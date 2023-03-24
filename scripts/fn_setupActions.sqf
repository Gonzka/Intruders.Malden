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

call gonzka_fnc_freeBeartrapAction;
call gonzka_fnc_breakPalletAction;
call gonzka_fnc_damageGeneratorAction;