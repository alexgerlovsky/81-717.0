--------------------------------------------------------------------------------
-- HC switches case (LK-756V)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("LK_756V")

function TRAIN_SYSTEM:Initialize()
    -- Линейный контактор (ЛК1)
    self.Train:LoadSystem("LK1","Relay","PK-162",{bass=true,close_time=0.1})
    -- Линейный контактор (ЛК2)
    self.Train:LoadSystem("LK2","Relay","PK-162",{bass=true,close_time=0.1})
    -- Линейный контактор (ЛК3)
    self.Train:LoadSystem("LK3","Relay","PK-162",{bass=true,close_time=0.1})
    -- Линейный контактор (ЛК4)
    self.Train:LoadSystem("LK4","Relay","PK-162",{bass=true,close_time=0.1})
    -- Линейный контактор (ЛК5)
    self.Train:LoadSystem("LK5","Relay","PK-162",{bass=true,close_time=0.1})
end