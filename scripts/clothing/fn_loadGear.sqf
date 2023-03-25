/*
    Author:	Gonzka

    Loads the saved clothes of the player
*/

private _gearVar = format ["intruders_gear_%1",if (playerSide isEqualTo east) then {player getVariable "killer"} else {"survivor"}];
private _gearArray = profileNamespace getVariable _gearVar;
if (isNil {_gearArray}) exitWith {};

removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

_gearArray params [
    "_uniform",
    "_vest",
    "_backpack",
    "_goggles",
    "_headgear",
    "_face"
];

if (!(_goggles isEqualTo "")) then {player addGoggles _goggles};
if (!(_headgear isEqualTo "")) then {player addHeadGear _headgear};
if (!(_uniform isEqualTo "")) then {player forceAddUniform _uniform};
if (!(_vest isEqualTo "")) then {player addVest _vest};
if (!(_backpack isEqualTo "")) then {player addBackpack _backpack};
if (!(_face isEqualTo "") && playerSide isEqualTo civilian) then {player setFace _face; [player, _face] remoteExec ["setFace", -clientOwner, player]};

[] spawn gonzka_fnc_setVoicelines;