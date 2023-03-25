/*
    Author:	Gonzka

    Adds an item to a permanent saved profilenamespace inventory
*/

params [
    ["_item", "", [""]]
];

if (_item isEqualTo "") exitWith {};
if !(isClass (missionConfigFile >> "VirtualItems" >> _item)) exitWith {};

private _inventory = profileNamespace getVariable "intruders_perkInventory";
_inventory pushBackUnique _item;
profileNamespace setVariable ["intruders_perkInventory",_inventory];
saveProfileNamespace;

private _displayName = getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");
private _icon = getText (missionConfigFile >> "VirtualItems" >> _item >> "icon");

["STR_GAME_PerkUnlocked", localize _displayName, 5, _icon] spawn gonzka_fnc_notification;
playSound "Orange_Timeline_FadeIn";