-- プレイヤーのEntity_idを取ってくる
function getPlayerEntity()
  local players = EntityGetWithTag("player_unit")
  if #players == 0 then
    return
  end

  return players[1]
end

-- 呼ぶとプレイヤーが死ぬ
-- messageは死亡時の詳細テキスト(他のComponent経由でもメッセージを追加できる場合があるが、そのときはこのメッセージの前に設置されるよう)
function killPlayer(message)
  EntityInflictDamage(getPlayerEntity(), 999, "DAMAGE_SLICE", message, "BLOOD_EXPLOSION", 0, 0)
end

function getPlayerHealth()
	local damagemodels = EntityGetComponent( getPlayerEntity(), "DamageModelComponent" )
	local health = 0
	if( damagemodels ~= nil ) then
		for i,v in ipairs(damagemodels) do
			health = tonumber( ComponentGetValue( v, "hp" ) )
			break
		end
	end
	return health
end

-- function to return player max health
function getPlayerMaxHealth()
	local damagemodels = EntityGetComponent( getPlayerEntity(), "DamageModelComponent" )
	local maxHealth = 0
	if( damagemodels ~= nil ) then
		for i,v in ipairs(damagemodels) do

			maxHealth = tonumber( ComponentGetValue( v, "max_hp" ) )

			break
		end
	end
	return maxHealth
end
