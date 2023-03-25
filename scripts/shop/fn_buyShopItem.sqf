/*
    Author:	Gonzka

    Buy Item from Shop
*/

params [
	["_item", "", [""]],
	["_price", 0, [0]]
];

private _result = [localize "STR_GAME_BuyConfirmation", toUpper localize "STR_GAME_Confirmation", true, true] call BIS_fnc_guiMessage;

if (_result) then {
	private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
	_bloodPoints = _bloodPoints - _price;
	profileNamespace setVariable ["intruders_bloodPoints", _bloodPoints];
	saveProfileNamespace;
	[] spawn gonzka_fnc_updateShopMenu;
	if (_item isEqualTo "mysterybox") then {
		[] call gonzka_fnc_addRandomSkin;
	} else {
		[_item] call gonzka_fnc_addPerk;
	};
};