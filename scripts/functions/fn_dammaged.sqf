/*
    Author:	Gonzka

    Triggered when the unit is damaged
*/

params [
    ["_unit",objNull,[objNull]]
];

if (_unit getVariable ["BIS_revive_incapacitated", false]) then {
	[_unit] spawn {
		_unit = _this select 0;
		if (!knockout) then {
			knockout = true;
			
			incapacitatedCounter = incapacitatedCounter + 1;
			if (incapacitatedCounter >= 3) then {
				_unit setDamage 1;
			} else {
				["STR_SCORE_Incapacitated",500] remoteExecCall ["gonzka_fnc_addBloodpoints",east];
				[] remoteExec ["gonzka_fnc_jamAndBanana",east]; //Jam and Banana Killer Perk
				
				//QUEST
				private _knockDowns = Killer getVariable "quest_knockDowns";
				Killer setVariable ["quest_knockDowns",_knockDowns + 1,true];
				
				["knockedDown_1"] remoteExecCall ["playSound", [0, -2] select isDedicated];
				[["Intruders", "bleedingOut"], 15,"",35,"",true,true,true,true] remoteExecCall ["BIS_fnc_advHint", [0, -2] select isDedicated];
			};
			
			call gonzka_fnc_detachBeartrap; //IF TRAPPED IN BEARTRAP
			
			sleep 4;
			knockout = false;
		};
	};
};