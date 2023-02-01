/*
    Author:	Gonzka

    Updates the Shop Menu
*/

disableSerialization;

private _display = findDisplay 100;

private _timeToRefresh = 24 - (systemtime select 3);
_display displayCtrl 99 ctrlSetText localize "$STR_MM_SHOP" + " " + format [toUpper localize "STR_GAME_ShopRefreshTime", _timeToRefresh];

private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
_display displayCtrl 101 ctrlSetText ([_bloodPoints] call gonzka_fnc_numberText) + " " + toUpper localize "STR_SCORE_BloodPoints";

private _featuredShopItem = getText (missionConfigFile >> "VirtualItems" >> "featuredItem");

//REFRESH OF SHOP ITEMS
private _dailyShopItems = profileNamespace getVariable "intruders_dailyShopItems";
if (isNil "_dailyShopItems") then {
	private _releasedItems = "getNumber (_x >> 'released') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems");
	_releasedItems = _releasedItems apply {configName _x};
	_releasedItems = _releasedItems - [_featuredShopItem]; //Remove the featured item from the array so that it does not appear twice
	private _shopShuffle = _releasedItems call BIS_fnc_arrayShuffle;
	_dailyShopItems = _shopShuffle select [0,8]; //Select 8 items
	profileNamespace setVariable ["intruders_dailyShopItems",_dailyShopItems];
	saveProfileNamespace;
	["STR_GAME_ShopRefreshed", "STR_GAME_ShopNewItems", 10, "a3\3den\data\cfgwaypoints\cycle_ca.paa"] spawn gonzka_fnc_notification;
};

_dailyShopItems = [_dailyShopItems, [_featuredShopItem], 0] call BIS_fnc_arrayInsert; //Put the featured item in the first place

private _i = 0;
{
	private _picture = _display displayCtrl (102 + _i * 2);
	private _button = _display displayCtrl (103 + _i * 2);
	
	private _item = getText (missionConfigFile >> "VirtualItems" >> _x >> "variable");
	private _displayName = getText (missionConfigFile >> "VirtualItems" >> _x >> "displayName");
	private _description = getText (missionConfigFile >> "VirtualItems" >> _x >> "description");
	private _icon = getText (missionConfigFile >> "VirtualItems" >> _x >> "icon");
	private _price = getNumber (missionConfigFile >> "VirtualItems" >> _x >> "price");
	
	_button ctrlSetText format ["%1 (%2)", toUpper localize "STR_GAME_Purchase", [_price] call gonzka_fnc_numberText];
	_button buttonSetAction format ["playSound 'Click1'; ['%1', %2] spawn gonzka_fnc_buyShopItem;", _item, _price];
	_picture ctrlSetText _icon;
	_picture ctrlSetTooltip format ["%1\n\n%2", toUpper localize _displayName, localize _description];
	
	if (_item in (profileNamespace getVariable "intruders_perkInventory")) then {
		//_button ctrlSetBackgroundColor [0,0,0,1];
		_button ctrlSetText toUpper localize "STR_GAME_Purchased";
		_button ctrlEnable false;
	};
	
	if (_bloodPoints < _price) then {
		_button ctrlEnable false;
	};
	
	_i = _i + 1;
} forEach _dailyShopItems;