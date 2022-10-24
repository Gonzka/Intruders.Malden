/*
    Author:	Gonzka

    Saves the clothes of the player
*/

private _return = [];

_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack face player;

private _gearVar = format ["intruders_gear_%1",if (playerSide isEqualTo east) then {player getVariable "killer"} else {"survivor"}];
profileNamespace setVariable [_gearVar, _return];
saveProfileNamespace;