/*
    Author:	Gonzka

    The terror radius is an area near the killer where the player can hear his heartbeat
*/

params [
    ["_killer", objNull, [objNull]]
];

[] spawn gonzka_fnc_heartbeat;

while {alive player} do {	
	player setVariable ["threatLevel",0,true];
	
	if !(player getVariable "oblivious" || _killer getVariable ["undetectable", false]) then {
		
		if (player distance _killer >= 24 && player distance _killer < 32) then {
			player setVariable ["threatLevel",1,true];
		} else { 
			if (player distance _killer >= 16 && player distance _killer < 24) then {
				player setVariable ["threatLevel",2,true];
			} else {
				if (player distance _killer >= 8 && player distance _killer < 16) then {
					player setVariable ["threatLevel",3,true];
				} else {
					if (player distance _killer < 8) then {
						player setVariable ["threatLevel",4,true];
					};
				};
			};
		};	
	};
	sleep 1;
};