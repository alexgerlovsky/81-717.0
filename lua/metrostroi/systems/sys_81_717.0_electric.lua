-- 81-717 electric schemes
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
--FIX:
--Игра ВЗ2-ВЗ1-ВЗ2 - решение, РК крутиться вперед, запитано РВ1, проверить питание РВ1

Metrostroi.DefineSystem("81_717_0")
TRAIN_SYSTEM.MVM = 1
function TRAIN_SYSTEM:Initialize(typ1,typ2)
    
    self.TrainSolver = "81_717"
    self.ThyristorController = true
    self.Type = self.Type or self.MVM

    -- Load all functions from base
    Metrostroi.BaseSystems["Electric"].Initialize(self)
    for k,v in pairs(Metrostroi.BaseSystems["Electric"]) do
        if not self[k] and type(v) == "function" then
            self[k] = v
        end
    end
end

--if CLIENT then return end

function TRAIN_SYSTEM:Inputs(...)
    return { "Type", "EKK_VK", }
end

function TRAIN_SYSTEM:Outputs(...)
    return Metrostroi.BaseSystems["Electric"].Outputs(self,...)
end

function TRAIN_SYSTEM:TriggerInput(name,value)
    if name == "Type" then self.Type = value end
    if name == "EKK_VK" then self.EKK_VK = value > 0 end
end

local S = {}
local function C(x) return x and 1 or 0 end
local min = math.min
local max = math.max

