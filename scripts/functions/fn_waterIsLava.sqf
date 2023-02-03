/*
    Author:	Gonzka
	
	Kills survivors who go into the water.
*/

if (worldName isNotEqualTo "Tanoa") exitWith {};

waitUntil {surfaceIsWater position player && getPosASLW player select 2 <= 0}; //Warning
["STR_GAME_WaterIsLava", "STR_GAME_FurtherIntoWater", 10, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;

waitUntil {surfaceIsWater position player && getPosASLW player select 2 < -1.5}; //Kill
player setDamage 1;