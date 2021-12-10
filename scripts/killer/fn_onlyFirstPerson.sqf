/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         12.10.2020
	Description:	 The killer may only use the first person view

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

while {true} do {
	waitUntil {sleep 0.01; cameraOn == player && cameraView == "External"}; 
	player switchCamera "Internal";
};