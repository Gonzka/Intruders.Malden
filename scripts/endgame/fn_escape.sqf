/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         08.11.2020
	Description:	 The player has escaped

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

intrudersWin = true; publicvariable "intrudersWin";

["Initialize", [player, [civilian], false, true, true, true, true, false]] call BIS_fnc_EGSpectator;

["STR_SCORE_Survived",5000] call gonzka_fnc_addFunds;

//QUEST
quest_escape = true;
if (totems isEqualTo []) then {
    quest_thoroughCleansing = true;
};