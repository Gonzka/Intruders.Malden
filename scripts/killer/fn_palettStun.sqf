/*
    Author:	Gonzka

    Executed when the killer is hit by a pallet
*/

player setUnconscious true;

if (player getVariable ["isCloaked", false]) then {
    [] spawn gonzka_fnc_cloak; //A Palett Stun forces the Wendigo to uncloak
};

sleep 1;
player setUnconscious false;
player playMoveNow "Incapacitated";

sleep 1;
[player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["switchMove"];