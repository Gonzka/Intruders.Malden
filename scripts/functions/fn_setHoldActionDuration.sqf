/*
    Author:	Gonzka

    Returns the action id stored into object's namespace
*/

params [
    ["_object", objNull, [objNull]],
    ["_duration", 0, [0]]
];

private _actionID = _object getVariable "actionID";
private _arguments = _object actionParams _actionID;
_arguments select 2 set [20, _duration];