/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         24.09.2021
	Description:	 Adds an item (unique) to the global inventory

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_item", "", [""]]
];

if (_item isEqualTo "") exitWith {};
if (!isClass (missionConfigFile >> "VirtualItems" >> _item)) exitWith {};

private _globalInventory = profileNamespace getVariable "intruders_perkInventory";
private _icon = getText (missionConfigFile >> "VirtualItems" >> _item >> "icon");
private _displayName = getText (missionConfigFile >> "VirtualItems" >> _item >> "displayName");

_globalInventory pushBackUnique _item;
["STR_GAME_PerkUnlocked", localize _displayName, 5, _icon] spawn gonzka_fnc_notification;

profileNamespace setVariable ["intruders_perkInventory",_globalInventory];
saveProfileNamespace;

playSound "Orange_Timeline_FadeIn";