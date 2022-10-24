/*
    Author:	Lou Montana

    A countdown, inspired by this function: BIS_fnc_VRTimer
*/

params [
	["_time", 30, [0]],
	["_colour", "#FFFFFF", [""]]
];

private _timeout = time + _time;
RscFiringDrillTime_done = false;
1 cutRsc ["RscFiringDrillTime", "PLAIN"];

while { time < _timeout } do {
	private _remainingTime = _timeout - time;
	private _timeFormat = [_remainingTime, "MM:SS.MS", true] call BIS_fnc_secondsToString;
	private _text = format ["<t align='left' color='%1'><img image='%2' />%3:%4<t size='0.8'>.%5</t>",
		_colour,
		"A3\Modules_F_Beta\data\FiringDrills\timer_ca",
		_timeFormat select 0,
		_timeFormat select 1,
		_timeFormat select 2
	];
	RscFiringDrillTime_current = parseText _text;
	sleep 0.01;
};

private _timeFormat = [0, "MM:SS.MS", true] call BIS_fnc_secondsToString;
RscFiringDrillTime_current = parseText format ["<t align='left' color='%1'><img image='%2' />%3:%4<t size='0.8'>.%5</t>",
	_colour,
	"A3\Modules_F_Beta\data\FiringDrills\timer_ca",
	_timeFormat select 0,
	_timeFormat select 1,
	_timeFormat select 2];
sleep 4;
RscFiringDrillTime_done = true;