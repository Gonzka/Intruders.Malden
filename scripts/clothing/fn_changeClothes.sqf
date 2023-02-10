/*
    File: fn_changeClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the clothing store to show a 'preview' of the piece of clothing.
*/

disableSerialization;
private _control = (_this select 0) select 0;
private _selection = (_this select 0) select 1;
if (_selection isEqualTo -1) exitWith {/*hint localize "STR_Shop_NoSelection";*/};
if (isNull _control) exitWith {/*hint localize "STR_Shop_NoDisplay"*/};
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

[] call gonzka_fnc_playerSkins;
