class Clothing {
	class Category {
		
		class Uniforms {
			displayname = $STR_GAME_Clothing;
			conditions = "";
			clothing[] = {
				//{ "NONE", $STR_GAME_RemoveUniforms, "", "", "" },
				//CLASSNAME, TITLE, TOOLTIP, PICTURE, CONDITION
				{ "U_C_Poloshirt_blue", $STR_SKIN_Drugbaron, $STR_SKIN_DrugbaronLore, "", "playerSide isEqualTo civilian" },

				{ "U_I_G_resistanceLeader_F", $STR_SKIN_Masked, $STR_SKIN_MaskedLore, "", "playerSide isEqualTo civilian" },
				{ "U_C_FormalSuit_01_black_F", $STR_SKIN_Strollingman, $STR_SKIN_StrollingmanLore, "", "playerSide isEqualTo civilian" },
		
				{ "U_O_OfficerUniform_ocamo", $STR_SKIN_Adjutant, $STR_SKIN_AdjutantLore, "", "playerSide isEqualTo civilian" }, //RESKIN
				{ "U_O_ParadeUniform_01_CSAT_decorated_F", $STR_SKIN_General, $STR_SKIN_GeneralLore, "", "playerSide isEqualTo civilian" },

				{ "U_I_C_Soldier_Bandit_3_F", $STR_SKIN_StolenCarDealer, $STR_SKIN_StolenCarDealerLore, "", "playerSide isEqualTo civilian" },
				{ "U_C_IDAP_Man_Jeans_F", $STR_SKIN_Survivor, $STR_SKIN_SurvivorLore, "a3\characters_f_exp\syndikat\data\ui\icon_u_i_c_soldier_bandit_3_f_ca.paa", "playerSide isEqualTo civilian" }, //RESKIN

				{ "U_I_G_Story_Protagonist_F", $STR_SKIN_Hero, $STR_SKIN_HeroLore, "", "playerSide isEqualTo civilian" },
				{ "U_C_FormalSuit_01_tshirt_gray_F", $STR_SKIN_Businessman, $STR_SKIN_BusinessmanLore, "", "playerSide isEqualTo civilian" },
				
				{ "U_C_Journalist", "Journalist (Martin Opterix)", $STR_SKIN_JournalistLore, "", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
				
				{ "U_I_L_Uniform_01_tshirt_olive_F", $STR_SKIN_Harvester, $STR_SKIN_HarvesterLore, "", "playerSide isEqualTo civilian" },
				
				{ "U_BG_Guerrilla_6_1", $STR_SKIN_HolidaySweater, $STR_SKIN_HolidaySweaterLore, "", "playerSide isEqualTo civilian && profileNamespace getVariable ['HOLIDAYSWEATER',false]" }, //CODE - RESKIN
				{ "U_C_Poloshirt_salmon", $STR_SKIN_SpookyScarySkeleton, $STR_SKIN_SpookyScarySkeletonLore, "", "playerSide isEqualTo civilian && profileNamespace getVariable ['TRICKORTREAT',false]" }, //CODE - RESKIN
				
				/*{ "U_B_GEN_Commander_F", $STR_SKIN_Gendarme, "", "", "playerSide isEqualTo civilian" },
				{ "U_C_Paramedic_01_F", $STR_SKIN_Paramedic, "", "", "playerSide isEqualTo civilian" },
				{ "U_I_C_Soldier_Para_3_F", "Safari", "", "", "playerSide isEqualTo civilian" },*/
				
				{ "U_B_T_FullGhillie_tna_F", $STR_SKIN_WendigoDefaultTanoa, "", "", "player getVariable 'killer' isEqualTo 'wendigo'" },
				{ "U_B_FullGhillie_ard", $STR_SKIN_WendigoDefaultMalden, "", "", "player getVariable 'killer' isEqualTo 'wendigo'" },
				
				{ "U_C_ConstructionCoverall_Red_F", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'buckethead'" },
				{ "U_C_ConstructionCoverall_Black_F", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'buckethead'" },
				{ "U_C_ConstructionCoverall_Blue_F", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'buckethead'" },
				{ "U_C_ConstructionCoverall_Vrana_F", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'buckethead'" },
				
				{ "U_C_E_LooterJacket_01_F", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'trapper'" },
				{ "U_BG_Guerilla3_1", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'trapper'" }
			};
		};
		
		class Headgear {
			displayname = $STR_GAME_Hats;
			conditions = "";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveHeadgear, "", "", "playerSide isEqualTo civilian" },
				
				{ "H_Shemag_olive", $STR_SKIN_Masked, $STR_SKIN_MaskedLore, "", "playerSide isEqualTo civilian" },
				{ "H_ShemagOpen_khk", $STR_SKIN_Strollingman, $STR_SKIN_StrollingmanLore, "", "playerSide isEqualTo civilian" },
				
				{ "H_PASGT_basic_black_F", $STR_SKIN_Adjutant, $STR_SKIN_AdjutantLore, "", "playerSide isEqualTo civilian" },
				{ "H_ParadeDressCap_01_CSAT_F", $STR_SKIN_General, $STR_SKIN_GeneralLore, "", "playerSide isEqualTo civilian" },
				
				{ "H_Hat_tan", $STR_SKIN_StolenCarDealer, $STR_SKIN_StolenCarDealerLore, "", "playerSide isEqualTo civilian" },
				{ "H_HeadBandage_bloody_F", $STR_SKIN_Survivor, $STR_SKIN_SurvivorLore, "", "playerSide isEqualTo civilian" },
				
				{ "H_Cap_press", "Journalist (Martin Opterix)", $STR_SKIN_JournalistLore, "", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
				
				{ "H_Booniehat_oli", $STR_SKIN_Harvester, $STR_SKIN_HarvesterLore, "", "playerSide isEqualTo civilian" },
				
				/*{ "H_Beret_gen_F", $STR_SKIN_Gendarme, "", "", "playerSide isEqualTo civilian" },
				{ "H_Cap_White_IDAP_F", $STR_SKIN_Paramedic, "", "", "playerSide isEqualTo civilian" },
				{ "H_Hat_Safari_olive_F", "Safari", "", "", "playerSide isEqualTo civilian" },*/
				
				{ "Intruders_BucketHead", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'buckethead'" }, //MOD
				{ "Intruders_BucketHead_Smile", $STR_SKIN_BucketheadSmile, "", "", "player getVariable 'killer' isEqualTo 'buckethead'" }, //MOD

				{ "Intruders_HockeyMask", $STR_SKIN_Default, "", "", "player getVariable 'killer' isEqualTo 'trapper'" } //MOD
			};
		};
		
		class Goggles {
			displayname = $STR_GAME_Glasses;
			conditions = "";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveGoggles, "", "", "playerSide isEqualTo civilian" },
				
				{ "G_Squares_Tinted", $STR_SKIN_Drugbaron, $STR_SKIN_DrugbaronLore, "", "playerSide isEqualTo civilian" },
				
				{ "G_Combat", $STR_SKIN_Masked, $STR_SKIN_MaskedLore, "", "playerSide isEqualTo civilian" },
				
				{ "G_Lowprofile", $STR_SKIN_Adjutant, $STR_SKIN_AdjutantLore, "", "playerSide isEqualTo civilian" },

				{ "G_Sport_BlackWhite", $STR_SKIN_StolenCarDealer, $STR_SKIN_StolenCarDealerLore, "", "playerSide isEqualTo civilian" },
				
				{ "G_Aviator", $STR_SKIN_Hero, $STR_SKIN_HeroLore, "", "playerSide isEqualTo civilian" },
				
				{ "G_Spectacles", $STR_SKIN_Harvester, $STR_SKIN_HarvesterLore, "", "playerSide isEqualTo civilian" },
				
				{ "NWTS_goggle_deer_mossy", $STR_SKIN_WendigoDefaultTanoa, "", "", "player getVariable 'killer' isEqualTo 'wendigo'" }, //MOD
				{ "NWTS_goggle_deer", $STR_SKIN_WendigoDefaultMalden, "", "", "player getVariable 'killer' isEqualTo 'wendigo'" }, //MOD
				{ "NWTS_goggle_deer_bloody", $STR_SKIN_WendigoBloody, "", "", "player getVariable 'killer' isEqualTo 'wendigo'" }, //MOD
				{ "NWTS_goggle_deer_glow", $STR_SKIN_WendigoGlow, "", "", "player getVariable 'killer' isEqualTo 'wendigo'" } //MOD
			};
		};
		
		class Vests {
			displayname = $STR_GAME_Vests;
			conditions = "playerSide isEqualTo civilian";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveVests, "", "", "playerSide isEqualTo civilian" },
				
				{ "V_Pocketed_coyote_F", $STR_SKIN_Drugbaron, $STR_SKIN_DrugbaronLore, "", "playerSide isEqualTo civilian" },
				
				{ "V_PlateCarrier2_blk", $STR_SKIN_Masked, $STR_SKIN_MaskedLore, "", "playerSide isEqualTo civilian" },

				{ "V_CarrierRigKBT_01_light_Olive_F", $STR_SKIN_Hero, $STR_SKIN_HeroLore, "", "playerSide isEqualTo civilian" },
				
				{ "V_Press_F", "Journalist (Martin Opterix)", $STR_SKIN_JournalistLore, "", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" } //CODE
				
				/*{ "V_TacVest_gen_F", $STR_SKIN_Gendarme, "", "", "playerSide isEqualTo civilian" },
				{ "V_Pocketed_black_F", "Safari", "", "", "playerSide isEqualTo civilian" }*/
			};
		};
		
		class Backpacks {
			displayname = $STR_GAME_Backpack;
			conditions = "playerSide isEqualTo civilian";
			clothing[] = {
				{ "NONE", $STR_GAME_RemoveBackpacks, "", "", "playerSide isEqualTo civilian" },
				
				{ "B_Carryall_khk", $STR_SKIN_Drugbaron, $STR_SKIN_DrugbaronLore, "", "playerSide isEqualTo civilian" },
				
				{ "B_Carryall_oli", $STR_SKIN_Masked, $STR_SKIN_MaskedLore, "", "playerSide isEqualTo civilian" },
				{ "B_CivilianBackpack_01_Everyday_Black_F", $STR_SKIN_Strollingman, $STR_SKIN_StrollingmanLore, "", "playerSide isEqualTo civilian" },
				
				{ "B_RadioBag_01_black_F", $STR_SKIN_Adjutant, $STR_SKIN_AdjutantLore, "", "playerSide isEqualTo civilian" },
				
				{ "B_Carryall_cbr", $STR_SKIN_StolenCarDealer, $STR_SKIN_StolenCarDealerLore, "", "playerSide isEqualTo civilian" },
				{ "B_Carryall_ocamo", $STR_SKIN_Survivor, $STR_SKIN_SurvivorLore, "a3\weapons_f\ammoboxes\bags\data\ui\icon_b_c_tortila_cbr.paa", "playerSide isEqualTo civilian" }, //RESKIN
				
				{ "B_Messenger_Gray_F", $STR_SKIN_Businessman, $STR_SKIN_BusinessmanLore, "", "playerSide isEqualTo civilian" },
				
				{ "B_Kitbag_rgr", $STR_SKIN_Harvester, $STR_SKIN_HarvesterLore, "", "playerSide isEqualTo civilian" }
				
				//{ "B_Messenger_IDAP_F", $STR_SKIN_Paramedic, "", "", "playerSide isEqualTo civilian" }
			};
		};
		
		class Faces {
			displayname = $STR_GAME_Faces;
			conditions = "playerSide isEqualTo civilian";
			clothing[] = {
				{ "NONE", $STR_SKIN_PersonalFace, "", "", "playerSide isEqualTo civilian" },
				{ "GreekHead_A3_04", "Helmut Mueller", $STR_SKIN_DrugbaronLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "WhiteHead_26", "Stanislaw Kowalski", $STR_SKIN_MaskedLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "GreekHead_A3_11", "Hans Rammel", $STR_SKIN_AdjutantLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "PersianHead_A3_02", "Sandro Kalaschnikow", $STR_SKIN_StolenCarDealerLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "Bruce", "Bruce Willis", $STR_SKIN_HeroLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" },
				{ "Hladas", "Martin Opterix", $STR_SKIN_JournalistLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian && profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
				{ "LivonianHead_1", "Sonny Kolo", $STR_SKIN_HarvesterLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "playerSide isEqualTo civilian" }
			};
		};
	};
};