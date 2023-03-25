/*
    Author:	Gonzka

    Master Configuration File
*/

//GENERAL
blockMainWeapon = false;
knockout = false;
meleeCooldown = 0;
openNotifications = [];
incapacitatedCounter = 0;
clothing_filter = 0;
clothing_equip = ["","","","","",""];
skillCheck_hit = false;
endgameCountdown = false;
prevReviveCount = 0;
profileNamespace setVariable ["bis_reviveCount", 0];
generators = [genericGen_1, genericGen_2, genericGen_3, genericGen_4, genericGen_5 , genericGen_6, genericGen_7];

//GLOBAL VARS
player setVariable ["voiceActive", false, true];
player setVariable ["bloodPoints", 0, true];
player setVariable ["oblivious", false, true];
player setVariable ["killer", "", true];

//ABILITIES
cloakingCooldown = false;
portalTravelInUse = false;
exhausted = false;
beartraps = 3;

//ITEMS
firstAidKits = 0;
toolboxCharges = 0;
circuits = 0;
smokeBombs = 0;
firecrackers = 0;
vitalCapsules = 0;

//PERKS
darkSenseTriggered = false;

//QUEST
player setVariable ["quest_kills", 0, true];
player setVariable ["quest_stuns", 0, true];
player setVariable ["quest_knockDowns", 0, true];
player setVariable ["quest_bearTrapCatches", 0, true];
player setVariable ["quest_heals", 0, true];
player setVariable ["quest_endgameKill", false, true];
quest_generators = 0;
quest_chests = 0;
quest_skillCheckCombo = 0;
quest_terrorGenerators = 0;
quest_portalTravels = 0;
quest_uncloakingHit = 0;
quest_escape = false;
quest_hit_openTimeSlot = false;
quest_killAll = false;

//PERSISTENT SYSTEM
//Perk Inventory
if (isNil {profileNamespace getVariable "intruders_perkInventory"}) then {
    profileNamespace setVariable ["intruders_perkInventory",[]];
};

private _perkInventory = profileNamespace getVariable "intruders_perkInventory";
private _config = missionConfigFile >> "VirtualItems";
{
    if !(isClass (_config >> _x)) then { //REMOVE ITEMS THAT DONT EXIST ANYMORE
        _perkInventory deleteAt (_perkInventory find _x);
    };
} forEach _perkInventory;

profileNamespace setVariable ["intruders_perkInventory",_perkInventory];

//Skin Inventory
if (isNil {profileNamespace getVariable "intruders_skinInventory"}) then {
    profileNamespace setVariable ["intruders_skinInventory",[]];
};

//Equipped Perks
private _perkVar = format ["intruders_activePerks_%1",if (playerSide isEqualTo east) then {"killer"} else {"survivor"}];
if (isNil {profileNamespace getVariable _perkVar}) then {
    profileNamespace setVariable [_perkVar,["","","",""]];
};
if (count (profileNamespace getVariable _perkVar) isEqualTo 3) then { profileNamespace setVariable [_perkVar,["","","",""]]; }; //TEMPORARY
player setVariable ["intruders_activePerks", profileNamespace getVariable _perkVar, true]; //PUBLIC VAR

//Bloodpoints
if (isNil {profileNamespace getVariable "intruders_bloodPoints"}) then {
    profileNamespace setVariable ["intruders_bloodPoints",15000]; //Initial value. Everyone starts with 15,000 blood points.
};

saveProfileNamespace;

diag_log format ["[Intruders Client] Player: %1 (%2) | Bloodpoints: %3 | Perk-Inventory: %4 | Skin-Inventory: %5 | Date: %6", profileName, getPlayerUID player, profileNamespace getVariable "intruders_bloodPoints", profileNamespace getVariable "intruders_perkInventory", profileNamespace getVariable "intruders_skinInventory", systemTime];