--------------------------------------------------------------------------------
include("shared.lua")
--------------------------------------------------------------------------------
ENT.ClientProps = {}
ENT.ButtonMap = {}
ENT.AutoAnims = {}
ENT.ClientSounds = {}

ENT.ClientProps["salon"] = {
    model = "models/metrostroi_train/81-717/interior_mvm.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["body_additional"] = {
    model = "models/metrostroi_train/81-717/717_body_additional.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["schemes"] = {
    model = "models/metrostroi_train/81-717/labels/schemes.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
    callback = function(ent)
        ent.PassSchemesDone = false
    end,
}
ENT.ClientProps["destination"] = {
    model = "models/metrostroi_train/81-717/labels/destination.mdl",
    pos = Vector(-0.5,0,0),
    ang = Angle(0,0,0),
    hide=2,
    callback = function(ent)
        ent.LastStation.Reloaded = false
    end,
}
ENT.ClientProps["destination1"] = {
    model = "models/metrostroi_train/81-717/labels/destination.mdl",
    pos = Vector(-0.3,0,0),
    ang = Angle(0,0,0),
    hide=2,
    callback = function(ent)
        ent.LastStation.Reloaded = false
    end,
}
ENT.ButtonMap["LastStation"] = {
    pos = Vector(457.7,-27.4,1.75),
    ang = Angle(0,90,90),
    width = 876,
    height = 205,
    scale = 0.0625,
    buttons = {
        {ID = "LastStation-",x=000,y=0,w=438,h=205, tooltip=""},
        {ID = "LastStation+",x=438,y=0,w=438,h=205, tooltip=""},
    }
}
ENT.ClientProps["brake_valve_334"] = {
    model = "models/metrostroi_train/81-717/brake_valves/334.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=1,
}
--[[ENT.ClientProps["brake_valve_013"] = {
    model = "models/metrostroi_train/81-717/brake_valves/013.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=1,
}]]
ENT.ClientProps["lamps1"] = {
    model = "models/metrostroi_train/81-717/lamps_type1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=1.5,
}
ENT.ClientProps["lamps2"] = {
    model = "models/metrostroi_train/81-717/lamps_type2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=1.5,
}
ENT.ClientProps["seats_old"] = {
    model = "models/metrostroi_train/81-717/couch_old.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=1.5,
}
ENT.ClientProps["seats_old_cap"] = {
    model = "models/metrostroi_train/81-717/couch_cap_l.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["seats_new"] = {
    model = "models/metrostroi_train/81-717/couch_new.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=1.5,
}
ENT.ClientProps["seats_new_cap"] = {
    model = "models/metrostroi_train/81-717/couch_new_cap.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["handrails_old"] = {
    model = "models/metrostroi_train/81-717/handlers_old.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=1.5,
}
ENT.ClientProps["handrails_new"] = {
    model = "models/metrostroi_train/81-717/handlers_new.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=1.5,
}

ENT.ClientProps["mask22"] = {
    model = "models/metrostroi_minsk/81-717/masks/mask_717_22.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["mask22_mmz"] = {
    model = "models/metrostroi_minsk/81-717/masks/mask_717_22_mmz.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["mask222_mmz"] = {
    model = "models/metrostroi_minsk/81-717/masks/mask_717_222_mmz.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}

ENT.ClientProps["Headlights22_1"] = {
    model = "models/metrostroi_minsk/81-717/masks/22_glow1.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights22_2"] = {
    model = "models/metrostroi_minsk/81-717/masks/22_glow2.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights222_1"] = {
    model = "models/metrostroi_minsk/81-717/masks/222_glow1.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["Headlights222_2"] = {
    model = "models/metrostroi_minsk/81-717/masks/222_glow2.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["RedLights_r"] = {
    model = "models/metrostroi_minsk/81-717/masks/redlights_glow_r.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
ENT.ClientProps["RedLights_l"] = {
    model = "models/metrostroi_minsk/81-717/masks/redlights_glow_l.mdl",
    pos = Vector(458.629,0,10.8654),
    ang = Angle(0,0,0),
    nohide=true,
}
--[[
ENT.ClientProps["otsek_cap_l"] = {
    model = "models/metrostroi_train/81-717/otsek_cap_l.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0)
}
ENT.ClientProps["otsek_cap_r"] = {
    model = "models/metrostroi_train/81-717/otsek_cap_r.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0)
}
]]
ENT.ClientProps["door_otsek1"] = {
    model = "models/metrostroi_train/81-717/door_otsek1.mdl",
    pos = Vector(375.35,-15.324,5.167),
    ang = Angle(0,-90,0),
    hideseat=1.7,
}
ENT.ClientProps["door_otsek2"] = {
    model = "models/metrostroi_train/81-717/door_otsek2.mdl",
    pos = Vector(375.35,-59.65,5.167),
    ang = Angle(0,-90,0),
    hideseat=1.7,
}
ENT.ClientProps["cap_l"] = {
    model = "models/metrostroi_train/81-717/couch_cap_r.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["door1"] = {
    model = "models/metrostroi_train/81-717/door_torec.mdl",
    pos = Vector(-472.5,15.75,-2.7),
    ang = Angle(0,-90,0),
    hide=2,
}
ENT.ClientProps["door2"] = {
    model = "models/metrostroi_train/81-717/cab_door.mdl",
    pos = Vector(377.322,28.267,-1.599),
    ang = Angle(0,-90,0),
    hide=2,
}
ENT.ClientProps["door3"] = {
    model = "models/metrostroi_train/81-717/door_cabine.mdl",
    pos = Vector(443.493,65.111,0.277),
    ang = Angle(0,-90,0),
    hide=2,
}

ENT.ClientProps["cabine_mvm"] = {
    model = "models/metrostroi_train/81-717/cabine_mvm.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}
ENT.ClientProps["cabine_lvz"] = {
    model = "models/metrostroi_train/81-717/cabine_lvz.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hide=2,
}

local KVs = {
    "models/metrostroi_train/81-717/kv_black.mdl",
    "models/metrostroi_train/81-717/kv_white.mdl",
    "models/metrostroi_train/81-717/kv_wood.mdl",
    "models/metrostroi_train/81-717/kv_yellow.mdl",
}
ENT.ClientProps["Controller"] = {
    model = "models/metrostroi_train/81-717/kv_black.mdl",
    pos = Vector(435.848+0.08,16.1,-19.779+4.75-0.01),
    ang = Angle(0,-90,-32),
    hideseat=0.2,
    modelcallback = function(ent,cent)
        if ent.Anims.Controller then ent.Anims.Controller.reload = true end
        return KVs[ent:GetNW2Int("KVType",1)]
    end,
}
ENT.ClientProps["body_gray"] = {
    model = "models/metrostroi_train/81-717/pult/body_classic.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    color = Color(255,255,255),
    hide=2.5,
}

ENT.ClientProps["pult_mvm_classic"] = {
    model = "models/metrostroi_train/81-717/pult/pult_mvm_classic.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    color = Color(255,255,255),
    hideseat=0.8,
}
--[[
ENT.ClientProps["ars_mvm_round"] = {
    model = "models/metrostroi_train/81-717/pult/ars_round.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_round_yellow"] = {
    model = "models/metrostroi_train/81-717/pult/ars_round_yellow.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_square"] = {
    model = "models/metrostroi_train/81-717/pult/ars_square.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_old"] = {
    model = "models/metrostroi_train/81-717/pult/ars_old.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}
ENT.ClientProps["ars_mvm_old_yellow"] = {
    model = "models/metrostroi_train/81-717/pult/ars_old_yellow.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat=0.8,
}--]]

--var="ZS",vmin=0,vmax=1,min=0,max=1,speed=16,damping=false,
-- Main panel
ENT.ButtonMap["Block5_6"] = {
    pos = Vector(455.0-6,12.3,2.5-10.5+5.35),--446 -- 14 -- -0,5
    ang = Angle(0,-90,44),
    width = 480,
    height = 225,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {   ID = "R_UNchToggle",x=44+25.5*0,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_UNch",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "R_ZSToggle",x=44+25.5*1,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_ZS",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "R_GToggle",x=44+25.5*2,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_G",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "R_RadioToggle",x=44+25.5*3,y=40,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="R_Radio",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "!R_ProgramToggle",x=155,y=40,radius=0,model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_b_a.mdl",ang = 90,z=-3,
            getfunc = function(ent) return ent:GetPackedBool("R_Program1") and 0 or (ent:GetPackedBool("R_Program2") and 1 or 0.5) end,
            var="R_Program",speed=16
        }},
        {ID = "R_Program1Set",x=155-20,y=40-10,w=20,h=20,tooltip="",model = {
            var="R_Program1",sndid = "!R_ProgramToggle",
            sndvol = 0.5,snd = function(val) return val and "triple_0-down" or "triple_down-0" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_Program2Set",x=155+0,y=40-10,w=20,h=20,tooltip="",model = {
            var="R_Program2",sndid = "!R_ProgramToggle",
            sndvol = 0.5,snd = function(val) return val and "triple_0-up" or "triple_up-0" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
		{   ID = "KB1Set",x=243,y=36,radius=20,tooltip="КБ1: Кнопка бдительности",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="KB1",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
		{   ID = "KB2Set",x=287.5,y=36,radius=20,tooltip="КБ2: Кнопка бдительности",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="KB2",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
		{   ID = "KVTSet",x=243,y=83,radius=20,tooltip="КВТ: Кнопка восприятия торможения",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="KVT",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
		{   ID = "EPKbSet",x=287.5,y=83,radius=20,tooltip="Кнопка включения ЭПК",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="EPKb",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "ContVentSet",x=372.5,y=36,radius=20,tooltip="Кнопка контроля вентиляции",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="ContVent",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button2_off" end,
            sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "!LKV1Light",x=333,y=42,radius=20,tooltip="ЛКВ1: Лампа контроля невключения вентиляции",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",ignorepanel = true,skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=63,x=-0.3,y=-0.3,z=20.6,var="LKV1",color=Color(255,170,110)},
        }},
        {ID = "!LKV2Light",x=412,y=42,radius=20,tooltip="ЛКВ2: Лампа контроля невключения вентиляции вагона",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",ignorepanel = true,skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=63,x=-0.3,y=-0.3,z=20.6,var="LKV2",color=Color(255,170,110)},
        }},
        {   ID = "V13Toggle",x=438,y=42,radius=20,tooltip="Тумблер включения аварийной вентиляции",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="V13",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        --[[{ID = "VUD1Toggle",x=60,y=103,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/switches/vudblack.mdl",z=-20,
            var="VUD1",speed=6,
            sndvol = 1,snd = function(val) return val and "vu224_on" or "vu224_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},]]
		{ID = "VUDToggle",x=62,y=101,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",z=-5,ang=0,
            var="VUD",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLSet",x=60,y=170,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",
            var="KDL",speed=16,min=1,max=0,z=-2,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLKToggle",x=40,y=180,w=40,h=20,tooltip="",model = {
            var="KDLK",speed=8,min=0.32,max=0.68,disable="KDLSet",
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -3,
            sndvol = 1,snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLRSet",x=155,y=170,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",
            var="KDLR",speed=16,min=1,max=0,z=-2,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDLRKToggle",x=135,y=180,w=40,h=20,tooltip="",model = {
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -3,
            var="KDLRK",speed=8,min=0.32,max=0.68,disable="KDLRSet",
            sndvol = 1,snd = function(val) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "KRZDSet",x=155,y=85,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="KRZD",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "VozvratRPSet",x=107,y=132,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -3,
            var="VozvratRP",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button1_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},

        {ID = "!GreenRPLight",x=155,y=132,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=2,x=-0.3,y=-0.3,z=20.6,var="GreenRP",color=Color(100,255,100)}
        }},
		{ID = "!RZPLight",x=332,y=98,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",z = -6,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=63,x=-0.3,y=-0.3,z=20.6,var="RZP",color=Color(255,170,110)},
        }},
        {ID = "!LKVPLight",x=377,y=98,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",ignorepanel = true,skin = 3,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=25,x=-0.3,y=-0.3,z=20.6,var="LKVP",color=Color(255,170,110)},
        }},
        --[[
        {ID = "!SPLight",x=412,y=42,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",ignorepanel = true,skin = 1,z = -3,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=63,x=-0.3,y=-0.3,z=20.6,var="LSP",color=Color(100,255,50)},
        }},
        --]]
        {   ID = "V11Toggle",x=357,y=70,radius=20,tooltip="Тумблер включения I группы вентиляции",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="V11",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {   ID = "V12Toggle",x=400,y=70,radius=20,tooltip="Тумблер включения II группы вентиляции",model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_w_a.mdl",ang = 180,z=-3,
            var="V12",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "ConverterProtectionSet",x=333,y=133,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",
            var="ConverterProtection",speed=16,min=1,max=0,z=-4,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KSNSet",x=377,y=133,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="KSN",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "RingSet",x=420,y=133,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="Ring",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},

        {ID = "ARSToggle",x=234,y=134,radius=20,tooltip="АРC: Выключатель системы автоматического регулирования скорости",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t2.mdl",ang = 180,z=-6,
            var="ARS",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "ALSToggle",x=263,y=134,radius=20,tooltip="АЛС: Выключатель автоматической локомотивной сигнализации",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t2.mdl",ang = 180,z=-6,
            var="ALS",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "OVTToggle",x=240,y=181,radius=20,tooltip="ОВТ: Тумблер отпуска вентильного тормоза",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 0,z=-8,
            var="OVT",speed=16,
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=90,x=1,y=-25,z=4,var="OVTPl",ID="OVTPl",},
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "L_2Toggle",x=353,y=181,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="L_2",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "L_3Toggle",x=391,y=181,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-8,
            var="L_3",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}

-- Front panel
ENT.ButtonMap["Block7"] = {
    pos = Vector(446.22,-17.6,-5.48+5.35),
    ang = Angle(0,-90,58),
    width = 178,
    height = 222,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "L_4Toggle",x=42,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="L_4",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VUSToggle",x=74.5,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="VUS",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VADToggle",x=107,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="VAD",speed=16,
            plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=270,x=-1,y=28,z=4,var="VADPl",ID="VADPl",},
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VAHToggle",x=140,y=180.5,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-4,
            var="VAH",speed=16,
            --plomb = {model = "models/metrostroi_train/81/plomb.mdl",ang=270,x=-1,y=28,z=4,var="VAHPl",ID="VAHPl",},
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "KRPSet",x=43,y=30,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -2,
            var="KRP",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button1_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "RezMKSet",x=43,y=88,radius=20,tooltip="Резервный МК",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -2,
            var="RezMK",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button2_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDPSet",x=90,y=130,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",
            var="KDP",speed=16,min=1,max=0,z=-2,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "KDPKToggle",x=70,y=140,w=40,h=20,tooltip="",model = {
            model = "models/metrostroi_train/81/krishka.mdl",ang = 0,z = -1,
            var="KDPK",speed=8,min=0.33,max=0.685,disable="KDPSet",
            sndvol = 1,snd = function(val,realval) return val and "kr_close" or "kr_open" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "!PNW",x=135,y=130,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",skin = 4,z = -1,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=81,x=-0.3,y=-0.3,z=20.6,var="BrW",color=Color(255,130,90)},
        }},
    }
}

ENT.ButtonMap["Block1"] = {
    pos = Vector(450.4,28.2,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 290,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "VMKToggle",x=39,y=30,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-5,
            var="VMK",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "BPSNonToggle",x=80,y=30,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-5,
            var="BPSNon",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "VAOToggle",x=120,y=30,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_pp250.mdl",ang = 180,z=-3,
            var="VAO",speed=16,
            sndvol = 1,snd = function(val) return val and "switch_on" or "switch_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},

        {ID = "Radio13Set",x=80,y=80,radius=20,tooltip="Проверка Радио 13V",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_red.mdl",z = -2,
            var="Radio13",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button3_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "ARS13Set",x=130,y=80,radius=20,tooltip="Проверка АРС 13V",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -2,
            var="ARS13",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button2_off" end,sndmin = 60,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "!BatteryVoltage", x=220,y=55,radius=60,tooltip=""},
    }
}

ENT.ButtonMap["Block3"] = {
    pos = Vector(450.4,-10,1.3+5.35),
    ang = Angle(0,-90,58),
    width = 290,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "!BLTLPressure", x=62, y=55, radius=55, tooltip=""},
        {ID = "!BCPressure", x=182, y=55, radius=55, tooltip=""},
    }
}

ENT.ButtonMap["Block2"] = {
    pos = Vector(450.71,10.0,1.3+5.35+0.05),
    ang = Angle(0,-90,58),
    width = 300,
    height = 110,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "!Speedometer2",x=143,y=33.7,w=17,h=25,tooltip="",model = {
            name="SSpeed2",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",scale=0.82,color=Color(175,250,20),z=0,skin=0,ang=Angle(0,0,-90),
        }},
        {ID = "!Speedometer1",x=160,y=33.7,w=17,h=25,tooltip="",model = {
            name="SSpeed1",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",scale=0.82,color=Color(175,250,20),z=0,skin=0,ang=Angle(0,0,-90),
        }},
        {ID = "!ARSOch",x=107.7,y=36,w=10,h=10,tooltip="ОЧ: Лампа отсутствие частоты",model = {
            name="SAOCh",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.7,var="AR04"},
        }},
        {ID = "!ARS0",x=97.5,y=36,w=10,h=10,tooltip="0 км/ч:Лампа разрешенной скорости 0 км/ч",model = {
            name="SA0",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.7,var="AR0"},
        }},
        {ID = "!ARS40",x=97.5,y=35+10.9*1,w=10,h=10,tooltip="40 км/ч: Лампа разрешенной скорости 40 км/ч",model = {
            name="SA40",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.7,color=Color(255,150,0),var="AR40"},
        }},
        {ID = "!ARS60",x=97.5,y=33+11.9*2,w=10,h=10,tooltip="60 км/ч: Лампа разрешенной скорости 60 км/ч",model = {
            name="SA60",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.7,color=Color(175,250,20),var="AR60"},
        }},
        {ID = "!ARS70",x=97.5,y=33+11.2*3,w=10,h=10,tooltip="70 км/ч: Лампа разрешенной скорости 70 км/ч",model = {
            name="SA70",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.7,color=Color(175,250,20),var="AR70"},
        }},
        {ID = "!ARS80",x=97.5,y=35+10.3*4,w=10,h=10,tooltip="80 км/ч: Лампа разрешенной скорости 80 км/ч",model = {
            name="SA80",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.7,color=Color(175,250,20),var="AR80"},
        }},
        {ID = "!LampLSD1",x=190,y=36.5,w=9.6,h=4,tooltip="ЛСД: Лампа сигнализации дверей",model = {
            name="SSD1",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.7,color=Color(175,250,20),var="SD"},
        }},
        {ID = "!LampLSD2",x=200,y=36.5,w=10.4,h=4,tooltip="ЛСД: Лампа сигнализации дверей",model = {
            name="SSD2",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.7,ang=90,color=Color(175,250,20),var="SD"},
        }},
        {ID = "!LampLVD",x=190.3,y=45.9+8.8*0,w=10,h=4,tooltip="ЛВД: Лампа включения двигателей",model = {
            name="SVD",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",var="A04",z=-0.7,color=Color(175,250,20),var="VD"},
        }},
        {ID = "!LampLHRK",x=190.3,y=45.9+8.8*1.1,w=10,h=4,tooltip="ЛХРК: Лампа хода реостатного контроллера",model = {
            name="SRK",lamp = {speed=109,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.7,color=Color(255,150,0), var="HRK"},
        }},
        {ID = "!LampLST",x=190.3,y=45.9+8.9*2.1,w=10,h=4,tooltip="ЛСТ: Лампа сигнализации торможения",model = {
            name="SST",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.7,color=Color(255,150,0),var="ST"},
        }},
        {ID = "!LampRP",x=206.2,y=45.9+8.8*0,w=10,h=4,tooltip="РП: Лампа реле перегрузки",model = {
            name="SRP",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.7,var="RP"},
        }},
        {ID = "!LampLSN",x=216,y=45.9+8.8*0,w=10,h=4,tooltip="ЛСН: Лампа сигнализации неисправности",model = {
            name="SSN",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.7,ang=-90,var="SN"},
        }},
        {ID = "!LampLKVD",x=215,y=47+8.8*1,w=10,h=4,tooltip="ЛКВД: Лампа контроля выключения двигателей",model = {
            name="SKVD",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.7,color=Color(255,150,0),var="KVD"},
        }},
        {ID = "!LampLKT",x=215,y=47+8.8*2,w=10,h=4,tooltip="ЛКТ: Лампа контроля торможения",model = {
            name="SKT",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.7,color=Color(255,150,0),var="KT"}, 
        }},
        {ID = "!LampDV",x=215,y=47.5+8.8*3,w=10,h=4,tooltip="ДВ: Лампа неисправности датчика вращения колесной пары",model = {
            name="SDV",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.7,color=Color(255,150,0),var="DV"},
        }},
        {ID = "!LampLKVC",x=190.3,y=45+9.5*4,w=10,h=4,tooltip="ЛКВЦ: Лампа контактора вспомогательных цепей",model = {
            name="SKVC",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",ang=Angle(0,0,90),z=-0.7 ,color=Color(255,150,0),var="KVC"},
        }},
        {ID = "!LampBLD",x=190.3,y=45+9.5*3,w=10,h=4,tooltip="ЛН(БЛД): Лампа блокировки левых дверей",model = {
            name="BLD",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",ang=Angle(0,0,90),color=Color(175,250,20),z=-0.7,var="BLD"},
        }},
        {ID = "!LampLEKK",x=215,y=45+9.5*4,w=10,h=4,tooltip="ЛЭКК: Лампа электроконтактной коробки автосцепки",model = {
            name="LEKK",lamp = {speed=100,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",ang=Angle(0,0,90),color=Color(175,250,20),z=-0.8,var="LEKK"},
        }},
      
    }
}

