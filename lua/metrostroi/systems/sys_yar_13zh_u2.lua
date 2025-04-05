--------------------------------------------------------------------------------
-- Box with relays (YAR-13ZH)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("YAR_13ZH")

function TRAIN_SYSTEM:Initialize()
    
    -- Реле ускорения, торможения (РУТ)
    self.Train:LoadSystem("RUT","Relay","R-52B")
    -- Реле резервного пуска (РРП)
    self.Train:LoadSystem("RRP1","Relay","R3100")
    ----------------------------------------------------------------------------
    -- Стоп-реле (СР1)
    self.Train:LoadSystem("SR1","Relay","RM3001",{iterations=16,open_time=0})
    -- Реле контроля реверсоров (РКР)
    self.Train:LoadSystem("RKR","Relay","RM3001",{bass=true})
    ----------------------------------------------------------------------------
    -- Реле ручного тормоза (РРТ)
    self.Train:LoadSystem("RRT","Relay","R3100")
    -- Реле времени РВ1
    self.Train:LoadSystem("RV1","Relay","R3100",{open_time=0.7})
    -- Реле времени РВ2 
    self.Train:LoadSystem("RV2","Relay","R3100",{open_time=0.9})
    ----------------------------------------------------------------------------
    -- Реле перегрузки (РПЛ)
    self.Train:LoadSystem("RPL","Relay","RM3001", {trigger_level=1200})
    -- Групповое реле перегрузки 1-3 (РП1-3)
    self.Train:LoadSystem("RP1_3","Relay","RM3001",{trigger_level=620})
    -- Групповое реле перегрузки 2-4 (РП2-4)
    self.Train:LoadSystem("RP2_4","Relay","RM3001",{trigger_level=620})
    -- Реле заземления (РЗ-1, РЗ-2, РЗ-3)
    self.Train:LoadSystem("RZ_1","Relay","RM3001")
    self.Train:LoadSystem("RZ_2","Relay","RM3001")
    self.Train:LoadSystem("RZ_3","Relay","RM3001")
    -- Возврат реле перегрузки (РПвозврат)
    self.Train:LoadSystem("RPvozvrat","Relay","RM3001",{
        latched = true,             -- RPvozvrat latches into place
        power_open = "None",        -- Power source for the open signal
        power_close = "Mechanical", -- Power source for the close signal
    })
    ----------------------------------------------------------------------------
    -- Реле системы управления
    self.Train:LoadSystem("RSU","Relay","R3100")
    -- Нулевое реле (НР)
    self.Train:LoadSystem("NR","Relay","R3150", {power_source="None"})
    ----------------------------------------------------------------------------
    -- Extra coils for some relays
    self.Train.RUTpod = 0
    self.Train.RRTuderzh = 0
    self.Train.RRTpod = 0
    self.WeightLoadRatio = 0
    -- Need many iterations for engine simulation to converge
    self.SubIterations = 4
end

function TRAIN_SYSTEM:Inputs()
    return {}
end
function TRAIN_SYSTEM:Outputs()
    return {}
end

function TRAIN_SYSTEM:TriggerInput(name,value)
    if name == "TrigLev" then self.trigger_level = value end
end

function TRAIN_SYSTEM:Think()
    local Train = self.Train
    -- Логика нулевого реле
    Train.NR:TriggerInput("Close",Train.Electric.Aux750V > 360) -- 360 - 380 V
    Train.NR:TriggerInput("Open", Train.Electric.Aux750V < 150) -- 120 - 190 V
    -- Уставки РП1-3, РП2-4, РПЛ
    Train.RP1_3:TriggerInput("Set",math.abs(Train.Electric.I13))
    Train.RP2_4:TriggerInput("Set",math.abs(Train.Electric.I24))
    Train.RPL:TriggerInput("Set",Train.Electric.Itotal)
    -- Уставка РУТ
    self.RUTCurrent = (math.abs(Train.Electric.I13) + math.abs(Train.Electric.I24))/2
    self.RUTTarget = 260 + 60*self.Train.Pneumatic.WeightLoadRatio
    if Train.RUTpod > 0.5
    then Train.RUT:TriggerInput("Close",1.0)
    else Train.RUT:TriggerInput("Set",self.RUTCurrent > self.RUTTarget)
    end
    -- Сработка РП возврат
    Train.RPvozvrat:TriggerInput("Close", Train:ReadTrainWire(17) < 1 and (
        (Train.RPL.Value == 1.0) or
        (Train.RP1_3.Value == 1.0) or
        (Train.RP2_4.Value == 1.0) or
        (Train.RZ_1.Value == 1.0) or
        (Train.RZ_2.Value == 1.0) or
        (Train.RZ_3.Value == 1.0)))
end
