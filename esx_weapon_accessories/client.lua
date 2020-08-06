local ESX = nil
-- ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('WeaponAcc:Add')
AddEventHandler('WeaponAcc:Add', function()
    TriggerEvent('esx_inventoryhud:closeInventory')
    ESX.UI.Menu.CloseAll()
    Wait(100)
    mainMenu:Visible(not mainMenu:Visible())
end)

RegisterNetEvent('WeaponAcc:Remove')
AddEventHandler('WeaponAcc:Remove', function()
    TriggerEvent('esx_inventoryhud:closeInventory')
    ESX.UI.Menu.CloseAll()
    Wait(100)
    removeMenu:Visible(not removeMenu:Visible())
end)

RegisterNetEvent('WeaponAcc:Skin')
AddEventHandler('WeaponAcc:Skin', function()
    TriggerEvent('esx_inventoryhud:closeInventory')
    ESX.UI.Menu.CloseAll()
    Wait(100)
    skinMenu:Visible(not skinMenu:Visible())
end)

RegisterNetEvent('WeaponAcc:Color')
AddEventHandler('WeaponAcc:Color', function()
    TriggerEvent('esx_inventoryhud:closeInventory')
    ESX.UI.Menu.CloseAll()
    Wait(100)
    colorMenu:Visible(not colorMenu:Visible())
end)

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("武器改裝", "~b~自定義你的武器", 1450, 100)
clipmenu = _menuPool:AddSubMenu(mainMenu, "彈匣樣式", "~g~多款~s~樣式等待你的組裝", 1450, 100)
scopemenu = _menuPool:AddSubMenu(mainMenu, "瞄準鏡樣式", "~g~多款~s~樣式等待你的組裝", 1450, 100)

removeMenu = NativeUI.CreateMenu("武器改裝移除", "~b~移除你的武器改裝", 1450, 100)
Rclipmenu = _menuPool:AddSubMenu(removeMenu, "彈匣樣式", "~r~移除~s~你的武器改裝", 1450, 100)
Rscopemenu = _menuPool:AddSubMenu(removeMenu, "瞄準鏡樣式", "~r~移除~s~你的武器改裝", 1450, 100)

skinMenu = NativeUI.CreateMenu("武器塗裝", "~b~自定義你的武器塗裝", 1450, 100)

colorMenu = NativeUI.CreateMenu("武器顏色", "~b~自定義你的武器外觀顏色", 1450, 100)

_menuPool:Add(mainMenu)
_menuPool:Add(removeMenu)
_menuPool:Add(skinMenu)
_menuPool:Add(colorMenu)

_menuPool:ControlDisablingEnabled(false)
_menuPool:MouseControlsEnabled(false)

