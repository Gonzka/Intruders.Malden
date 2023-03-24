/*
    Author:	Gonzka

    The killer can destroy dropped pallets
*/

private _brutalStrengthMultiplier = 1;
if ("brutalStrength" in (player getVariable "intruders_activePerks")) then {
	_brutalStrengthMultiplier = 1.2;
};

[
	player,
	localize "STR_GAME_Destroy",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"count (nearestObjects [player, ['Intruders_Object_Palett'], 3]) > 0 && {((nearestObjects [player, ['Intruders_Object_Palett'], 3]) select 0) animationPhase 'Door_1' isEqualTo 1} && {side _this isEqualTo east}",
	"count (nearestObjects [player, ['Intruders_Object_Palett'], 3]) > 0",
	{},
	{},
	{
		private _nearestPaletts = nearestObjects [player, ["Intruders_Object_Palett"], 3];
		if !(_nearestPaletts isEqualTo []) then {		
			private _palett = _nearestPaletts select 0;
			deleteVehicle _palett;

			private _soundSrc = "Land_HelipadEmpty_F" createVehicle getPos _palett;			
			[_soundSrc, selectRandom ["palletBreak_1", "palletBreak_2", "palletBreak_3"]] remoteExecCall ["say3D"];
			
			player playAction "GestureSwing";
			[player, selectRandom ["weaponSwing_1","weaponSwing_2","weaponSwing_3","weaponSwing_4","weaponSwing_5","weaponSwing_6","weaponSwing_7"]] remoteExecCall ["say3D"];

			["STR_SCORE_Destruction",100] call gonzka_fnc_addBloodpoints;

			[] remoteExecCall ["gonzka_fnc_alert", civilian]; //Survivor Perk
			
			[_soundSrc] spawn {
				sleep 1.5;
				deleteVehicle (_this select 0);
			};
		};
	},
	{},
	[],
	2.6 / _brutalStrengthMultiplier,
	nil,
	false,
	false
] call BIS_fnc_holdActionAdd;