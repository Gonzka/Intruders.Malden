/*
    File: fn_buyClothes.sqf
    Author: Bryan "Tonic" Boardwine | edit by Deathman/Mr.Frost

    Description:
    Buys the current set of clothes and closes out of the shop interface.
*/

if ((tvCurSel 3101) isEqualTo -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

clothesEquiped = true;
[] call gonzka_fnc_playerSkins;
closeDialog 0;
