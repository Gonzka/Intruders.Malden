/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         20.04.2021
	Description:	 Loading Wheel

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

with uiNamespace do {
    disableSerialization; 
    circle = findDisplay 46 ctrlCreate ["RscPictureKeepAspect", -1];
    circle ctrlSetPosition [0.4,0.36,0.2,0.279999];
    circle ctrlSetText "A3\Missions_F_Exp\data\Img\lobby\ui_campaign_lobby_background_tablet_radial_left_ca.paa"; 
    circle ctrlCommit 0;
	displayText = findDisplay 46 ctrlCreate ["RscStructuredText", -1]; 
    displayText ctrlSetPosition [0.3,0.32,0.4,0.04];
    displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", localize "STR_INIT_ClientSetup", ""];
    displayText ctrlCommit 0;	
	angle = 0;
    onEachFrame { 
        uiNamespace setVariable ["loadingText", loadingText];		
        with uiNamespace do {  
            if (angle > 89) then {
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingText, "."];
            };
            if (angle > 179) then {
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingText, ".."];
            };
            if (angle > 269) then {
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingText, "..."];
            };    
            if (angle > 359) then { 
                angle = 0;
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingText, ""];
            };            
            circle ctrlSetAngle [angle, 0.5, 0.5];   
            angle = angle + 1; 
			if (loadingText isEqualTo "GameStarted") then {
                ctrlDelete circle;
                ctrlDelete displayText;
            }; 
        };  
    };  
};