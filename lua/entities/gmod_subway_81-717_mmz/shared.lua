--FIX - проигрывается звук с выключением, включением РЦ ЛКшек 04.01.2024

ENT.Type            = "anim"
ENT.Base            = "gmod_subway_base"

ENT.PrintName = "81-717.0"
ENT.Author          = "Ben Evans"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "Metrostroi (trains)"
ENT.SkinsType = "81-717_msk"
ENT.Model = "models/metrostroi_train/81-717/81-717_mvm.mdl"

ENT.Spawnable       = true
ENT.AdminSpawnable  = false
ENT.DontAccelerateSimulation = false

function ENT:PassengerCapacity()
    return 300
end

function ENT:GetStandingArea()
    return Vector(-450,-30,-48),Vector(380,30,-48)
end
--Координаты дверей
local function GetDoorPosition(i,k)
    return Vector(359.0 - 35/2 - 229.5*i,-65*(1-2*k),7.5)
end

ENT.AnnouncerPositions = {
    {Vector(420,-49 ,61),80,0.4},
    {Vector(-3,-60, 62),250,0.3},
    {Vector(-3,60 ,62),250,0.3},
}

ENT.Cameras = {
    {Vector(407.5+23,4,29),Angle(0,180,0),"Train.717.Breakers","AV_C"},
    {Vector(407.5+35,-49,20),Angle(0,180,0),"Train.717.VB","Battery_C"},
    {Vector(407.5+25,-40,27),Angle(0,180,0),"Train.717.Breakers","AV_R"},
    {Vector(407.5+20,-40.5,5.5),Angle(0,180,0),"Train.717.VB","Battery_R"},
    {Vector(407.5-0,-10.5,12),Angle(0,270-45,0),"Train.717.VBD","VBD_R"},
    {Vector(407.5+13,-47,-20),Angle(40,270-15,0),"Train.Common.UAVA"},
    {Vector(407.5+5,-20,-10),Angle(40,-30,0),"Train.Common.PneumoPanels"},
    {Vector(407.5+35,40,10),Angle(0,90-17,0),"Train.Common.HelpersPanel"},
    --{Vector(407.5+39,-26.5,25),Angle(0,-20,0),"Train.Common.IGLA"},
    {Vector(407.5+08,-50,15),Angle(35,180,0),"Train.Common.RRI","RRI"},
    {Vector(407.5+70,51.5,0)  ,Angle(20,180+9,0),"Train.Common.RouteNumber"},
    {Vector(407.5+75,0.3,4.5)  ,Angle(20,180,0),"Train.Common.LastStation"},
    {Vector(450+7,0,30),Angle(60,0,0),"Train.Common.CouplerCamera"},
    --{Vector(365,0,35),Angle(0,180,0),"Салон, вид общий"},
    --{Vector(-450,-50,5),Angle(0,25,0),"Салон, вид с сидушек"},
    --{Vector(385,-32, 10),Angle(0,25,0),"БАРС ХУЙНЯ"},
    {Vector(-60,-40,-66),Angle(0,25,0),"ЛК"},
    {Vector(0,106,53),Angle(0,-100,0),"Бортовые"},
}

local ARSRelays = {"BUM_RVD1","BUM_RVD2","BUM_RUVD","BUM_RB","BUM_TR","BUM_PTR","BUM_PTR1","BUM_RET","BUM_RVZ1","BUM_RVT1","BUM_RVT2","BUM_RVT4","BUM_RVT5","BUM_EK","BUM_EK1","BUM_RIPP","BUM_PEK","BUM_RPU",}

