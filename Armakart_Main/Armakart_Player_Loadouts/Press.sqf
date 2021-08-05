comment "Exported from Arsenal by Njpatman";
comment "[!] UNIT MUST BE LOCAL [!]";
if (!local player) exitWith {};
comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;
comment "Add containers";
player forceAddUniform "U_C_Journalist";
player addVest "V_Press_F";
comment "Add items to containers";
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToVest "ACE_personalAidKit";
for "_i" from 1 to 6 do {player addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 6 do {player addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 4 do {player addItemToVest "ACE_tourniquet";};
player addHeadgear "H_Cap_blu";
comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";