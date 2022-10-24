/*
    Author:	Karel Moricky

    Convert a number into string (avoiding scientific notation)
*/

private _number = [_this,0,0,[0]] call bis_fnc_param;
private _mod = [_this,1,3,[0]] call bis_fnc_param;

private _digits = _number call bis_fnc_numberDigits;
private _digitsCount = count _digits - 1;

private _modBase = _digitsCount % _mod;
private _numberText = "";
{
    _numberText = _numberText + str _x;
    if ((_foreachindex - _modBase) % (_mod) isEqualTo 0 && !(_foreachindex isEqualTo _digitsCount)) then {_numberText = _numberText + ".";};
} forEach _digits;
_numberText