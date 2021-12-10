/*
    File: fn_clothingFilter.sqf
    Author: Bryan "Tonic" Boardwine | edit by Deathman / MrFrost

    Description:
    Check wich thing is selected and make Cam Move
*/

disableSerialization;

private _selection = ((_this select 0) select 1) select 0;
clothing_filter = _selection;

switch (_selection) do {
    case 4: {
        shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
        shop_cam camSetPos (player modelToWorld [1,-4,2]);
        shop_cam camCommit 1;
    };

    case 0: {
        shop_cam camSetTarget (player modelToWorld [0,0,1]);
        shop_cam camSetPos (player modelToWorld [1,4,2]);
        shop_cam camCommit 1;
    };

    case 3: {
        shop_cam camSetTarget (player modelToWorld [0,0,1.4]);
        shop_cam camSetPos (player modelToWorld [-.1,2,1.4]);
        shop_cam camCommit 1;
    };

    default {
        shop_cam camSetTarget (player modelToWorld [0,0,1.6]);
        shop_cam camSetPos (player modelToWorld [-.5,1,1.6]);
        shop_cam camCommit 1;
    };
};
