/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         24.10.2020
	Description:	 Removes the marker when a generator is repaired

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_generator", objNull, [objNull]]
];

private _id = ["draw_",_generator] joinString "";
removeMissionEventHandler ["Draw3D", call compile _id];