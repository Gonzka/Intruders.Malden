/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         10.10.2020
	Description:	 For remoteExec Say3D commands with a range parameter

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_object",objNull,[objNull]],
    ["_sound","",[""]],
    ["_distance",100,[0]],
    ["_pitch",1,[0]]
];

if (isNull _object || {_sound isEqualTo ""}) exitWith {};
if (_distance < 0) then {_distance = 100};
_object say3D [_sound,_distance,_pitch];