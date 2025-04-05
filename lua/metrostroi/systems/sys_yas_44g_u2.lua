--------------------------------------------------------------------------------
-- Box with rheostats (YAS-44G)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("YAS_44G")

function TRAIN_SYSTEM:Initialize()
	self.Resistors = {
		--BPSN
		["SP1-NR1"]	= 4800,
		--ThyristorController
		["L44-L43"] = 285,
		["L46-L43"]	= 285,
		["L25-L42"]	= 285,
		["L28-L42"]	= 285,
		["L30-L42"]	= 300,
		["L42-L43"]	= 660,
		["L43-L40"]	= 300,
	}
	
	for k,v in pairs(self.Resistors) do
		self[k] = v
	end
end