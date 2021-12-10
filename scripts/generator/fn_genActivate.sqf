/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         12.10.2020
	Description:	 Local function when a generator is activated

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

private _generator = getPos player nearestObject "Land_TransferSwitch_01_F";
 
if (_generator getVariable "active") exitWith {
    ["STR_GAME_Error", "STR_GAME_GenAlreadyActive", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

_generator setVariable ["active",true,true];

{  
    [_x, "ON"] remoteExec ["switchLight",0,true];  
} forEach (nearestObjects [_generator, [], 3]);
_generator animateSource ["switchposition",-1];   
_generator animateSource ["light",1];   
_generator setDamage 0; 
	
private _activateSound = ["a3\missions_f_exp\data\sounds\exp_m07_lightson_01.wss","a3\missions_f_exp\data\sounds\exp_m07_lightson_02.wss","a3\missions_f_exp\data\sounds\exp_m07_lightson_03.wss"] call BIS_fnc_selectRandom;
playSound3D [_activateSound, _generator, false, getPosASL _generator, 3, 1, 1000]; 
[_generator] remoteExec ["gonzka_fnc_genSoundLoop",2];

repairedGenerators = repairedGenerators + 1;
publicvariable "repairedGenerators";

[_generator] remoteExecCall ["gonzka_fnc_removeGenMarker",east];
[_generator,"textures\gui\hud_generator.paa","",[0,1,0,1]] remoteExec ["gonzka_fnc_auraNotification", [0, -2] select isDedicated];

if (repairedGenerators isEqualTo totalGenerators) then {
	[] remoteExec ["gonzka_fnc_initEndgame", [0, -2] select isDedicated];
	if (worldName isEqualTo "Tanoa") then {
	    [lighthouse2, "ON"] remoteExec ["switchLight",0,true]; //Activates Lighthouse
	};
};

["STR_SCORE_Generator",1000] call gonzka_fnc_addFunds;

//PERKS
[] remoteExecCall ["gonzka_fnc_darkSense",civilian];
[_generator] remoteExecCall ["gonzka_fnc_bitterMurmur",east];

//QUEST
quest_generators = quest_generators + 1;
if ((player getVariable "threatLevel") > 0) then {
    quest_terrorGenerators = quest_terrorGenerators + 1;
};

//SPECIAL THINGS AND LIGHTS
private _genLights = [];
switch true do {
	case (genericGen_1 getVariable ["active",false] && !gen1_special): {
	    if (worldName isEqualTo "Malden") then {
		    _genLights = [gen1_light1];
		};
		gen1_special = true; publicvariable "gen1_special";
	};
	
	case (genericGen_2 getVariable ["active",false] && !gen2_special): {
		if (worldName isEqualTo "Malden") then {
		    _genLights = [gen2_light1, gen2_light2];
		} else {
		    _genLights = [gen2_light1];
		};
		gen2_special = true; publicvariable "gen2_special";
	};
	
	case (genericGen_3 getVariable ["active",false] && !gen3_special): {
	    if (worldName isEqualTo "Tanoa") then {
		    [ewok,"ewok_long",100] remoteExecCall ["gonzka_fnc_say3D"];
		} else {
		    _genLights = [gen3_light1, gen3_light2, gen3_light3];
		};
		gen3_special = true; publicvariable "gen3_special";
	};
	
	case (genericGen_4 getVariable ["active",false] && !gen4_special): {
		if (worldName isEqualTo "Malden") then {
		    _genLights = [gen4_light1, gen4_light2];
		};
		gen4_special = true; publicvariable "gen4_special";
	};
	
	case (genericGen_5 getVariable ["active",false] && !gen5_special): {
		if (worldName isEqualTo "Malden") then {
		    _genLights = [gen5_light1, gen5_light2];
		};
		gen5_special = true; publicvariable "gen5_special";
	};
	
	case (genericGen_6 getVariable ["active",false] && !gen6_special): {
	    if (worldName isEqualTo "Malden") then {
		    _genLights = [gen6_light1, gen6_light2, gen6_light3];
		} else {
		    _genLights = [gen6_light1, gen6_light2];
		};
		gen6_special = true; publicvariable "gen6_special";
	};
	
	case (genericGen_7 getVariable ["active",false] && !gen7_special): {
		if (worldName isEqualTo "Tanoa") then {
			_genLights = [gen7_light1, gen7_light2, gen7_light3, gen7_light4, gen7_light5];
		} else {
			_genLights = [gen7_light1, gen7_light2];
		};
		gen7_special = true; publicvariable "gen7_special";
	};
};

if !(_genLights isEqualTo []) then {
	{
	   [_x, "ON"] remoteExec ["switchLight",0,true]; 
	} forEach _genLights;
};