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
and cover `es_extended/config_weaponlua` to work
