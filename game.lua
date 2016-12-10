local Game = {
	state = 'StartMenu',
	aggroSpeed = 0.5,
	dmgMult = 1,
	aggro = 1,
	aggroEffects = {}
}

function Game:addEffect(time, add, mult, delay)
	table.insert(self.aggroEffects, {
		time = time or 10000,
		add = add or 0,
		mult = mult or 1,
		delay = delay or 0
	})
end

function Game:addDmgMult(addMult)
	self.dmgMult = self.dmgMult + addMult
end

function Game:updateAggro(delta)
	local add = 0
	local mult = 1
	for i,effect in ipairs(self.aggroEffects) do
		if effect.delay > 0 then
			effect.delay = effect.delay - delta
		elseif effect.time > 0 then
			add = add + effect.add
			mult = mult * effect.mult
			effect.time = effect.time - delta
		end
	end
	local deltaAggro = delta * self.aggroSpeed * (1 + add) * mult
	self.aggro = self.aggro + deltaAggro
	print('Aggro: '..self.aggro..' Add: '..add..' Mult: '..mult)
	self:cleanEffects()
end

function Game:cleanEffects()
	for i,effect in ipairs(self.aggroEffects) do
		if effect.time <= 0 then
			table.remove(self.aggroEffects, i)
			return self:cleanEffects()
		end
	end
end

return Game