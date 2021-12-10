/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         10.10.2020
	Description:	 Updates the player skin

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

switch (uniform player) do {
	case "U_O_OfficerUniform_ocamo": {
        player setObjectTextureGlobal [0, "textures\clothing\Adjutant.paa"];
    };
	case "U_C_IDAP_Man_Jeans_F": {
		player setObjectTextureGlobal [0, "textures\clothing\BloodySurvivor_1.paa"];
		player setObjectTextureGlobal [1, "textures\clothing\BloodySurvivor_2.paa"];
	};
	case "U_C_Poloshirt_salmon": {
	    player setObjectTextureGlobal [0, "textures\clothing\SpookyScarySkeleton.paa"];
	};
	case "U_BG_Guerrilla_6_1": {
	    player setObjectTextureGlobal [0, "textures\clothing\HolidaySweater.paa"];
	};
};

switch (backpack player) do {
	case "B_Carryall_ocamo": {
        unitBackpack player setObjectTextureGlobal [0, "textures\clothing\BloodySurvivor_Backpack.paa"];
    };
};