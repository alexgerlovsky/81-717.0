--------------------------------------------------------------------------------
-- Box with switches (YAK-36V)
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("YAK_36V")

function TRAIN_SYSTEM:Initialize()
	
	-- КК (контактор мотор-компрессора)
	self.Train:LoadSystem("KK","Relay","KPP-110",{bass=true})
	-- КВП (контактор вторичного преобразователя БПСН)
	self.Train:LoadSystem("KVP","Relay","KPP-110","KPP",{bass=true})
	--[[
	-- ТРК (защита мотор-компрессора от перегрузки) -- с 81-717.БВ
	self.Train:LoadSystem("TRK","Relay","TRTP-115")
	--]]
	-- КВЦ (контактор высоковольтных цепей)
	self.Train:LoadSystem("KVC","Relay","KPP-110","750V",{bass=true})
	
end
