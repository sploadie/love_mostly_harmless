Dialog = {}

Dialog.events = {}
Dialog.time = 0
Dialog.lastEvent = nil
Dialog.currentEvent = nil
Dialog.eventTime = 30

function Dialog:choicePressed(choice)
	if Dialog.currentEvent and Dialog.currentEvent.choices[choice] then
		print('Choice '..choice..'chosen!')
	end
end

function Dialog.start()
	Dialog.font = love.graphics.newFont(15)
	Dialog.box = {
		full = Button:new("data/static/dialog_full.png", function()
			print('Dialog Box clicked')
		end, 150, 530),
		c1 =   Button:new("data/static/dialog_1.png", function()
			print('Choice 1 clicked')
			if Dialog.currentEvent and Dialog.currentEvent.choices and Dialog.currentEvent.choices[1] then
				if Dialog.currentEvent.actions and Dialog.currentEvent.actions[1] then
					local localEvent = Dialog.currentEvent
					Dialog.currentEvent = nil
					localEvent.actions[1](localEvent)
				else
					Dialog.currentEvent = nil
				end
			end
		end, 156, 644),
		c2 =   Button:new("data/static/dialog_2.png", function()
			print('Choice 2 clicked')
			if Dialog.currentEvent and Dialog.currentEvent.choices and Dialog.currentEvent.choices[2] then
				if Dialog.currentEvent.actions and Dialog.currentEvent.actions[2] then
					local localEvent = Dialog.currentEvent
					Dialog.currentEvent = nil
					localEvent.actions[2](localEvent)
				else
					Dialog.currentEvent = nil
				end
			end
		end, 380, 646),
		c3 =   Button:new("data/static/dialog_3.png", function()
			print('Choice 3 clicked')
			if Dialog.currentEvent and Dialog.currentEvent.choices and Dialog.currentEvent.choices[3] then
				if Dialog.currentEvent.actions and Dialog.currentEvent.actions[3] then
					local localEvent = Dialog.currentEvent
					Dialog.currentEvent = nil
					localEvent.actions[3](localEvent)
				else
					Dialog.currentEvent = nil
				end
			end
		end, 635, 646),
		c4 =   Button:new("data/static/dialog_4.png", function()
			print('Choice 4 clicked')
			if Dialog.currentEvent and Dialog.currentEvent.choices and Dialog.currentEvent.choices[4] then
				if Dialog.currentEvent.actions and Dialog.currentEvent.actions[4] then
					local localEvent = Dialog.currentEvent
					Dialog.currentEvent = nil
					localEvent.actions[4](localEvent)
				else
					Dialog.currentEvent = nil
				end
			end
		end, 862, 644)
	}
end

function Dialog:update(dt)
	Dialog.time = Dialog.time + dt
	for i,event in pairs(Dialog.events) do
		if math.floor(Dialog.time) == i and Dialog.lastEvent ~= i then
			Dialog.currentEvent = event
			Dialog.lastEvent = i
			Dialog.eventTime = event.time or 200
		end
	end
	if Dialog.currentEvent then
		Dialog.eventTime = Dialog.eventTime - dt
		if Dialog.eventTime <= 0 then
			Dialog.currentEvent = nil -- FIXME
		end
	end
end

function Dialog:draw()
	if Dialog.currentEvent then
		love.graphics.setFont(Dialog.font)
		love.graphics.setColor(0, 0, 0)
		love.graphics.print(Dialog.currentEvent.dialog, 170, 560)
		if Dialog.currentEvent.choices then
			if Dialog.currentEvent.choices[1] then
				love.graphics.print(Dialog.currentEvent.choices[1], 170, 657)
			end
			if Dialog.currentEvent.choices[2] then
				love.graphics.print(Dialog.currentEvent.choices[2], 380 + 14, 657)
			end
			if Dialog.currentEvent.choices[3] then
				love.graphics.print(Dialog.currentEvent.choices[3], 635 + 14, 657)
			end
			if Dialog.currentEvent.choices[4] then
				love.graphics.print(Dialog.currentEvent.choices[4], 862 + 14, 657)
			end
		end
	end
