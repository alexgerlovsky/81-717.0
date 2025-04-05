--------------------------------------------------------------------------------
-- 81-717 "ISDPM" safety system 
--------------------------------------------------------------------------------
-- ISDPM includes IS+BP+DV
--------------------------------------------------------------------------------
-- Copyright (C) 2024 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("ISDPM")
function TRAIN_SYSTEM:Initialize()
    self.Train:LoadSystem("ALSCoil")
	self.SpeedoTimer = false -- Интервал обновления
    self.Speed = 1
	self.BPpower = 0
end

function TRAIN_SYSTEM:Outputs() --под TURBOSTROI
    return {}
end

function TRAIN_SYSTEM:Inputs()
    return {}
end

function TRAIN_SYSTEM:Think(dT)
    
    local Train = self.Train
    local ALS = Train.ALSCoil
    local speed = ALS.Speed
	if self.BPpower > 0 then
    self.SpeedoTimer = self.SpeedoTimer or CurTime()
     if CurTime()-self.SpeedoTimer > 0.4 then
        self.Speed = math.max(0,self.Speed+(speed-self.Speed)*(0.4+math.max(0,math.min((self.Speed-5)*0.2,0.4))))
        self.SpeedoTimer = CurTime()
	 end
	else
         self.Speed = 0
	end
end