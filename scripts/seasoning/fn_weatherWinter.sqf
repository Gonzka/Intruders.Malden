/*
    Author:	Gonzka

    Snow like effect
*/

if (season isNotEqualTo "Winter") exitWith {};

0 setOvercast 0.5;
0 setRain 0.5;
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