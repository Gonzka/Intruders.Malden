/*
    Author:	Gonzka

    Master eventhandler file
*/

player addEventHandler ["InventoryOpened", {findDisplay 602 closeDisplay 1; true}];
player addEventHandler ["Fired",{_this call gonzka_fnc_onFired}];
player addEventHandler ["HandleDamage", {_this call gonzka_fnc_handleDamage}];
player addEventHandler ["Dammaged", {_this call gonzka_fnc_dammaged}];

player addEventHandler ["Killed", {
	player removeWeapon (primaryWeapon player); 
	player removeWeapon (handgunWeapon player);
	player removeWeapon (secondaryWeapon player);
	
	["STR_SCORE_Killed",1000] remoteExecCall ["gonzka_fnc_addBloodpoints",east];
	["killed_1"] remoteExecCall ["playSound", [0, -2] select isDedicated];
	["Initialize", [player, [civilian], false, true, true, true, true, false]] call BIS_fnc_EGSpectator;
	
	deadPlayers pushBackUnique getPlayerUID player; publicVariable "deadPlayers"; //Put the dead player's UID on a global list to prevent him from rejoining the game even though he has already died
	
	//QUEST
	private _kills = Killer getVariable "quest_kills";
	Killer setVariable ["quest_kills",_kills + 1,true];
	
	if (endgameCountdown) then {
	    private _endgameKill = Killer getVariable "quest_endgameKill";
	    Killer setVariable ["quest_endgameKill",true,true];
	};
}];

{
	_x addEventHandler ["GetIn", {
		params ["_veh","_pos","_unit"];
		if (side _unit isEqualTo east) then {
			_unit action ["eject", _veh];
		} else {
			if (player isEqualTo _unit) then {
				[] call gonzka_fnc_escape;
			};
		};
	}];
} forEach [escapeVehicle_1, escapeVehicle_2];

if (playerSide isEqualTo civilian) then {
	//Show markers of survivors who are unconscious and show markers of all survivors if the player himself is unconscious
	//And Bond Survivor Perk
	addMissionEventHandler ["Draw3D", {
		{
			if (_x getVariable ["BIS_revive_incapacitated", false] || player getVariable ["BIS_revive_incapacitated", false] || ("bond" in (player getVariable "intruders_activePerks") && player distance _x <= 36)) then {
				drawIcon3D ["\intruders_mod\textures\gui\hud_survivor.paa", [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, "", 1, 0.0315];
			};
		} forEach playableUnits - [player, Killer];
	}];
	
	//Workaround to add bloodpoints to a player who revived someone
	player addEventHandler ["AnimDone", {
		params ["_unit", "_anim"];
		if (_anim isEqualTo "ainvpknlmstpsnonwnondnon_medicend" && {profileNamespace getVariable ["bis_reviveCount", 0] > prevReviveCount}) then {
			prevReviveCount = profileNamespace getVariable ["bis_reviveCount", 0];
			["STR_SCORE_Rescue",1500] call gonzka_fnc_addBloodpoints;
		};
	}];
};

//LOCKPICKING
disableSerialization;
private _main_display = findDisplay 46;

// Setup key handlers
_main_display displayAddEventHandler ["MouseButtonDown", {_this call pizza_fnc_handler_mousedown}];
_main_display displayAddEventHandler ["KeyDown", {_this call pizza_fnc_handler_keydown}];
_main_display displayAddEventHandler ["KeyUp",   {_this call pizza_fnc_handler_keyup}];

// Scroll-wheel handler
inGameUISetEventHandler ["PrevAction", "_this call pizza_fnc_handler_actions"];
inGameUISetEventHandler ["NextAction", "_this call pizza_fnc_handler_actions"];
inGameUISetEventHandler ["Action", "_this call pizza_fnc_handler_actions"];