/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         16.10.2020
	Description:	 Character dependent voiceline after the player is spawned

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if (playerSide isEqualTo civilian) then {
    switch (face player) do {
        case "GreekHead_A3_04": {
		    [player, "Acts_JetsCrewaidF_idle2_m"] remoteExec ["switchMove"];
		    [player, selectRandom ["helmut_spawn_1","helmut_spawn_2","helmut_spawn_3","helmut_spawn_4"], 50] call gonzka_fnc_say3D;
	    };
	
        case "WhiteHead_26": {
		    [player, "Acts_Hilltop_Calibration_Heli_Out"] remoteExec ["switchMove"]; //In
		    [player, selectRandom ["stanislaw_spawn_1","stanislaw_spawn_2"], 50] call gonzka_fnc_say3D;
	    };
	
	    case "GreekHead_A3_11": {
		    [player, "Acts_JetsMarshallingClear_in"] remoteExec ["switchMove"];
		    [player, selectRandom ["rammel_spawn_1","rammel_spawn_2","rammel_spawn_3","rammel_spawn_4"], 100] call gonzka_fnc_say3D;
	    };
	
	    case "PersianHead_A3_02": {
		    [player, "Acts_Arrival_Response"] remoteExec ["switchMove"]; //Acts_Shocked_1_Loop
		    [player, selectRandom ["sandro_spawn_1","sandro_spawn_2","sandro_spawn_3"], 50] call gonzka_fnc_say3D;
        };
	
	    case "Bruce": {
		    [player, "Acts_Hilltop_Calibration_Loop"] remoteExec ["switchMove"];
		    [player, selectRandom ["bruce_spawn_1","bruce_spawn_2","bruce_spawn_3"], 100] call gonzka_fnc_say3D;
	    };
		
		case "Hladas": {
		    [player, "Acts_Dance_02"] remoteExec ["switchMove"];
		    [player, selectRandom ["opterix_spawn_1","opterix_spawn_2"], 50] call gonzka_fnc_say3D;
	    };
	};
};

if (playerSide isEqualTo east) then {
	//WENDIGO
	if (player getVariable "killer" isEqualTo "wendigo") then {
		[player, selectRandom ["growl_1","growl_2","growl_3","growl_4","growl_5","growl_6"], 50] call gonzka_fnc_say3D;
	};
	
	//COMPACTOR
	if (player getVariable "killer" isEqualTo "compactor") then {
		[player, selectRandom ["evilLaugh_1","evilLaugh_2","evilLaugh_3","evilLaugh_4","evilLaugh_5","evilLaugh_6","evilLaugh_7"], 50] call gonzka_fnc_say3D;
	};
	
	//BUTCHER
	if (player getVariable "killer" isEqualTo "butcher") then {
		[player, selectRandom ["growlWeird_1","growlWeird_2","growlWeird_3","growlWeird_4"], 50] call gonzka_fnc_say3D;
	};
	
	private _hintClass = player getVariable "killer";
	[["Intruders", _hintClass], 15,"",35,"",true,false,false,true] call BIS_fnc_advHint;
};

call gonzka_fnc_playerSkins;
[] spawn gonzka_fnc_initCustomVoicelines;

sleep 20;
[] spawn gonzka_fnc_terrorMusic;