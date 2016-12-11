Monster = {}
Monster.fluffy = {}
Monster.fluffy.agace      = { buff =  0.2, name = 'fluffy_agace', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.amuse      = { buff = -0.3, name = 'fluffy_amuse', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.caresse    = { buff =    0, name = 'fluffy_caresse', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.content    = { buff = -0.2, name = 'fluffy_content', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.endormi    = { buff = -0.8, name = 'fluffy_endormi', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.ennui      = { buff =  0.2, name = 'fluffy_ennui', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.monsterize = { buff =  0.6, name = 'fluffy_monsterize', num = 9, delay = 0.05, effect = 'pingpong', after = Monster.fluffy.agace }
Monster.fluffy.musique    = { buff = -0.2, name = 'fluffy_musique', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.neutre     = { buff =    0, name = 'fluffy_neutre', num = 6, delay = 0.05, effect = 'pingpong' }
Monster.fluffy.triste     = { buff =  0.4, name = 'fluffy_triste', num = 6, delay = 0.05, effect = 'pingpong' }

function Monster:start()
	self.sprite = Animation:new(self.fluffy.neutre)
	self.emote = self.fluffy.neutre.buff
end

function Monster:emotion(newEmotion)
	self.sprite:load(self.fluffy[newEmotion])
	self.emote = self.fluffy[newEmotion].buff
end

function Monster:update(delta)
	self.sprite:update(delta)
end

function Monster:draw()
	self.sprite:draw(600, 310, 0, 0.2, 0.2)
end

return Monster
