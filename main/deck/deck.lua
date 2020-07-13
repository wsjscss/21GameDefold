local Deck = {}

-- Создание массив с цифрами по 4, пример {2,2,2,2, 3,3,3,3, 4,4,4,4 ... 11,11,11,11} в случайном порядке
function Deck.create()
	print('creating deck')
	
	
	local deck = {}
	local max_cards = 52
	local card_value = 2
	local card_max_value = 11
	local cnt = 0

	for idx=1, max_cards do
		cnt = cnt + 1

		deck[idx] = card_value

		-- Сброс счетчика до 0 если стал 4
		if cnt == 4 then
			cnt = 0
			card_value = card_value + 1
		end

		-- Если значение превышает 11, то сбрасываем до 2. (Валет 2, Дама 3, Король 4)
		if card_value > card_max_value then
			card_value = 2
		end
	end

	-- Перемешиваием карты
	deck = shuffle(deck)
	
	return deck
end

function shuffle(tbl)
	for i = #tbl, 2, -1 do
		local j = math.random(i)
		tbl[i], tbl[j] = tbl[j], tbl[i]
	end
	return tbl
end

-- Возвращает одну карту из колоды и удаляет её из массива карт
function Deck.get_card(tbl)
	return table.remove(tbl, 1)
end

return Deck