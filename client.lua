-- CONFIG --
local showCompass = true
local displayTime = true
local useMilitaryTime = true

local timeAndDateString = nil
local hour
local minute

-- CODE --
function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
        SetTextFont(6)
        SetTextProportional(1)
        SetTextScale(0.0, 0.48)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x, y)
end

local lastStreet = nil
local zones = { ['AIRP'] = "МАЛС", ['ALAMO'] = "Аламо-Си", ['ALTA'] = "Альта", ['ARMYB'] = "Форт Занкудо", ['BANHAMC'] = "Бэнхэм Драйв", ['BANNING'] = "Бэннинг", ['BEACH'] = "Веспуччи-Бич", ['BHAMCA'] = "Каньон Бэнхэм", ['BRADP'] = "Перевал Брэддока", ['BRADT'] = "Тоннель Брэддока", ['BURTON'] = "Бертон", ['CALAFB'] = "Калафиа-Бридж", ['CANNY'] = "Каньон Ратон", ['CCREAK'] = "Кэссиди-Крик", ['CHAMH'] = "Чемберлен-Хиллз", ['CHIL'] = "Вайнвуд-Хиллз", ['CHU'] = "Чумаш", ['CMSW'] = "Заповедник Горы Чилиад", ['CYPRE'] = "Сайпресс-Флэтс", ['DAVIS'] = "Дэвис", ['DELBE'] = "Дель-Перро-Бич", ['DELPE'] = "Дель-Перро", ['DELSOL'] = "Ла-Пуэрта", ['DESRT'] = "Пустыня Гранд-Сенора", ['DOWNT'] = "Центр", ['DTVINE'] = "Центр Вайнвуд", ['EAST_V'] = "Западный Вайнвуд", ['EBURO'] = "Эль-Бурро-Хайтс", ['ELGORL'] = "Маяк Эль-Гордо", ['ELYSIAN'] = "Элизиан-Айленд", ['GALFISH'] = "Галилео", ['GOLF'] = "Гольф-Клуб", ['GRAPES'] = "Грейпсид", ['GREATC'] = "Грейт-Чапаррал", ['HARMO'] = "Хармони", ['HAWICK'] = "Хавик", ['HORS'] = "Гоночная трасса Вайнвуда", ['HUMLAB'] = "Лаборатория Humane Labs and Research", ['JAIL'] = "Тюрьма Болингброук", ['KOREAT'] = "Маленький Сеул", ['LACT'] = "Лэнд-Экт-Резервуар", ['LAGO'] = "Лаго-Занкудо", ['LDAM'] = "Лэнд-Экт-Дэм", ['LEGSQU'] = "Площадь Легиона", ['LMESA'] = "Ла-Меса", ['LOSPUER'] = "Ла-Пуэрта", ['MIRR'] = "Миррор-Парк", ['MORN'] = "Морнингвуд", ['MOVIE'] = "Киностудия Richards Majestic", ['MTCHIL'] = "Гора Чилиад", ['MTGORDO'] = "Гора Гордо", ['MTJOSE'] = "Гора Джосайя", ['MURRI'] = "Мурьета-Хайтс", ['NCHU'] = "Северный Чумаш", ['NOOSE'] = "Центр Н.У.П.", ['OCEANA'] = "Тихий Океан", ['PALCOV'] = "Бухта Палето", ['PALETO'] = "Палето-Бэй", ['PALFOR'] = "Лес Палето", ['PALHIGH'] = "Нагорья Паламино", ['PALMPOW'] = "Электростанция Палмер-Тэйлор", ['PBLUFF'] = "Пасифик-Блаффс", ['PBOX'] = "Пиллбокс-Хилл", ['PROCOB'] = "Прокопио-Бич", ['RANCHO'] = "Ранчо", ['RGLEN'] = "Ричман-Глен", ['RICHM'] = "Ричман", ['ROCKF'] = "Рокфорд-Хиллз", ['RTRAK'] = "Трасса Redwood Lights", ['SANAND'] = "Сан-Андреас", ['SANCHIA'] = "Сан-Шаньский Горный Хребет", ['SANDY'] = "Сэнди-Шорс", ['SKID'] = "Мишн-Роу", ['SLAB'] = "Стэб-Сити", ['STAD'] = "Арена Maze Bank", ['STRAW'] = "Строберри", ['TATAMO'] = "Татавиамские горы", ['TERMINA'] = "Терминал", ['TEXTI'] = "Текстайл-Сити", ['TONGVAH'] = "Тонгва-Хиллз", ['TONGVAV'] = "Долина Тонгва", ['VCANA'] = "Каналы Веспуччи", ['VESP'] = "Веспуччи", ['VINE'] = "Вайнвуд", ['WINDF'] = "Ветряная Ферма Ron Alternates", ['WVINE'] = "Восточный Вайнвуд", ['ZANCUDO'] = "Река Занкудо", ['ZP_ORT'] = "Порт Южного Лос-Сантоса", ['ZQ_UAR'] = "Дэвис-Кварц" }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local pos = GetEntityCoords(GetPlayerPed(-1))

		if(GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z))then
			if(zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)))then
				drawTxt2(0.015, 0.745, 1.0,1.0,0.4, zones[GetNameOfZone(pos.x, pos.y, pos.z)], 255, 255, 255, 255)
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        lastStreet = GetStreetNameAtCoord(x, y, z)
        lastStreetName = GetStreetNameFromHashKey(lastStreet)


        SetTextFont(6)
        SetTextProportional(1)
        SetTextScale(0.0, 0.48)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")

        if showCompass then
        	compass = getCardinalDirectionFromHeading(GetEntityHeading(GetPlayerPed(-1)))
        	lastStreetName = compass .. " | " .. lastStreetName  -- Example: N | Spanish Ave.
        end

        AddTextComponentString(lastStreetName)
        DrawText(0.015, 0.769)
    end
end)

Citizen.CreateThread(function()
	while true do
		Wait(1)
		timeAndDateString = ""
		
		if displayTime == true then
			CalculateTimeToDisplay()
			timeAndDateString = timeAndDateString .. "Время: " .. hour .. ":" .. minute  -- Example: Time: 00:00
		end
		
                 SetTextFont(6)
                 SetTextProportional(1)
                 SetTextScale(0.0, 0.48)
                 SetTextColour(255, 255, 255, 255)
                 SetTextDropshadow(0, 0, 0, 0, 255)
                 SetTextEdge(1, 0, 0, 0, 255)
                 SetTextDropShadow()
                 SetTextOutline()
                 SetTextEntry("STRING")
		
		AddTextComponentString(timeAndDateString)
		DrawText(0.015, 0.721)
	end
end)


-- Thanks @marxy
function getCardinalDirectionFromHeading(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "С" -- North
    elseif (heading >= 45 and heading < 135) then
        return "В" -- East
    elseif (heading >=135 and heading < 225) then
        return "Ю" -- South
    elseif (heading >= 225 and heading < 315) then
        return "З" -- West
    end
end

function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end
