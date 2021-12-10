/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         22.10.2020
	Description:	 Plays the heartbeat sound with different intervals

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

while {alive player} do {
	switch (player getVariable "threatLevel") do {
	    case 1: {
		    playSound "heartbeat";
			sleep 1.8;
		};
		case 2: {
		    playSound "heartbeat";
			sleep 1.4;
		};
		case 3: {
		    playSound "heartbeat";
			sleep 1.1;
		};
		case 4: {
		    playSound "heartbeat";
			sleep 0.8;
		};
		default {
			sleep 1;
		};
	};
};