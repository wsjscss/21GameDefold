local Player = {}

function Player.create(player_name)
	return {
		name = player_name,
		current_score = 0,
		is_moving = 1,
		won_rounds = 0,
		risky = math.random(1,4)
	}
end

-- Добавляем очки
function Player.add_score(player, score)
	return player.current_score + score
end

-- Принимаем решение брать ещё или остановится
function Player.make_decision(player)
	-- Тут случайным образом решается игрок играет дальше или останавливается
	-- Можно добавить какой-то процент рискованности игрока
	local decision = 1 -- или 1
	local min_stop_val = player.risky + 16

	if player.current_score > min_stop_val then
		decision = 0
	end
	
	return decision
end

-- Добавляем +1 к выигранным уровням
function add_won_round(player)
	return player.won_rounds + 1
end

-- Сброс переменных игрок для начала раунда
function Player.reset(player)
	player.current_score = 0
	player.is_moving = 1
	return player
end

return Player
