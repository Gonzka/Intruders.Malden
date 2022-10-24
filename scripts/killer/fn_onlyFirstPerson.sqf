/*
    Author:	Gonzka

    The killer may only use the first person view
*/

while {true} do {
	waitUntil {sleep 0.01; cameraOn == player && cameraView == "External"}; 
	player switchCamera "Internal";
};