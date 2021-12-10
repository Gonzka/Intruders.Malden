/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         18.07.2021
	Description:	 Placement of a trap

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if (beartraps < 1) exitWith {};

private _nearbyTraps = getPosATL player nearEntities [["Intruders_Object_Beartrap"], 1.5];

if !(_nearbyTraps isEqualTo []) exitWith {
    ["STR_GAME_Error", "STR_GAME_TrapTooClose", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
};

beartraps = beartraps - 1;

player switchMove "AinvPknlMstpSlayWrflDnon";
player playMoveNow "AinvPknlMstpSlayWrflDnon";
sleep 0.5;

private _trap = createVehicle ["Intruders_Object_Beartrap", getPosATL player, [], 0, "NONE"];
_trap allowDamage false;
_trap enableSimulation true;
_trap setPosATL [getPosATL player select 0, getPosATL player select 1, getPosATL player select 2];
private _dir = floor(random 360);  
_trap setDir _dir;

{
    _trap animate [_x,0];
} forEach ["door_1","door_2","door_3","door_4","door_5"];

[_trap, selectRandom ["bearTrap_1", "bearTrap_2", "bearTrap_3", "bearTrap_4"]] remoteExecCall ["say3D"];

[_trap] call gonzka_fnc_resetBeartrap;
[_trap] call gonzka_fnc_collectBeartrap;
[_trap] spawn gonzka_fnc_markBeartrap;
[_trap] remoteExec ["gonzka_fnc_stepInBeartrap",civilian];
[_trap] remoteExec ["gonzka_fnc_disarmBeartrap",civilian];

["STR_SCORE_SetTrap",100] call gonzka_fnc_addFunds;