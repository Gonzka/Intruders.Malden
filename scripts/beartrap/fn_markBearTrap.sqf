/*
    Author:	Gonzka

    Marks the trap in the game environment
*/

params [
    ["_trap", objNull, [objNull]]
];

call compile format ["
	_eventHandlerId = addMissionEventHandler ['Draw3D', {drawIcon3D [getMissionPath 'textures\ico_abilityButcher.paa', [1,1,1,1], ASLToAGL getPosASL (objectFromNetId '%1'), 0.8, 0.8, 0, '', 1, 0.0315, 'EtelkaMonospacePro'];}];
	waitUntil {isNull (objectFromNetId '%1')};
	removeMissionEventHandler ['Draw3D', _eventHandlerId];
", netId _trap];