function ENT:InitializeSounds()
    self.BaseClass.InitializeSounds(self)
    --Качение на скорости
    self.SoundNames["rolling_5"] = {loop=true,"subway_trains/common/junk/junk_background3.wav"}
    self.SoundNames["rolling_10"] = {loop=true,"subway_trains/717/rolling/10_rolling.wav"}
    self.SoundNames["rolling_40"] = {loop=true,"subway_trains/717/rolling/40_rolling.wav"}
    self.SoundNames["rolling_70"] = {loop=true,"subway_trains/717/rolling/70_rolling.wav"}
    self.SoundNames["rolling_80"] = {loop=true,"subway_trains/717/rolling/80_rolling.wav"}
    self.SoundPositions["rolling_5"] = {480,1e12,Vector(0,0,0),0.15}
    self.SoundPositions["rolling_10"] = {480,1e12,Vector(0,0,0),0.20}
    self.SoundPositions["rolling_40"] = {480,1e12,Vector(0,0,0),0.55}
    self.SoundPositions["rolling_70"] = {480,1e12,Vector(0,0,0),0.60}
    self.SoundPositions["rolling_80"] = {480,1e12,Vector(0,0,0),0.75}
    --Двигатели при кочении
    self.SoundNames["rolling_motors"] = {loop=true,"subway_trains/common/junk/wind_background1.wav"}
    self.SoundNames["rolling_motors2"] = {loop=true,"subway_trains/common/junk/wind_background1.wav"}
    self.SoundPositions["rolling_motors"] = {250,1e12,Vector(200,0,0),0.33}
    self.SoundPositions["rolling_motors2"] = {250,1e12,Vector(-250,0,0),0.33}
    self.SoundNames["rolling_low"] = {loop=true,"subway_trains/717/rolling/rolling_outside_low.wav"}
    self.SoundNames["rolling_medium1"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium1.wav"}
    self.SoundNames["rolling_medium2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_medium2.wav"}
    self.SoundNames["rolling_high2"] = {loop=true,"subway_trains/717/rolling/rolling_outside_high2.wav"}
    self.SoundPositions["rolling_low"] = {480,1e12,Vector(0,0,0),0.6}
    self.SoundPositions["rolling_medium1"] = {480,1e12,Vector(0,0,0),0.90}
    self.SoundPositions["rolling_medium2"] = {480,1e12,Vector(0,0,0),0.90}
    self.SoundPositions["rolling_high2"] = {480,1e12,Vector(0,0,0),1.00}
    --Пневматика
    self.SoundNames["pneumo_disconnect2"] = "subway_trains/common/pneumatic/pneumo_close.mp3"
    self.SoundNames["pneumo_disconnect1"] = {
        "subway_trains/common/pneumatic/pneumo_open.mp3",
        "subway_trains/common/pneumatic/pneumo_open2.mp3",
    }
    self.SoundPositions["pneumo_disconnect2"] = {60,1e9,Vector(431.8,-24.1+1.5,-33.7),1}
    self.SoundPositions["pneumo_disconnect1"] = {60,1e9,Vector(431.8,-24.1+1.5,-33.7),1}
    self.SoundNames["epv_on"]           = "subway_trains/common/pneumatic/epv_on.mp3"
    self.SoundNames["epv_off"]          = "subway_trains/common/pneumatic/epv_off.mp3"
    self.SoundPositions["epv_on"] = {80,1e9,Vector(437.2,-53.1,-32.0),0.85}
    self.SoundPositions["epv_off"] = {80,1e9,Vector(437.2,-53.1,-32.0),0.85}
    self.SoundPositions["epv_off"] = {60,1e9,Vector(437.2,-53.1,-32.0),0.85}
    -- Реле и контакторы
    self.SoundNames["rpb_on"] = "subway_trains/717/relays/rev813t_on1.mp3"
    self.SoundNames["rpb_off"] = "subway_trains/717/relays/rev813t_off1.mp3"
    self.SoundPositions["rpb_on"] =     {80,1e9,Vector(440,16,66),1}
    self.SoundPositions["rpb_off"] =    {80,1e9,Vector(440,16,66),0.7}
    self.SoundNames["rvt_on"] = "subway_trains/717/relays/rev811t_on2.mp3"
    self.SoundNames["rvt_off"] = "subway_trains/717/relays/rev811t_off1.mp3"
    self.SoundPositions["rvt_on"] =     {80,1e9,Vector(440,18,66),1}
    self.SoundPositions["rvt_off"] =    {80,1e9,Vector(440,18,66),0.7}
    self.SoundNames["k6_on"] = "subway_trains/717/relays/tkpm121_on1.mp3"
    self.SoundNames["k6_off"] = "subway_trains/717/relays/tkpm121_off1.mp3"
    self.SoundPositions["k6_on"] =      {80,1e9,Vector(440,20,66),1}
    self.SoundPositions["k6_off"] = {80,1e9,Vector(440,20,66),1}
    self.SoundNames["r1_5_on"] = "subway_trains/717/relays/kpd110e_on1.mp3"
    self.SoundNames["r1_5_off"] = "subway_trains/717/relays/kpd110e_off1.mp3"
    self.SoundPositions["r1_5_on"] =    {80,1e9,Vector(440,22,66),1}
    self.SoundPositions["r1_5_off"] =   {80,1e9,Vector(440,22,66),0.7}
    self.SoundNames["k25_on"] = self.SoundNames["r1_5_on"]
    self.SoundNames["k25_off"] = self.SoundNames["r1_5_off"]
    self.SoundPositions["k25_on"] =     {80,1e9,Vector(440,-16,66),1}
    self.SoundPositions["k25_off"] =    {80,1e9,Vector(440,-16,66),0.7}
    self.SoundNames["rp8_off"] = "subway_trains/717/relays/rev811t_off2.mp3"
    self.SoundNames["rp8_on"] = "subway_trains/717/relays/rev811t_on3.mp3"
    self.SoundPositions["rp8_on"] =     {110,1e9,Vector(440,-18,66),1}
    self.SoundPositions["rp8_off"] =    {110,1e9,Vector(440,-18,66),0.3}
    self.SoundNames["kd_off"] = self.SoundNames["rp8_off"]
    self.SoundNames["kd_on"] = self.SoundNames["rp8_on"]
    self.SoundPositions["kd_on"] =      {170,1e9,Vector(440,-20,66),1}
    self.SoundPositions["kd_off"] =     {170,1e9,Vector(440,-20,66),0.7}
    self.SoundNames["ro_on"] = self.SoundNames["r1_5_on"]
    self.SoundNames["ro_off"] = self.SoundNames["r1_5_off"]
    self.SoundPositions["ro_on"] =      {80,1e9,Vector(440,-22,66),1}
    self.SoundPositions["ro_off"] =     {80,1e9,Vector(440,-22,66),0.7}
    self.SoundNames["rars_on"] = "subway_trains/717_mmz/relays/RARS/rars_on.mp3"
    self.SoundNames["rars_off"] = "subway_trains/717_mmz/relays/RARS/rars_off.mp3"
    self.SoundPositions["rars_on"] =    {10,1e9,Vector(385,-32, 10),1}
    self.SoundPositions["rars_off"] =   {10,1e9,Vector(385,-32, 10),1}
    self.SoundNames["kk_off"] = "subway_trains/717/relays/lsd_2.mp3"
    self.SoundNames["kk_on"] = "subway_trains/717/relays/lsd_1.mp3"
    self.SoundPositions["kk_on"] =      {80,1e9,Vector(280,40,-30),0.85}
    self.SoundPositions["kk_off"] =     {80,1e9,Vector(280,40,-30),0.85}
    --БПСН
    self.SoundNames["bpsn1"] = {"subway_trains/717_mmz/bpsn/bpsn1.mp3", loop=true}
    self.SoundNames["bpsn2"] = {"subway_trains/717_mmz/bpsn/bpsn_piter.mp3", loop=true}
    self.SoundPositions["bpsn1"] = {500,1e9,Vector(0,45,-448),0.09}
    self.SoundPositions["bpsn2"] = {500,1e9,Vector(0,45,-448),0.10}
    --Линейные контактора
    self.SoundNames["lk1_on"] = "subway_trains/717_mmz/pneumo/lk/lk1_on.mp3"
    self.SoundPositions["lk1_on"] = {440,1e9,Vector(-60,-40,-66),0.30}
    self.SoundNames["lk2_on"] = "subway_trains/717_mmz/pneumo/lk/lk2-3-4-5_on.mp3"
    self.SoundNames["lk2_off"] = "subway_trains/717_mmz/pneumo/lk/lk2-5_off.mp3"
    self.SoundPositions["lk2_on"] = {440,1e9,Vector(-60,-40,-66),0.23}
    self.SoundPositions["lk2_off"] = self.SoundPositions["lk2_on"] 
    self.SoundNames["lk3_on"] = "subway_trains/717_mmz/pneumo/lk/lk2-3-4-5_on.mp3"
    self.SoundNames["lk3_off"] = "subway_trains/717_mmz/pneumo/lk/lk1-3-4_off.mp3"
    self.SoundPositions["lk3_on"] = {440,1e9,Vector(-60,-40,-66),0.28}
    self.SoundPositions["lk3_off"] = self.SoundPositions["lk3_on"]
    --Мотор-компрессор
    self.SoundNames["compressor"] = {loop=2.0,"subway_trains/717_mmz/compressor/compressor_717_start2.wav","subway_trains/717_mmz/compressor/compressor_717_loop2.wav", "subway_trains/717_mmz/compressor/compressor_717_end2.wav"}
    self.SoundPositions["compressor"] = {600,1e9,Vector(-118,-40,-66),0.15}
    self.SoundNames["rk"] = {loop=0.8,"subway_trains/717/rk/rk_start.wav","subway_trains/717/rk/rk_spin.wav","subway_trains/717/rk/rk_stop.mp3"}
    self.SoundPositions["rk"] = {70,1e3,Vector(110,-40,-75),0.5}
    --Контроллер машиниста
    self.SoundNames["revers_0-f"] = {"subway_trains/717/kv70/reverser_0-f_1.mp3","subway_trains/717/kv70/reverser_0-f_2.mp3"}
    self.SoundNames["revers_f-0"] = {"subway_trains/717/kv70/reverser_f-0_1.mp3","subway_trains/717/kv70/reverser_f-0_2.mp3"}
    self.SoundNames["revers_0-b"] = {"subway_trains/717/kv70/reverser_0-b_1.mp3","subway_trains/717/kv70/reverser_0-b_2.mp3"}
    self.SoundNames["revers_b-0"] = {"subway_trains/717/kv70/reverser_b-0_1.mp3","subway_trains/717/kv70/reverser_b-0_2.mp3"}
    self.SoundNames["revers_in"] = {"subway_trains/717/kv70/reverser_in1.mp3","subway_trains/717/kv70/reverser_in2.mp3","subway_trains/717/kv70/reverser_in3.mp3"}
    self.SoundNames["revers_out"] = {"subway_trains/717/kv70/reverser_out1.mp3","subway_trains/717/kv70/reverser_out2.mp3"}
    self.SoundPositions["revers_0-f"] = 	{80,1e9,Vector(445.5,-32+1.7,-7.5),0.85}
    self.SoundPositions["revers_f-0"] = 	{80,1e9,Vector(445.5,-32+1.7,-7.5),0.85}
    self.SoundPositions["revers_0-b"] = 	{80,1e9,Vector(445.5,-32+1.7,-7.5),0.85}
    self.SoundPositions["revers_b-0"] = 	{80,1e9,Vector(445.5,-32+1.7,-7.5),0.85}
    self.SoundPositions["revers_in"] = 		{80,1e9,Vector(445.5,-32+1.7,-7.5),0.85}
    self.SoundPositions["revers_out"] = 	{80,1e9,Vector(445.5,-32+1.7,-7.5),0.85}
    --КРУ
    self.SoundNames["kru_in"] = {
        "subway_trains/717/kru/kru_insert1.mp3",
        "subway_trains/717/kru/kru_insert2.mp3"
    }
    self.SoundPositions["kru_in"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundNames["kru_out"] = {
        "subway_trains/717/kru/kru_eject1.mp3",
        "subway_trains/717/kru/kru_eject2.mp3",
        "subway_trains/717/kru/kru_eject3.mp3",
    }
    self.SoundPositions["kru_out"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundNames["kru_0_1"] = {
        "subway_trains/717/kru/kru0-1_1.mp3",
        "subway_trains/717/kru/kru0-1_2.mp3",
        "subway_trains/717/kru/kru0-1_3.mp3",
        "subway_trains/717/kru/kru0-1_4.mp3",
    }
    self.SoundNames["kru_1_2"] = {
        "subway_trains/717/kru/kru1-2_1.mp3",
        "subway_trains/717/kru/kru1-2_2.mp3",
        "subway_trains/717/kru/kru1-2_3.mp3",
        "subway_trains/717/kru/kru1-2_4.mp3",
    }
    self.SoundNames["kru_2_1"] = {
        "subway_trains/717/kru/kru2-1_1.mp3",
        "subway_trains/717/kru/kru2-1_2.mp3",
        "subway_trains/717/kru/kru2-1_3.mp3",
        "subway_trains/717/kru/kru2-1_4.mp3",
    }
    self.SoundNames["kru_1_0"] = {
        "subway_trains/717/kru/kru1-0_1.mp3",
        "subway_trains/717/kru/kru1-0_2.mp3",
        "subway_trains/717/kru/kru1-0_3.mp3",
        "subway_trains/717/kru/kru1-0_4.mp3",
    }
    self.SoundNames["kru_2_3"] = {
        "subway_trains/717/kru/kru2-3_1.mp3",
        "subway_trains/717/kru/kru2-3_2.mp3",
        "subway_trains/717/kru/kru2-3_3.mp3",
        "subway_trains/717/kru/kru2-3_4.mp3",
    }
    self.SoundNames["kru_3_2"] = {
        "subway_trains/717/kru/kru3-2_1.mp3",
        "subway_trains/717/kru/kru3-2_2.mp3",
        "subway_trains/717/kru/kru3-2_3.mp3",
        "subway_trains/717/kru/kru3-2_4.mp3",
    }
    self.SoundPositions["kru_0_1"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_1_2"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_2_1"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_1_0"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_2_3"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    self.SoundPositions["kru_3_2"] = {80,1e9,Vector(452.3,-24.0,4.0)}
    --Переключатель вентиляции кабины
    self.SoundNames["pvk2"] = "subway_trains/717/switches/vent1-2.mp3"
    self.SoundNames["pvk1"] = "subway_trains/717/switches/vent2-1.mp3"
    self.SoundNames["pvk0"] = "subway_trains/717/switches/vent1-0.mp3"
    self.SoundNames["vent_cabl"] = {loop=true,"subway_trains/717/vent/vent_cab_low.wav"}
    self.SoundPositions["vent_cabl"] = {140,1e9,Vector(450.7,44.5,-11.9),0.66}
    self.SoundNames["vent_cabh"] = {loop=true,"subway_trains/717/vent/vent_cab_high.wav"}
    self.SoundPositions["vent_cabh"] = self.SoundPositions["vent_cabl"]
    --Принудительная вентиляция салона
    for i=1,7 do
        self.SoundNames["vent"..i] = {loop=true,"subway_trains/717/vent/vent_cab_"..(i==7 and "low" or "high")..".wav"}
    end
    self.SoundPositions["vent1"] = {120,1e9,Vector(225,  -50, -37.5),0.23}
    self.SoundPositions["vent2"] = {120,1e9,Vector(-5,    50, -37.5),0.23}
    self.SoundPositions["vent3"] = {120,1e9,Vector(-230, -50, -37.5),0.23}
    self.SoundPositions["vent4"] = {120,1e9,Vector(225,   50, -37.5),0.23}
    self.SoundPositions["vent5"] = {120,1e9,Vector(-5,   -50, -37.5),0.23}
    self.SoundPositions["vent6"] = {120,1e9,Vector(-230,  50, -37.5),0.23}
    self.SoundPositions["vent7"] = {120,1e9,Vector(-432, -50, -37.5),0.23}
    --Выключатель управления(ВУ-22)
    self.SoundNames["vu22_on"] = {"subway_trains/ezh3/vu/vu22_on1.mp3", "subway_trains/ezh3/vu/vu22_on2.mp3", "subway_trains/ezh3/vu/vu22_on3.mp3"}
    self.SoundNames["vu22_off"] = {"subway_trains/ezh3/vu/vu22_off1.mp3", "subway_trains/ezh3/vu/vu22_off2.mp3", "subway_trains/ezh3/vu/vu22_off3.mp3"}
    
    self.SoundNames["kr_open"] = {
        "subway_trains/717/cover/cover_open1.mp3",
        "subway_trains/717/cover/cover_open2.mp3",
        "subway_trains/717/cover/cover_open3.mp3",
    }
    self.SoundNames["kr_close"] = {
        "subway_trains/717/cover/cover_close1.mp3",
        "subway_trains/717/cover/cover_close2.mp3",
        "subway_trains/717/cover/cover_close3.mp3",
    }

    self.SoundNames["switch_off"] = {
        "subway_trains/717/switches/tumbler_slim_off1.mp3",
        "subway_trains/717/switches/tumbler_slim_off2.mp3",
        "subway_trains/717/switches/tumbler_slim_off3.mp3",
        "subway_trains/717/switches/tumbler_slim_off4.mp3",
    }
    self.SoundNames["switch_on"] = {
        "subway_trains/717/switches/tumbler_slim_on1.mp3",
        "subway_trains/717/switches/tumbler_slim_on2.mp3",
        "subway_trains/717/switches/tumbler_slim_on3.mp3",
        "subway_trains/717/switches/tumbler_slim_on4.mp3",
    }

    self.SoundNames["switchbl_off"] = {
        "subway_trains/717/switches/tumbler_fatb_off1.mp3",
        "subway_trains/717/switches/tumbler_fatb_off2.mp3",
        "subway_trains/717/switches/tumbler_fatb_off3.mp3",
    }
    self.SoundNames["switchbl_on"] = {
        "subway_trains/717/switches/tumbler_fatb_on1.mp3",
        "subway_trains/717/switches/tumbler_fatb_on2.mp3",
        "subway_trains/717/switches/tumbler_fatb_on3.mp3",
    }

    self.SoundNames["triple_down-0"] = {
        "subway_trains/717/switches/tumbler_triple_down-0_1.mp3",
        "subway_trains/717/switches/tumbler_triple_down-0_2.mp3",
    }
    self.SoundNames["triple_0-up"] = {
        "subway_trains/717/switches/tumbler_triple_0-up_1.mp3",
        "subway_trains/717/switches/tumbler_triple_0-up_2.mp3",
    }
    self.SoundNames["triple_up-0"] = {
        "subway_trains/717/switches/tumbler_triple_up-0_1.mp3",
        "subway_trains/717/switches/tumbler_triple_up-0_2.mp3",
    }
    self.SoundNames["triple_0-down"] = {
        "subway_trains/717/switches/tumbler_triple_0-down_1.mp3",
        "subway_trains/717/switches/tumbler_triple_0-down_2.mp3",
    }
    self.SoundNames["button1_off"] = {
        "subway_trains/717/switches/button1_off1.mp3",
        "subway_trains/717/switches/button1_off2.mp3",
        "subway_trains/717/switches/button1_off3.mp3",
    }
    self.SoundNames["button1_on"] = {
        "subway_trains/717/switches/button1_on1.mp3",
        "subway_trains/717/switches/button1_on2.mp3",
        "subway_trains/717/switches/button1_on3.mp3",
    }
    self.SoundNames["button2_off"] = {
        "subway_trains/717/switches/button2_off1.mp3",
        "subway_trains/717/switches/button2_off2.mp3",
    }
    self.SoundNames["button2_on"] = {
        "subway_trains/717/switches/button2_on1.mp3",
        "subway_trains/717/switches/button2_on2.mp3",
    }
    self.SoundNames["button3_off"] = {
        "subway_trains/717/switches/button3_off1.mp3",
        "subway_trains/717/switches/button3_off2.mp3",
    }
    self.SoundNames["button3_on"] = {
        "subway_trains/717/switches/button3_on1.mp3",
        "subway_trains/717/switches/button3_on2.mp3",
    }
    self.SoundNames["button4_off"] = {
        "subway_trains/717/switches/button4_off1.mp3",
        "subway_trains/717/switches/button4_off2.mp3",
    }
    self.SoundNames["button4_on"] = {
        "subway_trains/717/switches/button4_on1.mp3",
        "subway_trains/717/switches/button4_on2.mp3",
    }

    self.SoundNames["uava_reset"] = {
        "subway_trains/common/uava/uava_reset1.mp3",
        "subway_trains/common/uava/uava_reset2.mp3",
        "subway_trains/common/uava/uava_reset4.mp3",
    }
    self.SoundPositions["uava_reset"] = {80,1e9,Vector(429.6,-60.8,-15.9),0.95}
    self.SoundNames["gv_f"] = {"subway_trains/717/kv70/reverser_0-b_1.mp3","subway_trains/717/kv70/reverser_0-b_2.mp3"}
    self.SoundNames["gv_b"] = {"subway_trains/717/kv70/reverser_b-0_1.mp3","subway_trains/717/kv70/reverser_b-0_2.mp3"}

    self.SoundNames["pneumo_TL_open"] = {
        "subway_trains/ezh3/pneumatic/brake_line_on.mp3",
        "subway_trains/ezh3/pneumatic/brake_line_on2.mp3",
    }
    self.SoundNames["pneumo_TL_disconnect"] = {
        "subway_trains/common/334/334_close.mp3",
    }
    self.SoundPositions["pneumo_TL_open"] = {60,1e9,Vector(431.8,-24.1+1.5,-33.7),0.7}
    self.SoundPositions["pneumo_TL_disconnect"] = {60,1e9,Vector(431.8,-24.1+1.5,-33.7),0.7}
    self.SoundNames["pneumo_BL_disconnect"] = {
        "subway_trains/common/334/334_close.mp3",
    }
    self.SoundNames["disconnect_valve"] = "subway_trains/common/switches/pneumo_disconnect_switch.mp3"

    self.SoundNames["brake_f"] = {"subway_trains/common/pneumatic/vz_brake_on2.mp3","subway_trains/common/pneumatic/vz_brake_on3.mp3","subway_trains/common/pneumatic/vz_brake_on4.mp3"}
    self.SoundPositions["brake_f"] = {50,1e9,Vector(317-8,0,-82),0.13}
    self.SoundNames["brake_b"] = self.SoundNames["brake_f"]
    self.SoundPositions["brake_b"] = {50,1e9,Vector(-317+0,0,-82),0.13}
    self.SoundNames["release1"] = {loop=true,"subway_trains/common/pneumatic/release_0.wav"}
    self.SoundPositions["release1"] = {350,1e9,Vector(-183,0,-70),1}
    self.SoundNames["release2"] = {loop=true,"subway_trains/common/pneumatic/release_low.wav"}
    self.SoundPositions["release2"] = {350,1e9,Vector(-183,0,-70),0.4}

    self.SoundNames["parking_brake"] = {loop=true,"subway_trains/common/pneumatic/parking_brake.wav"}
    self.SoundNames["parking_brake_en"] = "subway_trains/common/pneumatic/parking_brake_stop.mp3"
    self.SoundNames["parking_brake_rel"] = "subway_trains/common/pneumatic/parking_brake_stop2.mp3"
    self.SoundPositions["parking_brake"] = {80,1e9,Vector(453.6,-0.25,-39.8),0.6}
    self.SoundPositions["parking_brake_en"] = self.SoundPositions["parking_brake"]
    self.SoundPositions["parking_brake_rel"] = self.SoundPositions["parking_brake"]
    self.SoundNames["front_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["front_isolation"] = {300,1e9,Vector(443, 0,-63),1}
    self.SoundNames["rear_isolation"] = {loop=true,"subway_trains/common/pneumatic/isolation_leak.wav"}
    self.SoundPositions["rear_isolation"] = {300,1e9,Vector(-456, 0,-63),1}

    self.SoundNames["crane013_brake"] = {loop=true,"subway_trains/common/pneumatic/release_2.wav"}
    self.SoundPositions["crane013_brake"] = {80,1e9,Vector(431.5,-20.3,-12),0.86}
    self.SoundNames["crane013_brake2"] = {loop=true,"subway_trains/common/pneumatic/013_brake2.wav"}
    self.SoundPositions["crane013_brake2"] = {80,1e9,Vector(431.5,-20.3,-12),0.86}
    self.SoundNames["crane013_brake_l"] = {loop=true,"subway_trains/common/pneumatic/013_brake_loud2.wav"}
    self.SoundPositions["crane013_brake_l"] = {80,1e9,Vector(431.5,-20.3,-12),0.7}
    self.SoundNames["crane013_release"] = {loop=true,"subway_trains/common/pneumatic/013_release.wav"}
    self.SoundPositions["crane013_release"] = {80,1e9,Vector(431.5,-20.3,-12),0.4}
    self.SoundNames["crane334_brake_high"] = {loop=true,"subway_trains/common/pneumatic/334_brake.wav"}
    self.SoundPositions["crane334_brake_high"] = {80,1e9,Vector(432.27,-22.83,-8.2),0.85}
    self.SoundNames["crane334_brake_low"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow.wav"}
    self.SoundPositions["crane334_brake_low"] = {80,1e9,Vector(432.27,-22.83,-8.2),0.75}
    self.SoundNames["crane334_brake_2"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow.wav"}
    self.SoundPositions["crane334_brake_2"] = {80,1e9,Vector(432.27,-22.83,-8.2),0.85}
    self.SoundNames["crane334_brake_eq_high"] = {loop=true,"subway_trains/common/pneumatic/334_release_reservuar.wav"}
    self.SoundPositions["crane334_brake_eq_high"] = {80,1e9,Vector(432.27,-22.83,-70.2),0.2}
    self.SoundNames["crane334_brake_eq_low"] = {loop=true,"subway_trains/common/pneumatic/334_brake_slow2.wav"}
    self.SoundPositions["crane334_brake_eq_low"] = {80,1e9,Vector(432.27,-22.83,-70.2),0.2}
    self.SoundNames["crane334_release"] = {loop=true,"subway_trains/common/pneumatic/334_release3.wav"}
    self.SoundPositions["crane334_release"] = {80,1e9,Vector(432.27,-22.83,-8.2),0.2}
    self.SoundNames["crane334_release_2"] = {loop=true,"subway_trains/common/pneumatic/334_release2.wav"}
    self.SoundPositions["crane334_release_2"] = {80,1e9,Vector(432.27,-22.83,-8.2),0.2}

    self.SoundNames["epk_brake"] = {loop=true,"subway_trains/common/pneumatic/epv_loop.wav"}
    self.SoundPositions["epk_brake"] = {80,1e9,Vector(437.2,-53.1,-32.0),0.65}

    self.SoundNames["valve_brake"] = {loop=true,"subway_trains/common/pneumatic/epv_loop.wav"}
    self.SoundPositions["valve_brake"] = {80,1e9,Vector(408.45,62.15,11.5),1}

    self.SoundNames["emer_brake"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop.wav"}
    self.SoundNames["emer_brake2"] = {loop=true,"subway_trains/common/pneumatic/autostop_loop_2.wav"}
    self.SoundPositions["emer_brake"] = {600,1e9,Vector(345,-55,-84),0.95}
    self.SoundPositions["emer_brake2"] = {600,1e9,Vector(345,-55,-84),1}


    self.SoundNames["pak_on"] = "subway_trains/717/switches/rc_on.mp3"
    self.SoundNames["pak_off"] = "subway_trains/717/switches/rc_off.mp3"

    self.SoundNames["kv70_0_t1"] = "subway_trains/717/kv70_3/0-t1.mp3"
    self.SoundNames["kv70_t1_0_fix"]= "subway_trains/717/kv70_3/t1-0.mp3"
    self.SoundNames["kv70_t1_0"] = "subway_trains/717/kv70_3/t1-0.mp3"
    self.SoundNames["kv70_t1_t1a"] = "subway_trains/717/kv70_3/t1-t1a.mp3"
    self.SoundNames["kv70_t1a_t1"] = "subway_trains/717/kv70_3/t1a-t1.mp3"
    self.SoundNames["kv70_t1a_t2"] = "subway_trains/717/kv70_3/t1a-t2.mp3"
    self.SoundNames["kv70_t2_t1a"] = "subway_trains/717/kv70_3/t2-t1a.mp3"
    self.SoundNames["kv70_0_x1"] = "subway_trains/717/kv70_3/0-x1.mp3"
    self.SoundNames["kv70_x1_0"] = "subway_trains/717/kv70_3/x1-0.mp3"
    self.SoundNames["kv70_x1_x2"] = "subway_trains/717/kv70_3/x1-x2.mp3"
    self.SoundNames["kv70_x2_x1"] = "subway_trains/717/kv70_3/x2-x1.mp3"
    self.SoundNames["kv70_x2_x3"] = "subway_trains/717/kv70_3/x2-x3.mp3"
    self.SoundNames["kv70_x3_x2"] = "subway_trains/717/kv70_3/x3-x2.mp3"
    self.SoundPositions["kv70_fix_on"] = {110,1e9,Vector(435.848,16.1,-19.779+4.75),0.4}
    self.SoundPositions["kv70_fix_off"] = self.SoundPositions["kv70_fix_on"]
    self.SoundPositions["kv70_0_t1"] = {110,1e9,Vector(456.5,-45,-8),0.7}
    self.SoundPositions["kv70_t1_0_fix"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1_0"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1_t1a"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1a_t1"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1a_t2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t2_t1a"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_0_x1"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x1_0"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x1_x2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x2_x1"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x2_x3"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x3_x2"] = self.SoundPositions["kv70_0_t1"]

    self.SoundNames["kv70_0_t1_2"] = "subway_trains/717/kv70_4/kv70_0_t1.mp3"
    self.SoundNames["kv70_t1_0_2"] = "subway_trains/717/kv70_4/kv70_t1_0.mp3"
    self.SoundNames["kv70_t1_t1a_2"] = "subway_trains/717/kv70_4/kv70_t1_t1a.mp3"
    self.SoundNames["kv70_t1a_t1_2"] = "subway_trains/717/kv70_4/kv70_t1a_t1.mp3"
    self.SoundNames["kv70_t1a_t2_2"] = "subway_trains/717/kv70_4/kv70_t1a_t2.mp3"
    self.SoundNames["kv70_t2_t1a_2"] = "subway_trains/717/kv70_4/kv70_t2_t1a.mp3"
    self.SoundNames["kv70_0_x1_2"] = "subway_trains/717/kv70_4/kv70_0_x1.mp3"
    self.SoundNames["kv70_x1_0_2"] = "subway_trains/717/kv70_4/kv70_x1_0.mp3"
    self.SoundNames["kv70_x1_x2_2"] = "subway_trains/717/kv70_4/kv70_x1_x2.mp3"
    self.SoundNames["kv70_x2_x1_2"] = "subway_trains/717/kv70_4/kv70_x2_x1.mp3"
    self.SoundNames["kv70_x2_x3_2"] = "subway_trains/717/kv70_4/kv70_x2_x3.mp3"
    self.SoundNames["kv70_x3_x2_2"] = "subway_trains/717/kv70_4/kv70_x3_x2.mp3"
    self.SoundPositions["kv70_0_t1_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1_0_fix_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1_0_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1_t1a_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1a_t1_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t1a_t2_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_t2_t1a_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_0_x1_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x1_0_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x1_x2_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x2_x1_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x2_x3_2"] = self.SoundPositions["kv70_0_t1"]
    self.SoundPositions["kv70_x3_x2_2"] = self.SoundPositions["kv70_0_t1"]

    self.SoundNames["ring_old"] = {loop=0.15,"subway_trains/717_mmz/ring/ring_old_start.mp3","subway_trains/717_mmz/ring/ring_old_loop.mp3","subway_trains/717_mmz/ring/ring_old_end.mp3"}
    self.SoundPositions["ring_old"] = {60,1e9,Vector(380,-50,-44),0.35}

    self.SoundNames["cab_door_open"] = "subway_trains/common/door/cab/door_open.mp3"
    self.SoundNames["cab_door_close"] = "subway_trains/common/door/cab/door_close.mp3"
    self.SoundNames["otsek_door_open"] = {"subway_trains/720/door/door_torec_open.mp3","subway_trains/720/door/door_torec_open2.mp3"}
    self.SoundNames["otsek_door_close"] = {"subway_trains/720/door/door_torec_close.mp3","subway_trains/720/door/door_torec_close2.mp3"}

    --[[
    self.SoundNames["igla_on"]  = "subway_trains/common/other/igla/igla_on1.mp3"
    self.SoundNames["igla_off"] = "subway_trains/common/other/igla/igla_off2.mp3"
    self.SoundNames["igla_start1"]  = "subway_trains/common/other/igla/igla_start.mp3"
    self.SoundNames["igla_start2"]  = "subway_trains/common/other/igla/igla_start2.mp3"
    self.SoundNames["igla_alarm1"]  = "subway_trains/common/other/igla/igla_alarm1.mp3"
    self.SoundNames["igla_alarm2"]  = "subway_trains/common/other/igla/igla_alarm2.mp3"
    self.SoundNames["igla_alarm3"]  = "subway_trains/common/other/igla/igla_alarm3.mp3"
    self.SoundPositions["igla_on"] = 		{50,1e9,Vector(458.50,-33,34),0.15}
    self.SoundPositions["igla_off"] = 		{50,1e9,Vector(458.50,-33,34),0.15}
    self.SoundPositions["igla_start1"] = 	{50,1e9,Vector(458.50,-33,34),0.33}
    self.SoundPositions["igla_start2"] = 	{50,1e9,Vector(458.50,-33,34),0.15}
    self.SoundPositions["igla_alarm1"] = 	{50,1e9,Vector(458.50,-33,34),0.33}
    self.SoundPositions["igla_alarm2"] = 	{50,1e9,Vector(458.50,-33,34),0.33}
    self.SoundPositions["igla_alarm3"] = 	{50,1e9,Vector(458.50,-33,34),0.33}
    --]]

    self.SoundNames["pnm_on"]           = {"subway_trains/common/pnm/pnm_switch_on.mp3","subway_trains/common/pnm/pnm_switch_on2.mp3"}
    self.SoundNames["pnm_off"]          = "subway_trains/common/pnm/pnm_switch_off.mp3"
    self.SoundNames["pnm_button1_on"]           = {
        "subway_trains/common/pnm/pnm_button_push.mp3",
        "subway_trains/common/pnm/pnm_button_push2.mp3",
    }

    self.SoundNames["pnm_button2_on"]           = {
        "subway_trains/common/pnm/pnm_button_push3.mp3",
        "subway_trains/common/pnm/pnm_button_push4.mp3",
    }

    self.SoundNames["pnm_button1_off"]          = {
        "subway_trains/common/pnm/pnm_button_release.mp3",
        "subway_trains/common/pnm/pnm_button_release2.mp3",
        "subway_trains/common/pnm/pnm_button_release3.mp3",
    }

    self.SoundNames["pnm_button2_off"]          = {
        "subway_trains/common/pnm/pnm_button_release4.mp3",
        "subway_trains/common/pnm/pnm_button_release5.mp3",
    }

    self.SoundNames["horn"] = {loop=0.5,"subway_trains/717_mmz/horn/horn3_start.wav","subway_trains/717_mmz/horn/horn3_loop.wav", "subway_trains/717_mmz/horn/horn3_end.wav"}
    self.SoundPositions["horn"] = {1100,1e9,Vector(450,0,-55),0.6}

    --DOORS
    self.SoundNames["vdol_on"] = {
        "subway_trains/common/pneumatic/door_valve/VDO_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDO2_on.mp3",
    }
    self.SoundNames["vdol_off"] = {
        "subway_trains/common/pneumatic/door_valve/VDO_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDO2_off.mp3",
    }
    self.SoundPositions["vdol_on"] = {300,1e9,Vector(-420,45,-30),1}
    self.SoundPositions["vdol_off"] = {300,1e9,Vector(-420,45,-30),0.4}
    self.SoundNames["vdor_on"] = self.SoundNames["vdol_on"]
    self.SoundNames["vdor_off"] = self.SoundNames["vdol_off"]
    self.SoundPositions["vdor_on"] = self.SoundPositions["vdol_on"]
    self.SoundPositions["vdor_off"] = self.SoundPositions["vdol_off"]
    self.SoundNames["vdol_loud"] = "subway_trains/common/pneumatic/door_valve/vdo3_on.mp3"
    self.SoundNames["vdop_loud"] = self.SoundNames["vdol_loud"]
    self.SoundPositions["vdol_loud"] = {100,1e9,Vector(-420,45,-30),1}
    self.SoundPositions["vdop_loud"] = self.SoundPositions["vdol_loud"]
    self.SoundNames["vdz_on"] = {
        "subway_trains/common/pneumatic/door_valve/VDZ_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ2_on.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ3_on.mp3",
    }
    self.SoundNames["vdz_off"] = {
        "subway_trains/common/pneumatic/door_valve/VDZ_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ2_off.mp3",
        "subway_trains/common/pneumatic/door_valve/VDZ3_off.mp3",
    }
    self.SoundPositions["vdz_on"] = {60,1e9,Vector(-420,45,-30),1}
    self.SoundPositions["vdz_off"] = {60,1e9,Vector(-420,45,-30),0.4}

    self.SoundNames["RKR"] = "subway_trains/common/pneumatic/RKR2.mp3"
    self.SoundPositions["RKR"] = {330,1e9,Vector(-27,-40,-66),0.22}

    self.SoundNames["PN2end"] = {"subway_trains/common/pneumatic/vz2_end.mp3","subway_trains/common/pneumatic/vz2_end_2.mp3","subway_trains/common/pneumatic/vz2_end_3.mp3","subway_trains/common/pneumatic/vz2_end_4.mp3"}
    self.SoundPositions["PN2end"] = {350,1e9,Vector(-183,0,-70),0.3}
    for i=0,3 do
        for k=0,1 do
            self.SoundNames["door"..i.."x"..k.."r"] = {"subway_trains/common/door/door_roll.wav",loop=true}
            self.SoundPositions["door"..i.."x"..k.."r"] = {150,1e9,GetDoorPosition(i,k),0.11}
            self.SoundNames["door"..i.."x"..k.."o"] = {"subway_trains/common/door/door_open_end5.mp3","subway_trains/common/door/door_open_end6.mp3","subway_trains/common/door/door_open_end7.mp3"}
            self.SoundPositions["door"..i.."x"..k.."o"] = {350,1e9,GetDoorPosition(i,k),2}
            self.SoundNames["door"..i.."x"..k.."c"] = {"subway_trains/common/door/door_close_end.mp3","subway_trains/common/door/door_close_end2.mp3","subway_trains/common/door/door_close_end3.mp3","subway_trains/common/door/door_close_end4.mp3","subway_trains/common/door/door_close_end5.mp3"}
            self.SoundPositions["door"..i.."x"..k.."c"] = {400,1e9,GetDoorPosition(i,k),2}
        end
    end

    for k,v in ipairs(self.AnnouncerPositions) do
        self.SoundNames["announcer_noise1_"..k] = {loop=true,"subway_announcers/upo/noiseS1.wav"}
        self.SoundPositions["announcer_noise1_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.5}
        self.SoundNames["announcer_noise2_"..k] = {loop=true,"subway_announcers/upo/noiseS2.wav"}
        self.SoundPositions["announcer_noise2_"..k] = {v[2] or 300,1e9,v[1],v[3]*0.5}
    end

    for _,v in pairs(ARSRelays) do
        self.SoundNames[v.."_on"] = "subway_trains/common/relays/ars_relays_on1.mp3"
        self.SoundNames[v.."_off"] = "subway_trains/common/relays/ars_relays_off1.mp3"
        self.SoundPositions[v.."_on"] = {10,1e9,Vector(385,-32, 10),0.05}
        self.SoundPositions[v.."_off"] = {10,1e9,Vector(385,-32, 10),0.05}
    end

    self:SetRelays()
end

ENT.PR14XRelaysOrder = {"r1_5_on","r1_5_off","rp8_on","rp8_off","ro_on","ro_off","rpb_on","rpb_off","k6_on","k6_off","rvt_on","rvt_off","kd_on","kd_off","k25_on","k25_off",}
ENT.PR14XRelays = {
    --orig 1
    r1_5_on = {
        --{"kpd110e_on2", 1},
        --^ SPB ONLY ^
        {"kpd110e_on4", 0.8},
        {"kpd110e_on5", 0.8},
        {"kpd110e_on6", 0.8},
        --v MSK ONLY v
        {"kpd110e_on1", 1},
        {"kpd110e_on3", 0.7},
        {"kpd110e_on7", 0.8},
    },
    --orig 0.7
    r1_5_off = {
        --{"kpd110e_off1",0.9},
        --{"kpd110e_off2",1},
        --^ SPB ONLY ^
        --v MSK ONLY v
        {"kpd110e_off5", 0.9},
        {"kpd110e_off6", 0.8},
    },
    --orig 1
    rvt_on = {
        {"rev811t_on2", 1},
        {"rev811t_on3", 1},
        {"rev811t_on4", 1},
        {"rev811t_on5", 0.6},
    },
    --orig 1
    rp8_on = {
        {"rev811t_on1", 2},
        {"rev811t_on2", 2},
        {"rev811t_on3", 2},
        {"rev811t_on4", 2},
        {"rev811t_on5", 1.6},
    },
    --orig 0.3
    rp8_off = {
        {"rev811t_off1",0.3},
        {"rev811t_off2",0.2},
        {"rev811t_off4",0.3},
    },
    ro_on = {
        --^ SPB ONLY ^
        {"kpd110e_on4",0.8},
        {"kpd110e_on5",0.8},
        {"kpd110e_on6",0.8},
        {"kpd110e_on1",1},
        {"kpd110e_on3",0.7},
        {"kpd110e_on7",0.8},
        --v MSK ONLY v
    },
    ro_off = {
        --^ SPB ONLY ^
        {"kpd110e_off1",0.9},
        {"kpd110e_off2",1},
        {"kpd110e_off5",0.9},
        {"kpd110e_off6",0.8},
        --v MSK ONLY v
    },
    --1
    rpb_on = {{"rev813t_on1",1},{"rev813t_on2",1}},
    --0.7
    rpb_off = {{"rev813t_off1",0.7}},
    --1
    k6_on = {{"tkpm121_on1",1},{"tkpm121_on2",1}},
    --1
    k6_off = {{"tkpm121_off1",1},{"tkpm121_off2",1}},
}
ENT.PR14XRelays.rvt_off = ENT.PR14XRelays.rp8_off
ENT.PR14XRelays.kd_on = ENT.PR14XRelays.rp8_on
ENT.PR14XRelays.kd_off = ENT.PR14XRelays.rp8_off
ENT.PR14XRelays.k25_on = ENT.PR14XRelays.ro_on
ENT.PR14XRelays.k25_off = ENT.PR14XRelays.ro_off

function ENT:SetRelays()
    local relayConf = self:GetNW2String("RelaysConfig")
    if #relayConf<#self.PR14XRelaysOrder then return end
    for i,k in ipairs(self.PR14XRelaysOrder) do
        local id = tonumber(relayConf[i])
        local v = self.PR14XRelays[k][id]
        self.SoundNames[k] = Format("subway_trains/717/relays/%s.mp3",v[1])
        self.SoundPositions[k][4] = v[2] or 1
    end
end

function ENT:InitializeSystems()
    -- Электросистема 81-717
    self:LoadSystem("Electric","81_717_0")
    -- Токоприёмник
    self:LoadSystem("TR","TR_3B")
    -- Электротяговые двигатели
    self:LoadSystem("Engines","DK_117DM")

    -- Резисторы для реостата/пусковых сопротивлений
    self:LoadSystem("KF_47A","KF_47A11")
    -- Резисторы для ослабления возбуждения
    self:LoadSystem("KF_50A","KF_50A7")
    -- Резисторы вспомогательных цепей
    self:LoadSystem("KF_10B")
    -- Ящик с предохранителями
    self:LoadSystem("YAP_57")

    -- Резисторы для цепей управления
    self:LoadSystem("Reverser","PR_722B")
    -- Реостатный контроллер для управления пусковыми сопротивления
    self:LoadSystem("RheostatController","EKG_36A")
    -- Групповой переключатель положений
    self:LoadSystem("PositionSwitch","PKG_761А")
    -- Кулачковый контроллер
    self:LoadSystem("KV","KV_67A")
    -- Контроллер резервного управления
    self:LoadSystem("KRU","KV_68A")

    -- Ящики с реле и контакторами
    self:LoadSystem("LK_756V")
    self:LoadSystem("YAR_13ZH")
    self:LoadSystem("YAR_27A")
    self:LoadSystem("YAK_36V")
    self:LoadSystem("YAK_37D")
    self:LoadSystem("YAS_44V")
    self:LoadSystem("YAS_44G")
    self:LoadSystem("PR_12X_Panels")

    -- Пневмосистема 81-710
    self:LoadSystem("Pneumatic","81_717_0_Pneumatic")
    -- Панель управления 81-710
    self:LoadSystem("Panel","81_717_0_Panel")
    -- Everything else
    self:LoadSystem("Battery")
    self:LoadSystem("PowerSupply","BPSN5_U2")
    self:LoadSystem("ALS_ARS","BARS")
    self:LoadSystem("ALS_ARS_BUM_U3")
    self:LoadSystem("ISDPM")
    self:LoadSystem("Horn")

    --self:LoadSystem("IGLA_CBKI","IGLA_CBKI1")
    --self:LoadSystem("IGLA_PCBK")

    self:LoadSystem("Announcer","81_71_Announcer", "AnnouncementsRRI")

    self:LoadSystem("RRI","81_71_RRI")
    self:LoadSystem("RRI_VV","81_71_RRI_VV")

    self:LoadSystem("RouteNumber","81_717_Minsk_RouteNumber",2)
    self:LoadSystem("LastStation","81_71_LastStation","717","destination")
end

function ENT:PostInitializeSystems()
    self.Electric:TriggerInput("Type",self.Electric.MVM)
    self.KRU:TriggerInput("LockX3",1)
end
---------------------------------------------------
-- Defined train information
-- Types of wagon(for wagon limit system):
-- 0 = Head or intherim
-- 1 = Only head
-- 2 = Only intherim
---------------------------------------------------
ENT.SubwayTrain = {
    Type = "81",
    Name = "81-717.0",
    WagType = 1,
    Manufacturer = "MVM",
    ALS = {
        HaveAutostop = true,
        TwoToSix = true,
        RSAs325Hz = true,
        Aproove0As325Hz = false,
    },
    Announcer = {
    },
    EKKType = 717,
}
-- LVZ,Dot5,NewSeats,NewBL,PassTexture,MVM
ENT.NumberRanges = {
    --81-717.0
    {
        true,
        {9301, 9302, 9303, 9304, 9305, 9306, 9307, 9308, 9309, 9310, 9315, 9316, 9317, 9318, 9319, 9320, 9321, 9322, 9323, 9324, 9325, 9326},
        {true,true,true,true}
    },
    --81-717.БВ
    {
        true,
        {0074, 0075, 0076, 0077},
        {false,false,false,false}
    },
}

ENT.Spawner = {
    model = {
        "models/metrostroi_train/81-717/81-717_mvm.mdl",
        "models/metrostroi_train/81-717/interior_mvm.mdl",
        "models/metrostroi_train/81-717/717_body_additional.mdl",
        "models/metrostroi_train/81-717/brake_valves/334.mdl",
        "models/metrostroi_train/81-717/lamps_type1.mdl",
        "models/metrostroi_train/81-717/couch_old.mdl",
        "models/metrostroi_train/81-717/couch_cap_l.mdl",
        "models/metrostroi_train/81-717/handlers_old.mdl",
        "models/metrostroi_train/81-717/mask_222.mdl",
        "models/metrostroi_train/81-717/couch_cap_r.mdl",
        "models/metrostroi_train/81-717/cabine_mvm.mdl",
        "models/metrostroi_train/81-717/pult/body_classic.mdl",
        "models/metrostroi_train/81-717/pult/pult_mvm_classic.mdl",
        "models/metrostroi_train/81-717/pult/ars_old.mdl",
    },
    interim = "gmod_subway_81-714_mmz",
    --Metrostroi.Skins.GetTable("Texture","Spawner.Texture",false,"train"),
    --Metrostroi.Skins.GetTable("PassTexture","Spawner.PassTexture",false,"pass"),
    --Metrostroi.Skins.GetTable("CabTexture","Spawner.CabTexture",false,"cab"),
    {"MaskType","Тип маски","List",{"2-2","2-2(М)","2-2-2(М)"}},
    {"Announcer","Spawner.717.Announcer","List",function()
        local Announcer = {}
        for k,v in pairs(Metrostroi.AnnouncementsASNP or {}) do if not v.riu then Announcer[k] = v.name or k end end
        return Announcer
    end},
    {"Scheme","Spawner.717.Schemes","List",function()
        local Schemes = {}
        for k,v in pairs(Metrostroi.Skins["717_new_schemes"] or {}) do Schemes[k] = v.name or k end
        return Schemes
    end},
    {"SpawnMode","Spawner.717.SpawnMode","List",{"Spawner.717.SpawnMode.Full","Spawner.717.SpawnMode.Deadlock","Spawner.717.SpawnMode.NightDeadlock","Spawner.717.SpawnMode.Depot"}, nil,function(ent,val,rot,i,wagnum,rclk)
        if rclk then return end
        if ent._SpawnerStarted~=val then
            ent.VB:TriggerInput("Set",val<=2 and 1 or 0)
            ent.ParkingBrake:TriggerInput("Set",val==3 and 1 or 0)
            if ent.AR63  then
                local first = i==1 or _LastSpawner~=CurTime()
                ent.A53:TriggerInput("Set",val<=2 and 1 or 0)
                ent.A49:TriggerInput("Set",val<=2 and 1 or 0)
                ent.AR63:TriggerInput("Set",val<=2 and 1 or 0)
                ent.RRIEnable:TriggerInput("Set",val<=2 and 1 or 0)
                ent.RRIAmplifier:TriggerInput("Set",val<=2 and 1 or 0)
                ent.R_UNch:TriggerInput("Set",val==1 and 1 or 0)
				ent.R_ZS:TriggerInput("Set",val==1 and 1 or 0)
                ent.R_G:TriggerInput("Set",val==1 and 1 or 0)
                ent.R_Radio:TriggerInput("Set",val==1 and 1 or 0)
                ent.L_4:TriggerInput("Set",val==1 and 1 or 0)
                ent.BPSNon:TriggerInput("Set",(val==1 and first) and 1 or 0)
                ent.VMK:TriggerInput("Set",(val==1 and first) and 1 or 0)
                ent.VAO:TriggerInput("Set",(val==1 and first) and 1 or 0)
                ent.VUD:TriggerInput("Set",(val==1 and first) and 1 or 0)
                ent.ARS:TriggerInput("Set",(ent.Plombs.RC1 and val==1 and first) and 1 or 0)
                ent.ALS:TriggerInput("Set",val==1 and 1 or 0)
                ent.L_3:TriggerInput("Set",val==1 and 1 or 0)
                ent.L_4:TriggerInput("Set",val==1 and 1 or 0)
                ent.VUS:TriggerInput("Set",val==1 and 1 or 0)
                ent.EPK:TriggerInput("Set",(ent.Plombs.RC1 and val==1) and 1 or 0)
                _LastSpawner=CurTime()
                ent.CabinDoor = val==4 and first
                ent.PassengerDoor = val==4
                ent.RearDoor = val==4
            else
                ent.FrontDoor = val==4
                ent.RearDoor = val==4
            end
            ent.Pneumatic.RightDoorState = val==4 and {1,1,1,1} or {0,0,0,0}
            ent.Pneumatic.DoorRight = val==4
            ent.Pneumatic.LeftDoorState = val==4 and {1,1,1,1} or {0,0,0,0}
            ent.Pneumatic.DoorLeft = val==4
            ent.GV:TriggerInput("Set",val<4 and 1 or 0)
            ent._SpawnerStarted = val
        end
        ent.Pneumatic.TrainLinePressure = val==3 and math.random()*4 or val==2 and 4.5+math.random()*3 or 7.6+math.random()*0.6
        if val==4 then ent.Pneumatic.BrakeLinePressure = 5.2 end
    end},
}
