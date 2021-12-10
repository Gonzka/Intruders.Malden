/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         14.10.2020
	Description:	 Changes the weather and makes it snow

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

//Snow Particles
private _obj = player;
private _pos = position (vehicle _obj);

private _snow = "#particlesource" createVehicleLocal _pos; 
_snow setParticleParams [["\A3\DATA_F\cl_water.p3d",1,1,1],"","spaceObject",1,7,[0, 0, 10.0],[0, 0, -0.35],1.0,0.000001,0.0,0.4,[0.17,0.05,0,0],[[1.0,1.0,1.0,1.0],[0.94,0.94,0.96,1.0],[1.0,1.0,1.0,1.0]],[0, 1],0,0.01,"","",_obj];

_snow setParticleRandom [2,[35, 35, 10],[0.0, 0.0, -0.1],0.001,0.05,[0.01, 0.01, 0.01, 0.02],0.002,0,360,0];
_snow setParticleCircle [0,[0.0, 0.0, -0.1]];
_snow setDropInterval 0.005;

while {true} do {
	_pos = position (vehicle _obj);
	_snow setpos _pos;
	sleep 1;
	if(!(alive player)) exitWith {};
};

deleteVehicle _snow;

/*
//SERVER SIDE (Arma 3 patch v2.08)
0 setOvercast 1;
0 setRain 1;
forceWeatherChange;
setRain [
	"a3\data_f\rainnormal_ca.paa",	// rainDropTexture
	1,	// texDropCount
	0.01,	// minRainDensity
	15,	// effectRadius
	0.1,	// windCoef
	2,	// dropSpeed
	0.5,	// rndSpeed
	0.5,	// rndDir
	0.02,	// dropWidth
	0.02,	// dropHeight
	[0.1,0.1,0.1,1],	// dropColor
	0.1,	// lumSunFront
	0.1,	// lumSunBack
	5.5,	// refractCoef
	0.3,	// refractSaturation
	true,	// snow
	false	// dropColorStrong
];
*/