-- [[   ACCESSORIES    ]]
function SetWeaponClip(menu) 
    local clip = NativeUI.CreateItem("預設彈匣", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local clip1 = NativeUI.CreateItem("擴充彈匣", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local clip2 = NativeUI.CreateItem("曳光彈匣", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local clip3 = NativeUI.CreateItem("燃燒彈匣", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local clip4 = NativeUI.CreateItem("穿甲彈匣", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local clip5 = NativeUI.CreateItem("金屬彈匣", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    clipmenu:AddItem(clip)
    clipmenu:AddItem(clip1)
    clipmenu:AddItem(clip2)
    clipmenu:AddItem(clip3)
    clipmenu:AddItem(clip4)
    clipmenu:AddItem(clip5)
    clipmenu.OnItemSelect = function(sender, item, index)
        if item == clip then
            SetWeaponClips('clip')
        elseif item == clip1 then
            SetWeaponClips('clip1')
        elseif item == clip2 then
            SetWeaponClips('clip2')
        elseif item == clip3 then
            SetWeaponClips('clip3')
        elseif item == clip4 then
            SetWeaponClips('clip4')
        elseif item == clip5 then
            SetWeaponClips('clip5')
        end
    end
end

function SetWeaponScope(menu)
    local scope = NativeUI.CreateItem("放大瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local scope1 = NativeUI.CreateItem("高級瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local scope2 = NativeUI.CreateItem("夜視鏡瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local scope3 = NativeUI.CreateItem("熱感應瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    scopemenu:AddItem(scope)
    scopemenu:AddItem(scope1)
    scopemenu:AddItem(scope2)
    scopemenu:AddItem(scope3)
    scopemenu.OnItemSelect = function(sender, item, index)
        if item == scope then
            SetWeaponScopes('scope')
        elseif item == scope1 then
            SetWeaponScopes('scope1')
        elseif item == scope2 then
            SetWeaponScopes('scope2')
        elseif item == scope3 then
            SetWeaponScopes('scope3')
        end
    end
end

function SetWeaponOther(menu)
    local suppressor = NativeUI.CreateItem("滅音管", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local light = NativeUI.CreateItem("手電筒", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local grip = NativeUI.CreateItem("握把", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    menu:AddItem(suppressor)
    menu:AddItem(light)
    menu:AddItem(grip)
    menu.OnItemSelect = function(sender, item, index)
        if item == suppressor then
            SetWeaponSuppressor()
        elseif item == light then
            SetWeaponLight()
        elseif item == grip then
            SetWeaponGrip()
        end
    end
end 

-- [[   REMOVE ACCESSORIES    ]]
function RemoveWeaponClip(menu) 
    local clip = NativeUI.CreateItem("預設彈匣", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local clip1 = NativeUI.CreateItem("擴充彈匣", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local clip2 = NativeUI.CreateItem("曳光彈匣", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local clip3 = NativeUI.CreateItem("燃燒彈匣", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local clip4 = NativeUI.CreateItem("穿甲彈匣", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local clip5 = NativeUI.CreateItem("金屬彈匣", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    Rclipmenu:AddItem(clip)
    Rclipmenu:AddItem(clip1)
    Rclipmenu:AddItem(clip2)
    Rclipmenu:AddItem(clip3)
    Rclipmenu:AddItem(clip4)
    Rclipmenu:AddItem(clip5)
    Rclipmenu.OnItemSelect = function(sender, item, index)
        if item == clip then
            RemoveWeaponClips('clip')
        elseif item == clip1 then
            RemoveWeaponClips('clip1')
        elseif item == clip2 then
            RemoveWeaponClips('clip2')
        elseif item == clip3 then
            RemoveWeaponClips('clip3')
        elseif item == clip4 then
            RemoveWeaponClips('clip4')
        elseif item == clip5 then
            RemoveWeaponClips('clip5')
        end
    end
end

function RemoveWeaponScope(menu)
    local scope = NativeUI.CreateItem("放大瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local scope1 = NativeUI.CreateItem("高級瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local scope2 = NativeUI.CreateItem("夜視鏡瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local scope3 = NativeUI.CreateItem("熱感應瞄準鏡", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    Rscopemenu:AddItem(scope)
    Rscopemenu:AddItem(scope1)
    Rscopemenu:AddItem(scope2)
    Rscopemenu:AddItem(scope3)
    Rscopemenu.OnItemSelect = function(sender, item, index)
        if item == scope then
            RemoveWeaponScopes('scope')
        elseif item == scope1 then
            RemoveWeaponScopes('scope1')
        elseif item == scope2 then
            RemoveWeaponScopes('scope2')
        elseif item == scope3 then
            RemoveWeaponScopes('scope3')
        end
    end
end

function RemoveWeaponOther(menu)
    local suppressor = NativeUI.CreateItem("滅音管", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local light = NativeUI.CreateItem("手電筒", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    local grip = NativeUI.CreateItem("握把", "會因為~g~槍枝~s~的不同而有~r~無法拆裝~s~的現象")
    removeMenu:AddItem(suppressor)
    removeMenu:AddItem(light)
    removeMenu:AddItem(grip)
    removeMenu.OnItemSelect = function(sender, item, index)
        if item == suppressor then
            RemoveWeaponSuppressor()
        elseif item == light then
            RemoveWeaponLight()
        elseif item == grip then
            RemoveWeaponGrip()
        end
    end
end 

-- [[   SKIN    ]]
function SetWeaponSkin(menu)
    local skin = NativeUI.CreateItem("數位迷彩/普通塗裝", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin1 = NativeUI.CreateItem("一筆迷彩", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin2 = NativeUI.CreateItem("林地迷彩", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin3 = NativeUI.CreateItem("骷髏頭", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin4 = NativeUI.CreateItem("塞森塔·諾夫", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin5 = NativeUI.CreateItem("英仙座", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin6 = NativeUI.CreateItem("豹紋", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin7 = NativeUI.CreateItem("斑馬", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin8 = NativeUI.CreateItem("幾何", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    local skin9 = NativeUI.CreateItem("BOOM", "會因為~g~槍枝~s~的不同而有~r~無法安裝~s~的現象")
    menu:AddItem(skin)
    menu:AddItem(skin1)
    menu:AddItem(skin2)
    menu:AddItem(skin3)
    menu:AddItem(skin4)
    menu:AddItem(skin5)
    menu:AddItem(skin6)
    menu:AddItem(skin7)
    menu:AddItem(skin8)
    menu:AddItem(skin9)
    menu.OnItemSelect = function(sender, item, index)
        if item == skin then
            SetWeaponSkins('skin')
        elseif item == skin1 then
            SetWeaponSkins('skin1')
        elseif item == skin2 then
            SetWeaponSkins('skin2')
        elseif item == skin3 then
            SetWeaponSkins('skin3')
        elseif item == skin4 then
            SetWeaponSkins('skin4')
        elseif item == skin5 then
            SetWeaponSkins('skin5')
        elseif item == skin6 then
            SetWeaponSkins('skin6')
        elseif item == skin7 then
            SetWeaponSkins('skin7')
        elseif item == skin8 then
            SetWeaponSkins('skin8')
        elseif item == skin9 then
            SetWeaponSkins('skin9')
        end
    end
end

-- [[   COLOR    ]]
function SetWeaponColor(menu)
    local color = NativeUI.CreateItem("黑色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    local color1 = NativeUI.CreateItem("綠色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    local color2 = NativeUI.CreateItem("金色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    local color3 = NativeUI.CreateItem("粉紅色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    local color4 = NativeUI.CreateItem("部隊色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    local color5 = NativeUI.CreateItem("警用色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    local color6 = NativeUI.CreateItem("橘色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    local color7 = NativeUI.CreateItem("白金色", "會因為~g~槍枝~s~的不同而有~r~不同顏色~s~的現象")
    colorMenu:AddItem(color)
    colorMenu:AddItem(color1)
    colorMenu:AddItem(color2)
    colorMenu:AddItem(color3)
    colorMenu:AddItem(color4)
    colorMenu:AddItem(color5)
    colorMenu:AddItem(color6)
    colorMenu:AddItem(color7)
    colorMenu.OnItemSelect = function(sender, item, index)
        if item == color then
            SetWeaponColors('color')
        elseif item == color1 then
            SetWeaponColors('color1')
        elseif item == color2 then
            SetWeaponColors('color2')
        elseif item == color3 then
            SetWeaponColors('color3')
        elseif item == color4 then
            SetWeaponColors('color4')
        elseif item == color5 then
            SetWeaponColors('color5')
        elseif item == color6 then
            SetWeaponColors('color6')
        elseif item == color7 then
            SetWeaponColors('color7')
        end
    end
end

-- [[   ACCESSORIES    ]]
SetWeaponClip(mainMenu)
SetWeaponScope(mainMenu)
SetWeaponOther(mainMenu)

-- [[   ACCESSORIES    ]]
RemoveWeaponClip(removeMenu)
RemoveWeaponScope(removeMenu)
RemoveWeaponOther(removeMenu)

-- [[   SKIN    ]]
SetWeaponSkin(skinMenu)

-- [[   COLOR   ]]
SetWeaponColor(colorMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		_menuPool:ProcessMenus()
	end
end)

-- [[   ACCESSORIES    ]]
function SetWeaponClips(type)
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    if type == 'clip' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_APPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL50', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_NAVYREVOLVER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NAVYREVOLVER"), GetHashKey("COMPONENT_REVOLVER_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_NAVYREVOLVER', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_VINTAGEPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_CERAMICPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CERAMICPISTOL"), GetHashKey("COMPONENT_CERAMICPISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CERAMICPISTOL', 'clip_default')

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MICROSMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_ASSAULTSMG_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_MINISMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG"), GetHashKey("COMPONENT_MINISMG_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MINISMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPDW', 'clip_default')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'clip_default')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMPACTRIFLE', 'clip_default')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_MG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_MG_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_COMBATMG_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_GUSENBERG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG"), GetHashKey("COMPONENT_GUSENBERG_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_GUSENBERG', 'clip_default')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_SNIPERRIFLE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), GetHashKey("COMPONENT_HEAVYSNIPER_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'clip_default')
        
        -- 重型武器
        elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_GRENADELAUNCHER_CLIP_01"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'clip_default')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'clip1' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_APPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL50', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_VINTAGEPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_CERAMICPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CERAMICPISTOL"), GetHashKey("COMPONENT_CERAMICPISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CERAMICPISTOL', 'clip_extended')

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MICROSMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_MINISMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG"), GetHashKey("COMPONENT_MINISMG_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MINISMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPDW', 'clip_extended')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'clip_extended')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMPACTRIFLE', 'clip_extended')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_MG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_MG_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_COMBATMG_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_GUSENBERG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG"), GetHashKey("COMPONENT_GUSENBERG_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_GUSENBERG', 'clip_extended')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'clip_extended')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end        
    elseif type == 'clip2' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_tracer')

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPDW', 'clip_tracer')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'clip_tracer')
                
        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMPACTRIFLE', 'clip_tracer')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_tracer')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end        
    elseif type == 'clip3' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_incendiary')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_incendiary')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_incendiary')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_incendiary')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_incendiary')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_incendiary')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'clip4' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_hollowpoint')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_hollowpoint')
             
        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_hollowpoint')
        
        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_hollowpoint') 

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_hollowpoint')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then 
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_hollowpoint')
        
        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end       
    elseif type == 'clip5' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_fmj')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_fmj')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2','clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_fmj')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_fmj')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_fmj')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    end
end

function SetWeaponSuppressor()
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    --手槍
    if WeaponHash == GetHashKey("WEAPON_PISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_APPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL50', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_VINTAGEPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_CERAMICPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CERAMICPISTOL"), GetHashKey("COMPONENT_CERAMICPISTOL_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CERAMICPISTOL', 'suppressor')
    
    -- 衝鋒槍
    elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MICROSMG', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SMG") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSMG', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'suppressor')

    -- 散彈槍
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'suppressor')
    elseif WeaponHash == GetHashKey("weapon_bullpupshotgun") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_bullpupshotgun"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'weapon_bullpupshotgun', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'suppressor')

    -- 步槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'suppressor')

    -- 狙擊槍
    elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'suppressor')

    else
        TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
    end       
end

function SetWeaponScopes(type)
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    if type == 'scope' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_RAIL_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_RAIL"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'scope')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MICROSMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPDW', 'scope')
        
        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'scope')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'scope')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_MG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
            TriggerServerEvent('SetWeaponToSQL',  'WEAPON_COMBATMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'scope')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_LARGE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), GetHashKey("COMPONENT_AT_SCOPE_LARGE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_LARGE_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'scope')

        -- 重型武器
        elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'COMPONENT_AT_SCOPE_SMALL')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end      
    elseif type == 'scope1' then
        -- 衝鋒槍
        if WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_SMG_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'scope_advanced')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'scope_advanced')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'scope_advanced')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'scope_advanced')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope_advanced')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'scope2' then
        -- 狙擊槍
        if WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_NV"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope_nv')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'scope3' then
        -- 狙擊槍
        if WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_THERMAL"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope_thermal')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    end
end

function SetWeaponLight()
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    -- 手槍
    if WeaponHash == GetHashKey("WEAPON_PISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_APPISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL50', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'flashlight')
    
    -- 衝鋒槍
    elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MICROSMG', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SMG") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSMG', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPDW', 'flashlight')

    -- 散彈槍
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'flashlight')
    elseif WeaponHash == GetHashKey("weapon_bullpupshotgun") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_bullpupshotgun"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'weapon_bullpupshotgun', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'flashlight')

    -- 步槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'flashlight')

    -- 重型武器
    elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'flashlight')

    else
        TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
    end    
end

function SetWeaponGrip()
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    -- 衝鋒槍
    if WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPDW', 'grip')

    -- 散彈槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'grip')
    elseif WeaponHash == GetHashKey("weapon_bullpupshotgun") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("weapon_bullpupshotgun"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'weapon_bullpupshotgun', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'grip')

    -- 步槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'grip')

    -- 機關槍
    elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'grip')

    -- 狙擊槍
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'grip')

    -- 重型武器
    elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'grip')

    else
        TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
    end   
end

-- [[   REMOVE ACCESSORIES    ]]
function RemoveWeaponClips(type)
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    if type == 'clip' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_PISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_APPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL50', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_NAVYREVOLVER") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_NAVYREVOLVER"), GetHashKey("COMPONENT_REVOLVER_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_NAVYREVOLVER', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_VINTAGEPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_CERAMICPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CERAMICPISTOL"), GetHashKey("COMPONENT_CERAMICPISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CERAMICPISTOL', 'clip_default')

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MICROSMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_ASSAULTSMG_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_MINISMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG"), GetHashKey("COMPONENT_MINISMG_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MINISMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPDW', 'clip_default')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'clip_default')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMPACTRIFLE', 'clip_default')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_MG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_MG_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_COMBATMG_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_GUSENBERG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG"), GetHashKey("COMPONENT_GUSENBERG_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_GUSENBERG', 'clip_default')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_SNIPERRIFLE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), GetHashKey("COMPONENT_HEAVYSNIPER_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_default')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'clip_default')
        
        -- 重型武器
        elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_GRENADELAUNCHER_CLIP_01"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'clip_default')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'clip1' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_PISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_APPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL50', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_VINTAGEPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_CERAMICPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CERAMICPISTOL"), GetHashKey("COMPONENT_CERAMICPISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CERAMICPISTOL', 'clip_extended')

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MICROSMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_ASSAULTSMG_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_MINISMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MINISMG"), GetHashKey("COMPONENT_MINISMG_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MINISMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPDW', 'clip_extended')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_ASSAULTSHOTGUN_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'clip_extended')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_BULLPUPRIFLE_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMPACTRIFLE', 'clip_extended')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_MG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_MG_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_COMBATMG_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_GUSENBERG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GUSENBERG"), GetHashKey("COMPONENT_GUSENBERG_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_GUSENBERG', 'clip_extended')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_extended')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_MARKSMANRIFLE_CLIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'clip_extended')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end        
    elseif type == 'clip2' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_tracer')

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_MACHINEPISTOL_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_COMBATPDW_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPDW', 'clip_tracer')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_HEAVYSHOTGUN_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'clip_tracer')
                
        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMPACTRIFLE', 'clip_tracer')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_tracer')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_tracer')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_tracer')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end        
    elseif type == 'clip3' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_incendiary')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_incendiary')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_incendiary')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_incendiary')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_incendiary')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_incendiary')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_incendiary')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'clip4' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_hollowpoint')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_hollowpoint')
             
        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'clip_hollowpoint')
        
        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_hollowpoint') 

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_hollowpoint')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_hollowpoint')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then 
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_hollowpoint')
        
        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end       
    elseif type == 'clip5' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'clip_fmj')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'clip_fmj')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2','clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'clip_fmj')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'clip_fmj')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'clip_fmj')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'clip_fmj')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    end
