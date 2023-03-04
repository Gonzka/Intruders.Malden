/*
    Author:	Gonzka

    Sends to the OptionWheelMenu which voicelines the character has
*/

private _voicelines = [["",""]];

switch (face player) do {
	case "GreekHead_A3_04": {
		_voicelines = [
			[localize "STR_VL_Helmut1","voiceline_helmut_1"],
			[localize "STR_VL_Helmut2","voiceline_helmut_2"],
			[localize "STR_VL_Helmut3","voiceline_helmut_3"],
			[localize "STR_VL_Helmut4","voiceline_helmut_4"],
			[localize "STR_VL_Helmut5","voiceline_helmut_5"],
			[localize "STR_VL_Helmut6","voiceline_helmut_6"],
			[localize "STR_VL_Helmut7","voiceline_helmut_7"],
			[localize "STR_VL_Helmut8","voiceline_helmut_8"],
			[localize "STR_VL_Helmut9","voiceline_helmut_9"]
		];
	};
	case "WhiteHead_26": {
		_voicelines = [
			[localize "STR_VL_Stanislaw1","voiceline_stanislaw_1"],
			[localize "STR_VL_Stanislaw2","voiceline_stanislaw_2"],
			[localize "STR_VL_Stanislaw3","voiceline_stanislaw_3"],
			[localize "STR_VL_Stanislaw4","voiceline_stanislaw_4"],
			[localize "STR_VL_Stanislaw5","voiceline_stanislaw_5"],
			[localize "STR_VL_Stanislaw6","voiceline_stanislaw_6"],
			[localize "STR_VL_Stanislaw7","voiceline_stanislaw_7"],
			[localize "STR_VL_Stanislaw8","voiceline_stanislaw_8"],
			[localize "STR_VL_Stanislaw9","voiceline_stanislaw_9"]
		];
	};
	case "GreekHead_A3_11": {
		_voicelines = [
			[localize "STR_VL_Rammel1","voiceline_rammel_1"],
			[localize "STR_VL_Rammel2","voiceline_rammel_2"],
			[localize "STR_VL_Rammel3","voiceline_rammel_3"],
			[localize "STR_VL_Rammel4","voiceline_rammel_4"],
			[localize "STR_VL_Rammel5","voiceline_rammel_5"],
			[localize "STR_VL_Rammel6","voiceline_rammel_6"],
			[localize "STR_VL_Rammel7","voiceline_rammel_7"],
			[localize "STR_VL_Rammel8","voiceline_rammel_8"],
			[localize "STR_VL_Rammel9","voiceline_rammel_9"]
		];
	};
	case "PersianHead_A3_02": {
		_voicelines = [
			[localize "STR_VL_Sandro1","voiceline_sandro_1"],
			[localize "STR_VL_Sandro2","voiceline_sandro_2"],
			[localize "STR_VL_Sandro3","voiceline_sandro_3"],
			[localize "STR_VL_Sandro4","voiceline_sandro_4"],
			[localize "STR_VL_Sandro5","voiceline_sandro_5"],
			[localize "STR_VL_Sandro6","voiceline_sandro_6"],
			[localize "STR_VL_Sandro7","voiceline_sandro_7"],
			[localize "STR_VL_Sandro8","voiceline_sandro_8"],
			[localize "STR_VL_Sandro9","voiceline_sandro_9"]
		];
	};
	case "Bruce": {
		_voicelines = [
			[localize "STR_VL_Bruce1","voiceline_bruce_1"],
			[localize "STR_VL_Bruce2","voiceline_bruce_2"],
			[localize "STR_VL_Bruce3","voiceline_bruce_3"],
			[localize "STR_VL_Bruce4","voiceline_bruce_4"],
			[localize "STR_VL_Bruce5","voiceline_bruce_5"],
			[localize "STR_VL_Bruce6","voiceline_bruce_6"],
			[localize "STR_VL_Bruce7","voiceline_bruce_7"]
		];
	};
	case "Hladas": {
		_voicelines = [
			[localize "STR_VL_Opterix1","voiceline_opterix_1"],
			[localize "STR_VL_Opterix2","voiceline_opterix_2"],
			[localize "STR_VL_Opterix3","voiceline_opterix_3"],
			[localize "STR_VL_Opterix4","voiceline_opterix_4"],
			[localize "STR_VL_Opterix5","voiceline_opterix_5"],
			["Schmidti, Schmidtiii","voiceline_opterix_6"]
		];
	};
};

[_voicelines,{
	private _sound = _this select 1;
	if (_sound isEqualTo "" || {player getVariable ["voiceActive", false]} || {!alive player} || {player getVariable ["BIS_revive_incapacitated", false]}) exitWith {};

	[player,[_sound,50]] remoteExecCall ["say3D"];
	player setVariable ["voiceActive",true,true];
	[_sound] spawn {
		sleep 10;
		player setVariable ["voiceActive",false,true];
	};
},0.4,0.5] call gonzka_fnc_setWheel;