/*
    Author:	Gonzka

    Hex Reveal Notification
*/

params [
    ["_hex", "", [""]],
    ["_object", objNull, [objNull]] //If the totem object is passed as a parameter, then the totem will be marked to the survivors as soon as it is revealed.
];

if (_hex isEqualTo "") exitWith {};

private _hexRevealVar = format ["reveal_%1", _hex];

if !(missionNamespace getVariable _hexRevealVar) then {
    missionNamespace setVariable [_hexRevealVar, true, true];
    
    private _icon = getText (missionConfigFile >> "VirtualItems" >> _hex >> "icon");
    private _name = getText (missionConfigFile >> "VirtualItems" >> _hex >> "displayName");
    ["STR_GAME_Cursed", _name, 5, _icon] remoteExec ["gonzka_fnc_notification", civilian];
    
    //Mark the totem for survivors
    if (isNull _object) exitWith {};
    call compile format ["
        addMissionEventHandler ['Draw3D', {
            if (isObjectHidden %1) then {
                removeMissionEventHandler ['Draw3D', _thisEventHandler];
            } else {
                drawIcon3D ['\intruders_mod\textures\gui\totem.paa', [1,1,1,1], ASLToAGL getPosASL %1, 0.8, 0.8, 0, '', 1, 0.0315, 'EtelkaMonospacePro', 'center', true];
            };
        }];
    ", _object];
    playSound "Orange_Timeline_FadeOut";
};