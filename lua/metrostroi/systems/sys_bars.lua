--------------------------------------------------------------------------------
-- 81-717 "BARS" safety system
--------------------------------------------------------------------------------
-- Copyright (C) 2024 Metrostroi Team & Metrodolbaeb group
--------------------------------------------------------------------------------
--Реализовать функцию скоростных сигналов, обрыв ДВШ
--FIX:
--Последовательность и инициализации переменных и циклов, правильная работа ламп 09.02.2025
--Ебля РВЗ1
--Фикс О и ОЧ - при режиме 1/5 - ОЧ - 28.01.2025
--Сделать более быстрый запуск БАРС с холодного, прописать условие РВТ0 при отсутствии значения 0 или ОЧ
Metrostroi.DefineSystem("BARS")
TRAIN_SYSTEM.DontAccelerateSimulation = false

function TRAIN_SYSTEM:Initialize()
    self.Train:LoadSystem("ALSCoil")
    self.Train:LoadSystem("EPKC","Relay")
	self.Train:LoadSystem("BUM","ALS_ARS_BUM_U3")
    
	--Power
    self.ARSPower = 0
    self.ALSPower = 0
	self.ALS = 0
	
	--Delays
	self.PSSdelay = false
	
	--Timers
	self.OnTimer = false
	self.PSSTimer = false
    self.Timer_RO = false
	self.Timer_Obr = false
	self.CancelTimer = false
	
    
	--PSS BARS  
	self.Freqmode = false
	self.R1030 = false
    self.ROCh = false
    self.RSS = false
	self.RO = false
    self.R20 = false
	self.ROD = false
	
	--PUR BARS
    self.GE = false
	self.KRO = 0
    self.KRH = 0
    self.KRT = 0
    self.KSR = false 
	self.RNT = false
    self.BR1 = false
    self.BR2 = false
	self.KPP = 0
	self.RVT0 = false
	
	--Filter BARS
    self.NoFreq = 0
    self.F1 = 0
    self.F2 = 0
    self.F3 = 0
    self.F4 = 0
    self.F5 = 0
    self.F6 = 0
	
	
    self.DA = 0
    self.KB = 0
    self.KT = 0
   
    self["2"] = 0
    self["8"] = 0
    self["20"] = 0
    self["33G"] = 0
    self["48"] = 0
    self.KVD = 0
    self["7S"] = 0
    self.EPK = 0
end

function TRAIN_SYSTEM:Outputs()
    return {"KVD","7S","Speed","NoFreq","F1","F2","F3","F4","F5","F6"} 
end

function TRAIN_SYSTEM:Inputs()
    return {}
end

