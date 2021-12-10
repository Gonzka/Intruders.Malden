/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         02.06.2021
	Description:	 Cinematic background in the main menu

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

params [
    ["_speed",20,[20]]
];

private _camera = "camera" camcreate (position player);
_camera cameraeffect ["internal","back"];
showCinemaBorder false;
camUseNVG false;

if (worldName isEqualTo "Tanoa") then {
	_camera camPrepareTarget [-52370.67,-66943.80,-15195.79];
	_camera camPreparePos [3773.77,14399.96,0.23];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 0;
	waitUntil {camCommitted _camera};

	_camera camPrepareTarget [-89426.05,-20971.45,7915.57];
	_camera camPreparePos [3775.40,14396.38,0.94];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared _speed;
	waitUntil {camCommitted _camera};
} else {
	_camera camPrepareTarget [95088.10,-35535.43,1875.04];
	_camera camPreparePos [6698.28,11196.35,0.21];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared 0;
	waitUntil {camCommitted _camera};

	_camera camPrepareTarget [61636.53,-72239.94,-4477.59];
	_camera camPreparePos [6702.67,11197.96,1.54];
	_camera camPrepareFOV 0.700;
	_camera camCommitPrepared _speed;
	waitUntil {camCommitted _camera};
};