/*
    Author:	Gonzka

    Booby Trap Killer Perk
*/

if !("boobyTrap" in (player getVariable "intruders_activePerks")) exitWith {};

private _normalChests = chestgroup;
for "_i" from 0 to 1 do { //Select 2 chests
	private _randSel = selectRandom _normalChests;
	private _rIndex = _normalChests find _randSel;
	_normalChests deleteAt _rindex;
	
	_randSel setVariable ["boobyTrap",true,true];
};