/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         24.09.2021
	Description:	 Updates the Shop Menu

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

disableSerialization;

private _display = findDisplay 100;

private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
private _bloodpointInfo = _display displayCtrl 101;
_bloodpointInfo ctrlSetText ([_bloodPoints] call gonzka_fnc_numberText) + " " + toUpper localize "STR_SCORE_BloodPoints";

private _cfgVirtualItems = "getNumber (_x >> 'released') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems" );
//_cfgVirtualItems sort true;

private _i = 0;
{
    private _picture = _display displayCtrl (102 + _i * 2);
    private _button = _display displayCtrl (103 + _i * 2);
	
	private _item = getText (_x >> "variable");
	private _displayName = getText (_x >> "displayName");
	private _description = getText (_x >> "description");
    private _icon = getText (_x >> "icon");
	private _price = getNumber (_x >> "price");
	
	_button ctrlSetText format ["%1 (%2)", toUpper localize "STR_GAME_Purchase", [_price] call gonzka_fnc_numberText];
	_button buttonSetAction format ["playSound 'Click1'; ['%1', %2] spawn gonzka_fnc_buyShopItem;", _item, _price];
	_picture ctrlSetText _icon;
	_picture ctrlSetTooltip format ["%1\n\n%2", toUpper localize _displayName, localize _description];
	
	if (_item in (profileNamespace getVariable "intruders_perkInventory")) then {
		//_button ctrlSetBackgroundColor [0.031,0.541,0.031,1];
		_button ctrlSetText toUpper localize "STR_GAME_Purchased";
		_button ctrlEnable false;
	};
	
	if (_bloodPoints < _price) then {
        _button ctrlEnable false;
	};
	
    _i = _i + 1;
} forEach _cfgVirtualItems;