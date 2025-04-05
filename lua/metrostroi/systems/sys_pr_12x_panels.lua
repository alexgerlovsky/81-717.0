--------------------------------------------------------------------------------
-- Relays panel (PR-123B, PR-124B)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("PR_12X_Panels")

function TRAIN_SYSTEM:Initialize()

    ----------------------------------------------------------------------------
    -- ПР-123Б
    ----------------------------------------------------------------------------
    -- Контактор 6-ого провода (К6)
    self.Train:LoadSystem("K6","Relay","TKPM-121",{bass=true, close_time=0.12}) 
    -- Реле времени торможения (РВТ)
    self.Train:LoadSystem("RVT","Relay","REV-811", {bass=true, open_time=0.6, close_time=0.12})
    -- Реле педали бдительности (РПБ)
    self.Train:LoadSystem("RPB","Relay","REV-812", {bass=true, open_time=2.5})

    ----------------------------------------------------------------------------
    -- ПР-124Б
    ----------------------------------------------------------------------------
    -- Контактор 25ого провода (К25)
    self.Train:LoadSystem("K25","Relay","KPD-110E",{bass=true})
    -- Реле-повторитель провода 8 (РП8)
    self.Train:LoadSystem("RP8","Relay","REV-821",{bass=true, close_time=0.15})
    -- Контактор дверей (КД)
    self.Train:LoadSystem("KD","Relay","REV-821",{bass=true, close_time=0.15})
    
end
function TRAIN_SYSTEM:Think()
end
