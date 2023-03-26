/*
    Author:	Gonzka

    Displays the scored points of all players
*/

//Bonus Bloodpoints
if (bloodRush) then { //1.5x Bloodpoints
	["STR_SCORE_Bonus",round (player getVariable "bloodPoints") * 0.5] call gonzka_fnc_addBloodpoints;
};
if (bloodHunt) then { //2x Bloodpoints
	["STR_SCORE_Bonus",player getVariable "bloodPoints"] call gonzka_fnc_addBloodpoints;
};

sleep 1; //Wait a moment until the final points are calculated

private _scoreTable = [];
{
	_scoreTable pushBack [_x getVariable "bloodPoints", name _x, _x getVariable "intruders_activePerks"];
} forEach (allPlayers select {side _x != sideLogic});

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

[parsetext _text, toUpper localize "STR_BRIEF_MatchFinished"] spawn BIS_fnc_guiMessage;
playSound "Orange_Timeline_FadeOut";
playMusic "EventTrack03_F_Curator";

//The first player of the playableUnits list sends the scoreboard to players who have chosen the spectator slot in the lobby. So this list will be sent only once.
if ((playableUnits select 0) isEqualTo player) then {
	[parsetext _text, toUpper localize "STR_BRIEF_MatchFinished"] remoteExec ["BIS_fnc_guiMessage", sideLogic];
	["EventTrack03_F_Curator"] remoteExecCall ["playMusic", sideLogic];
};

//SAVE BLOODPOINTS
private _totalBloodPoints = profileNamespace getVariable "intruders_bloodPoints";
profileNamespace setVariable ["intruders_bloodPoints", _totalBloodPoints + (player getVariable "bloodPoints")];
saveProfileNamespace;