end

Dialog.events = {}
Dialog.events[0] = {
		dialog = 'It\'s a beautiful morning in Sunnytown. Like every Wednesday, you\'re taking care of Fluffy, your neighbour\'s child.\nA kind, but very turbulent child, as you\'re about to witness.\n« Fluffy, be kind with your nanny, don\'t bite her like last time! »',
		time = 10,
		-- choices = {'YOLO', 'YES REALLY', 'YOU KNOW IT', '1337'},
		-- actions = {
		-- 	function() Dialog.eventTime = 10 ; Dialog.currentEvent = { dialog = 'PHRASE' } end,
		-- 	function() Dialog.eventTime = 10 ; Dialog.currentEvent = { dialog = 'PHRASE' } end,
		-- 	function() Dialog.eventTime = 10 ; Dialog.currentEvent = { dialog = 'PHRASE' } end,
		-- 	function() Dialog.eventTime = 10 ; Dialog.currentEvent = { dialog = 'PHRASE' } end
		-- }
	}
Dialog.events[10] = {
		dialog = '« I\'ll be back at 7PM. And don\'t forget to do your homework! »\nFluffy\'s parent left them after that, leaving you alone with this little monster.\n« Hi nanny ! »\nHere we are...',
		time = 10
		-- choices = {'', '', '', ''}
	}
