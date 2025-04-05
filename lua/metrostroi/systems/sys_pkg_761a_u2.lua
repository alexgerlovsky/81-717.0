--------------------------------------------------------------------------------
-- Position switch (PKG-761A)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("PKG_761А")
function TRAIN_SYSTEM:Initialize()
   
    --Позиции
    self.PPS = 0
    self.PMT = 0
    --Контакты
    self.PS = 0
    self.PP = 0
    self.PM = 0
    self.PT = 0

    --Резисторы
    self.RPS = 1e-15
    self.RPP = 1e-15
    self.RPM = 1e-15
    self.RPT = 1e-15

    --Состояние
    self.PPSState = 0
    self.PMTState = 0
    self.RotationRate = 1.0/0.30

    -- Реле РПУ
    self.Train:LoadSystem("RPU","Relay","REV-821",{normal_level = 2})
    -- РЗП (защита первичного инвертора БПСН)
    self.Train:LoadSystem("RZPpod","Relay","REM-651D",{trigger_level = 975})
    self.Train:LoadSystem("RZPud","Relay","REM-651D")
    self.Train:LoadSystem("RZP","Relay","REM-651D")
end
function TRAIN_SYSTEM:Inputs()
    return {"PS","PP","PM","PT"}
end
function TRAIN_SYSTEM:Outputs()
    return {"PS","PP","PM","PT"}
end
function TRAIN_SYSTEM:TriggerInput(name,value)
    
    if name == "PS" and value > 0 then
        self.PPSState = -1
    end

    if name == "PP" and value > 0 then
        self.PPSState =  1
    end

    if name == "PM" and value > 0 then
        self.PMTState = -1
    end

    if name == "PT" and value > 0 then
        self.PMTState =  1
    end
end
function TRAIN_SYSTEM:Think(dT)
    local Train = self.Train
    -- Работа
    self.PPS = math.max(0,math.min(1,self.PPS + self.RotationRate*dT*self.PPSState)) --PS == 0, PP == 1
    self.PMT = math.max(0,math.min(1,self.PMT + self.RotationRate*dT*self.PMTState)) --PT == 1, PM == 0
    -- Замыкание контактов
    self.PS = self.PPS <= 0.5 and 1 or 0
    self.PP = self.PPS >  0.5 and 1 or 0
    self.PM = self.PMT <= 0.5 and 1 or 0
    self.PT = self.PMT >  0.5 and 1 or 0

    self.RPS = 1e-15 + 1e15 * (1-self.PS)
    self.RPP = 1e-15 + 1e15 * (1-self.PP)
    self.RPM = 1e-15 + 1e15 * (1-self.PM)
    self.RPT = 1e-15 + 1e15 * (1-self.PT)

end