ENT.ClientProps["alspanel_2k"] = {
    model =  "models/ivin/kvr/cabin/nsk_block_2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,-90,0),
    hideseat=0.8,
}

--[[ENT.ClientProps["speed"] = {
    model = "models/metrostroi_train/81-710/ezh3_voltages.mdl",
    pos = Vector(448.287628,-0.010203,1.644087),
    ang = Angle(0.000000,-90.000000,58.000000),
    bscale = Vector(1.2,1.2,1.65),
    hideseat=0.2,
}]]


--[=[
ENT.ButtonMap["KiyvARS"] = {
    pos = Vector(456.97,10.0,12.5),
    ang = Angle(0,-90,58),
    width = 300,
    height = 110,
    scale = 0.0625,

    buttons = {
        {ID = "!Speedometer1",x=135,y=28,w=17,h=25,tooltip="",model = {
            name="KSpeed2",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",color=Color(175,250,20),skin=0,z=0.1,ang=Angle(0,0,-90),
        }},
        {ID = "!Speedometer2",x=157,y=28,w=17,h=25,tooltip="",model = {
            name="KSpeed1",model = "models/metrostroi_train/81-717/segments/segment_spb.mdl",color=Color(175,250,20),skin=0,z=0.1,ang=Angle(0,0,-90),
        }},

        {ID = "!ARSOch",x=95.8,y=31.6,w=10,h=10,tooltip="",model = {
            name="KAOCh",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.2,var="AR04"},
        }},
        {ID = "!ARS0",x=84.3,y=31.6+11.4*0,w=10,h=10,tooltip="",model = {
            name="KA0",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ra.mdl",z=-0.2,var="AR0"},
        }},
        {ID = "!ARS40",x=84.3,y=31.6+11.4*1,w=10,h=10,tooltip="",model = {
            name="KA40",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR40"},
        }},
        {ID = "!ARS60",x=84.3,y=31.6+11.4*2,w=10,h=10,tooltip="",model = {
            name="KA60",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR60",color=Color(200,255,200)},
        }},
        {ID = "!ARS70",x=84.3,y=31.6+11.4*3,w=10,h=10,tooltip="",model = {
            name="KA70",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR70",color=Color(200,255,200)},
        }},
        {ID = "!ARS80",x=84.3,y=31.6+11.4*4,w=10,h=10,tooltip="",model = {
            name="KA80",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_ya.mdl",z=-0.2,var="AR80",color=Color(200,255,200)},
        }},

        {ID = "!LampLSD1",x=192.5,y=32.7,w=10,h=4,tooltip="",model = {
            name="KSD1",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="SD",color=Color(200,255,200)},
        }},
        {ID = "!LampLSD2",x=202.6,y=32.7,w=10,h=4,tooltip="",model = {
            name="KSD2",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,ang=90,var="SD",color=Color(200,255,200)},
        }},

        {ID = "!LampLVD",x=192.5,y=42.8+9.3*0,w=10,h=4,tooltip="",model = {
            name="KVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",var="A04",z=-0.2,var="VD",color=Color(200,255,200)},
        }},
        {ID = "!LampLHRK",x=192.5,y=42.8+9.3*1,w=10,h=4,tooltip="",model = {
            name="KRK",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="HRK"},
        }},
        {ID = "!LampLST",x=192.5,y=42.9+9.3*2,w=10,h=4,tooltip="",model = {
            name="KST",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="ST"},
        }},
        {ID = "!LampLRD",x=192.4,y=42.9+9.3*3,w=10,h=4,tooltip="",model = {
            name="KRD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="RD",color=Color(200,255,200)},
        }},


        {ID = "!LampRP",x=212,y=42.9+9.3*0,w=10,h=4,tooltip="",model = {
            name="KRP",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.2,var="RP"},
        }},
        {ID = "!LampLSN",x=222.1,y=42.9+9.3*0,w=10,h=4,tooltip="",model = {
            name="KSN",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_rb.mdl",z=-0.2,ang=-90,var="SN"},
        }},

        --{x=2031 + 2*0,y=223 + 192*0,w=10,h=10,tooltip="",radius=10},
        {ID = "!LampLKVD",x=222.0,y=42.9+9.2*1,w=10,h=4,tooltip="",model = {
            name="KKVD",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="KVD"},
        }},
        {ID = "!LampLKT",x=222.0,y=42.9+9.3*2,w=10,h=4,tooltip="",model = {
            name="KKT",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="KT"},
        }},
        {ID = "!LampDV",x=222.0,y=42.9+9.3*3,w=10,h=4,tooltip="",model = {
            name="KDV",lamp = {speed=10,model = "models/metrostroi_train/81-717/lamps/lamp_panelspb_yb.mdl",z=-0.2,var="DV",color=Color(200,255,200)},
        }},
        --[[
        {ID = "!LampLN",x=217-0.5*0 ,y=34.6 + 20.7*1,w=10,h=10,tooltip="",model = {
            name="KHLN",lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",color=Color(175,250,20),z=0,var="LN"},
        }},
        {ID = "!LampLRS",x=271.5-1*1,y=34.6 + 20.5*1,w=10,h=10,tooltip="",model = {
            name="KHRS",lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod2.mdl",color=Color(175,250,20),z=0,var="RS"},
        }},]]
    }
}]=]

