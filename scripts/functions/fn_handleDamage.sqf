/*
    Author:	Gonzka

    Handles damage
*/

params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

if (!isNull _source && {_source != _unit} && {_projectile isEqualTo "B_545x39_Ball_F"} && {playerSide isEqualTo east} && {!knockout}) then {
    [_unit,_source] spawn gonzka_fnc_rifleStun;
};

damage _unit //NO DAMAGE