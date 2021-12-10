/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         04.08.2021
	Description:	 Bitter Murmur Killer Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_generator", objNull, [objNull]]
];

if !("bitterMurmur" in (player getVariable "intruders_activePerks")) exitWith {};

{
    if (side _x isEqualTo civilian) then {
        if (repairedGenerators isEqualTo totalGenerators) then {
            [_x,"","",[1,1,1,1],10,false] spawn gonzka_fnc_auraNotification;
        } else {
	        if (_x distance _generator <= 16) then {
	    	    [_x,"","",[1,1,1,1],5,false] spawn gonzka_fnc_auraNotification;
	        };
		};
	};
} forEach playableUnits;

playSound "Orange_Timeline_FadeOut";