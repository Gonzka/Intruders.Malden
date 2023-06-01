/*
    Author:	Gonzka

    Plunderer's Instinct Survivor Perk
*/

if !("plunderersInstinct" in (player getVariable "intruders_activePerks")) exitWith {};

addMissionEventHandler ["Draw3D", {
    {
        if (player distance _x <= 32 && !(_x getVariable ["looted",false])) then {
            drawIcon3D ["\intruders_mod\textures\perks\ico_plunderersInstinct.paa", [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, "", 1, 0.0315];
        };  
    } forEach chestgroup;  
}];