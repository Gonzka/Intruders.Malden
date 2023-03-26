/*
    Author:	Gonzka

    Inserts the classname of clothes into a permanent saved profilenamespace inventory
*/

private _allSkins = [
    //Uniforms
    "U_C_CBRN_Suit_01_Blue_F",
    "U_C_CBRN_Suit_01_White_F",
    "U_O_R_Gorka_01_F",
    "U_O_R_Gorka_01_brown_F",
    "U_I_ParadeUniform_01_AAF_decorated_F",
    "U_O_ParadeUniform_01_CSAT_decorated_F",
    "U_I_E_ParadeUniform_01_LDF_decorated_F",
    "U_B_ParadeUniform_01_US_decorated_F",
    "U_I_C_Soldier_Para_2_F",
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_1_F",
    "U_C_Paramedic_01_F",
    "U_I_C_Soldier_Camo_F",
    "U_O_R_Gorka_01_black_F",
    "U_C_Uniform_Scientist_01_formal_F",
    "U_C_Uniform_Scientist_02_F",
    "U_C_Uniform_Scientist_01_F",

    //Headgear
    "H_HelmetAggressor_F",
    "H_HelmetAggressor_cover_F",
    "H_Beret_CSAT_01_F",
    "H_Beret_02",
    "H_Beret_Colonel",
    "H_HelmetCrew_B",
    "H_ParadeDressCap_01_AAF_F",
    "H_ParadeDressCap_01_CSAT_F",
    "H_ParadeDressCap_01_LDF_F",
    "H_ParadeDressCap_01_US_F",
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Shemag_olive",

    //Goggles
    "G_AirPurifyingRespirator_02_olive_F",
    "G_AirPurifyingRespirator_02_sand_F",
    "G_AirPurifyingRespirator_02_black_F",
    "G_AirPurifyingRespirator_01_F",
    "G_RegulatorMask_F",
    "G_Balaclava_oli",
    "G_Balaclava_blk",
    "G_Balaclava_TI_tna_F",
    "G_Balaclava_TI_blk_F",

    //Vests
    "V_Plain_crystal_F",
    "V_SmershVest_01_F",
    "V_CarrierRigKBT_01_light_Olive_F",
    "V_CarrierRigKBT_01_Olive_F",

    //Backpacks
    "B_SCBA_01_F",
    "B_RadioBag_01_black_F",
    "B_CombinationUnitRespirator_01_F",
    "B_ViperHarness_khk_F",
    "B_ViperHarness_oli_F",
    "B_ViperHarness_blk_F"
];

private _inventory = profileNamespace getVariable "intruders_skinInventory";

{
    if !(_x in _allSkins) then { //Cleanup: Non-existing classnames are removed from the profilenamespace
        _inventory deleteAt (_inventory find _x);
    };
} forEach _inventory;

_allSkins = _allSkins - _inventory; //No duplicates
if (_allSkins isEqualTo []) exitWith {
    ["STR_GAME_Error", "STR_GAME_NoMoreSkins", 10, "\A3\ui_f\data\GUI\RscCommon\RscDebugConsole\warningcdc_ca.paa", true] spawn gonzka_fnc_notification;
    private _bloodPoints = profileNamespace getVariable "intruders_bloodPoints";
    private _price = getNumber (missionConfigFile >> "VirtualItems" >> "mysterybox" >> "price");
    _bloodPoints = _bloodPoints + _price;
    profileNamespace setVariable ["intruders_bloodPoints", _bloodPoints];
    saveProfileNamespace;
};

private _className = selectRandom _allSkins;
_inventory pushBackUnique _className;
profileNamespace setVariable ["intruders_skinInventory",_inventory];
saveProfileNamespace;

private _details = [_className] call gonzka_fnc_fetchCfgDetails;
private _displayName = _details select 1;
private _pic = _details select 2;

[_displayName, "STR_GAME_SkinUnlocked", 15, _pic] spawn gonzka_fnc_notification;
playSound "Orange_Timeline_FadeIn";