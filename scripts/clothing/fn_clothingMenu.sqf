/*
    File: fn_clothingMenu.sqf
    Author: Bryan "Tonic" Boardwine | edit by Deathman / MrFrost

    Description:
    Opens and initializes the clothing store menu.
    Started clean, finished messy.
*/

//Save old inventory
oldClothes = uniform player;
olduniformItems = uniformItems player;
oldBackpack = backpack player;
oldVest = vest player;
oldVestItems = vestItems player;
oldBackpackItems = backpackItems player;
oldGlasses = goggles player;
oldHat = headgear player;
oldFace = face player;

/* Open up the menu */
createDialog "ClothingMenu";
disableSerialization;

(findDisplay 3100) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {closeDialog 0;}"];

sliderSetRange [3102, 0, 360];

private _pos = getPosATL player;

private _oldDir = getDir player;
private _oldPos = visiblePositionASL player;
private _oldBev = behaviour player;

private _testLogic = "Logic" createVehicle _pos; //was in original createVehicleLocal
_testLogic setPosATL _pos;

private _light = "#lightpoint" createVehicleLocal _pos;
_light setLightBrightness 0.2;
_light setLightColor [1,1,1];
_light setLightAmbient [1,1,1];
_light lightAttachObject [_testLogic, [0,0,0]];

player setBehaviour "SAFE";
player attachTo [_testLogic,[0,0,0]];
//player switchMove "";
player setDir 360;

//initialize camera view
shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
shop_cam cameraEffect ["Internal", "Back"];
shop_cam camSetTarget (player modelToWorld [0,0,1]);
shop_cam camSetPos (player modelToWorld [1,4,2]);
shop_cam camSetFOV .33;
shop_cam camSetFocus [50, 0];
shop_cam camCommit 0;
cMenu_lock = false;

if (isNull (findDisplay 3100)) exitWith {};

private _display = findDisplay 3100;
private _treelist = _display displayCtrl 3101;  
tvClear _treelist;
{
    private _displaynamecat = getText(_x >> "displayname");
    private _conditions = getText(_x >> "conditions");
    if ([_conditions] call gonzka_fnc_levelCheck) then {
        private _treeVatId = _treelist tvAdd[[],_displaynamecat];
        {
            private _className = _x select 0;
            private _displayName = _x select 1;
            private _tooltip = _x select 2;
            private _pic = _x select 3;
            if !(_className isEqualTo "NONE") then {
                private _details = [_className] call gonzka_fnc_fetchCfgDetails;
                if (_displayName isEqualTo "") then {
                    _displayName = _details select 1;
                };
                if (_pic isEqualTo "") then {
                    _pic = _details select 2;
                };
            };
            private _undertreeid = _treelist tvAdd [[_treeVatId], _displayName];
            private _newpath = [_treeVatId] + [_undertreeid];
            _treelist tvSetData [_newpath, _className];
            _treelist tvSetTooltip [_newpath, _tooltip];
            if ([_x] call gonzka_fnc_levelCheck) then {
                _treelist tvSetPicture [_newpath, _pic];
            } else {
                _treelist tvSetPicture [_newpath, "a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\sessions_locked_ca.paa"];
            };
        } forEach getArray (_x >> "clothing");
    };
} forEach ("true" configClasses (missionConfigFile >> "Clothing"));

waitUntil {isNull (findDisplay 3100)};

detach player;
player setBehaviour _oldBev;
player setPosASL _oldPos;
player setDir _oldDir;
{
	deleteVehicle _x;
	true
} count [_testLogic,_light];

shop_cam cameraEffect ["TERMINATE","BACK"];
camDestroy shop_cam;
[0] spawn gonzka_fnc_menuCinematic; //CREATE NEW MENU CAMERA
clothing_filter = 0;
if (isNil "clothesEquiped") exitWith {
    clothing_equip = ["","","","","",""];
    if !(oldClothes isEqualTo "") then {player addUniform oldClothes;} else {removeUniform player};
    if !(oldHat isEqualTo "") then {player addHeadgear oldHat} else {removeHeadgear player;};
    if !(oldGlasses isEqualTo "") then {player addGoggles oldGlasses;} else {removeGoggles player};
    if !(backpack player isEqualTo "") then {
        if (oldBackpack isEqualTo "") then {
            removeBackpack player;
        } else {
            removeBackpack player;
            player addBackpack oldBackpack;
            clearAllItemsFromBackpack player;
            if (count oldBackpackItems > 0) then {
                {
                    [_x,true,true] call gonzka_fnc_handleItem;
                    true
                } count oldBackpackItems;
            };
        };
    };

    if (count oldUniformItems > 0) then {
        {
            [_x,true,false,false,true] call gonzka_fnc_handleItem;
            true
        } count oldUniformItems;
    };

    if (vest player != "") then {
        if (oldVest isEqualTo "") then {
            removeVest player;
        } else {
            player addVest oldVest;
            if (count oldVestItems > 0) then {
                {
                    [_x,true,false,false,true] call gonzka_fnc_handleItem;
                    true
                } count oldVestItems;
            };
        };
    };
	
	[player, oldFace] remoteExec ["setFace", 0, player];
};
clothesEquiped = nil;

//Check uniform purchase.
if ((clothing_equip select 0) isEqualTo "") then {
    if (oldClothes != uniform player) then {player addUniform oldClothes;};
};
//Check hat
if ((clothing_equip select 1) isEqualTo "") then {
    if (oldHat != headgear player) then {
        if (oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear oldHat;
        };
    };
};
//Check glasses
if ((clothing_equip select 2) isEqualTo "") then {
    if (oldGlasses != goggles player) then {
        if (oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles oldGlasses;
        };
    };
};
//Check vest
if ((clothing_equip select 3) isEqualTo "") then {
    if (oldVest != vest player) then {
        if (oldVest isEqualTo "") then {removeVest player;} else {
            player addVest oldVest;
            {
                [_x,true,false,false,true] call gonzka_fnc_handleItem;
                true
            } count oldVestItems;
        };
    };
};
//Check backpack
if ((clothing_equip select 4) isEqualTo "") then {
    if (oldBackpack != backpack player) then {
        if (oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack oldBackpack;
            {
                [_x,true,true] call gonzka_fnc_handleItem;
                true
            } count oldBackpackItems;
        };
    };
};
//Check face
if ((clothing_equip select 5) isEqualTo "") then {
    if (oldFace != face player) then {
        [player, oldFace] remoteExec ["setFace", 0, player];
    };
};

clothing_equip = ["","","","","",""];
[] call gonzka_fnc_saveGear;