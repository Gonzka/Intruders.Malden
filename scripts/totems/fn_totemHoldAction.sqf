/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         15.03.2021
	Description:	 Creates an interaction with a totem

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_totem", objNull, [objNull]]
];

[
    _totem, 
    localize "STR_GAME_CleanseTotem",  
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa",  
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa", 
    "_this distance _target < 3 && side _this != east && !isObjectHidden _target",
    "_this distance _target < 3 && side _this != east && !isObjectHidden _target",
    {
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	},
    {},  
    {
		[_target,true] remoteExec ["hideObject"];
		private _index = totems find _target;
		totems deleteAt _index;
		publicvariable "totems";
		
		[_target,"surrender_fall"] remoteExecCall ["say3D"];
		
		if (_target getVariable ["hex",""] isNotEqualTo "") then {
		    deleteVehicle (nearestObject [_target, "#particlesource"]); 
			
		    [selectRandom ["thunder_1","thunder_2"]] remoteExecCall ["playSound", [0, -2] select isDedicated];
			
		    [_target,"textures\ico_hexTotem.paa","",[1,0,0,1]] remoteExec ["gonzka_fnc_auraNotification",east];			
		    ["STR_SCORE_HexTotem",1500] call gonzka_fnc_addFunds;
			
			//Retribution Killer Perk (Hex)
			if !(isNil "totem_hex_retribution" || {isObjectHidden totem_hex_retribution}) then {
			    {
	                if (side _x isEqualTo civilian) then {
		                [_x,"","",[1,1,1,1],15,false] remoteExec ["gonzka_fnc_auraNotification",east];
	                };
                } forEach playableUnits;
				["Orange_Timeline_FadeOut"] remoteExecCall ["playSound",east];
			};
			
			//Undying Killer Perk (Hex)
			if !(isNil "totem_hex_undying" || {isObjectHidden totem_hex_undying}) then {
		        ["hex_undying"] call gonzka_fnc_revealHex;
				missionNamespace setVariable [format ["totem_%1", _target getVariable "hex"], totem_hex_undying, true];
				totem_hex_undying = nil;
			};
		} else {
		    ["STR_SCORE_Totem",1000] call gonzka_fnc_addFunds;
		};
		
		//Retribution Killer Perk (Hex)
		if !(isNil "totem_hex_retribution" || {isObjectHidden totem_hex_retribution}) then {
			if !(player getVariable ["oblivious",false]) then {
				player setVariable ["oblivious",true,true];
				["hex_retribution"] call gonzka_fnc_revealHex;
				[] spawn {
					sleep 45;
					player setVariable ["oblivious",false,true];
				};
			};
		};
		
		call gonzka_fnc_counterforce; //Counterforce Survivor Perk
	},
    {
		[player, ""] remoteExec ["switchMove"];
	},
    [],  
    14,
    nil,  
    true,  
    false 
] call BIS_fnc_holdActionAdd;	