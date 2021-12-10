/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         24.10.2021
	Description:	 Returns the action id stored into object's namespace

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_object", objNull, [objNull]],
    ["_duration", 0, [0]]
];

private _actionID = _object getVariable "actionID";
private _arguments = _object actionParams _actionID;
_arguments select 2 set [20, _duration];