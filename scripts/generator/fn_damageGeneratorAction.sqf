/*
    Author:	Gonzka

    Damage the generator as a killer to make it regress
*/

private _brutalStrengthMultiplier = 1;
if ("brutalStrength" in (player getVariable "intruders_activePerks")) then {
	_brutalStrengthMultiplier = 1.2;
};

{
	[
		_x,
		localize "STR_GAME_Damage",
		"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
		"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
		"_this distance _target < 2 && {side _this isEqualTo east} && {!(_target in repairedGenerators)} && {!endgameActivated} && {_target getVariable 'duration' < 60} && {isNull (_target getVariable ['isRepairedBy', objNull])} && {!(_target getVariable ['isRegressing', false])}",
		"_this distance _target < 2",
		{
			[["Intruders", "damagingGenerators"], 15,"",35,"",true,true,true,true] call BIS_fnc_advHint;
		},
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
} forEach generators;