/*
    Author:	Gonzka

    The ambient music changes within the killer's terorr radius
*/

if (playerSide isEqualTo east) exitWith {};

private _music = false;

while {sleep 1; alive player} do {
	if (inTerrorRadius && !_music) then {
		playMusic selectRandom ["terrorMusic_1", "terrorMusic_2"];
		0 fadeMusic 0.5;
		_music = true;
	};
	if !(inTerrorRadius) then {
		_music = false;
		2 fadeMusic 0;
		sleep 2;
	};
};