end

function RemoveWeaponSuppressor()
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    --手槍
    if WeaponHash == GetHashKey("WEAPON_PISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_APPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL50', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_VINTAGEPISTOL', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_CERAMICPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CERAMICPISTOL"), GetHashKey("COMPONENT_CERAMICPISTOL_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CERAMICPISTOL', 'COMPONENT_CERAMICPISTOL_SUPP')
    
    -- 衝鋒槍
    elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MICROSMG', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SMG") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSMG', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MACHINEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MACHINEPISTOL', 'suppressor')

    -- 散彈槍
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'suppressor')
    elseif WeaponHash == GetHashKey("weapon_bullpupshotgun") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("weapon_bullpupshotgun"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'weapon_bullpupshotgun', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'suppressor')

    -- 步槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'suppressor')

    -- 狙擊槍
    elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SR_SUPP_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'suppressor')
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'suppressor')

    else
        TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
    end        
end

function RemoveWeaponScopes(type)
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    if type == 'scope' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_RAIL_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_RAIL"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'scope')
        
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MICROSMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPDW', 'scope')
        
        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'scope')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_02_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MACRO_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'scope')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_MG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
            TriggerServerEvent('RemoveWeaponToSQL',  'WEAPON_COMBATMG', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'scope')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_LARGE"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), GetHashKey("COMPONENT_AT_SCOPE_LARGE"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_LARGE_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'scope')

        -- 重型武器
        elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'scope')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end      
    elseif type == 'scope1' then
        -- 衝鋒槍
        if WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_SMG_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'scope_advanced')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'scope_advanced')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'scope_advanced')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'scope_advanced')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'scope_advanced')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_MAX"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope_advanced')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'scope2' then
        -- 狙擊槍
        if WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_NV"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope_nv')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    elseif type == 'scope3' then
        -- 狙擊槍
        if WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_AT_SCOPE_THERMAL"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'scope_thermal')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
        end
    end
