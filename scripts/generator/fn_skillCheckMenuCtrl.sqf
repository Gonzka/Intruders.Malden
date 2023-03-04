/*
    Author:	Gonzka

    Skill check minigame function for repairing generators
*/

if !(isNull (uiNamespace getVariable "SkillCheckMenu")) exitWith {};

playSound "skillCheckIncoming";
sleep 1;

if !(isNull (uiNamespace getVariable "SkillCheckMenu")) exitWith {};

("SkillCheckMenu" call BIS_fnc_rscLayer) cutRsc ["SkillCheckMenu","PLAIN"];
player setVariable ["BarGoToRight",0];
player setVariable ["BarGoToLeft",1];
((uiNamespace getVariable "SkillCheckMenu")displayCtrl 0150) ctrlSetStructuredText parseText format["<t font='PuristaBold' size='1.5' color='#ffffff' shadow='0'>%1</t>", localize "STR_GAME_SkillCheck"];

skillcheckEH = findDisplay 46 displayAddEventHandler ["MouseButtonDown", {
	private _button = _this select 1;
	if (_button isEqualTo 0) then {
		call key_check
	};
}];

[] spawn {	
	while { !isNull (uiNamespace getVariable "SkillCheckMenu") } do {	
		private _ctrl = ((uiNamespace getVariable "SkillCheckMenu")displayCtrl 0100);
		private _ctrlPos = ctrlposition _ctrl;
		( ctrlPosition _ctrl ) params[ "_grpX", "_grpY", "_grpW", "_grpH" ];
	
		if (_grpX <= (0.3 * safezoneW + safezoneX) && player getVariable "BarGoToRight" isEqualTo 0) then { // 0.0151516
			player setVariable ["BarGoToRight",1];
			player setVariable ["BarGoToLeft",0];
			_ctrl ctrlSetPosition [0.698 * safezoneW + safezoneX, 0.48 * safezoneH + safezoneY];
			_ctrl ctrlCommit 1;
			waitUntil {ctrlCommitted _ctrl};
		};
	
		if (_grpX >= (0.698 * safezoneW + safezoneX) && player getVariable "BarGoToLeft" isEqualTo 0) then { // 0.984849
			player setVariable ["BarGoToRight",0];
			player setVariable ["BarGoToLeft",1];
			_ctrl ctrlSetPosition [0.3 * safezoneW + safezoneX, 0.48 * safezoneH + safezoneY];
			_ctrl ctrlCommit 1;
			waitUntil {ctrlCommitted _ctrl};
		};
	};
	[false] call key_hit;
};

skillCheckSize = 0.06;
if (toolboxCharges > 0) then { //TOOLBOX ITEM
	skillCheckSize = 0.08;
};

private _adapthorizontal = 0.698 - skillCheckSize;
private _randompos = [0.300,_adapthorizontal] call BIS_fnc_randomNum;

((uiNamespace getVariable "SkillCheckMenu")displayCtrl 0050) ctrlSetPosition [_randompos * safezoneW + safezoneX, 0.48 * safezoneH + safezoneY, skillCheckSize * safezoneW, 0.04 * safezoneH];
((uiNamespace getVariable "SkillCheckMenu")displayCtrl 0050) ctrlCommit 0;

key_check = {
	if (isNull (uiNamespace getVariable "SkillCheckMenu")) exitWith { skillCheck_hit = false; findDisplay 46 displayRemoveEventHandler ["MouseButtonDown", skillcheckEH]; };
	
	private _ctrl = ((uiNamespace getVariable "SkillCheckMenu")displayCtrl 0100);
	private _ctrlPos = ctrlposition _ctrl;
	( ctrlPosition _ctrl ) params[ "_grpX", "_grpY", "_grpW", "_grpH" ];
	
	private _ctrl2 = ((uiNamespace getVariable "SkillCheckMenu")displayCtrl 0050);
	private _ctrlPos2 = ctrlposition _ctrl;
	( ctrlPosition _ctrl2 ) params[ "_grpX2", "_grpY2", "_grpW2", "_grpH2" ];

	//TOOLBOX ITEM
	if (toolboxCharges > 0) then { 
		toolboxCharges = toolboxCharges - 1;
	};
	if (toolboxCharges <= 0) then {
		skillCheckSize = 0.06;
	};
	
	if ((_grpX >= _grpX2) && (_grpX <= (_grpX2 + (skillCheckSize * safezoneW)))) then {
		[true] call key_hit;
	} else {
		[false] call key_hit;
	};
};

key_hit = {
	params [
		["_success", false, [false]]
	];
	
	if (skillCheck_hit) exitWith { skillCheck_hit = false; };
	skillCheck_hit = true;
	
	findDisplay 46 displayRemoveEventHandler ["MouseButtonDown", skillcheckEH];
	("SkillCheckMenu" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
	
	if (_success) then {
		quest_skillCheckCombo = quest_skillCheckCombo + 1; //QUEST
		playSound "skillCheckSuccess";	
		["STR_SCORE_SkillCheck",100] call gonzka_fnc_addBloodpoints;
	} else {
		quest_skillCheckCombo = 0; //QUEST
		playSound "skillCheckFail";
		if ("technician" in (player getVariable "intruders_activePerks") && random 100 < 50) exitWith {}; //Technician Survivor Perk (Prevents the Generator Explosion)
		[] spawn gonzka_fnc_genFail;
	};
};