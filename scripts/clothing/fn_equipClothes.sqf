/*
    File: fn_buyClothes.sqf
    Author: Bryan "Tonic" Boardwine | edit by Deathman/Mr.Frost

    Description:
    Buys the current set of clothes and closes out of the shop interface.
*/

if ((tvCurSel 3101) isEqualTo -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

clothesEquiped = true;
[] call gonzka_fnc_playerSkins;
[] spawn gonzka_fnc_setVoicelines;

["STR_GAME_SkinUpdated", "STR_GAME_SkinSaved", 5, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa"] spawn gonzka_fnc_notification;