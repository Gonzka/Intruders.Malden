/*
    Author:	Gonzka

    Removes the marker when a generator is repaired
*/

params [
    ["_generator", objNull, [objNull]]
];

private _id = ["draw_",_generator] joinString "";
removeMissionEventHandler ["Draw3D", call compile _id];