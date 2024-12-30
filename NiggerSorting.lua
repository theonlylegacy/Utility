
local players = game:getService("Players")

local getPriorityList = function()
    local list = {}
    local descriptionRecords = {}

    for _, player in players:getPlayers() do
        list[#list + 1] = player
        descriptionRecords[player] = players:getHumanoidDescriptionFromUserId(player.userId)
    end

    table.sort(list, function(first, second)
        local firstDescription = descriptionRecords[first]
        local secondDescription = descriptionRecords[second]
        if not (firstDescription and secondDescription) then
            return
        end

        local firstColor = select(2, firstDescription.headColor:ToHSV())
        local secondColor = select(2, secondDescription.headColor:ToHSV())
        
        return firstColor > secondColor
    end)

    return list
end

print("sorted players by swimming ability")
table.foreach(getPriorityList(), print)
