/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         23.08.2021
	Description:	 Lethal Pursuer Killer Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("lethalPursuer" in (player getVariable "intruders_activePerks")) exitWith {};

{
    if (side _x isEqualTo civilian) then {
	    [_x,"","",[1,1,1,1],9,false] spawn gonzka_fnc_auraNotification;
	};
} forEach playableUnits;

playSound "Orange_Timeline_FadeOut";