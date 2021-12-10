/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         25.09.2021
	Description:	 Executed when the killer is hit by a pallet

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

player setUnconscious true;

if (player getVariable ["isCloaked", false]) then {
	[] spawn gonzka_fnc_cloak; //A Palett Stun forces the Wendigo to uncloak
};

sleep 1;
player setUnconscious false;
player playMoveNow "Incapacitated";

sleep 1;
[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["switchMove"];