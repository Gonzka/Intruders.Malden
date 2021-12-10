/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         24.09.2021
	Description:	 Booby Trap Killer Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("boobyTrap" in (player getVariable "intruders_activePerks")) exitWith {};

private _normalChests = chestgroup;
for "_i" from 0 to 1 do { //Select 2 chests
	private _randSel = selectRandom _normalChests;
	private _rIndex = _normalChests find _randSel;
	_normalChests deleteAt _rindex;
	
	_randSel setVariable ["boobyTrap",true,true];
};