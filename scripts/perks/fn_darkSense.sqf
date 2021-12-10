/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         04.08.2021
	Description:	 Dark Sense Survivor Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("darkSense" in (player getVariable "intruders_activePerks")) exitWith {};

private _duration = 5;

if (repairedGenerators isEqualTo totalGenerators) then {
    _duration = 10;
};

[Killer,"","",[1,1,1,1],_duration] spawn gonzka_fnc_auraNotification;