--------------------------------------------------------------------------------
-- Box with rheostats (YAS-44V)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("YAS_44V")

function TRAIN_SYSTEM:Initialize()
	self.Resistors = {
		--R4
		["L9-P33"]	= 51,
		--MK
		["MK3-0"]	= 15, --37.5
		--R3
		["P33-L12"]	= 300,
	}

	for k,v in pairs(self.Resistors) do
		self[k] = v
	end
end