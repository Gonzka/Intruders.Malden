/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         24.10.2020
	Description:	 Shows when the player gets points and saves them

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
	["_actionName", "", [""]],
	["_funds", 0, [0]]
];

private _fortune = player getVariable "bloodPoints";
_fortune = _fortune + _funds;
player setVariable ["bloodPoints",_fortune,true];

["+ " + str _funds + " " + localize "STR_SCORE_BloodPoints", _actionName, 4, "textures\ico_points.paa"] spawn gonzka_fnc_notification;