end

function RemoveWeaponLight()
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    -- 手槍
    if WeaponHash == GetHashKey("WEAPON_PISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_APPISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL50', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_03"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PISTOL_MK2', 'flashlight')
    
    -- 衝鋒槍
    elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MICROSMG', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SMG") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSMG', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SMG_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPDW', 'flashlight')

    -- 散彈槍
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'flashlight')
    elseif WeaponHash == GetHashKey("weapon_bullpupshotgun") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("weapon_bullpupshotgun"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'weapon_bullpupshotgun', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'flashlight')

    -- 步槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'flashlight')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'flashlight')

    -- 重型武器
    elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_AT_AR_FLSH"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'flashlight')

    else
        TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
    end
end

function RemoveWeaponGrip()
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    -- 衝鋒槍
    if WeaponHash == GetHashKey("WEAPON_COMBATPDW") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATPDW', 'grip')

    -- 散彈槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTSHOTGUN', 'grip')
    elseif WeaponHash == GetHashKey("weapon_bullpupshotgun") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("weapon_bullpupshotgun"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'weapon_bullpupshotgun', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_HEAVYSHOTGUN', 'grip')

    -- 步槍
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'grip')

    -- 機關槍
    elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'grip')

    -- 狙擊槍
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'grip')
    elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'grip')

    -- 重型武器
    elseif WeaponHash == GetHashKey("WEAPON_GRENADELAUNCHER") then
        RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_GRENADELAUNCHER"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))
            TriggerServerEvent('RemoveWeaponToSQL', 'WEAPON_GRENADELAUNCHER', 'grip')

    else
        TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此改裝')
    end   