ENT.ButtonMap["VUP"] = {
    pos = Vector(397,2,57),
    ang = Angle(0,90,90),
    width = 60,
    height = 120,
    scale = 0.0625,
    hideseat = 0.2,

    buttons = {
        {ID = "HTRToggle", x=0, y=0, w=60,h=120, tooltip="ВУП: Выключатель управления печью", model = {
            model = "models/metrostroi_train/Equipment/vu22_white.mdl", z=-0, ang = Angle(180,180,0),
            var="HTR",speed=6,
            sndvol = 1, snd = function(val) return val and "vu22_on" or "vu22_off" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(0,0,0),
        }},
    }
}
ENT.ButtonMap["VU"] = {
    pos = Vector(452,33.05,0.3),
    ang = Angle(0,240,90),
    width = 60,
    height = 120,
    scale = 0.0700,
    hideseat = 0.2,

    buttons = {
        {ID = "VUToggle", x=0, y=0, w=60,h=120, tooltip="ВУ: Выключатель управления", model = {
            model = "models/metrostroi_train/equipment/vu22_brown.mdl", z=-22, ang = Angle(180,240,0),
            var="VU",speed=6,
            sndvol = 1, snd = function(val) return val and "vu22_on" or "vu22_off" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(0,0,0),
        }},
    }
}
-- AV panel
ENT.ButtonMap["AV_C"] = {
    pos = Vector(396,-17.5,44.6),
    ang = Angle(0,90,90),
    width = 680,
    height = 590,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "A53Toggle",x=30+36.7*0,y=60+157*0,radius=25,tooltip="A-53: КВЦ"},
        {ID = "A56Toggle",x=30+36.7*1,y=60+157*0,radius=25,tooltip="A-56: Аккумуляторная батарея"},
        {ID = "A54Toggle",x=30+36.7*2,y=60+157*0,radius=25,tooltip="A-54: Управление поездом"},
        {ID = "A17Toggle",x=30+36.7*3,y=60+157*0,radius=25,tooltip="A-17: Резервное управление. Двери, белые фары"},
        {ID = "A44Toggle",x=30+36.7*4,y=60+157*0,radius=25,tooltip="A-44: Резервное управление. КРУ, Мотор-компрессор"},
        {ID = "A39Toggle",x=30+36.7*5,y=60+157*0,radius=25,tooltip="A-39: Резервное управление. Пуск вагона"},
        {ID = "A70Toggle",x=30+36.7*6,y=60+157*0,radius=25,tooltip="A-70: Резервное управление. Авторежим. РКТТ"},
		--{ID = "AAToggle",x=30+36.7*7,y=60+157*0,radius=25,tooltip="Не используется"},
        {ID = "A14Toggle",x=30+36.7*8,y=60+157*0,radius=25,tooltip="A-14: Резервное управление. РРП"},
        {ID = "A26Toggle",x=30+36.7*9,y=60+157*0,radius=25,tooltip="A-26: Усилитель радиосвязи"},
        {ID = "AR63Toggle",x=30+36.7*10,y=60+157*0,radius=25,tooltip="AР-63: Радиостанция"},
        {ID = "AS1Toggle",x=30+36.7*11,y=60+157*0,radius=25,tooltip="АС-1: Переговорное устройство"},
        {ID = "A13Toggle",x=30+36.7*12,y=60+157*0,radius=25,tooltip="A-13: Сигнализация закрытия дверей"},
        {ID = "A21Toggle",x=30+36.7*13,y=60+157*0,radius=25,tooltip="A-21: Управление дверями"},
        {ID = "A31Toggle",x=30+36.7*14,y=60+157*0,radius=25,tooltip="A-31: Открытие левых дверей"},
        {ID = "A32Toggle",x=30+36.7*15,y=60+157*0,radius=25,tooltip="A-32: Открытие правых дверей"},
        {ID = "A16Toggle",x=30+36.7*16,y=60+157*0,radius=25,tooltip="A-16: Закрытие дверей"},
        {ID = "A12Toggle",x=30+36.7*17,y=60+157*0,radius=25,tooltip="A-12: Резервное закрытие дверей"},
        ------------------------------------------------------------------------
        {ID = "A24Toggle",x=30+36.7*0,y=60+157*1,radius=25,tooltip=""},
        {ID = "A49Toggle",x=30+36.7*1,y=60+157*1,radius=25,tooltip=""},
        {ID = "A15Toggle",x=30+36.7*2,y=60+157*1,radius=25,tooltip=""},
        {ID = "A27Toggle",x=30+36.7*3,y=60+157*1,radius=25,tooltip=""},
        {ID = "A72Toggle",x=30+36.7*4,y=60+157*1,radius=25,tooltip=""},
        {ID = "A50Toggle",x=30+36.7*5,y=60+157*1,radius=25,tooltip=""},
        {ID = "AV2Toggle",x=30+36.7*6,y=60+157*1,radius=25,tooltip="АВ-2: Вентиляция вагона. Питание основное"},
        {ID = "AV3Toggle",x=30+36.7*7,y=60+157*1,radius=25,tooltip="АВ-3: Вентиляция вагона. Питание резервное"},
        {ID = "AV4Toggle",x=30+36.7*8,y=60+157*1,radius=25,tooltip="АВ-4: Вентиляция вагона. Управление I группой"},
        {ID = "AV5Toggle",x=30+36.7*9,y=60+157*1,radius=25,tooltip="АВ-5: Вентиляция вагона. Управление II группой"},
        {ID = "AV6Toggle",x=30+36.7*10,y=60+157*1,radius=25,tooltip="АВ-6: Вентиляция вагона. Управление резервное"},
        {ID = "AV1Toggle",x=30+36.7*11,y=60+157*1,radius=25,tooltip="АВ-1: Вентиляция вагона. Управление и сигнализация"},
        {ID = "A29Toggle",x=30+36.7*12,y=60+157*1,radius=25,tooltip=""},
        {ID = "A46Toggle",x=30+36.7*13,y=60+157*1,radius=25,tooltip=""},
        {ID = "A47Toggle",x=30+36.7*14,y=60+157*1,radius=25,tooltip=""},
        {ID = "A71Toggle",x=30+36.7*15,y=60+157*1,radius=25,tooltip=""},
        {ID = "A7Toggle",x=30+36.7*16,y=60+157*1,radius=25,tooltip=""},
        {ID = "A9Toggle",x=30+36.7*17,y=60+157*1,radius=25,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A8Toggle",x=30+36.7*1,y=60+157*2,radius=25,tooltip=""},
        {ID = "A52Toggle",x=30+36.7*2,y=60+157*2,radius=25,tooltip=""},
        {ID = "A19Toggle",x=30+36.7*3,y=60+157*2,radius=25,tooltip=""},
        {ID = "A48Toggle",x=30+36.7*4,y=60+157*2,radius=25,tooltip=""},
        {ID = "A10Toggle",x=30+36.7*5,y=60+157*2,radius=25,tooltip=""},
        {ID = "A22Toggle",x=30+36.7*6,y=60+157*2,radius=25,tooltip=""},
        {ID = "A30Toggle",x=30+36.7*7,y=60+157*2,radius=25,tooltip=""},
        {ID = "A1Toggle",x=30+36.7*8,y=60+157*2,radius=25,tooltip=""},
        {ID = "A2Toggle",x=30+36.7*9,y=60+157*2,radius=25,tooltip=""},
        {ID = "A3Toggle",x=30+36.7*10,y=60+157*2,radius=25,tooltip=""},
        {ID = "A4Toggle",x=30+36.7*11,y=60+157*2,radius=25,tooltip=""},
        {ID = "A5Toggle",x=30+36.7*12,y=60+157*2,radius=25,tooltip=""},
        {ID = "A6Toggle",x=30+36.7*13,y=60+157*2,radius=25,tooltip=""},
        {ID = "A20Toggle",x=30+36.7*16,y=60+157*2,radius=25,tooltip=""},
        {ID = "A25Toggle",x=30+36.7*17,y=60+157*2,radius=25,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A11Toggle",x=30+36.7*0,y=60+157*3,radius=25,tooltip=""},
        {ID = "A37Toggle",x=30+36.7*1,y=60+157*3,radius=25,tooltip=""},
        {ID = "A45Toggle",x=30+36.7*2,y=60+157*3,radius=25,tooltip=""},
        {ID = "A18Toggle",x=30+36.7*3,y=60+157*3,radius=25,tooltip=""},
        {ID = "A51Toggle",x=30+36.7*4,y=60+157*3,radius=25,tooltip=""},
        {ID = "A65Toggle",x=30+36.7*5,y=60+157*3,radius=25,tooltip=""},
        {ID = "A66Toggle",x=30+36.7*6,y=60+157*3,radius=25,tooltip="A-66: Пожарная сигнализация. Лампа КВЦ"},
        {ID = "A42Toggle",x=30+36.7*7,y=60+157*3,radius=25,tooltip="A-42: АРС 75В"},
        {ID = "A43Toggle",x=30+36.7*8,y=60+157*3,radius=25,tooltip="A-43: АРС 12В"},
        {ID = "A41Toggle",x=30+36.7*9,y=60+157*3,radius=25,tooltip="A-41: Вентиль замещения №2 от АРС"},
        {ID = "A40Toggle",x=30+36.7*10,y=60+157*3,radius=25,tooltip="A-40: Тормоз от АРС"},
        {ID = "A58Toggle",x=30+36.7*11,y=60+157*3,radius=25,tooltip="A-58: Автоведение. Управление"},
        {ID = "A59Toggle",x=30+36.7*12,y=60+157*3,radius=25,tooltip="A-59: Автоведение. Питание"},
        {ID = "A60Toggle",x=30+36.7*13,y=60+157*3,radius=25,tooltip="A-60: Автоведение. Сбор на ход"},
        {ID = "A55Toggle",x=30+36.7*14,y=60+157*3,radius=25,tooltip="A-55: Автоведение. Синхронизация хода РК"},
        {ID = "A57Toggle",x=30+36.7*15,y=60+157*3,radius=25,tooltip="A-57: Автоведение. Ход РК"},
        {ID = "A61Toggle",x=30+36.7*16,y=60+157*3,radius=25,tooltip="A-61: Автоведение. Контроль реверсивной рукоятки"},
        {ID = "A28Toggle",x=30+36.7*17,y=60+157*3,radius=25,tooltip="A-28: Питание блока управления"},
    }
}
for i,button in pairs(ENT.ButtonMap.AV_C.buttons) do
    button.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-25,
        var=button.ID:Replace("Toggle",""),speed=8,
        sndvol = 0.8,snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
    }
    button.ID = "1:"..button.ID
end
ENT.ButtonMap["Battery_C"] = {
    pos = Vector(410.0,-57,21),
    ang = Angle(0,90,90),
    width = 80,
    height = 280,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "RC1Toggle",x=40,y=40,radius=40,tooltip="РЦ-1: Разъединитель цепей АРС",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_rc1.mdl",z=17,ang=180,
            var="RC1",speed=0.5,vmin=1,vmax=0.87,
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=230,x=-28,y=28,var="RC1Pl",ID="RC1Pl",z=-15,},
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "RC2Toggle",x=40,y= 140,radius=40,tooltip="РЦ-2: Разъединитель цепей автоведения",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_vb.mdl",z=13,ang=180,
            var="RC2",speed=0.5,vmin=1,vmax=0.87,
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "VBToggle",x=40,y=240,radius=40,tooltip="ВБ: Выключатель батареи",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_rc1.mdl",z=17,ang=180,
            var="VB",speed=0.5,vmin=1,vmax=0.87,
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},     
    }
}
ENT.ButtonMap["VA_C"] = {
    pos = Vector(410.0,-34,56),
    ang = Angle(0,90,90),
    width = 50,
    height = 50,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "VAToggle",x=25,y=25,radius=20,tooltip="ВА: Выключатель автоведения",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_vb.mdl",z=13,ang=180,
            var="VA",speed=0.5,vmin=1,vmax=0.87,
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
    }
}
--[[
ENT.ButtonMap["AV_R"] = {
    pos = Vector(398.5+11,-52.9+0.6,37.1),
    ang = Angle(0,90,90),
    width = 398,
    height = 358,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "A11Toggle",x=29.7*0,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A17Toggle",x=29.7*1,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A44Toggle",x=29.7*2,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A26Toggle",x=29.7*3,y=155*0,w=25,h=45,tooltip=""},
        {ID = "AR63Toggle",x=29.7*4,y=155*0,w=25,h=45,tooltip=""},
        {ID = "AS1Toggle",x=29.7*5,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A21Toggle",x=29.7*6,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A49Toggle",x=29.7*7,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A27Toggle",x=29.7*8,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A10Toggle",x=29.7*9,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A53Toggle",x=29.7*10,y=155*0,w=25,h=45,tooltip=""},
        {ID = "A54Toggle",x=29.7*11,y=155*0,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A76Toggle",x=29.7*0,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A48Toggle",x=29.7*1,y=155*1,w=25,h=45,tooltip=""},
        {ID = "AV1Toggle",x=29.7*2,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A29Toggle",x=29.7*3,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A46Toggle",x=29.7*4,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A47Toggle",x=29.7*5,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A43Toggle",x=29.7*6,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A42Toggle",x=29.7*7,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A74Toggle",x=29.7*8,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A71Toggle",x=29.7*10,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A41Toggle",x=29.7*11,y=155*1,w=25,h=45,tooltip=""},
        {ID = "A45Toggle",x=29.7*12,y=155*1,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A75Toggle",x=29.7*0,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A8Toggle",x=29.7*1,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A52Toggle",x=29.7*2,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A72Toggle",x=29.7*3,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A31Toggle",x=29.7*4,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A32Toggle",x=29.7*5,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A13Toggle",x=29.7*6,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A1Toggle",x=29.7*7,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A20Toggle",x=29.7*8,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A25Toggle",x=29.7*9,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A30Toggle",x=29.7*10,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A56Toggle",x=29.7*11,y=155*2,w=25,h=45,tooltip=""},
        {ID = "A65Toggle",x=29.7*12,y=155*2,w=25,h=45,tooltip=""},
    }
}
for i,button in pairs(ENT.ButtonMap.AV_R.buttons) do
    button.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-25,
        var=button.ID:Replace("Toggle",""),speed=8,
        sndvol = 0.8,snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
    }
    button.ID = "2:"..button.ID
end

ENT.ButtonMap["AV_S"] = {
    pos = Vector(392,-33,-20),
    ang = Angle(0,270,90),
    width = 300,
    height = 165,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "A2Toggle",x=25*0,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A3Toggle",x=25*1,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A4Toggle",x=25*2,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A5Toggle",x=25*3,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A6Toggle",x=25*4,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A70Toggle",x=25*5,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A14Toggle",x=25*6,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A39Toggle",x=25*7,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A28Toggle",x=25*8,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A18Toggle",x=25*9,y=60*0,w=25,h=45,tooltip=""},
        {ID = "A22Toggle",x=25*10,y=60*0,w=25,h=45,tooltip=""},
        --{ID = "A8Toggle",x=25*11,y=60*0,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "A12Toggle",x=25*1,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A16Toggle",x=25*2,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A37Toggle",x=25*3,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A51Toggle",x=25*4,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A24Toggle",x=25*5,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A66Toggle",x=25*7,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A19Toggle",x=25*6,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A40Toggle",x=25*9,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A80Toggle",x=25*10,y=60*1,w=25,h=45,tooltip=""},
        {ID = "A50Toggle",x=25*11,y=60*1,w=25,h=45,tooltip=""},
        --{ID = "A52Toggle",x=25*12,y=60*1,w=25,h=45,tooltip=""},
        ------------------------------------------------------------------------
        {ID = "AV2Toggle",x=25*1,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV3Toggle",x=25*2,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV4Toggle",x=25*3,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV5Toggle",x=25*4,y=60*2,w=25,h=45,tooltip=""},
        {ID = "AV6Toggle",x=25*5,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A15Toggle",x=25*6,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A57Toggle",x=25*7,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A81Toggle",x=25*8,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A7Toggle",x=25*9,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A9Toggle",x=25*10,y=60*2,w=25,h=45,tooltip=""},
        {ID = "A68Toggle",x=25*11,y=60*2,w=25,h=45,tooltip=""},
        --{ID = "A72Toggle",x=25*12,y=60*2,w=25,h=45,tooltip=""},
    }
}
for i,button in pairs(ENT.ButtonMap.AV_S.buttons) do
    button.model = {
        model = "models/metrostroi_train/81-720/button_av1.mdl",z=-25,
        var=button.ID:Replace("Toggle",""),speed=8,
        sndvol = 0.8,snd = function(val) return val and "av_on" or "av_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
    }
end
--]]
--[[ENT.ButtonMap["Battery_R"] = {
    pos = Vector(410.0,-54.25,8),
    ang = Angle(0,90,90),
    width = 440,
    height = 157,
    scale = 0.0625,
    hide=0.8,

    buttons = {
        {ID = "2:RC1Toggle",x=64,y=40,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_rc1.mdl",z=17,ang=180,
            var="RC1",speed=0.5,vmin=1,vmax=0.87,
            plomb = {model = "models/metrostroi_train/81/plomb_b.mdl",ang=230,x=-28,y=28,var="RC1Pl",ID="RC1Pl",z=-15,},
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
        {ID = "2:VBToggle",x=220,y=40,radius=40,tooltip="",model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_vb.mdl",z=17,ang=180,
            var="VB",speed=0.5,vmin=1,vmax=0.87,
            sndvol = 0.8,snd = function(val) return val and "pak_on" or "pak_off" end,sndmin = 80,sndmax = 1e3/3,sndang = Angle(-90,0,0),
        }},
    }
}]]

