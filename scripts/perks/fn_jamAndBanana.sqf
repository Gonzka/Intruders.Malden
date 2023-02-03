/*
    Author:	Gonzka

    Definitely not a copy of Barbeque and Chili
*/

if !("jamAndBanana" in (player getVariable "intruders_activePerks")) exitWith {};

private _intruderRevealed = false;
	
{
	if (_x distance player > 40) then {
		[_x,"","",[1,1,1,1],4,false] spawn gonzka_fnc_auraNotification;
		_intruderRevealed = true;
	};
} forEach playableUnits - [player];

if (_intruderRevealed) then {
	playSound "Orange_Timeline_FadeOut";
};