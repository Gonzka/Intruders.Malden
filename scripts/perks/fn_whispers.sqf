/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         04.08.2021
	Description:	 Whispers Killer Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("whispers" in (player getVariable "intruders_activePerks")) exitWith {};

while {sleep 5; alive player} do {
    _nearPlayers = getPosATL player nearEntities [["CAManBase"], 32];
    _nearPlayers = _nearPlayers - [player];
	
	if !(_nearPlayers isEqualTo []) then {
		playSound selectRandom ["whispers_1", "whispers_2", "whispers_3", "whispers_4", "whispers_5"];
	};
};