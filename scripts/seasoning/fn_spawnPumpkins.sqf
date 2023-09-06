/*
    Author:	Gonzka

    Spawn Halloween Event Pumpkins
*/

if (season isNotEqualTo "Halloween") exitWith {};

private _maxDist = switch (worldName) do {
    case "Altis": {60};
    case default {150};
};

for "_i" from 0 to 6 do { //Spawn 7 Pumpkins
	private _pumpkin = "Land_Pumpkin_01_halloween_F" createVehicle [0,0,0];
	_pumpkin allowDamage false;
	private _pos = [getMarkerPos "center", 0, _maxDist, 0, 0, 1] call BIS_fnc_findSafePos;
	_pumpkin setPos _pos;
	_pumpkin setDir (random 360);  
	
	[
		_pumpkin, 
		localize "STR_GAME_PumpkinAction",  
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestLeadership_ca.paa",  
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestLeadership_ca.paa", 
		"_this distance _target < 2",
		"_this distance _target < 2",
		{},
		{},  
		{
			_target setDamage 1;
			
			private _random = random 100;
			private _speed = 1.0;
			if (_random < 50) then { //50 %
		        //NOTHINGHAM
				["STR_SCORE_Pumpkin",250] call gonzka_fnc_addBloodpoints;
			} else {
				if (_random < 80) then { //30 %
					["STR_SCORE_PumpkinTreat",10] call gonzka_fnc_addBloodpoints;
					["STR_GAME_Hindered", "STR_GAME_TreatHindered", 6, "\intruders_mod\textures\gui\ico_pumpkin.paa"] spawn gonzka_fnc_notification;
					_speed = 0.9;
				} else { //20 %
					["STR_SCORE_PumpkinTrick",1000] call gonzka_fnc_addBloodpoints;
					["STR_GAME_Haste", "STR_GAME_TrickHaste", 6, "\intruders_mod\textures\gui\ico_pumpkin.paa"] spawn gonzka_fnc_notification;
					_speed = 1.25;
				};
				player setAnimSpeedCoef (getAnimSpeedCoef player * _speed);
				[] spawn {
					sleep 6;
					if (playerSide isEqualTo east) then {
						if (player getVariable ["isCloaked", false]) then {
							player setAnimSpeedCoef 1.5;
						} else {
							player setAnimSpeedCoef 1.15;
						};						
					} else {
						if (player getVariable ["hope", false]) then {
							player setAnimSpeedCoef 1.07; //Hope Survivor Perk
						} else {
							player setAnimSpeedCoef 1;
						};
					};
				};
			};
		},
		{},
		[],  
		0.75,  
		nil,  
		true,  
		false 
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _pumpkin];	
};