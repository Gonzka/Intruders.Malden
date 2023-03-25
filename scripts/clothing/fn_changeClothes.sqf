/*
    File: fn_changeClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the clothing store to show a 'preview' of the piece of clothing.
*/

disableSerialization;
private _control = (_this select 0) select 0;
private _selection = (_this select 0) select 1;
if (_selection isEqualTo -1) exitWith {};
if (isNull _control) exitWith {};
if (cMenu_lock) exitWith {};
cMenu_lock = true;

private _data = _control tvData _selection;
clothing_equip set[clothing_filter,_data];

if (_data isEqualTo "NONE") then {
    _item = switch (clothing_filter) do {
        case 0: {uniform player};
        case 1: {headGear player};
        case 2: {goggles player};
        case 3: {vest player};
        case 4: {backpack player};
        case 5: {face player};
    };

    [_item,false] call gonzka_fnc_handleItem;
} else {
    [_data,true,nil,nil,nil,nil,nil,true] call gonzka_fnc_handleItem;
};

cMenu_lock = false;

private _picture = _control tvPicture _selection;
if (_picture isEqualTo "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_locked_ca.paa") then {
    ((findDisplay 3100) displayCtrl 3103) ctrlEnable false;
    clothing_equip set[clothing_filter,""];
} else {
    ((findDisplay 3100) displayCtrl 3103) ctrlEnable true;
};