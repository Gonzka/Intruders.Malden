/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         18.07.2021
	Description:	 Detach bear trap from player

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if (str attachedObjects player find "beartrap" != -1) then {
	private _trap = attachedObjects player select 0; detach _trap; _trap setDir trapDir; _trap setPosATL [trapPos select 0, trapPos select 1, trapPos select 2]; //REMOVE TRAP
	[_trap, selectRandom ["bearTrap_1", "bearTrap_2", "bearTrap_3", "bearTrap_4"]] remoteExecCall ["say3D"];
};