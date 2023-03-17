/*
    Author:	Gonzka

    Notifies the players with a temporary 3D text at a specific position in the game environment
*/

params [
	["_location", objNull, [objNull]],
	["_icon", "", [""]],
	["_message", "", [""]],
	["_color", [1,1,1,1], [[1,1,1,1]]],
	["_duration", 10, [10]],
	["_soundAlert", true, [true]]
];

if (_soundAlert) then {
	playSound "Orange_Timeline_FadeOut";
};

if (_location isKindOf "CAManBase") then {
	if (side _location isEqualTo east) then {
		_icon = format ["\intruders_mod\textures\portraits\ico_%1.paa", _location getVariable "killer"];
	} else {
		_icon = "\intruders_mod\textures\gui\hud_survivor.paa";
		if ("lethalPursuer" in (player getVariable "intruders_activePerks")) then {
			_duration = _duration + 2;
		};
	};
};

private _eventHandlerId = call compile format ["
	addMissionEventHandler ['Draw3D', {drawIcon3D ['%2', %4, ASLToAGL getPosASL (objectFromNetId '%1'), 0.8, 0.8, 0, '%3', 1, 0.0315, 'EtelkaMonospacePro', 'center', true];}];
", netId _location, _icon, toUpper localize _message, _color];

sleep _duration;
removeMissionEventHandler ["Draw3D", _eventHandlerId];