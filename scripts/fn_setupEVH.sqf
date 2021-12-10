/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         18.10.2020
	Description:	 Master eventhandler file

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

player addEventHandler ["InventoryOpened", {findDisplay 602 closeDisplay 1; call gonzka_fnc_playerSkins; true}];
player addEventHandler ["Fired",{_this call gonzka_fnc_onFired}];
player addEventHandler ["HandleDamage", {_this call gonzka_fnc_handleDamage}];
player addEventHandler ["Dammaged", {_this call gonzka_fnc_dammaged}];

player addEventHandler ["Killed", {
    player removeWeapon (primaryWeapon player); 
    player removeWeapon (handgunWeapon player);
	player removeWeapon (secondaryWeapon player);
	
	["STR_SCORE_Killed",1000] remoteExecCall ["gonzka_fnc_addFunds",east];
	["killed_1"] remoteExecCall ["playSound", [0, -2] select isDedicated];
	["Initialize", [player, [civilian], false, true, true, true, true, false]] call BIS_fnc_EGSpectator;
	
	//QUEST
	private _kills = Killer getVariable "quest_kills";
	Killer setVariable ["quest_kills",_kills + 1,true];
	
	if !(isNil "RscFiringDrillTime_done") then {
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

//Show Incapacitated Survivors
addMissionEventHandler ["Draw3D", {  
    {
        if (_x isNotEqualTo player && _x isNotEqualTo Killer && (_x getVariable ["BIS_revive_incapacitated", false] || lifeState _x isEqualTo "INCAPACITATED")) then {
            drawIcon3D [getMissionPath "textures\gui\hud_survivor.paa", [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, "", 1, 0.0315];  
        };  
    } forEach playableUnits;  
}];

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