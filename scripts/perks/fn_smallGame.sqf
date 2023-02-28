/*
    Author:	Gonzka

    Small Game Survivor Perk
*/

if !("smallGame" in (player getVariable "intruders_activePerks")) exitWith {};

while {alive player} do {
    if (totems isEqualTo []) exitWith {};
    {
        if (player distance _x <= 12 && {[position player, call gonzka_fnc_getCameraViewDir, 45, position _x] call BIS_fnc_inAngleSector}) exitWith {
            playSound "premonition";
            ["STR_ITEM_SmallGame", "STR_GAME_SmallGameWarning", 5, "textures\ico_smallGame.paa"] spawn gonzka_fnc_notification;
            sleep 9.5;
        };
    } forEach totems;
    sleep 0.5;
};