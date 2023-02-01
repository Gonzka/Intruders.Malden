/*
    Author:	Gonzka

    Adds an item to a permanent saved profilenamespace inventory
*/

params [
    ["_item", "", [""]]
];

if (_item isEqualTo "") exitWith {};
if !(isClass (missionConfigFile >> "VirtualItems" >> _item)) exitWith {};

private _globalInventory = profileNamespace getVariable "intruders_perkInventory";
private _icon = getText (missionConfigFile >> "VirtualItems" >> _item >> "icon");
private _displayName = getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");

_globalInventory pushBackUnique _item;

private _notificationText = if (_item find "skin_" != -1) then {"STR_GAME_SkinUnlocked"} else {"STR_GAME_PerkUnlocked"};
[_notificationText, localize _displayName, 5, _icon] spawn gonzka_fnc_notification;

profileNamespace setVariable ["intruders_perkInventory",_globalInventory];
saveProfileNamespace;

playSound "Orange_Timeline_FadeIn";