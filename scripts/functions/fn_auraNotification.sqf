/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         17.11.2020
	Description:	 Notifies the players with a temporary 3D text at a specific position in the game environment

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

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
        _icon = format ["textures\ico_%1.paa", _location getVariable "killer"]; 
	} else {
	    _icon = "textures\gui\hud_survivor.paa";
	};
};

call compile format ["
    _eventHandlerId = addMissionEventHandler ['Draw3D', {drawIcon3D [getMissionPath '%2', %4, ASLToAGL getPosASL (objectFromNetId '%1'), 0.8, 0.8, 0, '%3', 1, 0.0315, 'EtelkaMonospacePro', 'center', true];}];
    sleep %5;
    removeMissionEventHandler ['Draw3D', _eventHandlerId];
", netId _location, _icon, toUpper localize _message, _color, _duration];