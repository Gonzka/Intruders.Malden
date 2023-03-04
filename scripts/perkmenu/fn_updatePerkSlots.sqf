/*
    Author:	Gonzka

    Updates the the perk icon and the tooltip
*/

disableSerialization;

private _display = findDisplay 9999;

//UPDATE ICON
private _perkVar = format ["intruders_activePerks_%1",if (playerSide isEqualTo east) then {"killer"} else {"survivor"}];
private _activePerks = profileNamespace getVariable _perkVar; //["","","",""];

private _perkSlot1 = _display displayCtrl 1502;
_perkSlot1 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerks select 0 >> "icon");
_perkSlot1 ctrlSetTooltip format["%1\n\n%2", toUpper localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 0 >> "displayName"), localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 0 >> "description")];

private _perkSlot2 = _display displayCtrl 1503;
_perkSlot2 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerks select 1 >> "icon");
_perkSlot2 ctrlSetTooltip format["%1\n\n%2", toUpper localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 1 >> "displayName"), localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 1 >> "description")];

private _perkSlot3 = _display displayCtrl 1504;
_perkSlot3 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerks select 2 >> "icon");
_perkSlot3 ctrlSetTooltip format["%1\n\n%2", toUpper localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 2 >> "displayName"), localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 2 >> "description")];

private _perkSlot4 = _display displayCtrl 1505;
_perkSlot4 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerks select 3 >> "icon");
_perkSlot4 ctrlSetTooltip format["%1\n\n%2", toUpper localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 3 >> "displayName"), localize getText (missionConfigFile >> "VirtualItems" >> _activePerks select 3 >> "description")];