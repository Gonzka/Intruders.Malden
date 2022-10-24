class Clothing {
	class Category {
		
		class Uniforms {
			displayname = $STR_GAME_Clothing;
			conditions = "";
			clothing[] = {
				//{ "NONE", $STR_GAME_RemoveUniforms, "", "" },
				//CLASSNAME, TITLE, PICTURE, CONDITION				
				{ "U_O_OfficerUniform_ocamo", $STR_SKIN_Adjutant, "", "playerSide isEqualTo civilian" }, //RESKIN
				{ "U_C_Poloshirt_blue", $STR_SKIN_Drugbaron, "", "playerSide isEqualTo civilian" },
				{ "U_O_ParadeUniform_01_CSAT_decorated_F", $STR_SKIN_General, "", "playerSide isEqualTo civilian" },
				{ "U_I_G_Story_Protagonist_F", $STR_SKIN_Hero, "", "playerSide isEqualTo civilian" },
				{ "U_C_Journalist", "Journalist (Martin Opterix)", "", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
				{ "U_I_G_resistanceLeader_F", $STR_SKIN_Masked, "", "playerSide isEqualTo civilian" },
				{ "U_I_C_Soldier_Bandit_3_F", $STR_SKIN_StolenCarDealer, "", "playerSide isEqualTo civilian" },
				{ "U_C_IDAP_Man_Jeans_F", $STR_SKIN_Survivor, "a3\characters_f_exp\syndikat\data\ui\icon_u_i_c_soldier_bandit_3_f_ca.paa", "playerSide isEqualTo civilian" }, //RESKIN
				
				{ "U_BG_Guerrilla_6_1", $STR_SKIN_HolidaySweater, "", "playerSide isEqualTo civilian && profileNamespace getVariable ['HOLIDAYSWEATER',false]" }, //CODE - RESKIN
				{ "U_C_Poloshirt_salmon", $STR_SKIN_SpookyScarySkeleton, "", "playerSide isEqualTo civilian && profileNamespace getVariable ['TRICKORTREAT',false]" }, //CODE - RESKIN
				
				/*{ "U_B_GEN_Commander_F", $STR_SKIN_Gendarme, "", "playerSide isEqualTo civilian" },
				{ "U_C_Paramedic_01_F", $STR_SKIN_Paramedic, "", "playerSide isEqualTo civilian" },
				{ "U_I_C_Soldier_Para_3_F", "Safari", "", "playerSide isEqualTo civilian" },*/
				
				{ "U_B_T_FullGhillie_tna_F", $STR_SKIN_WendigoDefaultTanoa, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'" },
				{ "U_B_FullGhillie_ard", $STR_SKIN_WendigoDefaultMalden, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'" },
				
				{ "U_C_ConstructionCoverall_Red_F", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'compactor'" },
				{ "U_C_ConstructionCoverall_Black_F", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'compactor'" },
				{ "U_C_ConstructionCoverall_Blue_F", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'compactor'" },
				{ "U_C_ConstructionCoverall_Vrana_F", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'compactor'" },
				
				{ "U_C_E_LooterJacket_01_F", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'butcher'" },
				{ "U_BG_Guerilla3_1", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'butcher'" }
			};
		};
		
		class Headgear {
			displayname = $STR_GAME_Hats;
			conditions = "";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveHeadgear, "", "playerSide isEqualTo civilian" },
				
				{ "H_PASGT_basic_black_F", $STR_SKIN_Adjutant, "", "playerSide isEqualTo civilian" },
				{ "H_ParadeDressCap_01_CSAT_F", $STR_SKIN_General, "", "playerSide isEqualTo civilian" },
				{ "H_Cap_press", "Journalist (Martin Opterix)", "", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
				{ "H_Shemag_olive", $STR_SKIN_Masked, "", "playerSide isEqualTo civilian" },
				{ "H_Hat_tan", $STR_SKIN_StolenCarDealer, "", "playerSide isEqualTo civilian" },
				{ "H_HeadBandage_bloody_F", $STR_SKIN_Survivor, "", "playerSide isEqualTo civilian" },
				
				/*{ "H_Beret_gen_F", $STR_SKIN_Gendarme, "", "playerSide isEqualTo civilian" },
				{ "H_Cap_White_IDAP_F", $STR_SKIN_Paramedic, "", "playerSide isEqualTo civilian" },
				{ "H_Hat_Safari_olive_F", "Safari", "", "playerSide isEqualTo civilian" },*/
				
				{ "Intruders_BucketHead", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'compactor'" }, //MOD
				{ "Intruders_BucketHead_Smile", $STR_SKIN_CompactorSmile, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'compactor'" }, //MOD
				{ "Intruders_HockeyMask", $STR_SKIN_Default, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'butcher'" } //MOD
			};
		};
		
		class Goggles {
			displayname = $STR_GAME_Glasses;
			conditions = "";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveGoggles, "", "playerSide isEqualTo civilian" },
				
				{ "G_Lowprofile", $STR_SKIN_Adjutant, "", "playerSide isEqualTo civilian" },
				{ "G_Squares_Tinted", $STR_SKIN_Drugbaron, "", "playerSide isEqualTo civilian" },
				{ "G_Aviator", $STR_SKIN_Hero, "", "playerSide isEqualTo civilian" },
				{ "G_Combat", $STR_SKIN_Masked, "", "playerSide isEqualTo civilian" },
				{ "G_Sport_BlackWhite", $STR_SKIN_StolenCarDealer, "", "playerSide isEqualTo civilian" },
				
				{ "NWTS_goggle_deer_mossy", $STR_SKIN_WendigoDefaultTanoa, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'" }, //MOD
				{ "NWTS_goggle_deer", $STR_SKIN_WendigoDefaultMalden, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'" }, //MOD
				{ "NWTS_goggle_deer_bloody", $STR_SKIN_WendigoBloody, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'" }, //MOD
				{ "NWTS_goggle_deer_glow", $STR_SKIN_WendigoGlow, "", "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'" } //MOD
			};
		};
		
		class Vests {
			displayname = $STR_GAME_Vests;
			conditions = "playerSide isEqualTo civilian";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveVests, "", "playerSide isEqualTo civilian" },
				
				{ "V_Pocketed_coyote_F", $STR_SKIN_Drugbaron, "", "playerSide isEqualTo civilian" },				
				{ "V_CarrierRigKBT_01_light_Olive_F", $STR_SKIN_Hero, "", "playerSide isEqualTo civilian" },
				{ "V_Press_F", "Journalist (Martin Opterix)", "", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
				{ "V_PlateCarrier2_blk", $STR_SKIN_Masked, "", "playerSide isEqualTo civilian" }
				
				/*{ "V_TacVest_gen_F", $STR_SKIN_Gendarme, "", "playerSide isEqualTo civilian" },
				{ "V_Pocketed_black_F", "Safari", "", "playerSide isEqualTo civilian" }*/
			};
		};
		
		class Backpacks {
			displayname = $STR_GAME_Backpack;
			conditions = "playerSide isEqualTo civilian";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveBackpacks, "", "playerSide isEqualTo civilian" },
				
				{ "B_RadioBag_01_black_F", $STR_SKIN_Adjutant, "", "playerSide isEqualTo civilian" },
				{ "B_Carryall_khk", $STR_SKIN_Drugbaron, "", "playerSide isEqualTo civilian" },
				{ "B_Carryall_oli", $STR_SKIN_Masked, "", "playerSide isEqualTo civilian" },
				{ "B_Carryall_cbr", $STR_SKIN_StolenCarDealer, "", "playerSide isEqualTo civilian" },
				{ "B_Carryall_ocamo", $STR_SKIN_Survivor, "a3\weapons_f\ammoboxes\bags\data\ui\icon_b_c_tortila_cbr.paa", "playerSide isEqualTo civilian" } //RESKIN
				
				//{ "B_Messenger_IDAP_F", $STR_SKIN_Paramedic, "", "playerSide isEqualTo civilian" }
			};
		};
		
		class Faces {
			displayname = $STR_GAME_Faces;
			conditions = "playerSide isEqualTo civilian";
			clothing[] = {
				{ "NONE", $STR_SKIN_PersonalFace, "", "playerSide isEqualTo civilian" },
				{ "Bruce", "Bruce Willis", "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "GreekHead_A3_11", "Hans Rammel", "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "GreekHead_A3_04", "Helmut Mueller", "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "Hladas", "Martin Opterix", "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
				{ "PersianHead_A3_02", "Sandro Kalaschnikow", "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "WhiteHead_26", "Stanislaw Kowalski", "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" }
			};
		};
	};
};