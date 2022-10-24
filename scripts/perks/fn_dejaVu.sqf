/*
    Author:	Gonzka

    Déjà Vu Survivor Perk
*/

if !("dejaVu" in (player getVariable "intruders_activePerks")) exitWith {};
if (repairedGenerators isEqualTo totalGenerators) exitWith {};

private _nearestGens = nearestObjects [player, ["Land_TransferSwitch_01_F"], 300];
private _inactiveGens = [];
{
	if !(_x getVariable ["active", false]) then {
		_inactiveGens pushBack _x;
	};
} forEach _nearestGens;

{
	[_x,"textures\gui\hud_generator.paa","",[1,1,1,1],30,false] spawn gonzka_fnc_auraNotification;
} forEach [_inactiveGens select 0, _inactiveGens select 1, _inactiveGens select 2];

playSound "Orange_Timeline_FadeOut";