/*
    Author:	Gonzka

    The terror radius is an area near the killer where the player can hear his heartbeat
*/

private _radius = 32;
private _intensity = 1.2;
private _minPitch = 0.9;
private _maxPitch = 1.1;
private _beatInterval = 0.8;

while {alive player} do {
	private _dist = Killer distance player;
    if (_dist < _radius && !(player getVariable "oblivious") && !(Killer getVariable ["undetectable", false])) then {
		_intensity = (1 - _dist / _radius);
		playSoundUI ["heartbeat", _intensity, _minPitch + (_maxPitch - _minPitch) * _intensity];
		inTerrorRadius = true;
		[["Intruders", "terrorRadius"], 15,"",35,"",true,true,true,true] call BIS_fnc_advHint;
	} else {
		inTerrorRadius = false;
	};
	sleep _beatInterval;
};