--------------------------------------------------------------------------------
-- HV Rheostats (KF-10B)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("KF_10B")

function TRAIN_SYSTEM:Initialize()
    self.Resistors = {
        ["L20-L21"] = 3.92,
    }

    for k,v in pairs(self.Resistors) do
        self[k] = v
    end
end