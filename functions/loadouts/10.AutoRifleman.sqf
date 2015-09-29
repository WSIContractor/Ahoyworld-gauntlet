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
player addItemToUniform "ACE_IR_Strobe_Item";
for "_i" from 1 to 2 do {player addItemToUniform "RH_15Rnd_45cal_fnp";};
player addVest "rhsusf_iotv_ocp_SAW";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
player addItemToVest "SmokeShell";
player addItemToVest "SmokeShellBlue";
player addItemToVest "ACE_HandFlare_White";
player addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";
player addItemToVest "ACE_SpareBarrel";
player addBackpack "rhsusf_assault_eagleaiii_ocp";
player addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";
for "_i" from 1 to 2 do {player addItemToBackpack "rhsusf_200Rnd_556x45_soft_pouch";};
player addHeadgear "rhsusf_ach_helmet_camo_ocp";

player addWeapon "rhs_weap_m249_pip";
player addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
player addPrimaryWeaponItem "FHQ_optic_HWS";
player addWeapon "RH_fnp45t";
player addHandgunItem "RH_X300";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "tf_microdagr";
player linkItem "tf_rf7800str";
player linkItem "ACE_NVG_Gen4";