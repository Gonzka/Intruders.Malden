/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         08.12.2021
	Description:	 Premonition Survivor Perk

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("premonition" in (player getVariable "intruders_activePerks")) exitWith {};

while {alive player} do {
    waitUntil {[position player, getDir player, 45, position Killer] call BIS_fnc_inAngleSector && (player distance Killer) <= 36};
    playSound "premonition";
	["STR_ITEM_Premonition", "STR_GAME_PremonitionWarning", 5, "textures\ico_premonition.paa"] spawn gonzka_fnc_notification;
    sleep 30; //COOLDOWN
};