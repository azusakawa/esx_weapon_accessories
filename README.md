# esx_weapon_accessories

# Requirement
* ESX Base 1.X
* mysql-async

# Add item in SQL
```
WeaponAcc_Add, 武器改裝包, 10, 0, 1
WeaponAcc_Remove, 武器移除包, 10, 0, 1
WeaponAcc_Skin, 武器塗裝包, 10, 0, 1
WeaponAcc_Color, 武器上色包, 10, 0, 1
```

# How to use it
Download and put in resources, open `server.cfg` add
```
ensure  esx_weapon_accessories
            or
start esx_weapon_accessories
```
and cover `es_extended/config.weaponlua` to work


<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/tw/"><img alt="創用 CC 授權條款" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/3.0/tw/88x31.png" /></a><br />本著作係採用<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/tw/">創用 CC 姓名標示-非商業性-禁止改作 3.0 台灣 授權條款</a>授權.
