/*
    Author:	Gonzka

    Bond Survivor Perk
*/

if !("bond" in (player getVariable "intruders_activePerks")) exitWith {};

addMissionEventHandler ["Draw3D", {  
    private _nearPlayers = getPosATL player nearEntities [["CAManBase"], 36];
    _nearPlayers = _nearPlayers - [player];
    {
        if (_x isNotEqualTo Killer && isPlayer _x) then {  
            drawIcon3D [getMissionPath "textures\gui\hud_survivor.paa", [1,1,1,1], ASLToAGL getPosASLVisual _x, 0.8, 0.8, 0, "", 1, 0.0315];
        }; 
    } forEach _nearPlayers;  
}];