/*
    Author:	Gonzka

    Premonition Survivor Perk
*/

if !("premonition" in (player getVariable "intruders_activePerks")) exitWith {};

while {alive player} do {
    if (player distance Killer <= 36 && {[position player, call gonzka_fnc_getCameraViewDir, 45, position Killer] call BIS_fnc_inAngleSector}) then {
        playSound "premonition";
        ["STR_ITEM_Premonition", "STR_GAME_PremonitionWarning", 5, "textures\ico_premonition.paa"] spawn gonzka_fnc_notification;
        sleep 30;
    } else {
        sleep 0.5;
    };
};