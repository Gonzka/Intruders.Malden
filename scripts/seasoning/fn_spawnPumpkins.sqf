/*
    Author:	Gonzka

    Spawn Halloween Event Pumpkins
*/

if (season isNotEqualTo "Halloween") exitWith {};

for "_i" from 0 to 6 do { //Spawn 7 Pumpkins
	private _pumpkin = "Intruders_Object_Pumpkin" createVehicle [0,0,0];
	_pumpkin enableSimulation false; _pumpkin allowDamage false;
	private _pos = [getMarkerPos "center", 0, 150, 0, 0, 1] call BIS_fnc_findSafePos;
	_pumpkin setPos _pos;
	_pumpkin setDir (random 360);  
	
	private _light = "#lightpoint" createVehicle position _pumpkin; 
	[_light, 0.2] remoteExec ["setlightbrightness",0,true]; 
	[_light, [1,0.3,0.1]] remoteExec ["setlightcolor",0,true]; 
	[_light, [0.8,0.3,0.1]] remoteExec ["setlightambient",0,true];
	
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
			private _fakePumpkin = "Land_Pumpkin_01_F" createVehicle [0,0,0];
			_fakePumpkin enableSimulation false; _fakePumpkin allowDamage false;
			_fakePumpkin setPos getPos _target;
			_fakePumpkin setDamage 1;
			deleteVehicle _target;
			deleteVehicle (nearestObject [_target, "#lightpoint"]);
			
			private _random = random 100;
			private _speed = 1.0;
			if (_random < 50) then { //50 %
		        //NOTHINGHAM
				["STR_SCORE_Pumpkin",250] call gonzka_fnc_addBloodpoints;
			} else {
				if (_random < 80) then { //30 %
					["STR_SCORE_PumpkinTreat",10] call gonzka_fnc_addBloodpoints;
					["STR_GAME_Hindered", "STR_GAME_TreatHindered", 6, "textures\ico_pumpkin.paa"] spawn gonzka_fnc_notification;
					_speed = 0.9;
				} else { //20 %
					["STR_SCORE_PumpkinTrick",1000] call gonzka_fnc_addBloodpoints;
					["STR_GAME_Haste", "STR_GAME_TrickHaste", 6, "textures\ico_pumpkin.paa"] spawn gonzka_fnc_notification;
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