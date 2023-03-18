/*
    Author:	Gonzka

    Creates an interaction with a generator
*/

params [
    ["_generator", objNull, [objNull]]
];

private _actionID = [ 
	_generator, 
	localize "STR_GAME_Repair",  
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
	"_this distance _target < 2 && {side _this isEqualTo civilian} && {!endgameActivated} && {_target getVariable ['isRepairedBy', objNull] in [objNull, _this]}",
	"_this distance _target < 2",
	{
		_target setVariable ["isRepairedBy", _caller, true];
		_caller playMoveNow "Acts_carFixingWheel";
	},  
    {
		params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
		
		if (endgameActivated) exitWith { [_caller, ""] remoteExec ["switchMove"]; };
		if (_progress < 2) exitWith { _target setVariable ["duration", _duration, true]; repairTime = 0; }; //Anti-Holdaction Space Spam
		if (_progress == 2) then { _target setObjectTextureGlobal [1, "#(argb,8,8,3)color(1,1,0,1,ca)"]; }; //A generator with repair progress lights yellow

		private _elapsedTime = _progress / 24 * _duration;
		_target setVariable ["duration", _duration - _elapsedTime, true];
		
		private _tickTime = 1 / 24 * _duration;
		if (random 100 < _tickTime * 8) then {
			[] spawn gonzka_fnc_skillCheckMenuCtrl;
		};
		
		if (animationState _caller != "Acts_carFixingWheel") then {
			_caller playMoveNow "Acts_carFixingWheel";
		};
		
		repairTime = _elapsedTime; //For the score calculation of the bloodpoints
	},
	{
		[] spawn gonzka_fnc_genActivate;
		[_caller, ""] remoteExec ["switchMove"];

		["STR_SCORE_Repairs", round(repairTime * 20.83)] call gonzka_fnc_addBloodpoints; repairTime = 0; //Score
	},
	{
		[_target, _target getVariable "duration"] remoteExecCall ["gonzka_fnc_setHoldActionDuration", [0, -2] select isDedicated];
		_target setVariable ["isRepairedBy", objNull, true];
		[_caller, ""] remoteExec ["switchMove"];
		
		["STR_SCORE_Repairs", round(repairTime * 20.83)] call gonzka_fnc_addBloodpoints; repairTime = 0; //Score
		
		if (!isNil "totem_hex_ruin" && {!isObjectHidden totem_hex_ruin}) then { //Ruin Killer Perk (Hex)
			[_target, 1, true] spawn gonzka_fnc_genRegression;
			["hex_ruin", totem_hex_ruin] call gonzka_fnc_revealHex;
		};
	},
	[],  
	60,
	nil,  
	true,  
	false 
] call BIS_fnc_holdActionAdd;	

_generator setVariable ["actionID", _actionID, true];

//Damage the generator as a killer to make it regress
private _brutalStrengthMultiplier = 1;
if ("brutalStrength" in (player getVariable "intruders_activePerks")) then {
	_brutalStrengthMultiplier = 1.2;
};
[
	_generator,
	localize "STR_GAME_Damage",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"_this distance _target < 2 && {side _this isEqualTo east} && {!(_target in repairedGenerators)} && {!endgameActivated} && {_target getVariable 'duration' < 60} && {isNull (_target getVariable ['isRepairedBy', objNull])} && {!(_target getVariable ['isRegressing', false])}",
	"_this distance _target < 2",
	{},
	{},
	{
		[_target] spawn gonzka_fnc_genRegression;
		
		playSound3D [selectRandom ["a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_1.wss", "a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_2.wss", "a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_3.wss", "a3\sounds_f\vehicles\crashes\cars\quadbike_crash_default_4.wss"], _target, false, getPosASL _target, 5, 1, 40];
		["STR_SCORE_DamageGenerator",100] call gonzka_fnc_addBloodpoints;
		
		player playAction "GestureSwing";
		[player, selectRandom ["weaponSwing_1","weaponSwing_2","weaponSwing_3","weaponSwing_4","weaponSwing_5","weaponSwing_6","weaponSwing_7"]] remoteExecCall ["say3D"];

		[] remoteExecCall ["gonzka_fnc_alert", civilian]; //Survivor Perk
		[] spawn gonzka_fnc_nowhereToHide;
	},
	{},
	[],
	2 / _brutalStrengthMultiplier,
	nil,
	false,
	false
]  call BIS_fnc_holdActionAdd;