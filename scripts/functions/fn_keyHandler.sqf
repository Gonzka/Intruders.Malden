/*
    Author:	Gonzka

    Main key handler for event 'keyDown'
*/

params [
    "_ctrl",
    "_code",
    "_shift",
    "_ctrlKey",
    "_alt"
];

private _handled = false;

//DISABLED KEYS
private _blacklistedKeys = [
	"AdjustUp",
	"AdjustDown",
	"AdjustLeft",
	"AdjustRight",
	"Salute",
	"SitDown",
	"TactToggle"	
];
if (({inputAction _x > 0} count _blacklistedKeys) > 0) exitWith {
	true;
};

//DISABLES TO LAY DOWN FOR THE KILLER, BUT STANDING UP IS POSSIBLE
if (playerSide isEqualTo east && {stance player != "PRONE"} && {inputAction "MoveDown" > 0}) exitWith {
	true;
};

//ANTI KILLER HOLSTER WEAPON (LAUNCHER)
if (playerSide isEqualTo east && {inputAction "toggleRaiseWeapon" > 0}) exitWith {
	true;
};

//SPRINT BURST (L.SHIFT)
if (playerSide isEqualTo civilian && {inputAction "turbo" > 0} && {!exhausted} && {speed player > 10}) then {
	[] spawn gonzka_fnc_sprintburst;
};

switch (_code) do {
	//Holster weapon (0)
	case 11: {
		if (playerSide isEqualTo east) exitWith {};
		if !(currentWeapon player isEqualTo "") then {
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};
	};
	
	//V key for Jumping
	case 47: {
		if (playerSide isEqualTo east) exitWith {};
		if (isNil "jumpActionTime") then {jumpActionTime = 0;};
		if (!(animationState player isEqualTo "AovrPercMrunSrasWrflDf") && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 10} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player] remoteExec ["gonzka_fnc_jumpFnc",0]; //Global execution
			_handled = true;
		};
	};
};

_handled;