end

-- [[   SKIN    ]]
function SetWeaponSkins(type)
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    if type == 'skin' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATPISTOL', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_APPISTOL', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL50', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_VARMOD_LOWRIDER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYPISTOL', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_REVOLVER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER"), GetHashKey("COMPONENT_REVOLVER_VARMOD_BOSS"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish')

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MICROSMG', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTSMG', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_SAWNOFFSHOTGUN") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SAWNOFFSHOTGUN"), GetHashKey("COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SAWNOFFSHOTGUN', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE', 'luxary_finish')    
        elseif WeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ADVANCEDRIFLE', 'luxary_finish')   
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE', 'luxary_finish')     
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_BULLPUPRIFLE_VARMOD_LOW"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE', 'luxary_finish')   
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish')     
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish')     
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish')     
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish')     

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_MG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MG"), GetHashKey("COMPONENT_MG_VARMOD_LOWRIDER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MG', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG"), GetHashKey("COMPONENT_COMBATMG_VARMOD_LOWRIDER"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_SNIPERRIFLE_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNIPERRIFLE', 'luxary_finish')
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish')    
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish')   
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_MARKSMANRIFLE_VARMOD_LUXE"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE', 'luxary_finish')   

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin1' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER"), GetHashKey("COMPONENT_REVOLVER_VARMOD_GOON"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER', 'luxary_finish_2') 
        elseif WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_2') 
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_2') 
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_2') 

        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_2') 

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_2') 

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_02"))     
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_2') 
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_02"))    
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_2')  
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_02"))     
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_2') 
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_02"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_2') 

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_02"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_2') 

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_02"))   
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_2')  
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_02"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_2') 

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin2' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_3') 
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_3') 
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_3') 
            
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_3') 

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_3') 

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_03"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_3')    
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_03"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_3')    
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_03"))     
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_3') 
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_03"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_3') 

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_03"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_3') 

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_03"))    
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_3') 
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_03"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_3') 

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin3' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_04"))
            
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_5') 
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_04"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_4') 
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_04"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_4') 
            
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_04"))      
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_4')   

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_04"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_4') 

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_04"))   
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_4')   
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_04"))     
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_4') 
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_04"))     
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_4') 
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_04"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_4') 

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_04"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_4') 

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_04"))    
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_4') 
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_04"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_4') 

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin4' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_05"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_5') 
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_05"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_5') 
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_05"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_5') 
    
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_05"))   
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_5')      

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_05"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_5') 

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_05"))   
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_5')   
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_05"))     
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_5') 
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_05"))     
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_5') 
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_05"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_5') 

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_05"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_5') 

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_05"))    
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_5') 
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_05"))  
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_5') 

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin5' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_6')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_6')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_6')
    
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_6')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_6')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_6')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_6')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_6')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_6')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_6')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_6')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_06"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_6')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin6' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_7')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_7')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_7')
    
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_7')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_7')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_7')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_7')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_7')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_7')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_7')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_7')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_07"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_7')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin7' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_8')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_8')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_8')
    
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_8')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_8')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_8')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_8')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_8')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_8')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_8')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_8')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_08"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_8')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin8' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_9')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_9')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_9')
    
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_9')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_9')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_9')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_9')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_9')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_9')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_9')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_9')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_09"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_9')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    elseif type == 'skin9' then
        -- 手槍
        if WeaponHash == GetHashKey("WEAPON_REVOLVER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_REVOLVER_MK2"), GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_REVOLVER_MK2', 'luxary_finish_10')
        elseif WeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SNSPISTOL_MK2', 'luxary_finish_10')
        elseif WeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PISTOL_MK2', 'luxary_finish_10')
    
        -- 衝鋒槍
        elseif WeaponHash == GetHashKey("WEAPON_SMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SMG_MK2', 'luxary_finish_10')

        -- 散彈槍
        elseif WeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), GetHashKey("COMPONENT_PUMPSHOTGUN_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_PUMPSHOTGUN_MK2', 'luxary_finish_10')

        -- 步槍
        elseif WeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_BULLPUPRIFLE_MK2', 'luxary_finish_10')
        elseif WeaponHash == GetHashKey("WEAPON_SPECIALCARBINE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE_MK2"), GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_SPECIALCARBINE_MK2', 'luxary_finish_10')
        elseif WeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_ASSAULTRIFLE_MK2', 'luxary_finish_10')
        elseif WeaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE_MK2"), GetHashKey("COMPONENT_CARBINERIFLE_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_CARBINERIFLE_MK2', 'luxary_finish_10')

        -- 機關槍
        elseif WeaponHash == GetHashKey("WEAPON_COMBATMG_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATMG_MK2"), GetHashKey("COMPONENT_COMBATMG_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_COMBATMG_MK2', 'luxary_finish_10')

        -- 狙擊槍
        elseif WeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE_MK2"), GetHashKey("COMPONENT_MARKSMANRIFLE_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_MARKSMANRIFLE_MK2', 'luxary_finish_10')
        elseif WeaponHash == GetHashKey("WEAPON_HEAVYSNIPER_MK2") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSNIPER_MK2"), GetHashKey("COMPONENT_HEAVYSNIPER_MK2_CAMO_10"))
            TriggerServerEvent('SetWeaponToSQL', 'WEAPON_HEAVYSNIPER_MK2', 'luxary_finish_10')

        else
            TriggerEvent('showNotification', '你必須~g~手持~s~武器或武器~r~不支援~s~此塗裝')
        end
    end
end

-- [[   COLOR   ]]
function SetWeaponColors(type)
    local WeaponHash = GetSelectedPedWeapon(PlayerPedId())
    if type == 'color' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 0)  
    elseif type == 'color1' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 1)  
    elseif type == 'color2' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 2)  
    elseif type == 'color3' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 3)  
    elseif type == 'color4' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 4)  
    elseif type == 'color5' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 5)  
    elseif type == 'color6' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 6)  
    elseif type == 'color7' then
        SetPedWeaponTintIndex(GetPlayerPed(-1), WeaponHash, 7)  
    end
end
