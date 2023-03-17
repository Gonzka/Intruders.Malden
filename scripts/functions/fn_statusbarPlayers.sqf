/*
    Author:	Gonzka

    Statusbar HUD
*/

params ["_player","_pic","_name"];

_pic ctrlSetText "\intruders_mod\textures\gui\hud_survivor.paa";
_name ctrlSetText name _player;	

if !(alive _player) then {
	_pic ctrlSetText "\intruders_mod\textures\gui\hud_dead.paa";
};

if (damage _player > 0 && damage _player != 1) then {
	_pic ctrlSetText "\intruders_mod\textures\gui\hud_injured.paa";
};

if (str attachedObjects _player find "beartrap" != -1) then {
	_pic ctrlSetText "\intruders_mod\textures\gui\hud_trapped.paa";
};

if (_player getVariable ["BIS_revive_incapacitated", false] || lifeState _player isEqualTo "INCAPACITATED") then {
	_pic ctrlSetText "\intruders_mod\textures\gui\hud_incapacitated.paa";
};

if (_player in escapeVehicle_1 || _player in escapeVehicle_2) then {
	_pic ctrlSetText "\intruders_mod\textures\gui\hud_escape.paa";
};