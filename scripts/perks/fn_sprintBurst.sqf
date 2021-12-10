/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         22.09.2021
	Description:	 Sprint Burst Survivor Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("sprintBurst" in (player getVariable "intruders_activePerks")) exitWith {};
if (exhausted) exitWith {};

exhausted = true;
player setAnimSpeedCoef 1.5;
sleep 3;
if (player getVariable ["hope", false]) then {
    player setAnimSpeedCoef 1.07; //Hope Survivor Perk
} else {
    player setAnimSpeedCoef 1; 
};

sleep 60;
exhausted = false;