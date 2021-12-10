/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         25.01.2021
	Description:	 Displays the scored points of all players

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

private _scoreTable = [];
{
	_scoreTable pushBack [_x getVariable "bloodPoints", name _x, _x getVariable "intruders_activePerks"];
} forEach allPlayers;

_scoreTable sort false;
	
private _text = format ["<t font='PuristaMedium'><t color='#B32121'><t size='1.8'><t align='center'>%1<br/><br/><t color='#ffffff'><img image='textures\ico_winner.paa'/><t size='1.4'> ",toUpper localize "STR_SCORE_BloodPoints"];

{
	_text = _text + format ["%1: %2",_x select 1, _x select 0];
	{
	    if (isClass (missionConfigFile >> "VirtualItems" >> _x)) then {
            _perks = format [" <img image='%1'/>",getText (missionConfigFile >> "VirtualItems" >> _x >> "icon")]; //SHOW PERKS
		    _text = _text + _perks;
	    };
	} forEach (_x select 2);
	_text = _text + "<br/><br/>";
} forEach _scoreTable;

/*
if ((_scoreTable select 0 select 0) >= 9000) then { //MINIMUM OF 9.000 POINTS
    _text = _text + format ["<t color='#B32121' size='1'>%1<br/><br/>",localize "STR_SCORE_ReceivedMysteryBox"];
	
	//MYSTERY BOX FOR PLAYER #1
	//if (name player isEqualTo (_scoreTable select 0 select 1)) then { ["mysteryBox",1] call gonzka_fnc_addItem; };
	["mysteryBox",1] call gonzka_fnc_addItem;
};
*/

[parsetext _text, toUpper localize "STR_BRIEF_GameOver"] spawn BIS_fnc_guiMessage;
playSound "Orange_Timeline_FadeOut";

//SAVE BLOODPOINTS
private _earnedBloodPoints = player getVariable "bloodPoints";
private _multiplicator = 1;

//_multiplicator = 1.3;
//["STR_SCORE_Bonus",round (_earnedBloodPoints * (_multiplicator - 1))] call gonzka_fnc_addFunds;

private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
_bloodPoints = round (_bloodPoints + _earnedBloodPoints * _multiplicator);
profileNamespace setVariable ["intruders_bloodPoints", _bloodPoints];
saveProfileNamespace;