/*
    Author:	Gonzka

    Whispers Killer Perk
*/

if !("whispers" in (player getVariable "intruders_activePerks")) exitWith {};

while {sleep 5; alive player} do {
    _nearPlayers = getPosATL player nearEntities [["CAManBase"], 32];
    _nearPlayers = _nearPlayers - [player];
    
    if !(_nearPlayers isEqualTo []) then {
        playSound selectRandom ["whispers_1", "whispers_2", "whispers_3", "whispers_4", "whispers_5"];
    };
};