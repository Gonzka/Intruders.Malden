/*
    Author:	Gonzka

    Master addAction file handler for all client-based actions.
*/

//PERKS & ABILITIES
if (playerSide isEqualTo east) then {
	player addAction["<img image='textures\ico_abilityWendigo.paa'/> " + localize "STR_GAME_WendigoAbilityAction",gonzka_fnc_cloak,"",0,false,true,"",' !cloakingCooldown && player getVariable "killer" isEqualTo "wendigo" '];
	player addAction["<img image='textures\ico_abilityButcher.paa'/> " + localize "STR_GAME_ButcherAbilityAction",gonzka_fnc_setBeartrap,"",0,false,true,"",' beartraps > 0 && player getVariable "killer" isEqualTo "butcher" '];
};

player addAction["<img image='textures\ico_unbreakable.paa'/> " + localize "STR_GAME_UnbreakableAction",{unbreakable = true; ["#rev", 1, player] call BIS_fnc_reviveOnState;},"",0,false,true,"",' "unbreakable" in (player getVariable "intruders_activePerks") && !unbreakable && player getVariable ["BIS_revive_incapacitated", false] ',50,true];
//player addAction["<img image='textures\ico_sprintBurst.paa'/> " + localize "STR_GAME_SprintBurstAction",gonzka_fnc_sprintBurst,"",0,false,true,"",' "sprintBurst" in (player getVariable "intruders_activePerks") && !exhausted && speed player > 10 ']; //Action replaced with Shift Hotkey

//SELF HEAL
player addAction["<img image='textures\ico_firstAidKit.paa'/> " + localize "STR_GAME_SelfHealAction",gonzka_fnc_selfHeal,"",0,false,true,"",' firstAidKits > 0 && damage player > 0 && !(player getVariable ["BIS_revive_incapacitated", false]) '];

//LOCKPICKING
player addAction["<img image='textures\gui\hud_escape.paa'/> " + localize "STR_GAME_LockpickAction",{[cursorObject] call pizza_fnc_lockpick},"",6,false,true,"",' cursorObject in [escapeVehicle_1, escapeVehicle_2] && player distance cursorObject < 5 && (locked cursorObject) > 1 && side player isEqualTo civilian '];

//ITEMS
player addAction["<img image='textures\ico_smokeBomb.paa'/> " + localize "STR_GAME_SmokeBombAction",{smokeBombs = smokeBombs - 1; [player] remoteExec ["gonzka_fnc_smokeBomb", [0, -2] select isDedicated];},"",0,false,true,"",' smokeBombs > 0 '];
player addAction["<img image='textures\ico_firecrackers.paa'/> " + localize "STR_GAME_FirecrackersAction",{firecrackers = firecrackers - 1; [] spawn gonzka_fnc_firecracker;},"",0,false,true,"",' firecrackers > 0 '];
player addAction["<img image='textures\ico_circuit.paa'/> " + localize "STR_GAME_CircuitAction",{
	circuits = circuits - 1;
	_circuitCharges = cursorObject getVariable ["circuitCharges",0];
	_circuitCharges = _circuitCharges + 1; cursorObject setVariable ["circuitCharges",_circuitCharges,true];
	
	private _circuitSound = selectRandom ["a3\missions_f_oldman\data\sound\light_switch\light_switch_01.wss","a3\missions_f_oldman\data\sound\light_switch\light_switch_02.wss","a3\missions_f_oldman\data\sound\light_switch\light_switch_03.wss"];
	playSound3D [_circuitSound, player, false, getPosASL cursorObject, 4, 1, 20];
},"",0,false,true,"",' circuits > 0 && cursorObject isKindOf "Land_TransferSwitch_01_F" && cursorObject distance player < 2 && !(cursorObject getVariable ["active",true]) '];

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
		["STR_SCORE_TrapEscape",500] call gonzka_fnc_addFunds;
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
	"_this distance _target < 2 && side _this != east && _this != _target && damage _target > 0 && !(_target getVariable ['BIS_revive_incapacitated', false]) && alive _target",
	"_this distance _target < 2 && side _this != east && _this != _target && damage _target > 0 && !(_target getVariable ['BIS_revive_incapacitated', false]) && alive _target",
	{
		_caller playMoveNow "AinvPknlMstpSlayWpstDnon_medicOther";
	},
	{},
	{
		_target setDamage 0;
		["STR_SCORE_Heal",500] remoteExecCall ["gonzka_fnc_addFunds", _caller];
		
		//QUEST
		//private _heals = _caller getVariable "quest_heals";
		//_caller setVariable ["quest_heals",_heals + 1,true];
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
[
	player,
	localize "STR_GAME_Destroy",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
	"count (nearestObjects [player, ['Intruders_Object_Palett'], 3]) > 0 && ((nearestObjects [player, ['Intruders_Object_Palett'], 3]) select 0) animationPhase 'Door_1' isEqualTo 1 && side _this isEqualTo east",
	"count (nearestObjects [player, ['Intruders_Object_Palett'], 3]) > 0 && ((nearestObjects [player, ['Intruders_Object_Palett'], 3]) select 0) animationPhase 'Door_1' isEqualTo 1 && side _this isEqualTo east",
	{
		blockMainWeapon = true; 
	},
	{},
	{
		private _nearestPaletts = nearestObjects [player, ["Intruders_Object_Palett"], 3];
		if !(_nearestPaletts isEqualTo []) then {
			player playAction "GestureSwing";
			[player, selectRandom ["weaponSwing_1","weaponSwing_2","weaponSwing_3","weaponSwing_4","weaponSwing_5","weaponSwing_6","weaponSwing_7"]] remoteExecCall ["say3D"];
			
			private _palett = _nearestPaletts select 0;
			private _soundSrc = "Land_HelipadEmpty_F" createVehicle getPos _palett;			
			
			[_soundSrc, selectRandom ["palletBreak_1", "palletBreak_2", "palletBreak_3"]] remoteExecCall ["say3D"];
			
			deleteVehicle _palett;
			blockMainWeapon = false;
			["STR_SCORE_Destruction",100] call gonzka_fnc_addFunds;
			
			[_soundSrc] spawn {
				sleep 1.5;
				deleteVehicle (_this select 0);
			};
		};
	},
	{
		blockMainWeapon = false;
	},
	[],
	2,
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
	"count (nearestObjects [player, ['Intruders_Object_Palett'], 3]) > 0 && ((nearestObjects [player, ['Intruders_Object_Palett'], 3]) select 0) animationPhase 'Door_1' isEqualTo 0 && side _this isEqualTo civilian",
	"count (nearestObjects [player, ['Intruders_Object_Palett'], 3]) > 0 && ((nearestObjects [player, ['Intruders_Object_Palett'], 3]) select 0) animationPhase 'Door_1' isEqualTo 0 && side _this isEqualTo civilian",
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
					
					["STR_SCORE_Stun",250] remoteExecCall ["gonzka_fnc_addFunds",player];

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