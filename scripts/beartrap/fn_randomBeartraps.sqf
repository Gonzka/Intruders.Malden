/*
    Author:	Gonzka

    Automatic placement of a random trap at each generator
*/

private _maxDist = switch (worldName) do {
    case "Tanoa": {15};
    case "Malden": {22};
    case "Altis": {10};
    case default {10};
};

{
    private _pos = [getPos _x, 0, _maxDist, 0, 0, 1] call BIS_fnc_findSafePos;
    private _trap = createVehicle ["Intruders_Object_Beartrap", _pos, [], 0, "NONE"];
    _trap allowDamage false;
    _trap enableSimulation true;
    _trap setDir (random 360);
    
    {
        _trap animate [_x,0];
    } forEach ["door_1","door_2","door_3","door_4","door_5"];
    
    [_trap] call gonzka_fnc_resetBeartrap;
    [_trap] call gonzka_fnc_collectBeartrap;
    [_trap] call gonzka_fnc_markBeartrap;
    [_trap] remoteExec ["gonzka_fnc_stepInBeartrap",civilian];
    [_trap] remoteExec ["gonzka_fnc_disarmBeartrap",civilian];
} forEach generators;