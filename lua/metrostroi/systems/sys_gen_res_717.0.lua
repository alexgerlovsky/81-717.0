--------------------------------------------------------------------------------
-- Resistor arrays calculations
--------------------------------------------------------------------------------
-- Copyright (C) 2025 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
Metrostroi.DefineSystem("Gen_Res_717_0")

local R = {}
--R1
local P17_18
local P18_20
local P20_21
local P21_22
local P22_23
local P23_24
local P24_25
local P25_26
--R2
local L12_P76
local L12_P27
--R5
local L12_P16
--R6
local P13_12
local P12_11
local P11_10
local P10_9
local P9_8
local P8_7
local P6_7
local P4_6
local P3_4
--R7
local L8_P14
--R8
local L8_P1
--R9
local P29_P28
local P30_P29
local P31_P30
local L76_P31
--R11
local P35_K2
local P36_P35
local P37_P36
local L74_P37

function TRAIN_SYSTEM.InitializeResistances_81_717(Train)
    --R6
	P13_12 = Train.KF_47A["P13_12"]
    P12_11 = Train.KF_47A["P12_11"]
    P11_10 = Train.KF_47A["P11_10"]
    P10_9 = Train.KF_47A["P10_9"]
    P9_8 = Train.KF_47A["P9_8"]
    P8_7 = Train.KF_47A["P8_7"]
    P6_7 = Train.KF_47A["P6_7"]
	P4_6 = Train.KF_47A["P4_6"]
    P3_4 = Train.KF_47A["P3_4"]
	--R2
	L12_P76 = Train.KF_47A["L12_P76"]
	L12_P27 = Train.KF_47A["L12_P27"]
	--R5
    L12_P16 = Train.KF_47A["L12_P16"]
    --R7
    L8_P14 = Train.KF_47A["L8_P14"]
	--R8
    L8_P1 = Train.KF_47A["L8_P1"]
    --R1
    P17_18 = Train.KF_47A["P17_18"]
    P18_20 = Train.KF_47A["P18_20"]
	P20_21 = Train.KF_47A["P20_21"]
    P21_22 = Train.KF_47A["P21_22"]
    P22_23 = Train.KF_47A["P22_23"]
    P23_24 = Train.KF_47A["P23_24"]
	P24_25 = Train.KF_47A["P24_25"]
    P25_26 = Train.KF_47A["P25_26"]
    --R9
    P29_P28 = Train.KF_50A["P29_P28"]
    P30_P29 = Train.KF_50A["P30_P29"]
    P31_P30 = Train.KF_50A["P31_P30"]
    L76_P31 = Train.KF_50A["L76_P31"]
    --R11
    P35_K2 = Train.KF_50A["P35_K2"]
    P36_P35 = Train.KF_50A["P36_P35"]
    P37_P36 = Train.KF_50A["P37_P36"]
    L74_P37 = Train.KF_50A["L74_P37"]
end

function TRAIN_SYSTEM.R1C1(Train)
	--Контур P13(P14)-Л8 в последовательном соединение моторном-тормозном
	local RK = Train.RheostatController
	local PM = Train.PositionSwitch.RPM
	local PT = Train.PositionSwitch.RPT
	R[1] = ((PM)^-1 + (P11_10)^-1)^-1
	R[2] = ((RK[17])^-1 + (P12_11)^-1)^-1
	R[3] = ((RK[19])^-1 + (R[2]+P13_12)^-1)^-1
	R[4] = ((RK[5])^-1 + (RK[3]+P3_4)^-1)^-1
	R[5] = ((RK[7])^-1 + (R[4]+P4_6)^-1)^-1
	R[6] = ((RK[9])^-1 + (R[5]+P6_7)^-1)^-1
	R[7] = ((RK[11])^-1 + (R[6]+P8_7)^-1)^-1
	R[8] = ((RK[13])^-1 + (R[7]+P9_8)^-1)^-1
	R[9] = ((RK[15] + PM)^-1 + (R[8]+R[1]+P10_9)^-1)^-1
	R[10] = ((L8_P14)^-1 + (L8_P1+RK[1])^-1)^-1 
	R[11] = ((R[9]+R[3])^-1 + (PT+R[10])^-1)^-1 
	return R[11]
end