function TRAIN_SYSTEM:SolveAllInternalCircuits(Train,dT,firstIter)
    local P = Train.PositionSwitch
    local RheostatController = Train.RheostatController
    local RK = RheostatController.SelectedPosition
    local B = (Train.Battery.Voltage > 55) and 1 or 0
    local BO = B*Train.VB.Value
    local T = Train.SolverTemporaryVariables
    local KV = Train.KV
    local KRU = Train.KRU
    local Panel = Train.Panel
	Panel.V1 = T[10]--[[*(1-Train.ARS13.Value)]] --Вольтметр АКБ
    --Цепи автоведения
    local RC2 = Train.RC2.Value
    local VA = Train.VA.Value
    S["Power"] = T[10]*Train.VA.Value*Train.A59.Value
    --Цепи БАРС
    local RC1 = Train.RC1.Value
    local ARS = Train.ALS_ARS
	local ISDPM = Train.ISDPM
    S["10AK"] = T[10]*Train.A54.Value*Train.VU.Value
    S["U2"] = S["10AK"]*KV["U2-10AK"] 
    S["7D"] = T[10]*Train.A48.Value
	S["7V"] = S["7D"]*(KV["7V-7D"]+Train.EPKb.Value)
    S["B3"] = B*Train.A44.Value 
    S["B4"] = S["B3"]*KRU["14/1-B3"]
    S["B15"] = S["B4"]*Train.A17.Value 
    S["F"] = T[10]*Train.A29.Value
    S["F7"] = S["F"]*KV["F-F7"]+S["B15"]*KRU["11/3-FR1"]
	S["14G"] = S["7V"] +S["B4"]
    Train:WriteTrainWire(5,S["10AK"]*KV["10AK-5"] + KRU["5/3-ZM31"]*-10)
    Train:WriteTrainWire(4,S["10AK"]*KV["10AK-4"])--*(1-T[4]*KV["4-0"]*-10)) --FIXME
	--Train:WriteTrainWire(4,S["10AK"]*KV["10AK-4"]+(1-T[4]*KV["0-4"]*-10))
    Train.A54:TriggerInput("Open",T[4]*KV["0-4"]) --Переписать, но логику оставить
    --Лампы ЛУДС
    Panel.LST = (T[6]*Train.RARS.Value+T[8]*(1-Train.RARS.Value))*Train.A40.Value --ЛСТ
    Panel.LhRK = (T[2]+T[-2])*Train.A57.Value --FIXED by Ben Evans
    Panel.LVD = T[1]*Train.A60.Value --ЛВД
	Panel.LKVD = ARS.KVD --ЛКВД
	Panel.LUDS = T[10] --Питание ИС
    Panel.LSN = S["U2"]*T[18] --FIXME
	--БАРС
	ARS.ARSPower = (S["14G"]*Train.A42.Value*Train.ARS.Value)*RC1 --LOGIC РЦ-1
    ARS.ALSPower = S["14G"]*Train.A42.Value*Train.ALS.Value --Локомотивная сигнализация
	ARS.ALS = S["14G"]*Train.A42.Value*(Train.ALS.Value--[[+Train.ARS.Value]])*Train.A43.Value --Питание приемных катушек
	ARS.KB=S["14G"]*(Train.PB.Value+Train.KVT.Value--[[+(Train.KB1.Value*Train.KB2.Value)]])--717 - КВТ, 717.БВ - 2 КБ
	ARS.DA = S["10AK"]*KV["10AK-DA"]
	Train.RARS:TriggerInput("Set",ARS.DA)
	ARS.KRT = (T[6]*Train.RARS.Value+T[8]*(1-Train.RARS.Value))*Train.A40.Value*RC1 --РЦ-1 к.1-2
	ARS.KRH = (max(0,T[1])+T[14])*RC1 --РЦ-1 к.21-22
	ARS.KRO = (S["7V"]+S["B4"])*KV["VMA-VM1"]*(1-Train.KRP.Value)*(1-ARS.KRH)*RC1 --РЦ-1 к.27-28
    Train:WriteTrainWire(53,0)
    Train:WriteTrainWire(54,0)
    Train:WriteTrainWire(66,0)
    Train:WriteTrainWire(67,0)
	--ИСДПМ
	ISDPM.BPpower = S["14G"]
    Train:WriteTrainWire(39,S["7V"]*KV["7B-7Zh"]*(1-Train.OVT.Value)*(1-Train.RPB.Value)) 
    Train.RPB:TriggerInput("Set",ARS.ARSPower+S["14G"]*Train.PB.Value) --РЦ-1 к.43-44
    S["33A-M"] = (Train.RPB.Value+Train.VAH.Value)*(Train.KD.Value+Train.VAD.Value) 
    Train.RV2:TriggerInput("Set",S["10AK"]*KV["10AK-33B"]*(1-RC2)*S["33A-M"]) --10AK-33B-33A-33M
    Train:WriteTrainWire(1,S["10AK"]*KV["10AK-33D"]*Train.R1_5.Value + KRU["1/3-ZM31"]*-10)
	Train:WriteTrainWire(2,S["U2"]*KV["U2-2"]+ARS["2"]*RC1 + KRU["2/3-ZM31"]*-10) --РЦ-1 к.19-20
    Train:WriteTrainWire(3,S["U2"]*KV["U2-3"])
    Train:WriteTrainWire(6,S["10AK"]*Train.K6.Value)
    Train:WriteTrainWire(8,T[10]*(KV["10-8"]+ARS["8"]*Train.A41.Value)) 
    Train:WriteTrainWire(20,(S["U2"]*KV["U2-20V"]*(Train.BUM_RVD1.Value*Train.SOT.Value*RC1+(1-RC1))*(1-RC2)+(ARS["20"]*RC1+S["U2"]*KV["U2-20"])+KRU["20/3-ZM31"]*-10)) --На ход РЦ-1 к.5-6, к.7-8, к.11-12, на тормоз к.17-18 
    Train:WriteTrainWire(25,S["U2"]*KV["U2-25V"]*Train.K25.Value+0*RC2)
    S["33G"] = ARS["33G"]*RC1+S["U2"]*KV["U2-33G"] --РЦ-1 к.33-34
	S["33Zh"] = S["U2"]*KV["U2-33G"]*(Train.BUM_RB.Value*RC1+(1-RC1)*(1-RC2))+0*RC2 --РЦ-1 к.35-36, к.39-40
    S["19B"] = S["7V"]*(Train.BUM_RVD2.Value*RC1+(1-RC1))*(1-RC2) --РЦ-1 к.13-14,к.15-16, к.9-10
    Train:WriteTrainWire(19,S["19B"]*KV["19B-19"])
    Train.R1_5:TriggerInput("Set",S["19B"]*Train.RV2.Value*Train.UAVAC.Value) --19B-33B-33V
    Train.RVT:TriggerInput("Set",S["33G"])
    Train.K25:TriggerInput("Set",S["33Zh"])
    Train.K6:TriggerInput("Set",S["10AK"]*Train.RVT.Value) --10AK-10AT
    Train.RP8:TriggerInput("Set",T[8])
    S["U4"] = S["10AK"]*KV["10AK-U4"]
    Train:WriteTrainWire(17,S["U4"]*Train.VozvratRP.Value*(1-RC2)+0*RC2)
    Train:WriteTrainWire(24,S["U2"]*Train.KSN.Value)
	--Цепи принудительной вентиляции
    S["V1"] = T[10]*Train.AV1.Value 
    S["59/2"] = S["V1"]*Train.V11.Value*(1-Train.R1.Value)
    S["V3"] = B*Train.A49.Value*(1-Train.V11.Value)*(1-Train.V12.Value)*Train.V13.Value
    Train:WriteTrainWire(59,S["V1"]*Train.V11.Value) --10-59 п.п.
    Train:WriteTrainWire(60,S["V1"]*Train.V12.Value) --10-60 п.п.
    Train:WriteTrainWire(58,S["V3"]) --11В-В2-В3
    Panel.LKV1 = T[57]*(1-Train.ContVent.Value) --Лампа ЛКВ1
    Panel.LKV2 = S["59/2"]*Train.ContVent.Value --Лампа ЛКВ2
    Panel.M8 = S["V1"]*Train.PVK.Value --Двиг. вентиляции кабины
	--Информатор 
    --[[local RRI_VV = Train.RRI_VV
    RRI_VV.Power = BO*Train.RRIEnable.Value
    RRI_VV.AmplifierPower = BO*Train.RRIAmplifier.Value
    Train:WriteTrainWire(13,RRI_VV.AmplifierPower*Train.RRI.LineOut)
    Train:WriteTrainWire(-13,RRI_VV.AmplifierPower*Train.PowerSupply.X2_2)
    RRI_VV.CabinSpeakerPower = T[13]
    Panel.AnnouncerPlaying = T[13]
    Panel.AnnouncerBuzz = T[-13]+RRI_VV.CabinSpeakerPower*Train.PowerSupply.X2_2]]
	--14 Провод
    Train:WriteTrainWire(14,S["B4"]*Train.KRP.Value*(1-Train.RP8.Value))
    --Panel.CBKIPower = BO*Train.A66.Value
    --Пневмоподвешивание
    Train:WriteTrainWire(49,0)
    Train:WriteTrainWire(50,0)
    --Вагонная часть
    S["10A"] = BO*Train.A30.Value --+Б-Б11-10А
    S["10I"] = S["10A"]*RheostatController.RKM2
    Train:WriteTrainWire(45,S["10I"]*P.PT*C(RK==0)*Train.A55.Value)
    S["ZR"] = (1-Train.RRP1.Value)+(B*Train.A39.Value*(1-Train.RPvozvrat.Value)*Train.RRP1.Value)*-1 -- РРП1-ЗР, Б2-Б8-Б6-Б5-ЗР
    S["1A"] = T[1]*Train.A1.Value
    S["6A"] = T[6]*Train.A6.Value
    Train.TR1:TriggerInput("Set",S["6A"])
	S["1P"] = S["1A"]*P.PM*Train.NR.Value+S["6A"]*P.PT --1A-ПМУ1(1Г)-НР/6А-6АЯ-ПТУ1-1П
    S["1G"] = S["1P"]*C(1 <= RK and RK <= 18)*Train.AVT.Value*(1-Train.RPvozvrat.Value)*Train.RKR.Value --1Г-1К-1Б-11У-1Г
    S["1L"] = S["1G"]*C(RK==1)*(Train.KSB1.Value+Train.KSH2.Value--[[Train.KSH1.Value]])*P.PS*Train.LK2.Value --1Г-1Е(КСБ1/КШ2)1Ю-ПСУ1-1Л
    S["1Zh"] = (S["1L"]+S["1G"]*Train.LK3.Value)*S["ZR"]
    Train.LK1:TriggerInput("Set",S["1Zh"]*P.PM) --1Ж-ПМУ2-ЛК1
    Train.LK3:TriggerInput("Set",S["1Zh"]) --1Ж-ЛК3
    Train.LK4:TriggerInput("Set",S["1Zh"]*Train.LK3.Value) --1Ж-ЛК4(1Ц)
    S["3A"] = T[3]*Train.A3.Value
    S["6D"] = S["6A"]*P.PT*C(RK==1) --6А-ПТУ2-6Г-6Д
    self.ThyristorControllerWork = S["6D"]*(Train.KSB2.Value+Train.KSB1.Value) --6Д-6Д.1
    S["6Yu"] = S["6D"]*(1-Train.RSU.Value) 
    Train.KSB2:TriggerInput("Set",S["6Yu"]) --КСБ2
    Train.KSB1:TriggerInput("Set",S["6Yu"]) --КСБ1=
    S["20A"] = T[20]*Train.A20.Value
    S["20B"] = S["20A"]*(1-Train.RPvozvrat.Value)
    Train.LK2:TriggerInput("Set",S["20B"]*S["ZR"]) --ЛК2
    Train.LK5:TriggerInput("Set",S["20B"]*S["ZR"]) --ЛК5
	S["1K"] = C(1<=RK and RK<=5)*S["3A"]+S["10A"]*Train.KSH2.Value --3А/10А-1К
    S["1R"] = (S["1A"]*C(RK==1)*P.PS + S["1K"]*P.PP)*S["ZR"] --1А-ПСУ3/1К-ППУ1-1Р
    Train.KSH1:TriggerInput("Set",S["1R"]) --КШ1
    Train.KSH2:TriggerInput("Set",S["1R"]) --КШ2
    P:TriggerInput("PP",S["1A"]*C(RK==18)*Train.LK1.Value*S["ZR"]) --1А-3Б-3В, катушка ПП
	local Reverser = Train.Reverser
    S["4A"] = T[4]*Train.A4.Value
    Reverser:TriggerInput("NZ",S["4A"]*Reverser.VP*S["ZR"]) --4А-4Б, катушка НЗ
    S["5A"] = T[5]*Train.A5.Value
    Reverser:TriggerInput("VP",S["5A"]*Reverser.NZ*S["ZR"]) --5А-5Б, катушка ВП
	S["5V"] = (S["4A"]*Reverser.NZ+S["5A"]*Reverser.VP)*S["ZR"]
    Train.RKR:TriggerInput("Set",S["5V"]) --катушка РКР
    S["1N"] = C(11<=RK and RK<=18 or RK == 1)*(1-Train.LK4.Value--[[Train.LK5.Value]]) --1Н-1Э --FIXED by Ben Evans --По схеме ЛК5, сделано по ЛК4
    S["10XA/10X"] = C(RK==1)*Train.LK5.Value+Train.LK4.Value
    S["RR"] = S["10A"]*S["1N"] + P.PS*S["10XA/10X"] --10А-1На-6Ю или 10А-1На-1Н-ПСУ2-10Xa/10Х 
    Train.RR:TriggerInput("Set",S["RR"]) --катушка РР, 1На
    Train.Rper:TriggerInput("Set",S["RR"]) --катушка Рпер, 1Нб
	S["5Zh-5X"] = S["10A"]*(1-Train.LK3.Value)*(1-Train.LK1.Value)*(1-Train.LK4.Value) --10А-5Ж-3 парал. цепи-5Х
    P:TriggerInput("PS",S["5Zh-5X"]*(P.PP)) --катушка ПС, 10А-5Ж-ППУ3-5Ш-5Х
    P:TriggerInput("PM",S["5Zh-5X"]*(1-Train.TR1.Value)*Train.KSH2.Value) --катушка ПМ, 10А-5Ж-5У-5Ш-5Х
    P:TriggerInput("PT",S["5Zh-5X"]*(P.PM)*(1-Train.KSH2.Value)) --катушка ПТ, 10А-5Ж-ПМУ3-5Е-5Ш-5Х
	S["8B-2Zh"] = T[48]*C(17<=RK and RK<=18)*Train.TR1.Value
    S["2A"] = (T[2]--[[+S["8B-2Zh"]])*Train.A2.Value
    S["2Zh-8M"] = S["2A"]*Train.TR1.Value
	Train.RSU:TriggerInput("Set",S["2Zh-8M"]*Train.ThyristorBU5_6.Value)
    Train.RU:TriggerInput("Set",S["2Zh-8M"]*Train.LK5.Value) --2А-2Ж-8М-2Н
    S["2B"] = S["2A"]*((1-Train.KSB1.Value)*(1-Train.KSB2.Value)+(1-Train.TR1.Value))
	S["2G1"] = P.PS*C(1<=RK and RK<=17)*Train.Rper.Value --2А-2Ш-2Б-ПСУ4-2Б-2Г
    S["2G2"] = P.PP*(C(6<=RK and RK<=18)+C(2<=RK and RK<=5)*Train.KSH1.Value)*(1-Train.Rper.Value) --2А-2Б-ППУ2-2В-2У/2Р-2Г
	S["2G"] = S["2G1"]+S["2G2"] --2А-2Г
    S["2E"] = S["2B"]*S["2G"]*Train.LK4.Value --2Г-2Е
    S["10A-2E"] = S["10A"]*(1-Train.LK3.Value)*C(2<=RK and RK<=18)*(1-Train.LK4.Value)
    S["2U"] = (S["10A-2E"]+S["2E"])*S["ZR"]
    Train.SR1:TriggerInput("Set",S["2U"]) --катушка СР1
    Train.RV1:TriggerInput("Set",S["2U"]) --катушка РВ1
    S["8M-8B"] = S["2A"]*Train.TR1.Value*C(17<=RK and RK<=18)
	Train:WriteTrainWire(-2, S["8B-2Zh"]*Train.A2.Value)
	Train.PneumaticNo1:TriggerInput("Set",S["8M-8B"]+T[48]*Train.A72.Value) --катушка ВЗ1
    S["8G"] = T[8]*Train.A8.Value*(1-Train.RV1.Value)*(1-Train.RT2.Value)*(1-Train.RV3.Value)
    Train.PneumaticNo2:TriggerInput("Set",S["8G"]+T[39]*Train.A52.Value) --катушка ВЗ2
	Train.RV3:TriggerInput("Set",T[19]*Train.A19.Value) --катушка РВ3
    S["25Zh"] = T[25]*Train.A25.Value
	--РУТ
    Train["RRTpod"] = S["10A"]*RheostatController.RKM2*S["10XA/10X"] --10А-РКМ2-10Н-10ХА/10Х
    Train["RRTuderzh"] = S["25Zh"]
	--РУТ
    Train["RUTpod"] = S["10A"]*RheostatController.RKM2*S["10XA/10X"] --10А-РКМ2-10Н-10ХА/10Х
    Train["RUTavt"] = Train.A70.Value*BO
    Train.RRT:TriggerInput("Close",Train.RRTuderzh*Train.RRTpod) -- Притягивание якоря РРТ
    Train.RRT:TriggerInput("Open",(1-Train.RRTuderzh)) -- Условие отпускание якоря РРТ
	Train.RRP1:TriggerInput("Set",T[14]*Train.A14.Value)
    Train.RRP2:TriggerInput("Set",T[14]*Train.A14.Value)
    S["10A3"] = BO*Train.A28.Value
    S["10B"] = Train.TR1.Value + Train.RV1.Value --10A-10B
    RheostatController:TriggerInput("MotorCoilState",min(1,S["10A"]*(S["10B"]*Train.RR.Value - S["10B"]*(1-Train.RR.Value)))) --Направление обмотки СДРК
    Train.RVO:TriggerInput("Set",S["10A3"]*Train.NR.Value) -- катушка РВО, 10А3-10А4
    self.ThyristorControllerPower = S["10A3"] 
    S["10Yu"] = S["10A"]*Train.SR1.Value --10A-10Ю 
    S["10N"] = S["10A"]*RheostatController.RKM1+S["10Yu"]*(1-Train.RRT.Value)*(1-Train.RUT.Value) --10A-10Ю-10Н
    S["10T"] = (Train.RUT.Value+Train.RRT.Value+(1-Train.SR1.Value))*(RheostatController.RKP)+S["10A"]*Train.LK3.Value*C(RK>=18 and RK<=1) --10Н/10У-10Т
    RheostatController:TriggerInput("MotorState",S["10N"]+S["10T"]*(-10)) --Якорь СДРК
    Train.RZ_2:TriggerInput("Set",T[24]*(1-Train.LK4.Value)) --Катушка РЗ-2
	Train.RPvozvrat:TriggerInput("Open",T[17]) --Катушка РП ВОЗВРАТ, FIXED by Alicorn
    --Вспом цепи
    Train:WriteTrainWire(10,BO*Train.A56.Value) --+Б-Б1-ВБ-Б12-ВБ-Б18-А56-10
    Train:WriteTrainWire(23,S["B3"]*Train.RezMK.Value) 
    Train:WriteTrainWire(48,ARS["48"]*RC1) --РЦ-1 к.3-4
	S["10AF"] = B*Train.A71.Value --+Б-Б9-10АФ
    S["22B"] = T[10]*Train.A10.Value*Train.VMK.Value
    Train:WriteTrainWire(22,(S["22B"]+T[44])*Train.AK.Value)
    Train:WriteTrainWire(44,(S["22B"])*Train.AK.Value)
    S["UO"] = T[10]*Train.A27.Value
    Train:WriteTrainWire(27,S["UO"])
    S["F1"] = S["10AF"]*KV["10AF-F1"]
	--Звонок
    Train:WriteTrainWire(7,S["UO"]*(Train.Ring.Value+(1-Train.SQ3.Value))+ARS["7S"]) 
    Panel.Ring = T[7]
	--РП
    S["18A"] = Train.A18.Value*((1-Train.LK4.Value)+Train.RPvozvrat.Value*100) --18-18А/24А
    Train:WriteTrainWire(18,S["18A"])
    Panel.TW18 = S["18A"] --Красное РП и ЛСН
    Panel.GreenRP = Train.RPvozvrat.Value*S["UO"] --Зеленые РП, УО-10АН -- 81-717.0
    --Panel.GreenRP = S["UO"]*(Train.RPvozvrat.Value+(1-Train.RKR.Value)+(1-Train.LK4.Value)*0.5) --81-717.БВ
    --ЛЭКК
    Train:WriteTrainWire(72,S["F1"]*C(self.EKK_VK)) 
    Panel.LEKK = S["F1"] + T[72]*C(self.EKK_VK)
    --БПСН
    S["36N"] = BO*Train.A45.Value --+Б-Д7-36Н
    Train:WriteTrainWire(37,S["36N"]*Train.ConverterProtection.Value)
    Train:WriteTrainWire(69,S["36N"]*Train.BPSNon.Value) --Тумблер БПСН, положение вверх
    Train:WriteTrainWire(36,T[69]*(1-Train.BPSNon.Value)) --Тумблер БПСН, положение вниз
    Panel.LKVP = T[36] --Лампа ЛКВП
    Panel.RZP = T[61] --Лампа РЗП
    --ЛКВЦ
    S["B8"] = B*Train.A53.Value*Train.VB.Value --+Б-Б9-Б8
    Train.KVC:TriggerInput("Set",S["B8"]) --Катушка КВЦ
    --Двери
    S["D4"] = BO*Train.A13.Value --Б-Д7-Д4
    S["D1"] = T[10]*Train.A21.Value*KV["D-D1"]+S["B15"]*KRU["11/3-D1/1"] 
    Train:WriteTrainWire(16,S["D1"]*Train.VUD.Value+0*RC2)
    Train:WriteTrainWire(12,S["D1"]*Train.KRZD.Value)
    Train:WriteTrainWire(31,S["D1"]*(Train.KDL.Value+Train.KDLR.Value)*(1-RC2)*(1-Train.BUM_RPU.Value)+0*RC2)
    Train:WriteTrainWire(32,S["D1"]*Train.KDP.Value*(1-RC2)+0*RC2)
    S["F8"] = S["F7"]*Train.L_4.Value --Ф7-Ф8
	S["F11"] = S["F7"]*Train.L_4.Value*Train.VUS.Value --Ф7-Ф9-Ф11
    Train.Panel.Headlights1 = S["F8"]*Train.A46.Value --Ф8-Ф10-Ф14-Ф12
    Train.Panel.Headlights2 = S["F11"]*Train.A47.Value --Ф9-Ф11-Ф13-Ф17-Ф15
    Train.Panel.RedLight1 = S["F1"]*Train.A7.Value --Ф1-Ф2
    Train.Panel.RedLight2 = S["F1"]*Train.A9.Value --Ф1-Ф4
	--Цепь контроля торможения
    S["KT"] = S["7D"]*(ARS.GE and 0 or 1)*RC1 --РЦ 1 к.23-24
    Train:WriteTrainWire(-34,S["KT"])
	Train:WriteTrainWire(34,Train.RKTT.Value+Train.DKPT.Value)
    ARS.KT = T[34]*T[-34]*(ARS.GE and 1 or 0)
	ARS.KPP = T[-34]*(ARS.GE and 0 or 1)+ARS.KT 
	Panel.KT = ARS.ARSPower*(ARS.GE and 1 or 0)*ARS.KPP --GE Logic - Задержка включения платы ПСС БАРСа
	--Дверная сигнализация
	Train:WriteTrainWire(-28,S["D4"]*KV["D4-15"]+S["B15"]) --15/28
    Train:WriteTrainWire(28,T[-28]*Train.RD.Value) --28-28А
    Train:WriteTrainWire(15,T[28]*KV["D8-15A"]*KRU["15/2-D8"]) --15/28
    S["15D"] = T[15]	
	S["15B"] = T[15]
	Train.KD:TriggerInput("Set",S["15B"]) --Катушка КД, 15-15А-15Б
    Panel.SD = S["15D"] --Лампы СД, 15-15A-15Д
	S[64] = S["UO"]*Train.BPT.Value --64 вагонный провод
	Train:WriteTrainWire(64,S[64]) --64 поездной провод
    Panel.BrW = S[64] --Лампа пневмотормоза вагона
    S["11B"]=T[11]*Train.A15.Value*(1-Train.KPP.Value) --11-11А-11В
    Panel.KVC = T[10]*Train.A66.Value*(1-Train.KVC.Value) --Лампа КВЦ, 10-10АЯ-10АА-10АЛ
    Panel.CabLights = S["UO"]*Train.L_2.Value+S["11B"]*(1-Train.L_2.Value) --На 81-717 не работает
    Panel.EqLights = T[10]*Train.A11.Value -- Лампы освещения отсеков
    Panel.PanelLights = T[10]*Train.L_3.Value -- Подсветка приборов
	--Вспом цепи приём
    Train:WriteTrainWire(11, B*Train.A49.Value*Train.VAO.Value) --Б--11В
    Panel.EmergencyLights = S["11B"] --Лампы аварийного освещения
    Train.Schemes = S --Схемы
	S["D6"] = S["D4"]*Train.BD.Value --Д4-Д6
    Train.RD:TriggerInput("Set",S["D6"]) --катушка РД
    Panel.DoorsW = S["D4"]*(1-Train.RD.Value) --Белые бортовые лампы, Д4-16В
    Train.VDZ:TriggerInput("Set",T[16]*Train.A16.Value*(1-Train.RD.Value)) --Катушка РЗД(В3), 16-16Б-16В
    S["12A"] = T[12]*Train.A12.Value
    S["31A"] = T[31]*Train.A31.Value
    S["32A"] = T[32]*Train.A32.Value
    Train.VDOL:TriggerInput("Set",S["31A"]+S["12A"]) --Катушка В1
    Train.VDOP:TriggerInput("Set",S["32A"]+S["12A"]) --Катушка В2
	S["36Ya"] = T[36]*Train.A51.Value*Train.RVO.Value --36-36А-36Я
    Train.KVP:TriggerInput("Set",S["36Ya"]*Train.KPP.Value) --Катушка КВП, 36Я-36Д
    Train.KPP:TriggerInput("Set",S["36Ya"]*(1-Train.RZP.Value)*Train.KVC.Value) --Катушка КПП, 36Я-36В-36Б
	S["27A"] = T[27]*Train.A50.Value
    Train.KO:TriggerInput("Set",S["27A"]) --Катушка КО
    S["22P"] = T[22]*Train.A22.Value --22-22П
    Train.KK:TriggerInput("Set",S["22P"]) --Катушка КК
    --Радиостанция
	--Panel.VPR = BO*Train.AR63.Value -- Питание радиостанции
    --БПСН
    local BPSN = Train.PowerSupply
    Train.Battery:TriggerInput("Charge",BPSN.X2_2*Train.A24.Value*BO) --Подзаряд АКБ
    BPSN:TriggerInput("5x2",BO*Train.A65.Value*Train.KVP.Value) --Работа вторичного преобразователя 
    Panel.MainLights = BPSN.X6_2*Train.KO.Value --Питание основного освещения 
    Train.RPU:TriggerInput("Set",T[37]*Train.A37.Value) --Питание катушки РПУ
    Train:WriteTrainWire(38,T[36]*Train.A38.Value)
	Train.RZPud:TriggerInput("Set",T[38]*(1-Train.RPU.Value)*Train.RZP.Value) --Питание катушки РЗПпод(38Б-61)
    Train.RZP:TriggerInput("Set",Train.RZPpod.Value+Train.RZPud.Value) --Сработка РЗП
    Train:WriteTrainWire(61,T[36]*Train.RZP.Value) --Питание лампы РЗП
    --Вентиляция
    Train.KV1:TriggerInput("Set",T[59]*Train.AV4.Value*Train.RVO.Value) --катушка К1
    Train.KV2:TriggerInput("Set",T[60]*Train.AV5.Value) --катушка К2
    Train.KV3:TriggerInput("Set",T[58]*Train.AV6.Value) --катушка К3
    S["V5"] = T[10]*Train.AV2.Value --10 п.п.-В4-В5
    Panel.M1_3 = S["V5"]*Train.KV1.Value --Двиг. 1 группы
    Panel.M4_7 = S["V5"]*Train.KV2.Value+B*Train.AV3.Value*Train.KV3.Value --Двиг. 2 группы
    Train.R1:TriggerInput("Set",S["V5"]*C(Panel.M1_3 > 0.5 and Panel.M4_7 > 0.5)) --катушка Р1
    Train:WriteTrainWire(57,T[59]*(1-Train.R1.Value))
    return S
end

function TRAIN_SYSTEM:SolveRKInternalCircuits(Train,dT,firstIter)
    local P     = Train.PositionSwitch
    local RheostatController = Train.RheostatController
    local RK    = RheostatController.SelectedPosition
    local B     = (Train.Battery.Voltage > 55) and 1 or 0
    local BO    = B*Train.VB.Value
    local T     = Train.SolverTemporaryVariables
    --Вагонная часть
    S["10A"] = BO*Train.A30.Value --+Б-Б11-10А
    S["ZR"] = (1-Train.RRP1.Value)+(B*Train.A39.Value*(1-Train.RPvozvrat.Value)*Train.RRP1.Value)*-1 -- РРП1-ЗР, Б2-Б8-Б6-Б5-ЗР
	S["1N"] = C(11<=RK and RK<=18)*(1-Train.LK4.Value--[[Train.LK5.Value]]) --1Н-1Э --FIXED by Ben Evans --По схеме ЛК5, сделано по ЛК4
	S["10XA/10X"] = C(RK==1)*Train.LK5.Value+Train.LK4.Value
    S["RR"] = S["10A"]*S["1N"] + P.PS*S["10XA/10X"] --10А-1На-6Ю или 10А-1На-1Н-ПСУ2-10Xa/10Х
    Train.RR:TriggerInput("Set",S["RR"]) --катушка РР
    Train.Rper:TriggerInput("Set",S["RR"]) --катушка Рпер
	S["2A"] = (T[2]+S["8B-2Zh"])*Train.A2.Value
    S["2B"] = S["2A"]*((1-Train.KSB1.Value)*(1-Train.KSB2.Value)+(1-Train.TR1.Value))
	S["2G1"] = P.PS*C(1<=RK and RK<=17)*Train.Rper.Value --2А-2Ш-2Б-ПСУ4-2Б-2Г
    S["2G2"] = P.PP*(C(6<=RK and RK<=18)+C(2<=RK and RK<=5)*Train.KSH1.Value)*(1-Train.Rper.Value) --2А-2Б-ППУ2-2В-2У/2Р-2Г
	S["2G"] = S["2G1"]+S["2G2"] --2А-2Г
    S["2E"] = S["2B"]*S["2G"]*Train.LK4.Value --2Г-2Е
    S["10A-2E"] = S["10A"]*(1-Train.LK3.Value)*C(2<=RK and RK<=18)*(1-Train.LK4.Value)
    S["2U"] = (S["10A-2E"]+S["2E"])*S["ZR"]
    Train.SR1:TriggerInput("Set",S["2U"]) --катушка СР1
    Train.RV1:TriggerInput("Set",S["2U"]) --катушка РВ1
    S["25Zh"] = T[25]*Train.A25.Value
	--RRT
    Train["RRTpod"] = S["10A"]*RheostatController.RKM2*S["10XA/10X"] --10А-РКМ2-10Н-10ХА/10Х
    Train["RRTuderzh"] = S["25Zh"]
	--RUT
    Train["RUTpod"] = S["10A"]*RheostatController.RKM2*S["10XA/10X"] --10А-РКМ2-10Н-10ХА/10Х
    Train.RRT:TriggerInput("Close",Train.RRTuderzh*Train.RRTpod) -- Притягивание якоря РРТ
    Train.RRT:TriggerInput("Open",(1-Train.RRTuderzh)) -- Условие отпускание якоря РРТ
	--СДРК Б+ провод
    S["10A3"] = BO*Train.A28.Value
    S["10B"] = Train.TR1.Value + Train.RV1.Value --10A-10B
    RheostatController:TriggerInput("MotorCoilState",min(1,S["10A"]*(S["10B"]*Train.RR.Value - S["10B"]*(1-Train.RR.Value)))) --Направление обмотки СДРК
	S["10Yu"] = S["10A"]*Train.SR1.Value --10A-10Ю 
    S["10N"] = S["10A"]*RheostatController.RKM1+S["10Yu"]*(1-Train.RRT.Value)*(1-Train.RUT.Value) --10A-10Ю-10Н
    S["10T"] = (Train.RUT.Value+Train.RRT.Value+(1-Train.SR1.Value))*(RheostatController.RKP)+S["10A"]*Train.LK3.Value*C(RK>=18 and RK<=1) --10Н/10У-10Т
    RheostatController:TriggerInput("MotorState",S["10N"]+S["10T"]*(-10)) --Якорь СДРК
	return S
end

local wires = {1,-2,2,3,4,5,6,7,8,10,11,12,14,15,16,17,18,19,20,22,23,24,27,-28,28,25,13,-13,31,32,36,37,38,39,44,45,48,49,50,53,54,57,59,60,58,57,64,34,36,-34,61,64,66,67,69,71,72} --2=40, 3=41, 4=29,5=30,6=43
--Функция инициализации проводов
function TRAIN_SYSTEM:SolveInternalCircuits(Train,dT,firstIter)
    local T = Train.SolverTemporaryVariables
    if not T then
        T = {}
        for i,v in ipairs(wires) do T[v] = 0 end
        Train.SolverTemporaryVariables = T
    end
    if firstIter then
        for i,v in ipairs(wires) do T[v] = min(Train:ReadTrainWire(v),1) end
        self:SolveAllInternalCircuits(Train,dT)
    else
        self:SolveRKInternalCircuits(Train,dT)
    end
end
--Силовая цепь
function TRAIN_SYSTEM:SolvePowerCircuits(Train,dT)
    --Сопротивления сброса
    self.ExtraResistanceLK5 = Train.KF_47A["L2_L4"]*(1-Train.LK5.Value)
    self.ExtraResistanceLK2 = Train.KF_47A["L8_L13"]*(1-Train.LK2.Value)
    --Изменение номинала реостата силовой цепи с учетом режима работы(ПМ, ПТ) и замыкания цепи(ПС, ПП)
    if Train.PositionSwitch.PT > 0 then 
        self.R1 = Train.ResistorBlocks.R1C1(Train)
        self.R2 = Train.ResistorBlocks.R2C1(Train)
    elseif Train.PositionSwitch.PS > 0 then
        self.R1 = Train.ResistorBlocks.R1C1(Train)
        self.R2 = Train.ResistorBlocks.R2C1(Train)
        self.R3 = 0.0
    elseif Train.PositionSwitch.PP > 0 then
        self.R1 = Train.ResistorBlocks.R1C2(Train)
        self.R2 = Train.ResistorBlocks.R2C2(Train)
        self.R3 = 0.0
    else
        self.R1 = 1e9
        self.R2 = 1e9
        self.R3 = 1e9
    end
    --Коммутация силовой цепи в ход и тормоз
    self.R1 = self.R1 + 1e9*(1 - Train.LK3.Value)
    self.R2 = self.R2 + 1e9*(1 - Train.LK4.Value)
    --Расчет резисторов ослабления поля ТЭдов 1-й и 2-й группы
    self.Rs1 = Train.ResistorBlocks.S1(Train)+1e9*(1-Train.KSH1.Value)
    self.Rs2 = Train.ResistorBlocks.S2(Train)+1e9*(1-Train.KSH2.Value)
    --Расчет резисторов при тиристорном торможении
    if self.ThyristorController then
        self.Rs1 = ((self.ThyristorResistance^(-1))+(self.Rs1^(-1)))^(-1)
        self.Rs2 = ((self.ThyristorResistance^(-1))+(self.Rs2^(-1)))^(-1)
    end
    --Рассчет сопротивления якоря и обмотки двигателя (2)
    local RwAnchor = Train.Engines.Rwa*2 
    local RwStator = Train.Engines.Rws*2
    --Рассчет сопротивления обмотки + цепь ослабления поля/ тиристорное торможение
    self.Rstator13  = (RwStator^(-1)+self.Rs1^(-1))^(-1)
    self.Rstator24  = (RwStator^(-1)+self.Rs2^(-1))^(-1)
    --Рассчет сопротивления якоря
    self.Ranchor13  = RwAnchor
    self.Ranchor24  = RwAnchor

    if Train.PositionSwitch.PT> 0 then 
        self:SolvePT(Train)
    elseif Train.PositionSwitch.PS > 0 then
        self:SolvePS(Train)
    elseif Train.PositionSwitch.PP > 0 then
        self:SolvePP(Train,Train.RheostatController.SelectedPosition>=17)
    else
        self:SolvePT(Train)
    end
    --Рассчет тока через реостаты 1, 2
    self.IR1 = self.I13
    self.IR2 = self.I24
    --Рассчет индукционных свойств двигателя
    self.I13SH = self.I13SH or self.I13
    self.I24SH = self.I24SH or self.I24
    --Временная константа
    local T13const1 = math.max(16.00,math.min(36.0,(self.R13^2)*2.0)) 
    local T24const1 = math.max(16.00,math.min(36.0,(self.R24^2)*2.0)) 
    --Суммарное изменение
    local dI13dT = T13const1*(self.I13-self.I13SH)*dT
    local dI24dT = T24const1*(self.I24-self.I24SH)*dT
    --Ограничьте изменения и примените их
    if dI13dT > 0 then dI13dT = math.min(self.I13-self.I13SH,dI13dT) end
    if dI13dT < 0 then dI13dT = math.max(self.I13-self.I13SH,dI13dT) end
    if dI24dT > 0 then dI24dT = math.min(self.I24-self.I24SH,dI24dT) end
    if dI24dT < 0 then dI24dT = math.max(self.I24-self.I24SH,dI24dT) end
    self.I13SH = self.I13SH+dI13dT
    self.I24SH = self.I24SH+dI24dT
    self.I13 = self.I13SH
    self.I24 = self.I24SH
    --Перерасчет общего тока c учетом коммутации силовой цепи
    if Train.PositionSwitch.PT > 0 then --Тормозной режим
        self.I13 = self.I13*Train.LK3.Value*Train.LK4.Value
        self.I24 = self.I24*Train.LK4.Value*Train.LK3.Value
        self.Itotal = self.I13+self.I24
    elseif Train.PositionSwitch.PS > 0 then --Ходовой ПС
        self.I13 = self.I13*(Train.LK1.Value*Train.LK3.Value*Train.LK4.Value)--*Train.LK5.Value (LOGIC)
        self.I24 = self.I24*(Train.LK1.Value*Train.LK3.Value*Train.LK4.Value)--*Train.LK5.Value (LOGIC)
        self.I24 = (self.I24+self.I13)*0.5
        self.I13 = self.I24
        self.Itotal = self.I24
    elseif Train.PositionSwitch.PP > 0 then --Ходовой ПП
        self.I13 = self.I13*(Train.LK1.Value*Train.LK3.Value)--*Train.LK5.Value (LOGIC)
        self.I24 = self.I24*(Train.LK1.Value*Train.LK4.Value)--*Train.LK5.Value (LOGIC)
        self.Itotal = self.I13+self.I24
    end
    --Рассчет дополнительной информации
    --Напряжение и ток на якоре
    self.Uanchor13 = self.I13 * self.Ranchor13
    self.Uanchor24 = self.I24 * self.Ranchor24
    self.Ianchor13 = self.I13
    self.Ianchor24 = self.I24
    --Напряжение и ток на обмотке, ток на шунте
    self.Ustator13 = self.I13 * self.Rstator13
    self.Ustator24 = self.I24 * self.Rstator24
    self.Ishunt13  = self.Ustator13 / self.Rs1
    self.Istator13 = self.Ustator13 / RwStator
    self.Ishunt24  = self.Ustator24 / self.Rs2
    self.Istator24 = self.Ustator24 / RwStator
    --Изменение направления тока 
    if Train.PositionSwitch.PT > 0 then
        local I1,I2 = self.Ishunt13,self.Ishunt24
        self.Ishunt13 = -I2
        self.Ishunt24 = -I1
        I1,I2 = self.Istator13,self.Istator24
        self.Istator13 = -I2
        self.Istator24 = -I1
    end
    --Вычисление тока реле РТ2
    self.IRT2 = math.abs(self.Itotal*Train.PositionSwitch.PT)
    --Проверка
    if self.R1 > 1e5 then self.IR1 = 0 end
    if self.R2 > 1e5 then self.IR2 = 0 end
    --[[
    --Рассчет мощности и нагрева
    local K = 12.0*1e-5
    local H = (10.00+(15.00*Train.Engines.Speed/80.0))*1e-3
    self.P1 = (self.IR1^2)*self.R1
    self.P2 = (self.IR2^2)*self.R2
    self.T1 = (self.T1 + self.P1*K*dT-(self.T1-25)*H*dT)
    self.T2 = (self.T2 + self.P2*K*dT-(self.T2-25)*H*dT)
    self.Overheat1 = math.min(1-1e-12,self.Overheat1 + math.max(0,(math.max(0,self.T1-750.0)/400.0)^2)*dT )
    self.Overheat2 = math.min(1-1e-12,self.Overheat2 + math.max(0,(math.max(0,self.T2-750.0)/400.0)^2)*dT )
    --Потребление энергии
    self.ElectricEnergyUsed = self.ElectricEnergyUsed + math.max(0,self.EnergyChange)*dT
    self.ElectricEnergyDissipated = self.ElectricEnergyDissipated + math.max(0,-self.EnergyChange)*dT
    --]]
end

function TRAIN_SYSTEM:SolveThyristorController(Train, dT)
    -- General state
    local Active = self.ThyristorControllerPower > 0 and self.ThyristorControllerWork > 0 and Train.KSB1.Value>0
    local I = (math.abs(self.I13) + math.abs(self.I24)) / 2
    --print(Train.RSU.Value,Active,Train.TR1.Value)
    -- Controllers resistance
    local Resistance = 0.036
    -- Update RV controller signal
    -- Update thyristor controller signal
    local done = true
    if not Active then
        self.ThyristorTimeout = CurTime()
        self.PrepareElectric = CurTime()
        self.ThyristorState = 0.00
    --[[elseif not Active then
        if Train.LK2.Value == 0.0 then
            self.ThyristorTimeout = CurTime()
            self.PrepareElectric = CurTime()
            self.ThyristorState = 0.00
        end--]]
    else
        local T = 180.0 + (100.0 * Train.Pneumatic.WeightLoadRatio + 80.0) * Train.RU.Value
        -- Generate control signal
        local rnd = T / 20 --+math.random()*(10)
        local dC = math.min(math.max((T - I), -20), 20)

        if self.PrepareElectric then
            self.ThyristorState = 0.92
            if I > 162 then--I > T * 0.9 then
                self.PrepareElectric = false
                self.ThyristorState = (1 - math.max(0, math.min(1, ((Train.Engines.Speed - 50) / 32)) ^ 0.5)) * 0.9
            end
        else
            self.ThyristorState = math.max(0, math.min(1, self.ThyristorState + dC / rnd * dT))
        end
        --(self.ThyristorState)
        --print(self.ThyristorState)
        -- Generate resistance
        local keypoints = {0.10, 0.008, 0.20, 0.018, 0.30, 0.030, 0.40, 0.047, 0.50, 0.070, 0.60, 0.105, 0.70, 0.165, 0.80, 0.280, 0.90, 0.650, 1.00, 15.00}
        local TargetField = 0.48 + 0.52 * self.ThyristorState
        local Found = false

        for i = 1, #keypoints / 2 do
            local X1, Y1 = keypoints[(i - 1) * 2 + 1], keypoints[(i - 1) * 2 + 2]
            local X2, Y2 = keypoints[(i) * 2 + 1], keypoints[(i) * 2 + 2]

            if (not Found) and (not X2) then
                Resistance = Y1
                Found = true
            elseif (TargetField >= X1) and (TargetField < X2) then
                local T = (TargetField - X1) / (X2 - X1)
                Resistance = Y1 + (Y2 - Y1) * T
                Found = true
            end
        end

        done = self.PrepareElectric and (CurTime() - self.PrepareElectric) > 0.8 or not self.PrepareElectric and self.ThyristorState > 0.92
    end

    -- Allow or deny using manual brakes
    --Train.ThyristorBU5_6:TriggerInput("Set",not self.PrepareElectric and self.ThyristorState > 0.90)
    Train.ThyristorBU5_6:TriggerInput("Set", Active and done)
    -- Set resistance
    self.ThyristorResistance = Resistance + 1e9 * (Active and 0 or 1)
end

function TRAIN_SYSTEM:Think(...)
    if not self.ResistorBlocksInit then
        self.ResistorBlocksInit  = true
        self.Train:LoadSystem("ResistorBlocks","Gen_Res_717_0")
        self.Train.ResistorBlocks.InitializeResistances_81_717(self.Train)
    end
    return Metrostroi.BaseSystems["Electric"].Think(self,...)
end