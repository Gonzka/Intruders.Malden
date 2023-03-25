/*
    Author:	Gonzka

    Character dependent voiceline after the player is spawned
*/

if (playerSide isEqualTo civilian) then {
	switch (face player) do {
		case "GreekHead_A3_04": {
			[player, "Acts_JetsCrewaidF_idle2_m"] remoteExec ["switchMove"];
			player say3D [selectRandom ["helmut_spawn_1","helmut_spawn_2","helmut_spawn_3","helmut_spawn_4"], 50];
		};
		
		case "WhiteHead_26": {
			[player, "Acts_Hilltop_Calibration_Heli_Out"] remoteExec ["switchMove"]; //In
			player say3D [selectRandom ["stanislaw_spawn_1","stanislaw_spawn_2"], 50];
		};
		
		case "GreekHead_A3_11": {
			[player, "Acts_JetsMarshallingClear_in"] remoteExec ["switchMove"];
			player say3D [selectRandom ["rammel_spawn_1","rammel_spawn_2","rammel_spawn_3","rammel_spawn_4"], 100];
		};
		
		case "PersianHead_A3_02": {
			[player, "Acts_Arrival_Response"] remoteExec ["switchMove"]; //Acts_Shocked_1_Loop
			player say3D [selectRandom ["sandro_spawn_1","sandro_spawn_2","sandro_spawn_3"], 50];
		};
		
		case "Bruce": {
			[player, "Acts_Hilltop_Calibration_Loop"] remoteExec ["switchMove"];
			player say3D [selectRandom ["bruce_spawn_1","bruce_spawn_2","bruce_spawn_3"], 100];
		};
		
		case "Hladas": {
			[player, "Acts_Dance_02"] remoteExec ["switchMove"];
			player say3D [selectRandom ["opterix_spawn_1","opterix_spawn_2"], 50];
		};
		
		case "LivonianHead_1": {
			player playMoveNow "Acts_A_M01_briefing";
			player say3D [selectRandom ["kolo_spawn_1","kolo_spawn_2","kolo_spawn_3","kolo_spawn_4"], 100];
		};
	};
};

if (playerSide isEqualTo east) then {
	//WENDIGO
	if (player getVariable "killer" isEqualTo "wendigo") then {
		player say3D [selectRandom ["growl_1","growl_2","growl_3","growl_4","growl_5","growl_6"], 50];
	};
	
	//BUCKETHEAD
	if (player getVariable "killer" isEqualTo "buckethead") then {
		player say3D [selectRandom ["evilLaugh_1","evilLaugh_2","evilLaugh_3","evilLaugh_4","evilLaugh_5","evilLaugh_6","evilLaugh_7"], 50];
	};
	
	//TRAPPER
	if (player getVariable "killer" isEqualTo "trapper") then {
		player say3D [selectRandom ["growlWeird_1","growlWeird_2","growlWeird_3","growlWeird_4"], 50];
	};
	
	private _hintClass = player getVariable "killer";
	[["Intruders", _hintClass], 15,"",35,"",true,false,false,true] call BIS_fnc_advHint;
};