function TRAIN_SYSTEM.R1C2(Train)
	--Контур P13(P14)-Л8 в паралелльном соединение моторном-тормозном
	local RK = Train.RheostatController
	local PM = Train.PositionSwitch.RPM
	local PT = Train.PositionSwitch.RPT
	R[1] = ((PM)^-1 + (P11_10)^-1)^-1
	R[2] = ((RK[17])^-1 + (P12_11)^-1)^-1
	R[3] = ((RK[19])^-1 + (R[2]+P13_12)^-1)^-1
	R[4] = ((L8_P14)^-1 + (L8_P1+RK[1])^-1)^-1
	R[5] = ((RK[15] + PM)^-1 + (R[4]+PT+R[3])^-1)^-1
	R[6] = ((RK[13])^-1 + (R[5]+R[1]+P10_9)^-1)^-1
	R[7] = ((RK[11])^-1 + (R[6]+P9_8)^-1)^-1
	R[8] = ((RK[9])^-1 + (R[7]+P8_7)^-1)^-1
	R[9] = ((RK[7])^-1 + (R[8]+P6_7)^-1)^-1
	R[10] = ((RK[5])^-1 + (R[9]+P4_6)^-1)^-1
	R[11] = ((RK[3])^-1 + (R[10]+P3_4)^-1)^-1
	return R[11]
end

function TRAIN_SYSTEM.R2C1(Train)
	--Контур P26(P27)-Л12 в последовательном соединение моторном-тормозном
	local RK = Train.RheostatController
	local PM = Train.PositionSwitch.RPM
	local PT = Train.PositionSwitch.RPT
	R[1] = ((PM)^-1 + (P24_25)^-1)^-1
	R[2] = ((RK[18])^-1 + (P25_26)^-1)^-1
	R[3] = ((RK[6])^-1 + (RK[4]+P17_18)^-1)^-1
	R[4] = ((RK[8])^-1 + (R[3]+P18_20)^-1)^-1
	R[5] = ((RK[10])^-1 + (R[4]+P20_21)^-1)^-1
	R[6] = ((RK[12])^-1 + (R[5]+P21_22)^-1)^-1
	R[7] = ((RK[14])^-1 + (R[6]+P22_23)^-1)^-1
	R[8] = ((RK[16]+PM)^-1 + (R[7]+P23_24+R[1])^-1)^-1
	R[9] = ((RK[27])^-1 + (L12_P27-L12_P76)^-1)^-1
	R[10] = ((L12_P76+R[9])^-1 + (L12_P16+RK[2])^-1)^-1
	R[11] = ((R[8]+R[2])^-1 + (R[10]+PT)^-1)^-1
	return R[11]
end

function TRAIN_SYSTEM.R2C2(Train)
	--Контур P26(P27)-Л12 в параллельном соединение моторном-тормозном
	local RK = Train.RheostatController
	local PM = Train.PositionSwitch.RPM
	local PT = Train.PositionSwitch.RPT
	R[1] = ((PM)^-1 + (P24_25)^-1)^-1
	R[2] = ((RK[18])^-1 + (P25_26)^-1)^-1
	R[3] = ((RK[27])^-1 + (L12_P27-L12_P76)^-1)^-1
	R[4] = ((L12_P76+R[3])^-1 + (L12_P16+RK[2])^-1)^-1 
	R[5] = ((RK[16]+PM)^-1 + (R[4]+PT+R[2])^-1)^-1
	R[6] = ((RK[14])^-1 + (P23_24+R[1]+R[5])^-1)^-1
	R[7] = ((RK[12])^-1 + (R[6]+P22_23)^-1)^-1
	R[8] = ((RK[10])^-1 + (R[7]+P21_22)^-1)^-1
	R[9] = ((RK[8])^-1 + (R[8]+P20_21)^-1)^-1
	R[10] = ((RK[6])^-1 + (R[9]+P18_20)^-1)^-1
	R[11] = ((RK[4])^-1 + (R[10]+P17_18)^-1)^-1
	return R[11]
end

function TRAIN_SYSTEM.S1(Train)
	--Резисторы ослабления поля ТЭДов 1-й группы
	local RK = Train.RheostatController
	local PM = Train.PositionSwitch.RPM
	local PT = Train.PositionSwitch.RPT
	R[1] = ((L76_P31)^-1 + (RK[21])^-1)^-1
	R[2] = ((RK[23])^-1 + (P31_P30+R[1])^-1)^-1
	R[3] = ((RK[25])^-1 + (P30_P29+R[2])^-1)^-1
	R[4] = (P29_P28+R[3])
	return R[4]
end

function TRAIN_SYSTEM.S2(Train)
	--Резисторы ослабления поля ТЭДов 2-й группы
	local RK = Train.RheostatController
	local PM = Train.PositionSwitch.RPM
	local PT = Train.PositionSwitch.RPT
	R[1] = ((L74_P37)^-1 + (RK[22])^-1)^-1
	R[2] = ((RK[24])^-1 + (P37_P36+R[1])^-1)^-1
	R[3] = ((RK[26])^-1 + (P36_P35+R[2])^-1)^-1
	R[4] = (P35_K2+R[3])
	return R[4]
end