ENT.ButtonMap["CabVent_C"] = {
    pos = Vector(455.2,47,-11.9),
    ang = Angle(0,-90,0),
    width = 70,
    height = 62,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID="PVK-",x=0, y=0, w=35,h=62, tooltip=""},
        {ID = "!PVK",x=35,y=31,model = {
            model = "models/metrostroi_train/81-717/buttons/breaker_common001.mdl",ang = 180,z=15,
            getfunc = function(ent) return ent:GetPackedRatio("PVK") end, var="PVK",speed=4,min=1,max=0.75,
            sndvol = 1,snd = function(val,val2) return "pvk"..val2 end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID="PVK+",x=35, y=0, w=35,h=62, tooltip=""},
    }
}
ENT.ButtonMap["CabVent_R"] = table.Copy(ENT.ButtonMap["CabVent_C"])
ENT.ButtonMap["CabVent_R"].pos = ENT.ButtonMap["CabVent_R"].pos - Vector(-0.2,0.6,1.1)
for k,v in pairs(ENT.ButtonMap["CabVent_R"].buttons) do v.ID = "1:"..v.ID end
-- Train driver helpers panel
ENT.ButtonMap["HelperPanel_C"] = {
    pos = Vector(447,62.6,17.75),
    ang = Angle(0,0,90),
    width = 76,
    height = 305,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "R_Program1HSet",x=38,y=230,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="R_Program1H",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button3_on" or "button2_off" end,
            sndmin = 60,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "R_Program2HSet",x=38,y=285,radius=20,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_button_black.mdl",z = -3,
            var="R_Program2H",speed=16,vmin=1,vmax=0,
            sndvol = 0.07,snd = function(val) return val and "button1_on" or "button3_off" end,
            sndmin = 60,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["HelperPanel_R"] = table.Copy(ENT.ButtonMap["HelperPanel_C"])
ENT.ButtonMap["HelperPanel_R"].pos = ENT.ButtonMap["HelperPanel_R"].pos - Vector(0.7,0,-0.65)
for k,v in pairs(ENT.ButtonMap["HelperPanel_R"].buttons) do v.ID = "1:"..v.ID end

ENT.ClientProps["reverser"] = {
    model = "models/metrostroi_train/reversor/reversor_classic.mdl",
    pos = Vector(438,-29.9,-14.9),
    ang = Angle(-90-22,180,90),
    hideseat=0.2,
    modelcallback = function(ent)
        return ent.HasGoldenReverser and "models/metrostroi_train/reversor/reversor_gold.mdl" or "models/metrostroi_train/reversor/reversor_classic.mdl"
    end,
}
ENT.ClientProps["krureverser"] = {
    model = "models/metrostroi_train/reversor/reversor_classic.mdl",
    pos = Vector(443.8,-24.5,-3.2),
    ang = Angle(0,-90,60),
    hideseat=0.2,
    modelcallback = function(ent)
        return ent.HasGoldenReverser and "models/metrostroi_train/reversor/reversor_gold.mdl" or "models/metrostroi_train/reversor/reversor_classic.mdl"
    end,
}

-- UAVA
ENT.ButtonMap["UAVAPanel"] = {
    pos = Vector(423,-57,-25.0),
    ang = Angle(0,180,90),
    width = 180,
    height = 200,
    scale = 0.0625,

    buttons = {
        {ID = "UAVAToggle",x=0, y=0, w=60, h=200, tooltip="", model = {
            plomb = {var="UAVAPl", ID="UAVAPl",},
            var="UAVA",
            sndid="UAVALever",sndvol = 1, snd = function(val) return val and "uava_on" or "uava_off" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
        {ID = "UAVAContactSet",x=60, y=0, w=120, h=200, tooltip=""},
    }
}
ENT.ClientProps["UAVALever"] = {
    model = "models/metrostroi_train/81-703/cabin_uava.mdl",
    pos = Vector(422.7,-59.4,-31.6),
    ang = Angle(3,-180,0),
    hideseat=0.2,
}

ENT.ButtonMap["Stopkran"] = {
    pos = Vector(401,62,17),
    ang = Angle(0,0,90),
    width = 200,
    height = 1300,
    scale = 0.1/2,
        buttons = {
            {ID = "EmergencyBrakeValveToggle",x=0,y=0,w=200,h=1300,tooltip=""},
    }
}
ENT.ClientProps["stopkran"] = {
    model = "models/metrostroi_train/81-717/stop_mvm.mdl",
    pos = Vector(408.45,62.15,11.5),
    ang = Angle(0,0,0),
    hideseat=0.2,
}
ENT.ClientSounds["EmergencyBrakeValve"] = {{"stopkran",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
--[[
ENT.ButtonMap["IGLA_C"] = {
    pos = Vector(456.15,-25.45,27.1),
    ang = Angle(0,-110,90),
    width = 512,--18333.333333333333333333333333333
    height = 107,--7916.6666666666666666666666666667
    scale = 0.0171,
    hideseat=0.2,
    hide=true,
}
ENT.ButtonMap["IGLAButtons_C"] = {
    pos = Vector(456.23,-24.87,27.85),
    ang = Angle(0,-110,90),
    width = 165,
    height = 70,
    scale = 0.0625,
    hideseat=0.2,
    buttons = {
        {ID = "IGLA1Set",x=23+32.5*0,y=54,w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL1",color=Color(175,250,20),x=1,y=-4.7,z=-2.3},
        }},
        {ID = "IGLA2Set",x=23+32.5*1,y=54,w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL2",color=Color(175,250,20),x=0.6,y=-4.7,z=-2.3},
        }},
        {ID = "IGLA23",x=23+32.5*1.5,y=54,w=14,h=12,tooltip=""},
        {ID = "IGLA3Set",x=23+32.5*2,y=54,w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL3",color=Color(175,250,20),x=0.2,y=-4.7,z=-2.3},
        }},
        {ID = "IGLA4Set",x=23+32.5*3,y=54,w=14,h=12,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/common/lamps/svetodiod1.mdl",var="IGLA:ButtonL4",color=Color(175,250,20),x=0,y=-4.7,z=-2.3},
        }},
        {ID = "!IGLAFire",x=142.9,y=56,radius=3,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="IGLA:Fire",color=Color(255,56,30),z=-2.4,ang=0},
        }},
        {ID = "!IGLAErr",x=142.9,y=63,radius=3,tooltip="",model = {
            lamp = {speed=16,model = "models/metrostroi_train/81-502/lamps/svetodiod_small_502.mdl",var="IGLA:Error",color=Color(255,168,000),z=-2.8,ang=0},
        }},
    }
}

ENT.ButtonMap["IGLA_R"] = table.Copy(ENT.ButtonMap["IGLA_C"])
ENT.ButtonMap["IGLAButtons_R"] = table.Copy(ENT.ButtonMap["IGLAButtons_C"])
ENT.ButtonMap["IGLA_R"].pos = ENT.ButtonMap["IGLA_R"].pos - Vector(0,0,1.09)
ENT.ButtonMap["IGLAButtons_R"].pos = ENT.ButtonMap["IGLAButtons_R"].pos - Vector(0.01,0,1.08)
for k,v in pairs(ENT.ButtonMap["IGLAButtons_R"].buttons) do v.ID = "1:"..v.ID end
--]]
ENT.ButtonMap["DriverValveBLDisconnect"] = {
    pos = Vector(426.1,-27.3,-20),
    ang = Angle(90,-150,90),
    width = 200,
    height = 100,
    scale = 0.0625,

    buttons = {
        {ID = "DriverValveBLDisconnectToggle", x=0, y=0, w=200, h=100, tooltip="", model = {
            var="DriverValveBLDisconnect",sndid="brake_disconnect",
            sndvol = 1, snd = function(val) return "disconnect_valve" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["DriverValveTLDisconnect"] = {
    pos = Vector(429.3,-23,-15),
    ang = Angle(90,-150,90),
    width = 200,
    height = 90,
    scale = 0.0625,

    buttons = {
        {ID = "DriverValveTLDisconnectToggle", x=0, y=0, w=200, h=90, tooltip="", model = {
            var="DriverValveTLDisconnect",sndid="train_disconnect",
            sndvol = 1, snd = function(val) return val and "pneumo_TL_open" or "pneumo_TL_disconnect" end,
            sndmin = 90, sndmax = 1e3, sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["EPKDisconnect"] = {
    pos = Vector(435,-40,-23),
    ang = Angle(0,-90-45,45),
    width = 200,
    height = 120,
    scale = 0.0625,

    buttons = {
        {ID = "EPKToggle",x=0,y=0,w=200,h=120,tooltip="",model = {
            var="EPK"--,sndid="EPK_disconnect",
            --sndvol = 1,snd = function(val) return "disconnect_valve" end,
            --sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
--[[
ENT.ButtonMap["EPVDisconnect"] = {
    pos = Vector(435,-40,-23),
    ang = Angle(0,-90-45,45),
    width = 200,
    height = 120,
    scale = 0.0625,

    buttons = {
        {ID = "EPKToggle",x=0,y=0,w=200,h=120,tooltip="",model = {
            var="EPK"--,sndid="EPK_disconnect",
            --sndvol = 1,snd = function(val) return "disconnect_valve" end,
            --sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
]]
ENT.ButtonMap["ParkingBrake"] = {
    pos = Vector(456.777527-3,5,-30),
    ang = Angle(0,-90,60),
    width = 200,
    height = 120,
    scale = 0.0625,

    buttons = {
        {ID = "ParkingBrakeToggle",x=0,y=0,w=200,h=120,tooltip="",model = {
            var="ParkingBrake",sndid="parking_brake",
            sndvol = 1,snd = function(val) return "disconnect_valve" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ClientProps["parking_brake"] = {
    model = "models/metrostroi_train/81-707/cran3.mdl",
    pos = Vector(453.6,-0.25,-39.8),
    ang = Angle(120,0,180),
    hideseat=0.2,
}

ENT.ClientProps["brake_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran1.mdl",
    pos = Vector(427.3,-28.9,-32.5),
    ang = Angle(90,-60,90),
    hideseat=0.2,
}
ENT.ClientSounds["EPK"] = {
    {"EPK_disconnect",function() return "disconnect_valve" end,1,1,90,1e3,Angle(-90,0,0)},
    --{"EPV_disconnect",function() return "disconnect_valve" end,1,1,90,1e3,Angle(-90,0,0)},
}
ENT.ClientProps["EPK_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran1.mdl",
    pos = Vector(432.4,-44.25,-24.7),
    ang = Angle(0,-90,0),
    hideseat=0.2,
}
--[[ENT.ClientProps["EPV_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran1.mdl",
    pos = Vector(431.15,-43.5,-24.7),
    ang = Angle(0,-90,0),
    hideseat=0.2,
}]]
ENT.ClientProps["train_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran3.mdl",
    pos = Vector(430.1,-24.0,-24.1),
    ang = Angle(90,-60,90),
    hideseat=0.2,
}


--[[ENT.ButtonMap["DriverValveDisconnect"] = {
    pos = Vector(425,-23,-27),
    ang = Angle(90,-150,90),
    width = 200,
    height = 90,
    scale = 0.0625,

    buttons = {
        {ID = "DriverValveDisconnectToggle",x=0,y=0,w=200,h=90,tooltip="",model = {
            var="DriverValveDisconnect",sndid="valve_disconnect",
            sndvol = 1,snd = function(val) return "disconnect_valve" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ClientProps["valve_disconnect"] = {
    model = "models/metrostroi_train/81-707/cran3.mdl",
    pos = Vector(428.15,-22.95,-37.43),
    ang = Angle(90,240+2,90),
    hideseat=0.2,
}]]

ENT.ButtonMap["FrontPneumatic"] = {
    pos = Vector(470-9,-45.0,-58.0+5),
    ang = Angle(0,90,90),
    width = 900,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    screenHide = true,

    buttons = {
        {ID = "FrontBrakeLineIsolationToggle",x=000, y=0, w=400, h=100, tooltip=""},
        {ID = "FrontTrainLineIsolationToggle",x=500, y=0, w=400, h=100, tooltip=""},
    }
}
ENT.ClientProps["FrontBrake"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_red.mdl",
    pos = Vector(449+11, -31, -62),
    ang = Angle(-15,-90,0),
    hide = 2,
}
ENT.ClientProps["FrontTrain"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_blue.mdl",
    pos = Vector(449+11, 31, -62),
    ang = Angle( 15,-90,0),
    hide = 2,
}
ENT.ClientSounds["FrontBrakeLineIsolation"] = {{"FrontBrake",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["FrontTrainLineIsolation"] = {{"FrontTrain",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}

ENT.ButtonMap["RearPneumatic"] = {
    pos = Vector(-473-1,45.0,-58.0+5),
    ang = Angle(0,270,90),
    width = 900,
    height = 100,
    scale = 0.1,
    hideseat=0.2,
    hide=true,
    screenHide = true,
    buttons = {
        {ID = "RearTrainLineIsolationToggle",x=500, y=0, w=400, h=100, tooltip=""},
        {ID = "RearBrakeLineIsolationToggle",x=000, y=0, w=400, h=100, tooltip=""},
    }
}
ENT.ClientProps["RearTrain"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_blue.mdl",
    pos = Vector(-450-22, -34, -62),
    ang = Angle(-15,90,0),
    hide = 2,
}
ENT.ClientProps["RearBrake"] = {--
    model = "models/metrostroi_train/bogey/disconnect_valve_red.mdl",
    pos = Vector(-450-22, 34, -62),
    ang = Angle( 15,90,0),
    hide = 2,
}
ENT.ClientSounds["RearBrakeLineIsolation"] = {{"RearBrake",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}
ENT.ClientSounds["RearTrainLineIsolation"] = {{"RearTrain",function() return "disconnect_valve" end,1,1,50,1e3,Angle(-90,0,0)}}


ENT.ButtonMap["GV"] = {
    pos = Vector(170-3-9.5,50+20,-60+2),
    ang = Angle(0,225-15,90),
    width = 260,
    height = 260,
    scale = 0.1,
    buttons = {
        {ID = "GVToggle",x=0, y=0, w= 260,h = 260, tooltip="", model = {
            var="GV",sndid = "gv",
            sndvol = 0.8,sndmin = 80, sndmax = 1e3/3, sndang = Angle(-90,0,0),
            snd = function(val) return val and "gv_f" or "gv_b" end,
        }},
    }
}
ENT.ClientProps["gv"] = {
    model = "models/metrostroi/81-717/gv.mdl",
    pos = Vector(153.5-3-9.5,36+20,-78+2),
    ang = Angle(-90,90,-90),
    color = Color(150,255,255),
    hide = 0.5,
}
ENT.ClientProps["gv_wrench"] = {
    model = "models/metrostroi_train/reversor/reversor_classic.mdl",
    pos = ENT.ClientProps["gv"].pos,
    ang = Angle(-90,0,0),
    hide = 0.5,
}

ENT.ButtonMap["AirDistributor"] = {
    pos = Vector(-185,-68,-50),
    ang = Angle(0,0,90),
    width = 170,
    height = 80,
    scale = 0.1,
    hideseat=0.1,
    hide=true,
    screenHide = true,

    buttons = {
        {ID = "AirDistributorDisconnectToggle",x=0,y=0,w= 170,h = 80,tooltip=""},
    }
}

for i=0,4 do
    ENT.ClientProps["TrainNumberL"..i] = {
        model = "models/metrostroi_train/common/bort_numbers.mdl",
        pos = Vector(41+16+i*6.6-5*6.6/2,67.4,-17.8),
        ang = Angle(0,180,0),
        skin=i,
        hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
    ENT.ClientProps["TrainNumberR"..i] = {
        model = "models/metrostroi_train/common/bort_numbers.mdl",
        pos = Vector(64+16-i*6.6-5*6.6/2,-67.4,-17.8),
        ang = Angle(0,0,0),
        skin=i,
        hide = 1.5,
        callback = function(ent)
            ent.WagonNumber = false
        end,
    }
end

ENT.ButtonMap["Route"] = {
    pos = Vector(457,43.4,-3.5),
    ang = Angle(0,99,90),
    width = 153,
    height = 130,
    scale = 0.0625,
    buttons = {
        {ID = "RouteNumber1+",x=76.5*0,y=0,w=76.5,h=65,tooltip=""},
        {ID = "RouteNumber2+",x=76.5*1,y=0,w=76.5,h=65,tooltip=""},
        {ID = "RouteNumber1-",x=76.5*0,y=65,w=76.5,h=65,tooltip=""},
        {ID = "RouteNumber2-",x=76.5*1,y=65,w=76.5,h=65,tooltip=""},
    }
}
ENT.ClientProps["route"] = {
    model = "models/metrostroi_train/common/routes/ezh/route_holder.mdl",
    pos = Vector(-8,0,-5.65),
    ang = Angle(0,1,0),
    hide = 2,
}

ENT.ClientProps["route1"] = {
    model = "models/metrostroi_train/common/routes/ezh/route_number1.mdl",
    pos = ENT.ClientProps["route"].pos,
    ang = ENT.ClientProps["route"].ang,
    skin=6,
    hide = 2,
    callback = function(ent)
        ent.RouteNumber.Reloaded = false
    end,
}
ENT.ClientProps["route2"] = {
    model = "models/metrostroi_train/common/routes/ezh/route_number2.mdl",
    pos = ENT.ClientProps["route"].pos,
    ang = ENT.ClientProps["route"].ang,
    skin=1,
    hide = 2,
    callback = function(ent)
        ent.RouteNumber.Reloaded = false
    end,
}

ENT.ButtonMap["CabinDoor"] = {
    pos = Vector(414.5,64,56.7),
    ang = Angle(0,0,90),
    width = 642,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoor",x=0,y=0,w=642,h=2000,tooltip="",model = {
            var="door2",sndid="door2",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["OtsekDoor1"] = {
    pos = Vector(394.5,28,12.6),
    ang = Angle(0,180,90),
    width = 310,
    height = 130,
    scale = 0.1/2,
    buttons = {
        {ID = "OtsekDoor1",x=0,y=0,w=310,h=130,tooltip="",model = {
            var="door_otsek1",sndid="door_otsek1",
            sndvol = 1,snd = function(val) return "otsek_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["OtsekDoor2"] = {
    pos = Vector(394.5,28,-15.5),
    ang = Angle(0,180,90),
    width = 310,
    height = 130,
    scale = 0.1/2,
    buttons = {
        {ID = "OtsekDoor2",x=0,y=0,w=310,h=130,tooltip="",model = {
            var="door_otsek2",sndid="door_otsek2",
            sndvol = 1,snd = function(val) return "otsek_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}

ENT.ButtonMap["PassengerDoor"] = {
    pos = Vector(390-12.2,29,50.6),--28
    ang = Angle(0,90,90),
    width = 642,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=642,h=2000,tooltip="",model = {
            var="door3",sndid="door3",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["PassengerDoor1"] = {
    pos = Vector(390-12.2,29+32,50.6),--28
    ang = Angle(0,-90,90),
    width = 642,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "PassengerDoor",x=0,y=0,w=642,h=2000,tooltip=""},
    }
}
ENT.ButtonMap["CabinDoor"] = {
    pos = Vector(411,64,50),
    ang = Angle(0,0,90),
    width = 665,
    height = 2000,
    scale = 0.1/2,
    buttons = {
        {ID = "CabinDoor",x=0,y=0,w=665,h=2000,tooltip="",model = {
            var="door2",sndid="door2",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
ENT.ButtonMap["RearDoor"] = {
    pos = Vector(-470-3,-16,48.4-2),
    ang = Angle(0,90,90),
    width = 642,
    height = 1900,
    scale = 0.1/2,
    buttons = {
        {ID = "RearDoor",x=0,y=0,w=642,h=1900,tooltip="",model = {
            var="door1",sndid="door1",
            sndvol = 1,snd = function(val) return val and "cab_door_open" or "cab_door_close" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
    }
}
--[[ ENT.ButtonMap["LeftMirror"] = {
    pos = Vector(470.0-0.1,72.75,37.4),
    ang = Angle(0,-60,90),
    width = 128,
    height = 256,
    scale = 0.06,
}
ENT.ButtonMap["RightMirror"] = {
    pos = Vector(470.0+3.4,-72.75+6,37.4),
    ang = Angle(0,-60-60,90),
    width = 128,
    height = 256,
    scale = 0.06,
}--]]
--------------------------------------------------------------------------------
ENT.ClientPropsInitialized = false
--[[ENT.ClientProps["brake013"] = {
    model = "models/metrostroi_train/81-717/cran13.mdl",
    pos = Vector(431.5,-20.3,-10.2),
    ang = Angle(0,180,0),
    hideseat = 0.2,
}]]
ENT.ClientProps["brake334"] = {
    model = "models/metrostroi_train/81-703/cabin_cran_334.mdl",
    pos = Vector(432.27,-22.83,-8.2),
    ang = Angle(0,-230,0),
    hideseat = 0.2,
}
--if not ENT.ClientSounds["br_013"] then ENT.ClientSounds["br_013"] = {} end
--table.insert(ENT.ClientSounds["br_013"],{"brake013",function(ent,_,var) return "br_013" end,0.7,1,50,1e3,Angle(-90,0,0)})
if not ENT.ClientSounds["br_334"] then ENT.ClientSounds["br_334"] = {} end
table.insert(ENT.ClientSounds["br_334"],{"brake334",function(ent,_,var) return "br_334_"..var end,1,1,50,1e3,Angle(-90,0,0)})

ENT.ClientProps["PB"] = {
    model = "models/metrostroi_train/81-720/720_pb.mdl",
    pos = Vector(450, 18, -37),
    ang = Angle(0,-90,8),
    hideseat = 0.2,
}
if not ENT.ClientSounds["PB"] then ENT.ClientSounds["PB"] = {} end
table.insert(ENT.ClientSounds["PB"],{"PB",function(ent,var) return var > 0 and "pb_on" or "pb_off" end,1,1,50,1e3,Angle(-90,0,0)})

ENT.ClientProps["train_line"] = {
    model = "models/metrostroi_train/Equipment/arrow_nm.mdl",
    pos = Vector(450.665070,-15.255391,-3.192689+5.35),
    ang = Angle(-62.299999,-33.400002,0.000000),
    hideseat = 0.2,
}
ENT.ClientProps["brake_line"] = {
    model = "models/metrostroi_train/Equipment/arrow_tm.mdl",
    pos = Vector(450.684143,-15.267894,-3.204609+5.35),
    ang = Angle(-62.299999,-33.400002,0.000000),
    hideseat = 0.2,
}
ENT.ClientProps["brake_cylinder"] = {
    model = "models/metrostroi_train/Equipment/arrow_nm.mdl",
    pos = Vector(450.535736,-22.815704,-3.113149+5.35),
    ang = Angle(-62.299999,-33.400002,0.000000),
    hideseat = 0.2,
}
ENT.ClientProps["ampermeter"] = {
    model = "models/metrostroi/81-717/volt_arrow.mdl",
    pos = Vector(452.269592,-30.540430,16.922098),
    ang = Angle(90.500000,0.000000,40.000000),
    hideseat = 0.2,
}
ENT.ClientProps["voltmeter"] = {
    model = "models/metrostroi/81-717/volt_arrow.mdl",
    pos = Vector(452.246277,-30.519978,12.287716),
    ang = Angle(90.500000,0.000000,40.000000),
    hideseat = 0.2,
}
ENT.ButtonMap["HVMeters"] = {
    pos = Vector(453.3,-28.7,20.1),
    ang = Angle(0,-130,90),
    width = 68,
    height = 138,
    scale = 0.0625,

    buttons = {
        {ID = "!EnginesCurrent", x=0, y=0, w=68, h=64, tooltip=""},
        {ID = "!HighVoltage", x=0, y=74, w=68, h=64, tooltip=""},
    }
}
ENT.ClientProps["volt1"] = {
    model = "models/metrostroi_train/81-710/ezh3_voltages.mdl",
    pos = Vector(449.501740,15.141174,0.812889),
    ang = Angle(-58.299999,0.000000,27.968136),
    bscale = Vector(1,1,1.47),
    hideseat = 0.2,
}
ENT.ClientProps["E_informator"] = {
    model = "models/metrostroi_train/equipment/rri_informator_portable.mdl",
    pos = Vector(404.7-5.2,-51,1),
    ang = Angle(0,0,0),
    hideseat=0.2,
}

ENT.ButtonMap["RRI"] = {
    pos = ENT.ClientProps["E_informator"].pos+Vector(-0.6,-0.5,5),
    ang = Angle(0,90,0),
    width = 60,
    height = 25,
    scale = 0.0625,
    hideseat=0.2,

    buttons = {
        {ID = "RRIEnableToggle",x=10,y=12.5,radius=10,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t1.mdl",ang = 180,z=-4,
            var="RRIEnable",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "!RRIRewind",x=30,y=12.5,radius=0,model = {
            model = "models/metrostroi_train/81-502/buttons/tumbler_b_a.mdl",ang = 180,z=-3,
            getfunc = function(ent) return ent:GetPackedRatio("RRIRewind") end,
            var="RRIRewind",speed=8,
            sndvol = 0.5,snd = function(_,val) return val==2 and "triple_0-up" or val==0 and "triple_0-down" or "triple_up-0" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "RRIRewindSet2",x=30-5,y=12.5-10,w=10,h=10,tooltip=""},
        {ID = "RRIRewindSet0",x=30-5,y=12.5,w=10,h=10,tooltip=""},

        {ID = "RRIAmplifierToggle",x=50,y=12.5,radius=10,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_tumbler_t1.mdl",ang = 180,z=-4,
            var="RRIAmplifier",speed=16,
            sndvol = 1,snd = function(val) return val and "switchbl_on" or "switchbl_off" end,
            sndmin = 90,sndmax = 1e3,sndang = Angle(-90,0,0),
        }},
        {ID = "!RRIOn",x=70,y=12.5,radius=10,tooltip="",model = {
            model = "models/metrostroi_train/81-710/ezh3_slc77.mdl",z = -13,
            lamp = {model = "models/metrostroi_train/81-717/buttons/slc_77_lamp.mdl",ang=62,x=-0.3,y=-0.3,z=20.6, var="RRIOn", color=Color(210,170,255)},
            getfunc=function(ent,min,max,var) return ent:GetPackedBool(var) and (1-(ent.AnnLamp or 0)^1.5*0.6) or 0 end,
        }},
    }
}
ENT.ButtonMap["RRIScreen"] = {
    pos = ENT.ClientProps["E_informator"].pos+Vector(1.95,-2.9,5),
    ang = Angle(0,90,90),
    width = 121,
    height = 103,
    scale = 0.07,
    hide=true,
    hideseat=0.2,

    buttons = {
        {ID = "RRIUp",x=30,y=60,radius=10,tooltip=""},
        {ID = "RRIDown",x=30,y=80,radius=10,tooltip=""},
        {ID = "RRILeft",x=20,y=70,radius=10,tooltip=""},
        {ID = "RRIRight",x=40,y=70,radius=10,tooltip=""},
    }
}


ENT.ClientProps["bortlamps1"] = {
    model = "models/metrostroi_train/81-717/bort_lamps_body.mdl",
    pos = Vector(-52,67,45.5),
    ang = Angle(0,0,0),
    hide = 2,
}
ENT.ClientProps["bortlamp1_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps1.pos+Vector(0,0.9,3.25),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamp1_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps1.pos+Vector(0,0.9,-0.1),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamp1_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps1.pos+Vector(0,0.9,-3.3),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamps2"] = {
    model = "models/metrostroi_train/81-717/bort_lamps_body.mdl",
    pos = Vector(39,-67,45.5),
    ang = Angle(0,180,0),
    hide = 2,
}
ENT.ClientProps["bortlamp2_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps2.pos+Vector(0,-0.85,3.2),
    ang = Angle(0,180,0),
    nohide = true,
}
ENT.ClientProps["bortlamp2_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps2.pos+Vector(0,-0.85,-0.1),
    ang = Angle(0,180,0),
    nohide = true,
}
ENT.ClientProps["bortlamp2_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps2.pos+Vector(0,-0.85,-3.35),
    ang = Angle(0,180,0),
    nohide = true,
}
---[[
ENT.ClientProps["bortlamps3"] = {
    model = "models/metrostroi_train/81-502/bort_lamps_body.mdl",
    pos = Vector(0,67,53.5),
    ang = Angle(90,0,0),
    hide = 2,
}
ENT.ClientProps["bortlamp3_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps3.pos+Vector(3.28,0.85,0),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamp3_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps3.pos+Vector(-0.06,0.85,0),
    ang = Angle(0,0,0),
    nohide = true,
    skin = 0,
}
ENT.ClientProps["bortlamp3_g_dim"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps3.pos+Vector(-0.06,0.85,0),
    ang = Angle(0,0,0),
    nohide = true,
    skin = 1,
}
ENT.ClientProps["bortlamp3_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps3.pos+Vector(-3.35,0.85,0),
    ang = Angle(0,0,0),
    nohide = true,
}
ENT.ClientProps["bortlamps4"] = {
    model = "models/metrostroi_train/81-502/bort_lamps_body.mdl",
    pos = Vector(0,-67,53.5),
    ang = Angle(90,180,0),
    hide = 2,
}
ENT.ClientProps["bortlamp4_w"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_b.mdl",
    pos = ENT.ClientProps.bortlamps4.pos+Vector(-3.28,-0.85,0),
    ang = Angle(0,180,0),
    nohide = true,
}
ENT.ClientProps["bortlamp4_g"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps4.pos+Vector(0.06,-0.85,0),
    ang = Angle(0,180,0),
    nohide = true,
    skin = 0,
}
ENT.ClientProps["bortlamp4_g_dim"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_g.mdl",
    pos = ENT.ClientProps.bortlamps4.pos+Vector(0.06,-0.85,0),
    ang = Angle(0,180,0),
    nohide = true,
    skin = 1,
}
ENT.ClientProps["bortlamp4_y"] = {
    model = "models/metrostroi_train/equipment/bort_lamps_y.mdl",
    pos = ENT.ClientProps.bortlamps4.pos+Vector(3.35,-0.85,0),
    ang = Angle(0,180,0),
    nohide = true,
}--]]
--------------------------------------------------------------------------------
-- Add doors
--[[ local function GetDoorPosition(i,k,j)
    if j == 0
    then return Vector(338.0-230.1*i+(1-k)*0.8,-65*(1-2*k),0.761)
    else return Vector(338.2-230.1*i+(1-k)*0.8,-65*(1-2*k),0.761)
    end
end
for i=0,3 do
    for k=0,1 do
        ENT.ClientProps["door"..i.."x"..k.."a"] = {
            model = "models/metrostroi_train/81-717/door_right_spb.mdl",
            pos = GetDoorPosition(i,k,0),
            ang = Angle(0,90 +180*k,0),
            hide = 2,
        }
        ENT.ClientProps["door"..i.."x"..k.."b"] = {
            model = "models/metrostroi_train/81-717/door_left_spb.mdl",
            pos = GetDoorPosition(i,k,1),
            ang = Angle(0,90 +180*k,0),
            hide = 2,
        }
    end
end--]]
ENT.ClientProps["door0x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos1.mdl",
    pos = Vector(338.445,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door1x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos2.mdl",
    pos = Vector(108.324,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door2x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos3.mdl",
    pos = Vector(-121.682,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door3x1"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos4.mdl",
    pos = Vector(-351.531,65.164,0.807),
    ang = Angle(0,-90,0),
    hide = 2.0,
}
ENT.ClientProps["door0x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos4.mdl",
    pos = Vector(338.445,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
ENT.ClientProps["door1x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos3.mdl",
    pos = Vector(108.324,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
ENT.ClientProps["door2x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos2.mdl",
    pos = Vector(-121.682,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
ENT.ClientProps["door3x0"] = {
    model = "models/metrostroi_train/81-717/81-717_doors_pos1.mdl",
    pos = Vector(-351.531,-65.164,0.807),
    ang = Angle(0,90,0),
    hide = 2.0,
}
ENT.ClientProps["Lamps_cab2"] = {
    model = "models/metrostroi_train/81-717/lamps/lamp_cabine1.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat = 0.9,
}
--[[ENT.ClientProps["Lamps_cab1"] = {
    model = "models/metrostroi_train/81-717/lamps/lamp_cabine2.mdl",
    pos = Vector(0,0,0),
    ang = Angle(0,0,0),
    hideseat = 0.9,
}
]]
for i = 0,11 do
    --[[ local b = 15--math.random()*15
    local g = 15--b+math.random()*(15-b)
    if math.random() > 0.4 then
        g = math.random()*15
        b = g
    else
        g = 15
        b = -10+math.random()*25
    end--]]
    ENT.ClientProps["lamp1_"..i+1] = {
        model = "models/metrostroi_train/81-717/lamps/lamp_typ1.mdl",
        pos = Vector(333.949 - 66.66*i,0,67.7),
        ang = Angle(0,0,0),
        --color = Color(255,235+g,235+b),
        color = Color(255,255,255),
        hideseat = 1.1,
    }
end
for i = 0,24 do
    --[[local r = 15--math.random()*15
    local g = 15--b+math.random()*(15-b)
    if math.random() > 0.4 then
        r = math.random()*15
        g = r
    else
        r = 15
        g = -20+math.random()*20
    end--]]
    ENT.ClientProps["lamp2_"..i+1] = {
        model = "models/metrostroi_train/81-717/lamps/lamp_typ2.mdl",
        pos = Vector(354.1 - 32.832*i,0,68.2),
        ang = Angle(0,0,0),
        --color = Color(245+r,228+g,189),
        color = Color(255,255,255),
        hideseat = 1.1,
    }
end
--[[

local pos = Vector(450.273468,-32.306019,13.236823)
local ang = Angle(-18.000000,25.541767,-90.600349)
ENT.ClientProps["TEST"] = {
    model = "models/metrostroi_train/81/334cran.mdl",
    pos = pos,
    ang = ang,
    scale=0.1,
}--]]


ENT.Lights = {
    -- Headlight glow
    [1] = { "headlight",Vector(460,0,-40),Angle(0,0,0),Color(216,161,92),farz=5144,brightness = 4, fov=100, texture = "models/metrostroi_train/equipment/headlight",shadows = 1,headlight=true},
    [2] = { "headlight",        Vector(460,0,50), Angle(-20,0,0), Color(255,0,0), fov=160 ,brightness = 0.3, farz=450,texture = "models/metrostroi_train/equipment/headlight2",shadows = 0,backlight=true},
	[3] = { "headlight",        Vector(365,-9,50), Angle(50,40,-0), Color(206,135,80), hfov=80, vfov=80,farz=100,brightness = 6,shadows=1},
    [4] = { "headlight",        Vector(365,-51,50), Angle(50,40,-0), Color(206,135,80), hfov=80, vfov=80,farz=100,brightness = 6,shadows=1},

    -- Manometers
    [40] = { "headlight",Vector(451.9,-13.5,-2+5.35),Angle(52.571899-15-5,-129.269775+25+15,49.853062) ,Color(255,125,25),farz = 8,nearz = 2,shadows = 1,brightness = 1,fov = 145 },
    [41] = { "headlight",Vector(451.8,-21,-2+5.35),Angle(52.571899-15-5,-129.269775+25+15,49.853062),Color(255,125,25),farz = 8,nearz = 2,shadows = 1,brightness = 1,fov = 140 },
    --[42] = { "headlight",Vector(450.3,13.1,-4.4+5.35),Angle(-136.613632-33,-95.636734-28,137.434570),Color(255,125,25),farz = 8,nearz = 2,shadows = 0,brightness = 1.5,fov = 120 },
    [43] = { "headlight",Vector(451.9-3,3.6+1,3.35+0.5),Angle(0,-90,0),Color(255,125,25),farz = 8,nearz = 2,shadows = 0,brightness = 1.5,fov = 80 },
    -- Voltmeter
    --[44] = { "headlight",Vector(450.273468,-32.306019,13.236823),Angle(-18.000000,25.541767,-90.600349),Color(255,145,25),farz = 10,nearz = 2,shadows = 1,brightness = 1,fov = 100 },
    --[45] = { "headlight",Vector(450.273468,-32.306019,18.236823),Angle(-12.000000,25.541767,-90.600349),Color(255,125,25),farz = 10,nearz = 2,shadows = 1,brightness = 1,fov = 100 },
}

function ENT:Initialize()
    self.BaseClass.Initialize(self)
    self.RRIScreen = self:CreateRT("717RRI",128,128)
    --self.IGLA = self:CreateRT("717IGLA",512,128)
    self.LeftMirror = self:CreateRT("LeftMirror",128,256)
    self.RightMirror = self:CreateRT("RightMirror",128,256)

    self.CraneRamp = 0
    self.CraneLRamp = 0
    self.CraneRRamp = 0
    self.ReleasedPdT = 0
    self.EmergencyValveRamp = 0
    self.EmergencyValveEPKRamp = 0
    self.EmergencyBrakeValveRamp = 0
    self.FrontLeak = 0
    self.RearLeak = 0

    self.VentCab = 0
    self.VentG1 = 0
    self.VentG2 = 0
end

function ENT:UpdateWagonNumber()
    local count = math.max(4,math.ceil(math.log10(self.WagonNumber+1)))
    for i=0,4 do
        self:ShowHide("TrainNumberL"..i,i<count)
        self:ShowHide("TrainNumberR"..i,i<count)
        if i< count and self.WagonNumber then
            local leftNum,rightNum = self.ClientEnts["TrainNumberL"..i],self.ClientEnts["TrainNumberR"..i]
            local num = math.floor(self.WagonNumber%(10^(i+1))/10^i)
            if IsValid(leftNum) then
                leftNum:SetPos(self:LocalToWorld(Vector(41+16+i*6.6-count*6.6/2,67.4,-17.8)))
                leftNum:SetSkin(num)
            end
            if IsValid(rightNum) then
                rightNum:SetPos(self:LocalToWorld(Vector(64+16-i*6.6-count*6.6/2,-67.4,-17.8)))
                rightNum:SetSkin(num)
            end
        end
    end
end
local Cpos = {
    0,0.2,0.4,0.5,0.6,0.8,1
}
--------------------------------------------------------------------------------
function ENT:Think()
    self.BaseClass.Think(self)
    if not self.RenderClientEnts or self.CreatingCSEnts then
        self.RKTimer = nil
        self.OldBPSNType = nil

        self.RingType = nil
        return
    end

    if self.Scheme ~= self:GetNW2Int("Scheme",1) then
        self.PassSchemesDone = false
        self.Scheme = self:GetNW2Int("Scheme",1)
    end
    if self.RelaysConfig ~= self:GetNW2String("RelaysConfig") then
        self.RelaysConfig = self:GetNW2String("RelaysConfig")
        self:SetRelays()
    end
    if not self.PassSchemesDone and IsValid(self.ClientEnts.schemes) then
        local scheme = Metrostroi.Skins["717_new_schemes"] and Metrostroi.Skins["717_new_schemes"][self.Scheme]
        self.ClientEnts.schemes:SetSubMaterial(1,scheme and scheme[1])
        self.PassSchemesDone = true
    end


    self:SetLightPower(40,self:GetPackedBool("PanelLights"))
    self:SetLightPower(41,self:GetPackedBool("PanelLights"))
    --self:SetLightPower(42,self:GetPackedBool("PanelLights"))

    --self:SetLightPower(44,self:GetPackedBool("PanelLights"))
    --self:SetLightPower(45,self:GetPackedBool("PanelLights"))
	
	self:ShowHide("SSpeed1",self:GetPackedBool("LUDS"))
    self:ShowHide("SSpeed2",self:GetPackedBool("LUDS"))
    if self:GetPackedBool("LUDS") then
        local speed = self:GetNW2Int("ALSSpeed")
        if IsValid(self.ClientEnts["SSpeed1"])then self.ClientEnts["SSpeed1"]:SetSkin(math.floor(speed)%10) end
        if IsValid(self.ClientEnts["SSpeed2"])then self.ClientEnts["SSpeed2"]:SetSkin(math.floor(speed/10)) end
    end
    local HL1 = self:Animate("Headlights1",self:GetPackedBool("Headlights1") and 1 or 0,0,1,6,false)
    local HL2 = self:Animate("Headlights2",self:GetPackedBool("Headlights2") and 1 or 0,0,1,6,false)
    --Красные лампы
    local RL1 = self:Animate("RedLights1",self:GetPackedBool("RedLights1") and 1 or 0,0,1,6,false)
    self:ShowHideSmooth("RedLights_r",RL1)
    local RL2 = self:Animate("RedLights2",self:GetPackedBool("RedLights2") and 1 or 0,0,1,6,false)
    self:ShowHideSmooth("RedLights_l",RL2)

    --Cпрайты на фары и красные лампы
    local headlight = HL1*0.6+HL2*0.4
    self:SetLightPower(1,headlight>0,headlight)
    self:SetLightPower(2,self:GetPackedBool("RedLights"),RL)

    local newBortlamps = self:GetNW2Bool("NewBortlamps")
    local Bortlamp_w = self:Animate("Bortlamp_w",self:GetPackedBool("DoorsW") and 1 or 0,0,1,16,false)
    local Bortlamp_g = self:Animate("Bortlamp_g",self:GetPackedBool("GRP") and 1 or 0,0,1,16,false)
    local Bortlamp_g_dim = self:Animate("Bortlamp_g_dim",self:GetPackedBool("GRP_dim") and 1 or 0,0,1,16,false)
    local Bortlamp_y = self:Animate("Bortlamp_y",self:GetPackedBool("BrW") and 1 or 0,0,1,16,false)
    if newBortlamps then
        self:ShowHide("bortlamps1",true)
        self:ShowHide("bortlamps2",true)
        self:ShowHide("bortlamps3",false)
        self:ShowHide("bortlamps4",false)
        self:ShowHideSmooth("bortlamp1_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp1_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp1_y",Bortlamp_y)
        self:ShowHideSmooth("bortlamp2_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp2_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp2_y",Bortlamp_y)
        self:ShowHideSmooth("bortlamp3_w",0)
        self:ShowHideSmooth("bortlamp3_g",0)
        self:ShowHideSmooth("bortlamp3_y",0)
        self:ShowHideSmooth("bortlamp4_w",0)
        self:ShowHideSmooth("bortlamp4_g",0)
        self:ShowHideSmooth("bortlamp4_y",0)
    else
        self:ShowHide("bortlamps1",false)
        self:ShowHide("bortlamps2",false)
        self:ShowHide("bortlamps3",true)
        self:ShowHide("bortlamps4",true)
        self:ShowHideSmooth("bortlamp1_w",0)
        self:ShowHideSmooth("bortlamp1_g",0)
        self:ShowHideSmooth("bortlamp1_y",0)
        self:ShowHideSmooth("bortlamp2_w",0)
        self:ShowHideSmooth("bortlamp2_g",0)
        self:ShowHideSmooth("bortlamp2_y",0)
        self:ShowHideSmooth("bortlamp3_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp3_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp3_g_dim",Bortlamp_g_dim)
        self:ShowHideSmooth("bortlamp3_y",Bortlamp_y)
        self:ShowHideSmooth("bortlamp4_w",Bortlamp_w)
        self:ShowHideSmooth("bortlamp4_g",Bortlamp_g)
        self:ShowHideSmooth("bortlamp4_g_dim",Bortlamp_g_dim)
        self:ShowHideSmooth("bortlamp4_y",Bortlamp_y)
    end

    self:Animate("Controller",self:GetPackedRatio("ControllerPosition"),0.3,0.02,2,false)

    self:Animate("reverser",self:GetNW2Int("ReverserPosition")/2,0,0.27,4,false)
    self:Animate("krureverser",self:GetNW2Int("KRUPosition")/2,0.53,0.95,4,false)
    self:ShowHide("reverser",self:GetNW2Int("WrenchMode",0)==1)
    self:ShowHide("krureverser",self:GetNW2Int("WrenchMode",0)==2)

    --self:ShowHide("brake013",self:GetPackedBool("Crane013"))
    --self:ShowHide("brake_valve_013",self:GetPackedBool("Crane013"))
    --self:ShowHide("valve_disconnect",self:GetPackedBool("Crane013"))
    --self:ShowHide("EPV_disconnect",self:GetPackedBool("Crane013"))
    --self:HidePanel("DriverValveDisconnect",not self:GetPackedBool("Crane013"))

    self:ShowHide("brake334",not self:GetPackedBool("Crane013"))
    self:ShowHide("brake_valve_334",not self:GetPackedBool("Crane013"))
    self:ShowHide("brake_disconnect",not self:GetPackedBool("Crane013"))
    self:ShowHide("EPK_disconnect",not self:GetPackedBool("Crane013"))
    self:ShowHide("train_disconnect",not self:GetPackedBool("Crane013"))
    self:HidePanel("DriverValveBLDisconnect",self:GetPackedBool("Crane013"))
    self:HidePanel("DriverValveTLDisconnect",self:GetPackedBool("Crane013"))

    self:Animate("brake334",self:GetPackedRatio("CranePosition")/5,0.35,0.65,256,24)
    --self:Animate("brake013",        Cpos[self:GetPackedRatio("CranePosition")] or 0, 0.03, 0.458,  256,24)

    self:Animate("speed",self:GetPackedRatio("Speed"),0.881+0.004,0.609-0.008,nil,nil,256,2,0.01)

    local ARSType = self:GetNW2Int("ARSType",1)
    if self.ARSType ~= ARSType then
        self:RemoveCSEnt("ars_mvm")
        self.ARSType = ARSType
    end
    if self.KVType ~= self:GetNW2Int("KVType",1) then
        self:RemoveCSEnt("Controller")
        self.KVType = self:GetNW2Int("KVType",1)
    end

    local handrails = self:GetNW2Bool("HandRails")
    local dot5 = self:GetNW2Bool("Dot5")
    local lvz = self:GetNW2Bool("LVZ")
    local newSeats = self:GetNW2Bool("NewSeats")
    --local mask = self:GetNW2Bool("Mask")
    --local mask22 = self:GetNW2Bool("Mask22")
    self:ShowHide("cabine_mvm",not dot5)
    self:ShowHide("destination",not dot5)
    self:HidePanel("Battery_C",dot5)
    self:HidePanel("AV_C",dot5)
    --self:HidePanel("IGLA_C",dot5)
    --self:HidePanel("IGLAButtons_C",dot5)
    self:HidePanel("HelperPanel_C",dot5)
    self:HidePanel("CabVent_C",dot5)
    self:ShowHide("cabine_lvz",dot5)
    self:ShowHide("destination1",dot5)
    --self:HidePanel("Battery_R",not dot5)
    --self:HidePanel("AV_R",not dot5)
    --self:HidePanel("IGLA_R",not dot5)
    --self:HidePanel("IGLAButtons_R",not dot5)
    self:HidePanel("CabVent_R",not dot5)
    self:HidePanel("HelperPanel_R",not dot5)
    self:ShowHide("handrails_old",not dot5)
    self:ShowHide("handrails_new",dot5)
    self.LastStation.EntityName = dot5 and "destination1" or "destination"
    
	local lamps_cab1 = self:Animate("lamps_cab1",self:GetPackedBool("CabLights") and 1 or 0,0,1,5,false) --Анимация ламп освещения кабины
    local lamps_cab2 = self:Animate("lamps_cab2",self:GetPackedBool("EqLights") and 1 or 0,0,1,5,false)
    self:ShowHideSmooth("Lamps_cab1",--[[dot5 and 0 or]] lamps_cab1)
    self:ShowHideSmooth("Lamps_cab2",--[[dot5 and 0 or]] lamps_cab2)
    --self:ShowHideSmooth("Lamps2_cab2",dot5 and lamps_cab2 or 0)
    --self:ShowHideSmooth("Lamps2_cab1",dot5 and lamps_cab1 or 0)

    --local lamps_rtm = self:Animate("lamps_rtm",self:GetPackedBool("VPR") and 1 or 0,0,1,8,false)
    --self:SetSoundState("vpr",lamps_rtm>0 and 1 or 0,1)

    --self:ShowHideSmooth("Lamp_RTM1",not dot5 and lamps_rtm or 0)
    self:ShowHideSmooth("Lamp_RTM2",dot5 and lamps_rtm or 0)

    local masktype = self:GetNW2Int("MaskType")
    self:ShowHide("mask22",masktype==1)
	self:ShowHide("mask22_mmz",masktype==2)
    self:ShowHide("mask222_mmz",masktype==3)
    self:ShowHideSmooth("Headlights22_1",(masktype==1 or masktype==2) and HL1 or 0)
    self:ShowHideSmooth("Headlights22_2",(masktype==1 or masktype==2) and HL2 or 0)
    self:ShowHideSmooth("Headlights222_1",masktype==3 and HL1 or 0)
    self:ShowHideSmooth("Headlights222_2",masktype==3 and HL2 or 0)

    self:ShowHide("seats_old",not newSeats)
    self:ShowHide("seats_old_cap",not newSeats)
    self:ShowHide("seats_new",newSeats)
    self:ShowHide("seats_new_cap",newSeats)
    self:Animate("PB",self:GetPackedBool("PB") and 1 or 0,0,0.2,  12,false)
    self:Animate("UAVALever",   self:GetPackedBool("UAVA") and 1 or 0,     0,0.6, 128,  3,false)
    self:Animate("parking_brake",   self:GetPackedBool("ParkingBrake") and 1 or 0,0.25,0,  4,false)
    self:Animate("EPK_disconnect",   self:GetPackedBool("EPK") and 1 or 0,0.25,0,  4,false)
    self:Animate("EPV_disconnect",   self:GetPackedBool("EPK") and 1 or 0,0.25,0,  4,false)
    self:Animate("brake_disconnect",self:GetPackedBool("DriverValveBLDisconnect") and 1 or 0,0.25,0,  4,false)
    self:Animate("train_disconnect",self:GetPackedBool("DriverValveTLDisconnect") and 1 or 0,0.25,0,  4,false)
    self:Animate("valve_disconnect",self:GetPackedBool("DriverValveDisconnect") and 1 or 0,0.25,0,  4,false)
    self:Animate("stopkran",   self:GetPackedBool("EmergencyBrakeValve") and 0 or 1,     0.25,0, 128,  3,false)

    --[[local c013 = self:GetNW2Int("Crane",1)==2
    self:ShowHide("brake_valve_334",not c013)
    self:ShowHide("brake334",not c013)
    self:ShowHide("brake_disconnect",not c013)
    self:ShowHide("train_disconnect",not c013)
    self:HidePanel("DriverValveBLDisconnect",c013)
    self:HidePanel("DriverValveTLDisconnect",c013)
    self:HidePanel("EPKDisconnect",c013)
    self:ShowHide("EPK_disconnect",not c013)
    self:ShowHide("brake_valve_013",c013)
    self:ShowHide("brake013",c013)
    self:ShowHide("valve_disconnect",c013)
    self:ShowHide("EPV_disconnect",c013)
    self:HidePanel("EPVDisconnect",not c013)
    self:HidePanel("DriverValveDisconnect",not c013)]]

    self:Animate("brake_line",self:GetPackedRatio("BLPressure"),0.143,0.88,256,2)--,0.01)
    self:Animate("train_line",self:GetPackedRatio("TLPressure"),0.143,0.88,256,0)--,0.01)
    self:Animate("brake_cylinder",self:GetPackedRatio("BCPressure"),0.134,0.874,256,0)--,0.03)

    self:Animate("voltmeter",self:GetPackedRatio("EnginesVoltage"),0.396,0.658,256,0.2,false)
    self:Animate("volt1",self:GetPackedRatio("BatteryVoltage"),0.625,0.376,256,0.2,false)
    self:Animate("ampermeter",self:GetPackedRatio("EnginesCurrent"),0.39,0.655,256,0.2,false)

    local otsek1 = self:Animate("door_otsek1",self:GetPackedBool("OtsekDoor1") and 1 or 0,0,0.25,4,0.5)
    local otsek2 = self:Animate("door_otsek2",self:GetPackedBool("OtsekDoor2") and 1 or 0,0,0.25,4,0.5)
    --self:HidePanel("AV_S",not dot5 or otsek2<=0)
    local door1 = self:Animate("door1",self:GetPackedBool("RearDoor") and 1 or 0,0,0.25,4,0.5)
    local door2 = self:Animate("door2",self:GetPackedBool("PassengerDoor") and 1 or 0,1,0.8,4,0.5)
    local door3 = self:Animate("door3",self:GetPackedBool("CabinDoor") and 1 or 0,0,0.25,4,0.5)
    if self.Door1 ~= (door1 > 0) then
        self.Door1 = door1 > 0
        self:PlayOnce("door1","bass",self.Door1 and 1 or 0)
    end
    if self.Door2 ~= (door2 < 1) then
        self.Door2 = door2 < 1
        self:PlayOnce("door2","bass",self.Door2 and 1 or 0)
    end
    if self.Door3 ~= (door3 > 0) then
        self.Door3 = door3 > 0
        self:PlayOnce("door3","bass",self.Door3 and 1 or 0)
    end
    if self.Otsek1 ~= (otsek1 > 0) then
        self.Otsek1 = otsek1 > 0
        if not self.Otsek1 then
            self:PlayOnce("door_otsek1","bass",1)
        end
    end
    if self.Otsek2 ~= (otsek2 > 0) then
        self.Otsek2 = otsek2 > 0
        if not self.Otsek2 then
            self:PlayOnce("door_otsek2","bass",1)
        end
    end
    self:SetLightPower(3,self.Otsek1 and self:GetPackedBool("EqLights"))
    self:SetLightPower(4,self.Otsek2 and self:GetPackedBool("EqLights"))

    local typ = self:GetNW2Int("LampType",1)
    if self.LampType ~= typ then
        self.LampType = typ
        for i=1,25 do
            if i<13 then
                self:ShowHide("lamp1_"..i,typ==1)
            end
            self:ShowHide("lamp2_"..i,typ==2)
        end
        self:ShowHide("lamps1",typ==1)
        self:ShowHide("lamps2",typ==2)
    end
    if typ == 1 then
        for i = 1,12 do
            local colV = self:GetNW2Vector("lamp"..i)
            local col = Color(colV.x,colV.y,colV.z)
            self:ShowHideSmooth("lamp1_"..i,self:Animate("Lamp1_"..i,self:GetPackedBool("lightsActive"..i) and 1 or 0,0,1,6,false),col)
        end
    else
        for i = 1,25 do
            local colV = self:GetNW2Vector("lamp"..i)
            local col = Color(colV.x,colV.y,colV.z)
            self:ShowHideSmooth("lamp2_"..i,self:Animate("Lamp2_"..i,self:GetPackedBool("lightsActive"..i) and 1 or 0,0,1,6,false),col)
        end
    end

    self:Animate("FrontBrake", self:GetNW2Bool("FbI") and 0 or 1,0,1, 3, false)
    self:Animate("FrontTrain",  self:GetNW2Bool("FtI") and 1 or 0,0,1, 3, false)
    self:Animate("RearBrake",   self:GetNW2Bool("RbI") and 0 or 1,0,1, 3, false)
    self:Animate("RearTrain",   self:GetNW2Bool("RtI") and 1 or 0,0,1, 3, false)

    -- Main switch
    if self.LastGVValue ~= self:GetPackedBool("GV") then
        self.ResetTime = CurTime()+1.5
        self.LastGVValue = self:GetPackedBool("GV")
    end
    self:Animate("gv_wrench",self.LastGVValue and 1 or 0,0.5,0.9,128,1,false)
    self:ShowHideSmooth("gv_wrench",    CurTime() < self.ResetTime and 1 or 0.1)

    --self:InitializeSounds()
    if not self.DoorStates then self.DoorStates = {} end
    if not self.DoorLoopStates then self.DoorLoopStates = {} end
    for i=0,3 do
        for k=0,1 do
            local st = k==1 and "DoorL" or "DoorR"
            local doorstate = self:GetPackedBool(st)
            local id,sid = st..(i+1),"door"..i.."x"..k
            local state = self:GetPackedRatio(id)
            if (state ~= 1 and state ~= 0) ~= self.DoorStates[id] then
                if doorstate and state < 1 or not doorstate and state > 0 then
                else
                    if state > 0 then
                        self:PlayOnce(sid.."o","",1,math.Rand(0.8,1.2))
                    else
                        self:PlayOnce(sid.."c","",1,math.Rand(0.8,1.2))
                    end
                end
                self.DoorStates[id] = (state ~= 1 and state ~= 0)
            end
            if (state ~= 1 and state ~= 0) then
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) + 2*self.DeltaTime,0,1)
            else
                self.DoorLoopStates[id] = math.Clamp((self.DoorLoopStates[id] or 0) - 6*self.DeltaTime,0,1)
            end
            self:SetSoundState(sid.."r",self.DoorLoopStates[id],0.8+self.DoorLoopStates[id]*0.2)
            local n_l = "door"..i.."x"..k--.."a"
            --local n_r = "door"..i.."x"..k.."b"
            local dlo = 1
            if self.Anims[n_l] then
                dlo = math.abs(state-(self.Anims[n_l] and self.Anims[n_l].oldival or 0))
                if dlo <= 0 and self.Anims[n_l].oldspeed then dlo = self.Anims[n_l].oldspeed/14 end
            end

            self:Animate(n_l,state,0,0.95,dlo*14,false)--0.8 + (-0.2+0.4*math.random()),0)
            --self:Animate(n_r,state,0,1,dlo*14,false)--0.8 + (-0.2+0.4*math.random()),0)
        end
    end

    local dT = self.DeltaTime
    local rollingi = math.min(1,self.TunnelCoeff+math.Clamp((self.StreetCoeff-0.82)/0.3,0,1))
    local rollings = math.max(self.TunnelCoeff*0.6,self.StreetCoeff)
    local speed = self:GetPackedRatio("Speed")*100.0
    local rol5 = math.Clamp(speed/1,0,1)*(1-math.Clamp((speed-3)/8,0,1))
    local rol10 = math.Clamp(speed/12,0,1)*(1-math.Clamp((speed-25)/8,0,1))
    local rol40p = Lerp((speed-25)/12,0.6,1)
    local rol40 = math.Clamp((speed-23)/8,0,1)*(1-math.Clamp((speed-55)/8,0,1))
    local rol40p = Lerp((speed-23)/50,0.6,1)
    local rol70 = math.Clamp((speed-50)/8,0,1)*(1-math.Clamp((speed-72)/5,0,1))
    local rol70p = Lerp(0.8+(speed-65)/25*0.2,0.8,1.2)
    local rol80 = math.Clamp((speed-70)/5,0,1)
    local rol80p = Lerp(0.8+(speed-72)/15*0.2,0.8,1.2)
    self:SetSoundState("rolling_5",math.min(1,rollingi*(1-rollings)+rollings*0.8)*rol5,1)
    self:SetSoundState("rolling_10",rollingi*rol10,1)
    self:SetSoundState("rolling_40",rollingi*rol40,rol40p)
    self:SetSoundState("rolling_70",rollingi*rol70,rol70p)
    self:SetSoundState("rolling_80",rollingi*rol80,rol80p)

    local rol10 = math.Clamp(speed/15,0,1)*(1-math.Clamp((speed-18)/35,0,1))
    local rol10p = Lerp((speed-15)/14,0.6,0.78)
    local rol40 = math.Clamp((speed-18)/35,0,1)*(1-math.Clamp((speed-55)/40,0,1))
    local rol40p = Lerp((speed-15)/66,0.6,1.3)
    local rol70 = math.Clamp((speed-55)/20,0,1)--*(1-math.Clamp((speed-72)/5,0,1))
    local rol70p = Lerp((speed-55)/27,0.78,1.15)
    --local rol80 = math.Clamp((speed-70)/5,0,1)
    --local rol80p = Lerp(0.8+(speed-72)/15*0.2,0.8,1.2)
    self:SetSoundState("rolling_low"    ,rol10*rollings,rol10p) --15
    self:SetSoundState("rolling_medium2",rol40*rollings,rol40p) --57
    --self:SetSoundState("rolling_medium1",0 or rol40*rollings,rol40p) --57
    self:SetSoundState("rolling_high2"  ,rol70*rollings,rol70p) --70

    self.ReleasedPdT = math.Clamp(self.ReleasedPdT + 2*(-self:GetPackedRatio("BrakeCylinderPressure_dPdT",0)-self.ReleasedPdT)*dT,0,1)
    local release1 = math.Clamp((self.ReleasedPdT-0.1)/0.8,0,1)^2
    self:SetSoundState("release1",release1,1)
    self:SetSoundState("release2",(math.Clamp(0.3-release1,0,0.3)/0.3)*(release1/0.3),1.0)
    local parking_brake = self:GetPackedRatio("ParkingBrakePressure_dPdT",0)
    local parking_brake_abs = math.Clamp(math.abs(parking_brake)-0.3,0,1)
    if self.ParkingBrake1 ~= (parking_brake<1) then
        self.ParkingBrake1 = (parking_brake<1)
        if self.ParkingBrake1 then self:PlayOnce("parking_brake_en","bass",1,1) end
    end
    if self.ParkingBrake2 ~= (parking_brake>-0.8) then
        self.ParkingBrake2 = (parking_brake>-0.8)
        if self.ParkingBrake2 then self:PlayOnce("parking_brake_rel","bass",0.6,1) end
    end
    self:SetSoundState("parking_brake",parking_brake_abs,1)
    self.FrontLeak = math.Clamp(self.FrontLeak + 10*(-self:GetPackedRatio("FrontLeak")-self.FrontLeak)*dT,0,1)
    self.RearLeak = math.Clamp(self.RearLeak + 10*(-self:GetPackedRatio("RearLeak")-self.RearLeak)*dT,0,1)
    self:SetSoundState("front_isolation",self.FrontLeak,0.9+0.2*self.FrontLeak)
    self:SetSoundState("rear_isolation",self.RearLeak,0.9+0.2*self.RearLeak)


    local ramp = self:GetPackedRatio("Crane_dPdT",0)
    if c013 then
        if ramp > 0 then
            self.CraneRamp = self.CraneRamp + ((0.2*ramp)-self.CraneRamp)*dT
        else
            self.CraneRamp = self.CraneRamp + ((0.9*ramp)-self.CraneRamp)*dT
        end
        self.CraneRRamp = math.Clamp(self.CraneRRamp + 1.0*((1*ramp)-self.CraneRRamp)*dT,0,1)
        self:SetSoundState("crane334_brake",0,1.0)
        self:SetSoundState("crane334_brake_reflection",0,1.0)
        self:SetSoundState("crane334_brake_slow",0,1.0)
        self:SetSoundState("crane334_release",0,1.0)
        self:SetSoundState("crane013_release",self.CraneRRamp^1.5,1.0)
        self:SetSoundState("crane013_brake",math.Clamp(-self.CraneRamp*1.5-0.1,0,1)^1.3,1.0)
        local loudV = self:GetNW2Float("Crane013Loud",0)
        if loudV>0 then
            if ramp>0 then
                self.CraneLRamp = self.CraneLRamp + (math.min(ramp,0)-self.CraneLRamp)*dT*0.5
            else
                self.CraneLRamp = self.CraneLRamp + (math.min(ramp,0)-self.CraneLRamp)*dT*1
            end
            self:SetSoundState("crane013_brake_l",(math.Clamp(-self.CraneRamp*2.5-0.1,0,1)^1.3)*(1-math.Clamp((-self.CraneLRamp-loudV)*3,0,1)),1.12-math.Clamp((-self.CraneLRamp-0.15)*2,0,1)*0.12)
        else
            self:SetSoundState("crane013_brake_l",0,1)
        end
        self:SetSoundState("crane013_brake2",math.Clamp(-self.CraneRamp*1.5-0.95,0,1.5)^2,1.0)
    else
        self:SetSoundState("crane013_brake",0,1.0)
        self:SetSoundState("crane013_release",0,1.0)
        --self:SetSoundState("crane013_brake2",0,1.0)

        self.CraneRamp = math.Clamp(self.CraneRamp + 8.0*((1*self:GetPackedRatio("Crane_dPdT",0))-self.CraneRamp)*dT,-1,1)

        self:SetSoundState("crane334_brake_low",math.Clamp((-self.CraneRamp)*2,0,1)^2,1)
        local high = math.Clamp(((-self.CraneRamp)-0.5)/0.5,0,1)^1
        self:SetSoundState("crane334_brake_high",high,1.0)
        self:SetSoundState("crane013_brake2",high*2,1.0)
        self:SetSoundState("crane334_brake_eq_high",--[[ math.Clamp(-self.CraneRamp*0,0,1)---]] math.Clamp(-self:GetPackedRatio("ReservoirPressure_dPdT")-0.2,0,1)^0.8*1,1)
        self:SetSoundState("crane334_brake_eq_low",--[[ math.Clamp(-self.CraneRamp*0,0,1)---]] math.Clamp(-self:GetPackedRatio("ReservoirPressure_dPdT")-0.4,0,1)^0.8*1.3,1)

        self:SetSoundState("crane334_release",math.Clamp(self.CraneRamp,0,1)^2,1.0)
    end
    local emergencyValveEPK = self:GetPackedRatio("EmergencyValveEPK_dPdT",0)
    self.EmergencyValveEPKRamp = math.Clamp(self.EmergencyValveEPKRamp + 1.0*((0.5*emergencyValveEPK)-self.EmergencyValveEPKRamp)*dT,0,1)
    if self.EmergencyValveEPKRamp < 0.01 then self.EmergencyValveEPKRamp = 0 end
    self:SetSoundState("epk_brake",self.EmergencyValveEPKRamp,1.0)

--[[
    local emergencyBrakeValve = self:GetPackedRatio("EmergencyBrakeValve_dPdT", 0)
    self.EmergencyBrakeValveRamp = math.Clamp(self.EmergencyBrakeValveRamp + (emergencyBrakeValve-self.EmergencyBrakeValveRamp)*dT*8,0,1)
    --self:SetSoundState("valve_brake",self.EmergencyBrakeValveRamp,0.8+math.min(0.4,self.EmergencyBrakeValveRamp*0.8))
    local emerBrakeValve = self.EmergencyBrakeValveRamp
    self:SetSoundState("valve_brake_l",math.Clamp(emerBrakeValve/0.2,0,1),1)
    self:SetSoundState("valve_brake_m",math.Clamp((emerBrakeValve-0.2)/0.3,0,1),1)
    self:SetSoundState("valve_brake_h",math.Clamp((emerBrakeValve-0.5)/0.5,0,1),1)
--]]
    local emergencyBrakeValve = self:GetPackedRatio("EmergencyBrakeValve_dPdT", 0)
    self.EmergencyBrakeValveRamp = math.Clamp(self.EmergencyBrakeValveRamp + (emergencyBrakeValve-self.EmergencyBrakeValveRamp)*dT*8,0,1)
    self:SetSoundState("valve_brake",self.EmergencyBrakeValveRamp,0.8+math.min(0.4,self.EmergencyBrakeValveRamp*0.8))

    local emergencyValve = self:GetPackedRatio("EmergencyValve_dPdT", 0)^0.4*1.2
    self.EmergencyValveRamp = math.Clamp(self.EmergencyValveRamp + (emergencyValve-self.EmergencyValveRamp)*dT*16,0,1)
    local emer_brake = math.Clamp((self.EmergencyValveRamp-0.9)/0.05,0,1)
    local emer_brake2 = math.Clamp((self.EmergencyValveRamp-0.2)/0.4,0,1)*(1-math.Clamp((self.EmergencyValveRamp-0.9)/0.1,0,1))
    self:SetSoundState("emer_brake",emer_brake,1)
    self:SetSoundState("emer_brake2",emer_brake2,math.min(1,0.8+0.2*emer_brake2))
    --self:SetSoundState("emer_brake",self.EmergencyValveRamp*0.8,1)
    --self:SetSoundState("emer_brake",self.EmergencyValveRamp*0.8,1)
    -- Compressor
    self:SetSoundState("compressor",self:GetPackedBool("Compressor") and 0.8 or 0,1)
    --self:SetSoundState("compressor2",self:GetPackedBool("Compressor") and 0.8 or 0,1)



    local v1state = self:GetPackedBool("M1_3") and 1 or 0
    local v2state = self:GetPackedBool("M4_7") and 1 or 0
    local vCstate = self:GetPackedRatio("M8")/2
    if self.VentCab < vCstate then
        self.VentCab = math.min(1,self.VentCab + dT/2.7)
    elseif self.VentCab > vCstate then
        self.VentCab = math.max(0,self.VentCab - dT/2.7)
    end
    self.VentG1 = math.Clamp(self.VentG1 + dT/2.7*(v1state*2-1),0,1)
    self.VentG2 = math.Clamp(self.VentG2 + dT/2.7*(v2state*2-1),0,1)
    self:SetSoundState("vent_cabl",math.Clamp(self.VentCab*2,0,1) ,1)
    self:SetSoundState("vent_cabh",math.Clamp((self.VentCab-0.5)*2,0,1),1)

    for i=1,7 do
        if i<4 then
            self:SetSoundState("vent"..i,self.VentG1,1)
        else
            self:SetSoundState("vent"..i,self.VentG2,1)
        end
    end

    -- ARS/Ring
    local ringstate = self:GetPackedBool("Buzzer") and 1 or 0
    self:SetSoundState("ring_old",ringstate,1)
    -- RK
    if self:GetPackedBool("RK") then self.RKTimer = CurTime() end
    self:SetSoundState("rk",(self.RKTimer and (CurTime() - self.RKTimer) < 0.2) and 0.7 or 0,1)

    -- BPSN sound
    self.BPSNType = self:GetNW2Int("BPSNType",13)
    if not self.OldBPSNType then self.OldBPSNType = self.BPSNType end
    if self.BPSNType ~= self.OldBPSNType then
        for i=1,12 do
            self:SetSoundState("bpsn"..i,0,1.0)
        end
    end
    self.OldBPSNType = self.BPSNType
    if self.BPSNType<13 then
        self:SetSoundState("bpsn"..self.BPSNType,self:GetPackedBool("BPSN") and 1 or 0,1) --FIXME громкость по другому
    end

    local cabspeaker = self:GetPackedBool("AnnCab")
    local work = self:GetPackedBool("AnnPlay")
    local buzz = self:GetPackedBool("AnnBuzz") and self:GetNW2Bool("AnnouncerBuzz")
    for k in ipairs(self.AnnouncerPositions) do
        self:SetSoundState("announcer_buzz"..k,(buzz and (k ~= 1 and work or k==1 and cabspeaker)) and 1 or 0,1)
    end
    for k,v in ipairs(self.AnnouncerPositions) do
        if self.Sounds["announcer"..k] and IsValid(self.Sounds["announcer"..k]) then
            self.Sounds["announcer"..k]:SetVolume((k ~= 1 and work or k==1 and cabspeaker) and (v[3] or 1)  or 0)
        end
    end
end

function ENT:Draw()
    self.BaseClass.Draw(self)
end
function ENT:DrawPost(special)
    --local dc = render.GetLightColor(self:LocalToWorld(Vector(460.0,0.0,5.0)))

    local distance = self:GetPos():Distance(LocalPlayer():GetPos())
    if distance > 1024 or special then return end

    self.RTMaterial:SetTexture("$basetexture", self.RRIScreen)
    self:DrawOnPanel("RRIScreen",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(64,64,128,128,0)
    end)
    --[[
    self.RTMaterial:SetTexture("$basetexture",self.IGLA)
    self:DrawOnPanel("IGLA_C",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(256,64,512,128,0)
    end)
    self:DrawOnPanel("IGLA_R",function(...)
        surface.SetMaterial(self.RTMaterial)
        surface.SetDrawColor(255,255,255)
        surface.DrawTexturedRectRotated(256,64,512,128,0)
    end)
    --]]
    self:DrawOnPanel("AirDistributor",function()
        draw.DrawText(self:GetNW2Bool("AD") and "Air Distributor ON" or "Air Distributor OFF","Trebuchet24",0,0,Color(0,0,0,255))
    end)
end

function ENT:OnButtonPressed(button)
    if button == "PrevSign" then
        self.InfoTableTimeout = CurTime() + 2.0
    end
    if button == "NextSign" then
        self.InfoTableTimeout = CurTime() + 2.0
    end

    if button and button:sub(1,3) == "Num" then
        self.InfoTableTimeout = CurTime() + 2.0
    end
end

function ENT:OnPlay(soundid,location,range,pitch)
    if location == "stop" then
        if IsValid(self.Sounds[soundid]) then
            self.Sounds[soundid]:Pause()
            self.Sounds[soundid]:SetTime(0)
        end
        return
    end
    if location == "bass" then
        if soundid == "VDOL" then
            return range > 0 and "vdol_on" or "vdol_off",location,1,pitch
        end
        if soundid == "VDOP" then
            return range > 0 and "vdor_on" or "vdor_off",location,1,pitch
        end
        if soundid == "VDZ" then
            return range > 0 and "vdz_on" or "vdz_off",location,1,pitch
        end
        --[[
        if soundid:sub(1,4) == "IGLA" then
            return range > 0 and "igla_on" or "igla_off",location,1,pitch
        end
        --]]
        
        if soundid == "LK1" then
            local speed = self:GetPackedRatio("Speed")
            self.SoundPositions["lk1_on"][1] = 350-Lerp(speed/0.1,0,250)
            return id,location,1-Lerp(speed/10,0.2,0.8),pitch
        end
        if soundid == "LK2" then
            local speed = self:GetPackedRatio("Speed")
            local id = range > 0 and "lk2_on" or "lk2_off"
            self.SoundPositions[id][1] = 350-Lerp(speed/0.1,0,250)
            return id,location,1-Lerp(speed/10,0.2,0.8),pitch
        end
        if soundid == "LK3" then
            local speed = self:GetPackedRatio("Speed")
            local id = range > 0 and "lk3_on" or "lk3_off"
            self.SoundPositions[id][1] = 350-Lerp(speed/0.1,0,250)
            return id,location,1-Lerp(speed/10,0.2,0.8),pitch
        end
        if soundid == "brake" then
            self:PlayOnce("brake_f",location,range,pitch)
            self:PlayOnce("brake_b",location,range,pitch)
            return
        end
        if soundid == "RARS" then
            return range > 0 and "rars_on" or "rars_off",location,1,pitch
        end
        if soundid == "RVT" then
            return range > 0 and "rvt_on" or "rvt_off",location,1,pitch
        end
        if soundid == "K6" then
            return range > 0 and "k6_on" or  "k6_off",location,1,pitch
        end
        --[[
        if soundid == "R1_5" then
            return range > 0 and "r1_5_on" or "r1_5_off",location,1,pitch
        end
        --]]
        if soundid == "RPB" then
            return range > 0 and "rpb_on" or "rpb_off",location,1,pitch
        end
        if soundid == "KD" then
            return range > 0 and "kd_on" or "kd_off",location,1,pitch
        end
        if soundid == "KK" then
            return range > 0 and "kk_on" or "kk_off",location,1,pitch
        end
        if soundid == "K25" then
            return range > 0 and "k25_on" or "k25_off",location,1,pitch
        end
        if soundid == "RP8" then
            return range > 0 and "rp8_on" or "rp8_off",location,1,pitch
        end
    elseif soundid:sub(1,4)=="kv70" and self:GetNW2Bool("SecondKV") then return soundid.."_2",location,range,pitch end
    return soundid,location,range,pitch
end
Metrostroi.GenerateClientProps()
