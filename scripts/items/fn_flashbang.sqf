/*
    Author:	Tonic modified by Gonzka

    Creates the effect when a player is hit by a flashbang
*/

params [
    ["_pos", [], [[]]],
	["_unit", objNull, [objNull]]
];

if (_pos isEqualTo []) exitWith {};
if (player distance _pos > 10) exitWith {};

_pos set[2,(_pos select 2)+0.2];
if (lineIntersects [eyePos player, ATLtoASL _pos,player]) exitWith {};

private _eyeDir = eyeDirection player;
private _pPos = getPosATL player;
private _impactPos = [(_pos select 0)-(_pPos select 0),(_pos select 1)-(_pPos select 1),(_pos select 2)-(_pPos select 2)];
private _norm = sqrt((_impactPos select 0)^2+(_impactPos select 1)^2+(_impactPos select 2)^2);
private _angle = aCos ((_eyeDir select 0)*((_impactPos select 0) / _norm)+((_impactPos select 1) / _norm)*(_eyeDir select 1)+((_impactPos select 2) / _norm)*(_eyeDir select 2));

if (_angle < 90) then {
    //SCORING
    if (playerSide isEqualTo east) then {
        ["STR_SCORE_Blind",1000] remoteExec ["gonzka_fnc_addBloodpoints",_unit];
        
        //QUEST
        private _stuns = _unit getVariable "quest_stuns";
        _unit setVariable ["quest_stuns",_stuns + 1,true];
    };
    
    playSound "combat_deafness";
    private _blurEffect = ppEffectCreate ["DynamicBlur",500];
    _blurEffect ppEffectForceInNVG true;
    _blurEffect ppEffectEnable true;

    //Create white-screen
    private _ppEffect = ppEffectCreate ["ColorCorrections",2500];
    _ppEffect ppEffectAdjust [1, 1, -0.01, [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]];
    _ppEffect ppEffectCommit 0.1;
    _ppEffect ppEffectEnable true;
    _ppEffect ppEffectForceInNVG true;
    _blurEffect ppEffectAdjust [3];
    _blurEffect ppEffectCommit 0.2;
    sleep 3;

    _ppEffect ppEffectAdjust [1, 1, -0.02, [4.5, 3.5, 1.6, -0.02],[1.8, 1.6, 1.6, 1],[-1.5,0,-0.2,1]];
    _ppEffect ppEffectCommit 1;
    _blurEffect ppEffectAdjust [0];
    _blurEffect ppEffectCommit 1;
    sleep 1;
    _ppEffect ppEffectEnable false;
    ppEffectDestroy _ppEffect;
    _blurEffect ppEffectEnable false;
    ppEffectDestroy _blurEffect;
} else {
    //SCORING
    if (playerSide isEqualTo east) then {
        ["STR_SCORE_Evasion",250] call gonzka_fnc_addBloodpoints;
    };
};