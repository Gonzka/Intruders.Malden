/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         18.09.2021
	Description:	 Hope Survivor Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("hope" in (player getVariable "intruders_activePerks")) exitWith {};

player setVariable ["hope", true, true];
player setAnimSpeedCoef 1.07;
sleep 120;
player setVariable ["hope", false, true];
player setAnimSpeedCoef 1;