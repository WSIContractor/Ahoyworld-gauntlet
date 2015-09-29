removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "rhs_uniform_cu_ocp";
player addItemToUniform "ACE_EarPlugs";
for "_i" from 1 to 5 do {player addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 2 do {player addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 3 do {player addItemToUniform "ACE_morphine";};
player addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_CableTie";};
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_microDAGR";
for "_i" from 1 to 2 do {player addItemToUniform "RH_15Rnd_9x19_M9";};
player addVest "rhsusf_iotv_ocp_Squadleader";
for "_i" from 1 to 6 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";
player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Green";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};

player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellRed";
player addItemToVest "SmokeShellGreen";
player addItemToVest "SmokeShellBlue";
player addItemToVest "SmokeShellPurple";
player addItemToVest "B_IR_Grenade";
player addBackpack "tf_rt1523g_big_rhs";
for "_i" from 1 to 2 do {player addItemToBackpack "Laserbatteries";};
player addHeadgear "rhsusf_patrolcap_ocp";

player addWeapon "rhs_weap_mk18_grip2_KAC";
player addPrimaryWeaponItem "rhsusf_acc_anpeq15";
player addPrimaryWeaponItem "optic_Hamr";
player addWeapon "RH_m9";
player addHandgunItem "RH_X300";
player addWeapon "Laserdesignator";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "tf_anprc152";
player linkItem "ItemGPS";
player linkItem "ACE_NVG_Gen4";
