/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         26.10.2020
	Description:	 Generates an explosion

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params ["_spawnPos"];

private _explosive = "SmallSecondary" createVehicle _spawnPos;
_explosive setPos _spawnPos;