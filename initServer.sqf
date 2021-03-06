//GENERAL VARS
setTimeMultiplier 0.1;

{
    _x setVariable ["active",false,true];
	{
        [_x, "OFF"] remoteExec ["switchLight",0,true];  
    } forEach (nearestObjects [_x, [], 3]);
    _x animateSource ["switchposition",1];   
    _x animateSource ["light",0];   
    _x setDamage 1;
	[_x] remoteExec ["gonzka_fnc_generatorHoldAction", [0, -2] select isDedicated, _x];
} forEach [genericGen_1, genericGen_2, genericGen_3, genericGen_4, genericGen_5 , genericGen_6, genericGen_7];

matchInProgress = false; publicvariable "matchInProgress";
totalGenerators = 5; publicvariable "totalGenerators";
repairedGenerators = 0; publicvariable "repairedGenerators";
intrudersWin = false; publicvariable "intrudersWin";

gen1_special = false; publicvariable "gen1_special";
gen2_special = false; publicvariable "gen2_special";
gen3_special = false; publicvariable "gen3_special";
gen4_special = false; publicvariable "gen4_special";
gen5_special = false; publicvariable "gen5_special";
gen6_special = false; publicvariable "gen6_special";
gen7_special = false; publicvariable "gen7_special";

//SEASONING
seasons = [	
//  Start: Monat,Tag - Ende: Monat,Tag
    [10,21,				10,31,		"Halloween"],
	[11,1,				11,11,		"Halloween"],
	[12,6,				12,31,		"Winter"]
];

_now = systemTime;
_season = "";

{	
	if ((_x select 0) <= (_now select 1) && (_x select 2) >= (_now select 1)) then {
		if ((_x select 1) <= (_now select 2) && (_x select 3) >= (_now select 2)) then {
			_season = _x select 4;
		};
	};
} forEach seasons;

season = _season; publicvariable "season";

//SPAWN PUMPKINS
[] spawn gonzka_fnc_spawnPumpkins;

//SNOW
[] spawn gonzka_fnc_weatherWinter;

//CHESTS
private _chestresult = []; 
private _chestgroups = [
    [chestgroup_1_1, chestgroup_1_2, chestgroup_1_3, chestgroup_1_4, chestgroup_1_5],
    [chestgroup_2_1, chestgroup_2_2, chestgroup_2_3, chestgroup_2_4, chestgroup_2_5],
    [chestgroup_3_1, chestgroup_3_2, chestgroup_3_3, chestgroup_3_4, chestgroup_3_5],
    [chestgroup_4_1, chestgroup_4_2, chestgroup_4_3, chestgroup_4_4, chestgroup_4_5],
    [chestgroup_5_1, chestgroup_5_2, chestgroup_5_3, chestgroup_5_4, chestgroup_5_5],
    [chestgroup_6_1, chestgroup_6_2, chestgroup_6_3, chestgroup_6_4, chestgroup_6_5],
    [chestgroup_7_1, chestgroup_7_2, chestgroup_7_3, chestgroup_7_4, chestgroup_7_5],
    [chestgroup_8_1, chestgroup_8_2, chestgroup_8_3, chestgroup_8_4, chestgroup_8_5, chestgroup_8_6] //Overworld
];

{
	private _randSel = selectRandom _x;
	private _rIndex = _x find _randSel;
	_x deleteAt _rindex;
	_chestresult pushBack _randSel;
} forEach _chestgroups;

{
    _x hideObjectGlobal false;
    [_x] remoteExec ["gonzka_fnc_chestHoldAction", [0, -2] select isDedicated, _x];
} forEach _chestresult;

chestgroup = _chestresult; publicvariable "chestgroup";

//TOTEMS
private _totemResult = []; 
private _totems = [
    totem_1, totem_2, totem_3, totem_4 ,totem_5, totem_6, totem_7, totem_8, totem_9, totem_10,
	totem_11, totem_12, totem_13, totem_14, totem_15, totem_16, totem_17, totem_18, totem_19, totem_20,
	totem_21, totem_22, totem_23, totem_24, totem_25, totem_26, totem_27, totem_28
];

for "_i" from 0 to 4 do { //Select 5 Totems
    private _randSel = selectRandom _totems;
    private _rIndex = _totems find _randSel;
    _totems deleteAt _rindex;
    _totemResult pushBack _randSel;
	
	_randSel hideObjectGlobal false;
	private _totemPole = getPos _randSel nearestObject "Land_WoodenWall_03_s_d_pole_F";
	_totemPole hideObjectGlobal false; 
	[_randSel] remoteExec ["gonzka_fnc_totemHoldAction", [0, -2] select isDedicated, _randSel];
};

totems = _totemResult; publicvariable "totems";

//WEATHER AND DAYTIME
/*
private _chance = floor random [0, 10, 0];
private _rain = false; 
private _sunset = false;

switch (_chance) do {
    case 5: { _sunset = true; }; //9%
    case 7: { _rain = true; }; //19%
};

if (_rain) then {
    0 setOvercast 0.5;
    0 setRain random 1;
    forceWeatherChange;
};

if (_sunset) then {
    private _date = date select [0,3]; 
    if (worldName isEqualTo "Tanoa") then {
	    _date append [17,30];
	} else {
	    _date append [19,0];
	};
	[_date] remoteExec ["setDate"];
};
*/