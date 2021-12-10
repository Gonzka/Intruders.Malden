/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         23.08.2021
	Description:	 Plunderer's Instinct Survivor Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("plunderersInstinct" in (player getVariable "intruders_activePerks")) exitWith {};

addMissionEventHandler ["Draw3D", {  
    {
        if (player distance _x <= 32 && !(_x getVariable ["looted",false])) then {  
            drawIcon3D [getMissionPath "textures\ico_plunderersInstinct.paa", [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, "", 1, 0.0315];  
        };  
    } forEach chestgroup;  
}];