/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         13.09.2021
	Description:	 Counterforce Survivor Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("counterforce" in (player getVariable "intruders_activePerks")) exitWith {};
if (totems isEqualTo []) exitWith {};

private _nearestTotem = ([totems, [], {player distance _x}, "DESCEND"] call BIS_fnc_sortBy) select 0;
[_nearestTotem,"textures\ico_totem.paa","",[1,1,1,1],4] spawn gonzka_fnc_auraNotification;
