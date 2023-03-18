/*
    Author:	Gonzka

    Master addAction file handler for all client-based actions.
*/

//LOCKPICKING
player addAction["<img image='\intruders_mod\textures\gui\hud_escape.paa'/> " + localize "STR_GAME_LockpickAction",{[cursorObject] call pizza_fnc_lockpick},"",6,false,true,"",' cursorObject in [escapeVehicle_1, escapeVehicle_2] && player distance cursorObject < 5 && (locked cursorObject) > 1 && side player isEqualTo civilian '];

//ITEMS
player addAction["<img image='textures\ico_firstAidKit.paa'/> " + localize "STR_GAME_SelfHealAction",gonzka_fnc_firstAidKit,"",0,false,true,"",' firstAidKits > 0 && damage player > 0 && !(player getVariable ["BIS_revive_incapacitated", false]) '];
player addAction["<img image='textures\ico_smokeBomb.paa'/> " + localize "STR_GAME_SmokeBombAction",{smokeBombs = smokeBombs - 1; [player] remoteExec ["gonzka_fnc_smokeBomb", [0, -2] select isDedicated];},"",0,false,true,"",' smokeBombs > 0 '];
player addAction["<img image='textures\ico_firecrackers.paa'/> " + localize "STR_GAME_FirecrackersAction",{firecrackers = firecrackers - 1; [] spawn gonzka_fnc_firecracker;},"",0,false,true,"",' firecrackers > 0 '];
player addAction["<img image='textures\ico_vitalCapsule.paa'/> " + localize "STR_GAME_VitalCapsuleAction",{vitalCapsules = vitalCapsules - 1; [] spawn gonzka_fnc_vitalCapsule;},"",0,false,true,"",' vitalCapsules > 0 && {_x getVariable ["BIS_revive_incapacitated", false] || lifeState _x isEqualTo "INCAPACITATED"} count playableUnits - [player, Killer] > 0 && !(player getVariable ["BIS_revive_incapacitated", false]) '];

//FREE FROM BEAR TRAP
[
	player,
	localize "STR_GAME_FreeFromTrap",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"str attachedObjects player find 'beartrap' != -1",
	"str attachedObjects player find 'beartrap' != -1",
	{},
	{},
	{
		call gonzka_fnc_detachBeartrap; [player,""] remoteExec ["switchMove"];
		["STR_SCORE_TrapEscape",500] call gonzka_fnc_addBloodpoints;
	},
	{},
	[],
	15,
	nil,
	false,
	false
]  call BIS_fnc_holdActionAdd;

//HEAL BY OTHER PLAYERS
[
	player,
	localize "STR_SCORE_Heal",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"_this distance _target < 2 && {damage _target > 0} && {!(_target getVariable ['BIS_revive_incapacitated', false])} && {alive _target} && {side _this != east} && {_this != _target}",
	"_this distance _target < 2 && {damage _target > 0} && {!(_target getVariable ['BIS_revive_incapacitated', false])} && {alive _target}",
	{
		_caller playMoveNow "AinvPknlMstpSlayWpstDnon_medicOther";
	},
	{},
	{
		_target setDamage 0;
		["STR_SCORE_Heal",500] remoteExecCall ["gonzka_fnc_addBloodpoints", _caller];
		
		//QUEST
		private _heals = _caller getVariable "quest_heals";
		_caller setVariable ["quest_heals",_heals + 1,true];
	},
	{
		[_caller, ""] remoteExec ["switchMove"];
	},
	[],
	8,
	nil,
	false,
	false
] remoteExec ["BIS_fnc_holdActionAdd", 0, player];

//BREAK PALLET
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
]  call BIS_fnc_holdActionAdd;

//DROP PALLET
[
	player,
	localize "STR_GAME_PullDown",
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa",
	"count (nearestObjects [player, ['Intruders_Object_Palett'], 3]) > 0 && {((nearestObjects [player, ['Intruders_Object_Palett'], 3]) select 0) animationPhase 'Door_1' isEqualTo 0} && {side _this isEqualTo civilian}",
	"((nearestObjects [player, ['Intruders_Object_Palett'], 3]) select 0) animationPhase 'Door_1' isEqualTo 0",
	{},
	{},
	{
		{
			if (_x animationPhase "Door_1" isEqualTo 1) then {
				_x animateSource ["Door_1", 0];
			} else {
				_x animateSource ["Door_1", 1];
				[_x, selectRandom ["palletDrop_1", "palletDrop_2", "palletDrop_3"]] remoteExecCall ["say3D"];
				
				//PALETT STUN
				if (Killer distance _x < 2) then {
					[] remoteExec ["gonzka_fnc_palettStun",Killer];
					
					["STR_SCORE_Stun",1000] remoteExecCall ["gonzka_fnc_addBloodpoints",player];

					//QUEST
					private _stuns = player getVariable "quest_stuns";
					player setVariable ["quest_stuns",_stuns + 1,true];
				};
			};
		} forEach (nearestObjects [player, ["Intruders_Object_Palett"], 3]); 
	},
	{},
	[],
	0.1,
	nil,
	false,
	false
]  call BIS_fnc_holdActionAdd;