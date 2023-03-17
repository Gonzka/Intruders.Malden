/*
    Author:	Gonzka

    Statusbar HUD
*/

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

("statusBar" call BIS_fnc_rscLayer) cutRsc ["statusBar","PLAIN"];

private _display = uiNameSpace getVariable "statusBar";

private _genCounter = _display displayCtrl 4000; 
private _pic1 = _display displayCtrl 4001; 
private _pic2 = _display displayCtrl 4002; 
private _pic3 = _display displayCtrl 4003; 
private _pic4 = _display displayCtrl 4004; 

private _name1 = _display displayCtrl 4005;
private _name2 = _display displayCtrl 4006;
private _name3 = _display displayCtrl 4007;
private _name4 = _display displayCtrl 4008;

private _perk1 = _display displayCtrl 4009;
private _perk2 = _display displayCtrl 4010;
private _perk3 = _display displayCtrl 4011;
private _perk4 = _display displayCtrl 4012;

if (playerSide isEqualTo sideLogic) then {
	(_display displayCtrl 4013) ctrlShow false; //The perk GUI should not be displayed to the player in the Spectator slot
} else {
	private _activePerk1 = player getVariable "intruders_activePerks" select 0;
	if (_activePerk1 isNotEqualTo "") then {
		_perk1 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerk1 >> "icon");
	};
	
	private _activePerk2 = player getVariable "intruders_activePerks" select 1;
	if (_activePerk2 isNotEqualTo "") then {
		_perk2 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerk2 >> "icon");
	};
	
	private _activePerk3 = player getVariable "intruders_activePerks" select 2;
	if (_activePerk3 isNotEqualTo "") then {
		_perk3 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerk3 >> "icon");
	};
	
	private _activePerk4 = player getVariable "intruders_activePerks" select 3;
	if (_activePerk4 isNotEqualTo "") then {
		_perk4 ctrlSetText getText (missionConfigFile >> "VirtualItems" >> _activePerk4 >> "icon");
	};
};

while {true} do {
	_genCounter ctrlSetText format ["\intruders_mod\textures\gui\hud_%1.paa", totalGenerators - count repairedGenerators];
	
	private _players = allPlayers select {side _x isEqualTo civilian};
	private _playerCount = count _players;
	
	if (_playerCount > 0) then {
		[_players select 0,_pic1,_name1] call gonzka_fnc_statusBarPlayers;
	} else { //When a player disconnects
		_pic1 ctrlSetText "";
		_name1 ctrlSetText "";
	};
	
	if (_playerCount > 1) then {
		[_players select 1,_pic2,_name2] call gonzka_fnc_statusBarPlayers;
	} else {
		_pic2 ctrlSetText "";
		_name2 ctrlSetText "";
	};

	if (_playerCount > 2) then {
		[_players select 2,_pic3,_name3] call gonzka_fnc_statusBarPlayers;		
	} else {
		_pic3 ctrlSetText "";
		_name3 ctrlSetText "";
	};
	
	if (_playerCount > 3) then {
		[_players select 3,_pic4,_name4] call gonzka_fnc_statusBarPlayers;	
	} else {
		_pic4 ctrlSetText "";
		_name4 ctrlSetText "";
	};
	
	sleep 1;
};