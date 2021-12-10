/*
    File: fn_s_onSliderChange.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Called when the slider is changed for any field and updates the view distance for it.
*/

params [
    ["_value",-1,[0]]
];

player setDir (360 - _value);