/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         15.11.2021
	Description:	 An exploding firecracker that can blind killers and survivors

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

private _firecracker = createSimpleObject ["Land_ButaneCanister_F", [0,0,0]];
_firecracker setPosATL getPosATL player;

[_firecracker, "firecracker_1"] remoteExec ["say3D", [0, -2] select isDedicated];

sleep 2;

private _effect = "CMflare_Chaff_Ammo" createVehicle getPosATL _firecracker;
[_firecracker, "firecracker_2"] remoteExec ["say3D", [0, -2] select isDedicated];
[ASLtoATL (visiblePositionASL _firecracker), player] remoteExec ["gonzka_fnc_flashbang", [0, -2] select isDedicated];
	
sleep 5;
deleteVehicle _effect;
deleteVehicle _firecracker;