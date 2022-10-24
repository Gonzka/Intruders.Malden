/*
    Author:	Gonzka

    Handles various different ammo types being fired
*/

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if (_ammo isEqualTo "GrenadeHand_stone") then {
    [_projectile,_unit] spawn {
        _projectile = _this select 0;
        _unit = _this select 1;
        private "_position";
        while {!isNull _projectile} do {
            _position = ASLtoATL (visiblePositionASL _projectile);
            sleep 0.1;
        };
        [_position,_unit] remoteExec ["gonzka_fnc_flashbang", [0, -2] select isDedicated];
    };
};

if (_unit ammo _weapon == 0) then { //IF RIFLE IS EMPTY
    _unit removeWeapon _weapon;
};