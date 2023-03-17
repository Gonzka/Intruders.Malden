/*
    Author:	Gonzka

    Local function when a generator is activated
*/

private _generator = getPos player nearestObject "Land_TransferSwitch_01_F";
 
if (_generator in repairedGenerators || endgameActivated) exitWith {
	["STR_GAME_Error", "STR_GAME_GenAlreadyActive", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

repairedGenerators pushBackUnique _generator; publicVariable "repairedGenerators";

_generator animateSource ["switchPosition",-1];
_generator animateSource ["switchLight",1];
_generator setObjectTextureGlobal [1, "#(argb,8,8,3)color(0,1,0,1,ca)"];

private _switchLightRange = switch (worldName) do {
	case "Tanoa": {7};
	case "Malden": {31};
	case "Altis": {28};
	case default {10};
};
{[_x, "ON"] remoteExec ["switchLight",0,true]} forEach (nearestObjects [_generator, [], _switchLightRange]);
	
playSound3D [selectRandom ["a3\missions_f_exp\data\sounds\exp_m07_lightson_01.wss", "a3\missions_f_exp\data\sounds\exp_m07_lightson_02.wss", "a3\missions_f_exp\data\sounds\exp_m07_lightson_03.wss"], _generator, false, getPosASL _generator, 3];
createSoundSource ["powergenerator", position _generator, [], 0];

[_generator,"\intruders_mod\textures\gui\hud_generator.paa","",[0,1,0,1]] remoteExec ["gonzka_fnc_auraNotification", [0, -2] select isDedicated];

if (count repairedGenerators isEqualTo totalGenerators) then {
	[] remoteExec ["gonzka_fnc_initEndgame", [0, -2] select isDedicated];
	endgameActivated = true; publicVariable "endgameActivated"; //Players who join now will not add another generator.
	
	if (worldName isEqualTo "Tanoa") then {
		[lighthouse2, "ON"] remoteExec ["switchLight",0,true]; //Activates Lighthouse
	};
};

//PERKS
[] remoteExec ["gonzka_fnc_darkSense",civilian];
[] remoteExec ["gonzka_fnc_dejaVu",civilian];
[_generator] remoteExecCall ["gonzka_fnc_bitterMurmur",east];

//QUEST
quest_generators = quest_generators + 1;
if (inTerrorRadius) then {
	quest_terrorGenerators = quest_terrorGenerators + 1;
};

//SPECIAL THINGS AND LIGHTS
if (worldName isEqualTo "Tanoa") then {
	if (_generator isEqualTo genericGen_3) then {
		[ewok, ["ewok_long", 100]] remoteExecCall ["say3D"];
	};
	if (_generator isEqualTo genericGen_7) then {
		{
			[_x, "ON"] remoteExec ["switchLight",0,true]; 
		} forEach [gen7_light1, gen7_light2, gen7_light3, gen7_light4, gen7_light5]; //Bojen
	};
};