Dialog.events[30] = {
		dialog = 'Cartoons time! Yes, leaving a kid in front of a television isn\'t the best way to raise them.\nGood thing you don\'t have to raise Fluffy, just to keep them for the day!\nSo... What will they watch?',
		choices = {
			'Steven Universe',
			-- Passage en état contente, bonus d'aggro (AB – 0,1)
			'Digimon',
			-- Passage en état ennuyé, malus d'aggro (AB + 0,1)
			'Bojack Horseman',
			-- Passage en état triste, malus d'aggro (AB +0,25)
			'No cartoon for Fluffly,\nyou\'ll play outside!'
			-- Passage en état ennuyé, mais bonus d'aggro (AB - 0,1)
		},
		actions = {
			function() Dialog.eventTime = 10 ; Monster:emotion('content') ; Dialog.currentEvent = { dialog = 'Fluffy likes this show so much they absolutely want the t-shirt Steven wears.\nThey\'re totally sucked into the show, allowing you to enjoy some peace.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('ennui') ; Dialog.currentEvent = { dialog = 'Digimon sucked already in the nineties, it won\'t get suddenly better if you watch it decades later.\nAnd Fluffy shares this opinion.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('triste') ; Dialog.currentEvent = { dialog = 'Fluffy is horrified by this show totally not suited for them.\nYou officially failed at adulthood.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('ennui') ; Dialog.currentEvent = { dialog = 'Even if Fluffy\'s not delighted by this idea, you take a good decision.\nEven though you won\'t see them immediately, the consequences will be good for you.' } end
		}
	}
Dialog.events[60] = {
		dialog = '« Nanny, I\'m super hungry!»\nIt seems snacks won\'t be enough to satisfy the little monster. What will you cook for them?',
		choices = {
			'A lentil and\nsweet potato curry', 
			-- « What is this nanny? »\nIt seems your favorite food isn't known to Fluffy. Who knows if they'll like it...
			-- Passage en état étonné, bonus d'aggro (AB – 0,2)
			'Some mac\'n\'cheese', 
			-- « Let's eat! »\nFluffy seems to still love mac'n'cheese, even though they eat it almost every day.
			-- Passage en état content, bonus d'aggro (AB – 0,2)
			'A nice bowl of soup\nwith fresh vegetables', 
			-- « NO NO NO, I HATE VEGETABLES!»\nFluffly looks angry, but health comes first!
			-- Passage en état agacé, malus d'aggro (AB +0,2)
			'Nothing, let him starve'
			-- « B... But... Why? »\nYou profoundly sadden Fluffy. Whatever...
			-- Passage en état triste, malus d'aggro (AB +0,5)
		},
		actions = {
			function() Dialog.eventTime = 10 ; Monster:emotion('amuse') ; Dialog.currentEvent = { dialog = '« What is this nanny? »\nIt seems your favorite food isn\'t known to Fluffy. Who knows if they\'ll like it...' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('content') ; Dialog.currentEvent = { dialog = '« Let\'s eat! »\nFluffy seems to still love mac\'n\'cheese, even though they eat it almost every day.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('agace') ; Dialog.currentEvent = { dialog = '« NO NO NO, I HATE VEGETABLES!»\nFluffly looks angry, but health comes first!' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('triste') ; Dialog.currentEvent = { dialog = '« B... But... Why? »\nYou profoundly sadden Fluffy. Whatever...' } end
		}
	}
Dialog.events[80] = {
		dialog = 'A child as young as Fluffy needs lots of sleep, including a daily nap after lunch.\nBut Fluffy being Fluffy, it\'s a real chore to put them to bed. What will you do?',
		choices = {
			'Leave them alone and\npray they fall asleep', 
			-- Surprisingly, leaving Fluffy alone worked well.\nOh, they're so cute when they sleep, and the house is so quiet...
			-- Passage en état content, bonus d'aggro (AB – 0,15)
			'Sing them a lullaby', 
			-- « Stop it, stop it! »\nYou'll never know if Fluffy hates lullabies or just your voice, but this isn't effective.
			-- Passage en état agacé, malus d'aggro (AB + 0,2)
			'Give Fluffy a sleeping pill', 
			-- What were you thinking? You shouldn't have done that!\nluffy's maybe asleep, but their parent won't like the way you acted...
			-- Passage en état neutre, annulation de tous les bonus  et malus d'aggro, mauvaise fin avec le parent automatique
			'Sleep is overrated,\nfeed them with coffee!'
			-- Remember: coffee's not suitable for kids.\nIf you're not convinced, Fluffy jumping all around the room should do the job.
			-- Passage en état content,  mais malus d'aggro (AB + 0,4)
		},
		actions = {
			function() Dialog.eventTime = 10 ; Monster:emotion('endormi') ; Dialog.currentEvent = { dialog = 'Surprisingly, leaving Fluffy alone worked well.\nOh, they\'re so cute when they sleep, and the house is so quiet...' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('agace') ; Dialog.currentEvent = { dialog = '« Stop it, stop it! »\nYou\'ll never know if Fluffy hates lullabies or just your voice, but this isn\'t effective.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('endormi') ; Dialog.currentEvent = { dialog = 'What were you thinking? You shouldn\'t have done that!\nFluffy\'s maybe asleep, but their parent won\'t like the way you acted...' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('content') ; Dialog.currentEvent = { dialog = 'Remember: coffee\'s not suitable for kids.\nIf you\'re not convinced, Fluffy jumping all around the room should do the job.' } end
		}
	}
Dialog.events[100] = {
		dialog = '4PM, the time for an afternoon snack! What will you give to Fluffy?',
		choices = {
			'A chocolate bar', 
			-- Fluffy's devouring the chocolate bar, and seems to enjoy it.\nBad thing it's sooo bad for health.
			-- Passage en état content, mais malus d'aggro (AB + 0,2)
			'A fresh fruit',
			-- Fluffy doesn't look thrilled by this fruity perspective.\nBut in the end, it'll be a good thing. One apple a day keeps the monster hunters away!
			'Nothing !\nNo snacks for little monsters!', 
			-- « Na... Nanny... Why?»\nCongratulations, you just made a little monster cry.
			-- Passage en état triste, malus d'aggro (AB +0,5)
			'A big juicy steak'
			-- Fluffy jumped on the steak, and devoured it within seconds.\nThat was... Impressive.
			-- Passage en état content, bonus d'aggro (AB – 0,1)
		},
		actions = {
			function() Dialog.eventTime = 10 ; Monster:emotion('neutre') ; Dialog.currentEvent = { dialog = 'Fluffy\'s devouring the chocolate bar, and seems to enjoy it.\nBad thing it\'s sooo bad for health.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('neutre') ; Dialog.currentEvent = { dialog = 'Fluffy doesn\'t look thrilled by this fruity perspective.\nBut in the end, it\'ll be a good thing. One apple a day keeps the monster hunters away!' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('neutre') ; Dialog.currentEvent = { dialog = '« Na... Nanny... Why?»\nCongratulations, you just made a little monster cry.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('neutre') ; Dialog.currentEvent = { dialog = 'Fluffy jumped on the steak, and devoured it within seconds.\nThat was... Impressive.' } end
		}
	}
Dialog.events[120] = {
		dialog = 'You postponed this moment for the whole day, but as the moment Fluffy\'s parent comes back grew closer, you realise you have no more choice.\nYou have to make Fluffy do their homework. Oh boy, it\'s gonna be a real pain...',
		choices = {
			'Start with mathematics', 
			-- « My head... It hurts! »\nMaths seem to give Fluffy a massive headache. Interesting...
			-- Passage en état agacé, malus d'aggro (AB +0,2)
			'Start with japanese', 
			-- « Zankoku na tenshi no you ni... »\nWhat a mastery of japanese! Impressive.
			-- Passage en état content
			'Start with geography', 
			-- « The capital of France is... Hum... Rome? »\nThis is gonna be veeery long...
			-- Passage en état triste, malus d'aggro (AB + 0,1)
			'Screw it, let\'s play\nMario Kart instead.'
			-- « Yay! I'll pick Daisy! »\nFluffy's pretty happy, but their parent will make you regret what you just did...
			-- Passage en état content, bonus d'aggro (AB – 0,25) MAIS mauvaise fin avec le parent automatique
		},
		actions = {
			function() Dialog.eventTime = 10 ; Monster:emotion('agace') ; Dialog.currentEvent = { dialog = '« My head... It hurts! »\nMaths seem to give Fluffy a massive headache. Interesting...' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('content') ; Dialog.currentEvent = { dialog = '« Zankoku na tenshi no you ni... »\nWhat a mastery of japanese! Impressive.' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('triste') ; Dialog.currentEvent = { dialog = '« The capital of France is... Hum... Rome? »\nThis is gonna be veeery long...' } end,
			function() Dialog.eventTime = 10 ; Monster:emotion('content') ; Dialog.currentEvent = { dialog = '« Yay! I\'ll pick Daisy! »\nFluffy\'s pretty happy, but their parent will make you regret what you just did...' } end
		}
	}
Dialog.events[150] = {
		-- Si Fluffy s'est énervé plus de deux fois
		dialog = 'That was... Hard.\nYou can\'t know for sure if Fluffy\'s a difficult child or if you\'re simply incomptetent, but yes, that was hard.\nAnd to think that you\'ll have to do that again next week... Yes, that was hard.',
		-- -- Si Fluffy s'est énervé deux fois ou moins
		-- dialog = 'That was a good day!\nSurprisingly, Fluffy was very nice today. Sure, some moment were rougher than others, but you had a very good day.\nLet\'s hope next week will be the same...',
		-- -- Si vous perdez tous les PV 
		-- dialog = 'That was a shitty day.\nYou\'ve been to hospital and lost your job, all thanks to Fluffy...\nFuck you Fluffy.',
		-- -- Si vous obtenez la mauvaise fin avec le parent 
		-- dialog = 'Keeping kids is hard, especially when their parents do not like your methods..\nEspecially when their parents are now chasing you because you fucked reaaally hard.\nThat was... A really, really shitty day.',
}

return Dialog
