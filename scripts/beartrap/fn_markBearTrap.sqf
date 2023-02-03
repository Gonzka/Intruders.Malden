/*
    Author:	Gonzka

    Marks the trap in the game environment
*/

params [
    ["_trap", objNull, [objNull]]
];

call compile format ["
	addMissionEventHandler ['Draw3D', {
		if (isNull (objectFromNetId '%1')) then {
			removeMissionEventHandler ['Draw3D', _thisEventHandler];
		} else {
			drawIcon3D [getMissionPath 'textures\ico_abilityButcher.paa', [1,1,1,1], ASLToAGL getPosASL (objectFromNetId '%1'), 0.8, 0.8, 0, '', 1, 0.0315, 'EtelkaMonospacePro'];
		};
	}];
", netId _trap];