/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         12.10.2020
	Description:	 Equips the killer with a weapon and lets him strike

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

initWeapon = {
    waitUntil {!(isNull(findDisplay 46))};
    chopEH = (findDisplay 46) displayAddEventHandler ["MouseButtonDown",{
	    private _button = _this select 1;
		if (_button isEqualTo 0) then {
			if (player getVariable ["isCloaked",false] || blockMainWeapon || knockout) exitWith {};
	        if (isNil "meleeActionTime") then {
			    meleeActionTime = 0;
			};
		    if (time - meleeActionTime > meleeCooldown) then {
		        meleeActionTime = time;
                [player] spawn chopWeapon;
		    };
		};
    }];
};

chopWeapon = {
    [] spawn gonzka_fnc_endPhaseWalk; //Old Man Ability
	
	player playAction "GestureSwing";
    [player, selectRandom ["weaponSwing_1","weaponSwing_2","weaponSwing_3","weaponSwing_4","weaponSwing_5","weaponSwing_6","weaponSwing_7"]] remoteExecCall ["say3D"];
	player forceWalk true;
	[] spawn {
        sleep meleeCooldown;
        player forceWalk false;
	};

    private _nearObj = getPosATL player nearEntities [["CAManBase"], 3];	
	private _tarCond = [];
    {
	    if (_x != player && {alive _x} && {isPlayer _x}) then {
		    _tarCond set [(count _tarCond),_x];
		};
	} forEach _nearObj;
    if (_tarCond isEqualTo []) exitWith {
	    meleeCooldown = 1.5; //Missed attack: 1.5 seconds
		if ("unrelenting" in (Killer getVariable "intruders_activePerks")) then { //Unrelenting Killer Perk
		    meleeCooldown = meleeCooldown / 1.3; //Decreased by 30%
		};
	};
	meleeCooldown = 3; //Successful attack: 3 seconds
    
	private _tar = _tarCond select 0;
    private _LoS = [getPosATL player, getDir player, 90, getPosATL _tar] call BIS_fnc_inAngleSector;
    
	if (_LoS) then {
	   if (alive _tar && _tar != player) then {
		    if (player distance _tar <= 3) then { 
			    if (_tar getVariable ["BIS_revive_incapacitated", false] || lifeState _tar == "INCAPACITATED") exitWith { 
				    ["STR_GAME_Error", "STR_GAME_PlayerUnconscious", 5, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
				};
				
				private _damage = 0.14; //0.42 player health
				//_damage = 0.21; //2 HITS
				_tar setDamage ((damage _tar) + _damage);
				
				//No One Escapes Death Killer Perk (Hex)
                if !(isNil "totem_hex_noOneEscapesDeath" || {isObjectHidden totem_hex_noOneEscapesDeath}) then {
				    _tar setDamage 0.42;
					["hex_noOneEscapesDeath"] call gonzka_fnc_revealHex;
				};
				
				[10] remoteExecCall ["BIS_fnc_bloodEffect",_tar]; //Adds the bleeding effect post-processing effect to the players screen
				
				//ON-HIT SPRINT
				if !(_tar getVariable ["BIS_revive_incapacitated", false] && lifeState _tar == "INCAPACITATED") then {
					[_tar] spawn {
					    _tar = _this select 0;
				        [_tar, 1.5] remoteExec ["setAnimSpeedCoef", _tar];
					    sleep 2;
						if (player getVariable ["hope", false]) then {
					        [_tar, 1.07] remoteExec ["setAnimSpeedCoef", _tar]; //Hope Survivor Perk
						} else {
						    [_tar, 1] remoteExec ["setAnimSpeedCoef", _tar];
						};
					};
				};
				
				private _tSnd = createVehicle ["Land_HelipadEmpty_F", getPos _tar, [], 0, "NONE"];
				[_tSnd, selectRandom ["weaponHit_1","weaponHit_2","weaponHit_3","weaponHit_4"]] remoteExecCall ["say3D"];
				
				switch (player getVariable "killer") do {
                    case "wendigo": {
				        [player, selectRandom ["growl_1","growl_2","growl_3","growl_4","growl_5","growl_6"], 50] remoteExecCall ["gonzka_fnc_say3D"];
				    };
					case "compactor": {
				        [player, selectRandom ["evilLaugh_1","evilLaugh_2","evilLaugh_3","evilLaugh_4","evilLaugh_5","evilLaugh_6","evilLaugh_7"], 50] remoteExecCall ["gonzka_fnc_say3D"];
				    };
					case "butcher": {
		                [player, selectRandom ["growlWeird_1","growlWeird_2","growlWeird_3","growlWeird_4"], 50] remoteExecCall ["gonzka_fnc_say3D"];
				    };
				};
				
				if (quest_hit_openTimeSlot) then {
				    quest_uncloakingHit = quest_uncloakingHit + 1;
					["STR_SCORE_SurpriseAttack",300] call gonzka_fnc_addFunds;
				} else {
				    ["STR_SCORE_Hit",200] call gonzka_fnc_addFunds;
				};
				
				[_tar] call gonzka_fnc_scream; //SURVIVOR SCREAM
				
				sleep 1;
				deleteVehicle _tSnd;
			};
		};
	};
};