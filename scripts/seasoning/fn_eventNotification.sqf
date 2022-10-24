/*
    Author:	Gonzka

    Shows information about events
*/

params [
	["_eventTitle", "", [""]],
	["_eventDesc", "", [""]],
	["_icon", "", [""]],
	["_eventDuration", "", [""]]
];

if (season isEqualTo "") exitWith {};

private _year = systemTime select 0;
private _eventVar = format ["notification_%1_%2", toLower season, _year];

if !(isNil {profileNamespace getVariable _eventVar}) exitWith {};

profileNamespace setVariable [_eventVar, true];

[format ["<t font='PuristaMedium'><t color='#B32121'><t size='1.7'><t align='center'>%1<br/><t color='#B32121' size='1'>%4<br/><br/><img size='5' color='#FFFFFF' image='%3'/><br/><br/><t color='#FFFFFF' size='1'>%2<br/><br/>", toUpper localize _eventTitle, localize _eventDesc, _icon, _eventDuration], toUpper localize _eventTitle] spawn BIS_fnc_guiMessage;