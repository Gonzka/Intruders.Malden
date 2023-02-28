/*
    Author:	Patrick "Lucian" Schmidt modified by Gonzka

    This notification shows the progress of the game
*/

params[
	["_title","",[""]],
	["_text","",[""]],
	["_duration",5,[5]],
	["_icon","",[""]],
	["_error",false,[false]]
];

disableSerialization;

private _display = finddisplay 46;
private _ctrlGroup = [];

if (isLocalized _title) then {
	_title = localize _title;
};

if (isLocalized _text) then {
	_text = localize _text;
};

_text = format["<t size='1.3' color='#B32121' font = 'PuristaBold' >%1</t><br/><t size='0.9' font = 'PuristaMedium'>%2</t>",toUpper _title, _text];

private _group = _display ctrlCreate ["RscStructuredText", -1];
_group ctrlSetStructuredText parsetext _text;
_group ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,(0.2 - 0.03) * safezoneW, 0.5];
_group ctrlCommit 0;

private _textheight = (ctrlTextHeight _group);
if (_textheight < 0.12) then {_textheight = 0.12};
_textheight = _textheight + (20/1920);

_group ctrlSetStructuredText parsetext format [""];
_group ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY,0.225 * safezoneW, (_textheight + (0.005 * safezoneH))];
_group ctrlSetBackgroundColor [0,0,0,0.8];
_group ctrlSetFade 1;
_group ctrlCommit 0;
_group ctrlSetFade 0;
_group ctrlCommit 0.4;

private _textField = _display ctrlCreate ["RscStructuredText", -1, _group];
_textField ctrlSetStructuredText parsetext _text;
_textField ctrlSetPosition [(0.005+(25/1920)) * safezoneW + safezoneX, (0.0205+(6/1080)) * safezoneH + safezoneY,(0.2 - 0.03) * safezoneW, (_textheight + (0.005 * safezoneH))];
_textField ctrlCommit 0;
_textField ctrlSetBackgroundColor [0,0,0,0];
_textField ctrlSetFade 1;
_textField ctrlCommit 0;
_textField ctrlSetFade 0;
_textField ctrlCommit 0.4;

private _sidebar = _display ctrlCreate ['RscText', -1, _group];
_sidebar ctrlSetPosition [0.005 * safezoneW + safezoneX, 0.021 * safezoneH + safezoneY, 0.003 * safezoneW, (ctrlPosition (_group)) select 3];
_sidebar ctrlSetBackgroundColor [0.7,0.13,0.13,1];
_sidebar ctrlSetFade 1;
_sidebar ctrlCommit 0;
_sidebar ctrlSetFade 0;
_sidebar ctrlCommit 0.4;

private _picture = _display ctrlCreate ['RscPicture', -1, _group];
_picture ctrlSetPosition [(ctrlPosition (_group) select 0) + (ctrlPosition (_group) select 2) - (0.006 * safezoneW) - (0.0666666667/2 * safezoneW), (ctrlPosition (_group) select 1) + (((ctrlPosition (_group)) select 3)/2) - ((0.12190476190/2/2) * safezoneH), 0.0666666667/2 * safezoneW, 0.12190476190/2 * safezoneH];
_picture ctrlSetText _icon;
_picture ctrlSetFade 1;
_picture ctrlCommit 0;
_picture ctrlSetFade 0;
_picture ctrlCommit 0.4;

if (_error) then {
	playSound "3DEN_notificationWarning";
} else {
	playSound "Orange_PeriodSwitch_Notification";
};

_ctrlGroup = [_group,_textField,_sidebar,_picture];

[_ctrlGroup,_duration] spawn {
	disableSerialization;
	uiSleep (_this select 1);
	
	{
		_x ctrlSetFade 1;
		_x ctrlCommit 0.3;
	} foreach (_this select 0);
	uiSleep 0.3;
	{
		ctrlDelete _x;
	} foreach (_this select 0);
};

private _groupHeight = (ctrlPosition (_ctrlGroup select 0)) select 3;

if (count openNotifications > 0) then {
	private _activeNotifications = 0;
	{
		private _notificationGroup = _x;
		
		if (!isNull (_notificationGroup select 0) && !isNull (_notificationGroup select 1) && !isNull (_notificationGroup select 2) && !isNull (_notificationGroup select 3)) then {
			
			{
				_x ctrlSetPosition [((ctrlPosition (_x)) select 0), ((ctrlPosition (_x)) select 1) + (_groupHeight + 1.5 * (0.011 * safezoneH))];
			} foreach _notificationGroup;
			
			{
				_x ctrlCommit 0.25;
			} foreach _notificationGroup;
			
			if (_activeNotifications > 3) then {
				{
					_x ctrlSetFade 1;
					_x ctrlCommit 0.2;
				} foreach _notificationGroup;
			};
			_activeNotifications = _activeNotifications + 1;
		};
	} forEach openNotifications;
};

openNotifications = ([_ctrlGroup] + openNotifications) select {!isNull (_x select 0) && !isNull (_x select 1) && !isNull (_x select 2) && !isNull (_x select 3)}; // Add the Element to the Front of the Array and remove the deleted Arrays