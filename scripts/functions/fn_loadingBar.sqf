/*
    Author:	Gonzka

    Loading Screen
*/

params [
	["_text","",[""]]
];

uiNamespace setVariable ["loadingBarText",_text];

with uiNamespace do {
    disableSerialization;
    circle = findDisplay 46 ctrlCreate ["RscPictureKeepAspect", -1];
    circle ctrlSetPosition [0.4,0.36,0.2,0.279999];
    circle ctrlSetText "A3\Missions_F_Exp\data\Img\lobby\ui_campaign_lobby_background_tablet_radial_left_ca.paa"; 
    circle ctrlCommit 0;
    displayText = findDisplay 46 ctrlCreate ["RscStructuredText", -1]; 
    displayText ctrlSetPosition [0.3,0.32,0.4,0.04];
    displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingBarText, ""];
    displayText ctrlCommit 0;
    angle = 0;
    onEachFrame {
        with uiNamespace do {
            if (angle > 89) then {
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingBarText, "."];
            };
            if (angle > 179) then {
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingBarText, ".."];
            };
            if (angle > 269) then {
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingBarText, "..."];
            };
            if (angle > 359) then {
                angle = 0;
                displayText ctrlSetStructuredText parseText format ["<t align='center'>%1%2", loadingBarText, ""];
            };
            circle ctrlSetAngle [angle, 0.5, 0.5];
            angle = angle + 1;
            if (isNil "loadingBarText") exitWith {
                ctrlDelete circle;
                ctrlDelete displayText;
            };
        };
        if (isNil {uiNamespace getVariable "loadingBarText"}) exitWith {};
    };
};