function TRAIN_SYSTEM:TriggerInput(name,value)
end
function TRAIN_SYSTEM:Think(dT)
    local S = {}
    local Train = self.Train
    local ALS = Train.ALSCoil
    local speed = ALS.Speed
	local Freqmode = ALS.OneFreq--[[+ALS.TwoFreq]]+ALS.NoneFreq 
    local ARSPower = self.ARSPower
	local ALSPower = self.ALSPower
	if ARSPower>0 and not self.GE then --Задержка ГЭ
		if not self.OnTimer then
		self.OnTimer = CurTime()
		elseif self.OnTimer and CurTime()-self.OnTimer > 0.3 then
		self.GE = true 
		self.OnTimer = false 
		end
	end   
	if self.ARSPower>0 and self.GE then
	ALSPower = self.ARSPower
	end
	local FreqCode = bit.bor(ALS.F1*1,ALS.F2*2,ALS.F3*4,ALS.F4*8,ALS.F5*16,ALSPower*32,ARSPower*64)
	if self.ALS ~= ALS.Enabled then --Питание катушки
        ALS:TriggerInput("Enable",self.ALS)
    end
	if ALSPower>0 and not self.PSSdelay then --Задержка на включение локомотивной сигнализации 
	 if not self.PSSTimer then
	 self.PSSTimer = CurTime()
	 end
	 if self.PSSTimer and CurTime()-self.PSSTimer > 1 then
	 self.PSSdelay = true
	 self.PSSTimer = false
	 end
	elseif ALSPower > 0 then 
	     if self.ALS> 0 then --Получение 325 Гц(без задержки)
		  self.F6 = ALS.F6
		  Train.BUM_RPU:TriggerInput("Set", self.F6)
		 end
	     if self.FreqCode ~= FreqCode then --Время нереагирования на смену частот
           if not self.FreqCodeTimer then self.FreqCodeTimer = CurTime() end
           if self.FreqCodeTimer and CurTime()-self.FreqCodeTimer>1.1 then
		    if self.ALS>0 and Freqmode>0 then --Прием частот в одночастотном режиме
              self.FreqCode = FreqCode
			  self.F1 = ALS.F1
              self.F2 = ALS.F2
              self.F3 = ALS.F3
              self.F4 = ALS.F4
              self.F5 = ALS.F5
			elseif self.ALS == 0 then --Обесточивание приемных катушек
		      self.F1 = 0
		      self.F2 = 0
		      self.F3 = 0
		      self.F4 = 0
		      self.F5 = 0
		      self.F6 = 0
		      self.FreqCode = nil
		    end
			self.FreqCodeTimer = false
		   end
		 end
		 self.NoFreq = (1-math.min(1,(self.F1+self.F2+self.F3+self.F4+self.F5))) 
		else 
	     self.PSSTimer = false
	     self.FreqCodeTimer = false
		 self.PSSdelay = false
		 self.FreqCode = nil
		 self.NoFreq = 0
	     self.F1 = 0
	     self.F2 = 0
	     self.F3 = 0
	     self.F4 = 0
	     self.F5 = 0
	     self.F6 = 0  
		 Train.BUM_RPU.Value = 0                                 
	end
	if ARSPower>0 then
	    local Vzad = 20
        if self.F4 > 0 then Vzad = 40 end
        if self.F3 > 0 then Vzad = 60 end
        if self.F2 > 0 then Vzad = 70 end
        if self.F1 > 0 then Vzad = 80 end
        if Vzad ~= 20 and self.KB>0 then Vzad = 20 end
		--RSS
		if speed<8.9 or speed>30 then self.R1030 = false elseif speed>10.2 or speed<28.7 then self.R1030 = true end -- R10/30 -подвязка время срабатывания ЭПК
		self.ROCh = self.GE and ALS.NoneFreq == 0 or ALS.TwoFreq == 0 and ALS.OneFreq == 1  --ROCh --FIXED by Ben Evans 
		if Vzad<=20 or speed>Vzad or self.F5>0 or self.NoFreq>0 then self.RSS = false elseif speed<Vzad-1 then self.RSS = true end --RSS
		if speed>4.5 then self.RO = false elseif speed<2.7 --[[or not self.ROCh]] then self.RO = true end --RO
		if speed>20 then self.R20 = false elseif speed<17.3 then self.R20 = true end --R20 --FIXED by Ben Evans
		if speed>Vzad-1 then self.ROD = true elseif speed<Vzad-2 then self.ROD = false end --ROD
		--Функция скоростных сигналов	
	    if self.RO and self.KRH>0 and self.ROCh and 1-self.F5>0  then --Условие запуска таймера
            if not self.Timer_RO then self.Timer_RO = CurTime() end
        elseif self.Timer_RO then
            self.Timer_RO = false
			self.Timer_Obr = false
		end
        if self.ROCh and self.Timer_RO and CurTime()-self.Timer_RO>7 then --Сработка противоската
            self.RSS = false
            self.R2O = false
        end
		--PUR
        self.RNT = (self.BR1 or self.BR2) or (self.RNT and (self.KSR or self.KRT>0)) --RNT, RNT1
		self.KSR = self.GE and self.RNT and self.RSS or self.R20 and (self.BR1 and self.ROCh or self.BR2) --KSR1, KSR2, KSR3
		self.RVT0 = self.GE and 1-Train.BUM_TR.Value > 0 and (self.NoFreq > 0 or self.F5 > 0 ) --RVT0
		self.BR2 = self.GE and self.KB>0 and not self.ROCh and not self.BR1 --BR2
		self.BR1 = self.GE and self.KB>0 and (self.BR1 or self.ROCh) and not self.BR2 --BR1
		--print(self.BR1, self.RNT, self.KSR)
		--BUM U3
		S["EKturn"] = not self.GE --[[and self.RO]] --для Днепра
		S["EKmove"] = (not self.RO or self.RO and ((1-self.KRH)>0 and (self.KRT>0 or self.KRO>0) and self.BR2 or self.KRH>0 and (1-self.KRO)>0 and (1-self.KRT)>0)) and self.KSR and Train.BUM_PTR.Value>0 
		S["EKbr"] = self.KT>0 
		S["EK"] = S["EKturn"] or (Train.BUM_RIPP.Value>0 and Train.BUM_PEK.Value>0 and (S["EKmove"] or S["EKbr"])) 
		Train.BUM_EK:TriggerInput("Set", S["EK"])
		Train.BUM_EK:TriggerInput("OpenTime", self.R1030 and 5.5 or 3.3)
		Train.BUM_EK1:TriggerInput("Set", S["EK"])
		Train.BUM_EK1:TriggerInput("OpenTime", self.R1030 and 5.5 or 3.3)
		Train.BUM_RIPP:TriggerInput("Set", Train.BUM_EK.Value)
        Train.BUM_PEK:TriggerInput("Set", Train.BUM_EK.Value)
		Train.BUM_TR:TriggerInput("Set",self.KSR)
		Train.BUM_PTR:TriggerInput("Set",Train.BUM_TR.Value) 
		Train.BUM_PTR1:TriggerInput("Set",Train.BUM_TR.Value) 
	    Train.BUM_RUVD:TriggerInput("Set",self.GE and self.KSR and (Train.BUM_RUVD.Value>0 or self.KRO>0))
		Train.BUM_RVT1:TriggerInput("Set", 1-Train.BUM_PTR1.Value>0 or self.RVT0) 
		Train.BUM_RVT2:TriggerInput("Set", 1-Train.BUM_PTR1.Value>0 or self.RVT0) 
		Train.BUM_RVT4:TriggerInput("Set", 1-Train.BUM_PTR1.Value>0 or self.RVT0) --Fixed by Ben Evans (LOGIC)          
		Train.BUM_RVT5:TriggerInput("Set", 1-Train.BUM_TR.Value>0 and 1-Train.BUM_PTR.Value>0)	
		Train.BUM_RET:TriggerInput("Set", 1-Train.BUM_TR.Value>0 and Train.BUM_PTR1.Value>0) 
		Train.BUM_RVZ1:TriggerInput("Set",self.RO and 1-self.KRH>0 and (self.KRT>0 or self.KRO>0) and not self.BR2) --или self.RO and 1-self.KRH>0 and not self.BR2
		Train.BUM_RVD1:TriggerInput("Set",self.GE and self.KSR and 1-self.KRT>0 and Train.BUM_RUVD.Value>0) 
		Train.BUM_RVD2:TriggerInput("Set",self.GE and self.KSR and 1-self.KRT>0 and Train.BUM_RUVD.Value>0) 
		Train.BUM_RB:TriggerInput("Set",self.GE and self.KSR) 
		--Команда на торможение
		self.KVD = 1-Train.BUM_RUVD.Value --Колхоз вариант лампы КВД без функции РОДа
		self["7S"] = self.RNT and 0 or 1
		self["2"] = self.DA*Train.BUM_RVT4.Value --Если не убрать DA - то при ВКЛ ЭПК не будет ЛХРК
		self["20"] = self.DA*Train.BUM_RVT1.Value
	    self["33G"] = self.DA*Train.BUM_RVT2.Value
		self["8"] = Train.BUM_RVT5.Value
		self["48"] = Train.BUM_RVZ1.Value+Train.BUM_RET.Value 
		self.EPK = Train.BUM_EK.Value
	 else
		self.OnTimer = false
		self.Timer_RO = false
		self.Timer_Obr = false
		self.CancelTimer = false

        self.GE = false

        self.ROCh = false
        self.RSS = false
		self.R1030 = false
        self.RO = false
        self.R20 = false
		self.ROD = false
         
		self.BR2 = false
		self.BR1 = false
		self.KSR = false 
		self.RNT = false
		self.KRO = 0
        self.KRH = 0
        self.KRT = 0
    	self.KPP = 0
	    self.RVT0 = false
        
		self.KVD = 0
        self["7S"] = 0
        self["2"] = 0
		self["8"] = 0
		self["20"] = 0
        self["33G"] = 0
		self["48"] = 0
   
		Train.BUM_EK.Value = 0
		Train.BUM_EK1.Value = 0
		Train.BUM_RIPP.Value = 0
		Train.BUM_PEK.Value = 0
        self.EPK = 0

   end
   Train.EPKC:TriggerInput("Set", self.EPK)
end
