/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         04.09.2021
	Description:	 A randomly chosen Dull Totem will become a Hex Totem 

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_hex", "", [""]]
];

if (_hex isEqualTo "") exitWith {};
if !(_hex in (player getVariable "intruders_activePerks")) exitWith {};

private _dullTotems = []; 
{
    if (_x getVariable ["hex",""] isEqualTo "") then {
        _dullTotems pushBack _x;
	};
} forEach totems;

if (_dullTotems isEqualTo []) exitWith {};

private _randSel = selectRandom _dullTotems;

//SET UP HEX
missionNamespace setVariable [format ["totem_%1", _hex], _randSel, true]; //Example: totem_hex_noOneEscapesDeath = totem_1;
_randSel setVariable ["hex",_hex,true];

//HEX REVEAL NOTIFICATION
missionNamespace setVariable [format ["reveal_%1", _hex], false, true]; //Example: reveal_hex_noOneEscapesDeath = false;

private _emitter = "#particlesource" createVehicle (getPosATL _randSel); 
_emitter setParticleClass "SmallFireBarrel";
_emitter setParticleFire [0.3,1.0,0];

call compile format ["
	_eventHandlerId = addMissionEventHandler ['Draw3D', {drawIcon3D [getMissionPath 'textures\ico_totem.paa', [1,1,1,1], ASLToAGL getPosASL %1, 0.8, 0.8, 0, '', 1, 0.0315, 'EtelkaMonospacePro'];}];
    waitUntil {isObjectHidden %1};
	removeMissionEventHandler ['Draw3D', _eventHandlerId];
", _randSel];