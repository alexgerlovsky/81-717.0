--------------------------------------------------------------------------------
-- Блок БУМ
--------------------------------------------------------------------------------
-- Copyright (C) 2024 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("ALS_ARS_BUM_U3")
TRAIN_SYSTEM.DontAccelerateSimulation = false

function TRAIN_SYSTEM:Initialize(typ)
    self.Train:LoadSystem("BUM_RVD1","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RVD2","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RUVD","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RB","Relay","ARS",{bass=true,bass_separate=true})
    
	self.Train:LoadSystem("BUM_TR","Relay","ARS",{close_time=0.15, bass=true,bass_separate=true})
	self.Train:LoadSystem("BUM_PTR","Relay","ARS",{open_time=1.0, bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_PTR1","Relay","ARS",{open_time=0.9, bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RET","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RVZ1","Relay","ARS",{bass=true,bass_separate=true})
	self.Train:LoadSystem("BUM_RVT1","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RVT2","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RVT4","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_RVT5","Relay","ARS",{bass=true,bass_separate=true})
	
	self.Train:LoadSystem("BUM_EK","Relay","ARS",{open_time=3.3, bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_EK1","Relay","ARS",{open_time=3.3, bass=true,bass_separate=true})
	self.Train:LoadSystem("BUM_RIPP","Relay","ARS",{bass=true,bass_separate=true})
    self.Train:LoadSystem("BUM_PEK","Relay","ARS",{bass=true,bass_separate=true})    

    self.Train:LoadSystem("BUM_RPU","Relay","ARS",{bass=true,bass_separate=true})
end

function TRAIN_SYSTEM:Outputs()
	return {}
end

function TRAIN_SYSTEM:Inputs()
	return {}
end

function TRAIN_SYSTEM:TriggerInput(name,value)
end

function TRAIN_SYSTEM:Think(dT)
end