class Clothing {
	class Uniforms_Survivor {
		displayname = $STR_GAME_Clothing;
		conditions = "playerSide isEqualTo civilian";
		clothing[] = {
			//{ "NONE", $STR_GAME_RemoveUniforms, "", "", "" },

			//CLASSNAME, TITLE, TOOLTIP, PICTURE, CONDITION
			{ "U_C_WorkerCoveralls", "", "", "", "" },
			{ "U_I_C_Soldier_Bandit_4_F", "", "", "", "" },
			{ "U_I_C_Soldier_Bandit_5_F", "", "", "", "" },
			{ "U_I_C_Soldier_Bandit_1_F", "", "", "", "" },
			{ "U_I_C_Soldier_Bandit_3_F", "", "", "", "" },
			{ "U_I_C_Soldier_Bandit_2_F", "", "", "", "" },
			{ "U_C_Poloshirt_blue", "", "", "", "" },
			{ "U_C_Poloshirt_burgundy", "", "", "", "" },
			{ "U_C_Poloshirt_salmon", "", "", "", "" },
			{ "U_C_Poloshirt_redwhite", "", "", "", "" },
			{ "U_C_Poloshirt_stripped", "", "", "", "" },
			{ "U_C_Poloshirt_tricolour", "", "", "", "" },
			{ "U_C_CBRN_Suit_01_Blue_F", "", "", "", "'U_C_CBRN_Suit_01_Blue_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_C_CBRN_Suit_01_White_F", "", "", "", "'U_C_CBRN_Suit_01_White_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_C_FormalSuit_01_blue_F", "", "", "", "" },
			{ "U_C_FormalSuit_01_gray_F", "", "", "", "" },
			{ "U_C_FormalSuit_01_khaki_F", "", "", "", "" },
			{ "U_C_FormalSuit_01_black_F", "", "", "", "" },
			{ "U_C_FormalSuit_01_tshirt_gray_F", "", "", "", "" },
			{ "U_C_FormalSuit_01_tshirt_black_F", "", "", "", "" },
			{ "U_B_GEN_Commander_F", "", "", "", "" },
			{ "U_B_GEN_Soldier_F", "", "", "", "" },
			{ "U_C_Poor_1", "", "", "", "" },
			{ "U_I_G_Story_Protagonist_F", "", "", "", "" },
			{ "U_O_R_Gorka_01_F", "", "", "", "'U_O_R_Gorka_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_O_R_Gorka_01_brown_F", "", "", "", "'U_O_R_Gorka_01_brown_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_BG_Guerilla2_1", "", "", "", "" },
			{ "U_BG_Guerilla2_3", "", "", "", "" },
			{ "U_BG_Guerilla2_2", "", "", "", "" },
			//{ "U_BG_Guerilla3_1", "", "", "", "" },
			{ "U_BG_Guerrilla_6_1", "", "", "", "" },
			{ "U_OrestesBody", "", "", "", "" },
			{ "U_C_HunterBody_grn", "", "", "", "" },
			{ "U_C_Journalist", "", "", "", "" },
			{ "U_I_G_resistanceLeader_F", "", "", "", "" },
			{ "U_C_Uniform_Farmer_01_F", "", "", "", "" },
			{ "U_C_Man_casual_2_F", "", "", "", "" },
			{ "U_C_Man_casual_3_F", "", "", "", "" },
			{ "U_C_Man_casual_1_F", "", "", "", "" },
			{ "U_Marshal", "", "", "", "" },
			{ "U_C_Mechanic_01_F", "", "", "", "" },
			{ "U_I_ParadeUniform_01_AAF_decorated_F", "", "", "", "'U_I_ParadeUniform_01_AAF_decorated_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_O_ParadeUniform_01_CSAT_decorated_F", "", "", "", "'U_O_ParadeUniform_01_CSAT_decorated_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_I_E_ParadeUniform_01_LDF_decorated_F", "", "", "", "'U_I_E_ParadeUniform_01_LDF_decorated_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_B_ParadeUniform_01_US_decorated_F", "", "", "", "'U_B_ParadeUniform_01_US_decorated_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_I_C_Soldier_Para_2_F", "", "", "", "'U_I_C_Soldier_Para_2_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_I_C_Soldier_Para_4_F", "", "", "", "'U_I_C_Soldier_Para_4_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_I_C_Soldier_Para_3_F", "", "", "", "'U_I_C_Soldier_Para_3_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_I_C_Soldier_Para_5_F", "", "", "", "" },
			{ "U_I_C_Soldier_Para_1_F", "", "", "", "'U_I_C_Soldier_Para_1_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_I_L_Uniform_01_tshirt_olive_F", "", "", "", "" },
			{ "U_C_Paramedic_01_F", "", "", "", "'U_C_Paramedic_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_C_Man_casual_5_F", "", "", "", "" },
			{ "U_C_Man_casual_4_F", "", "", "", "" },
			{ "U_C_Man_casual_6_F", "", "", "", "" },
			{ "U_I_C_Soldier_Camo_F", "", "", "", "'U_I_C_Soldier_Camo_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_O_R_Gorka_01_black_F", "", "", "", "'U_O_R_Gorka_01_black_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_C_Uniform_Scientist_01_formal_F", "", "", "", "'U_C_Uniform_Scientist_01_formal_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_C_Uniform_Scientist_02_F", "", "", "", "'U_C_Uniform_Scientist_02_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_C_Uniform_Scientist_01_F", "", "", "", "'U_C_Uniform_Scientist_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "U_C_Scientist", "", "", "", "" }
		};
	};

	class Uniforms_Wendigo {
		displayname = $STR_GAME_Clothing;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'";
		clothing[] = {			
			{ "U_B_T_FullGhillie_tna_F", $STR_SKIN_Default, "", "", "" },
			{ "U_I_FullGhillie_sard", $STR_SKIN_Default, "", "", "" },
			{ "U_B_FullGhillie_ard", $STR_SKIN_Default, "", "", "" }
		};
	};

	class Uniforms_Buckethead {
		displayname = $STR_GAME_Clothing;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'buckethead'";
		clothing[] = {						
			{ "U_C_ConstructionCoverall_Red_F", $STR_SKIN_Default, "", "", "" },
			{ "U_C_ConstructionCoverall_Black_F", $STR_SKIN_Default, "", "", "" },
			{ "U_C_ConstructionCoverall_Blue_F", $STR_SKIN_Default, "", "", "" },
			{ "U_C_ConstructionCoverall_Vrana_F", $STR_SKIN_Default, "", "", "" }
		};
	};

	class Uniforms_Trapper {
		displayname = $STR_GAME_Clothing;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'trapper'";
		clothing[] = {						
			{ "U_C_E_LooterJacket_01_F", $STR_SKIN_Default, "", "", "" },
			{ "U_BG_Guerilla3_1", $STR_SKIN_Default, "", "", "" }
		};
	};
	
	class Headgear_Survivor {
		displayname = $STR_GAME_Hats;
		conditions = "playerSide isEqualTo civilian";
		clothing[] = {
			{ "NONE", $STR_GAME_RemoveHeadgear, "", "", "" },

			{ "H_Hat_Tinfoil_F", "", "", "", "" },
			{ "H_HelmetAggressor_F", "", "", "", "'H_HelmetAggressor_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_HelmetAggressor_cover_F", "", "", "", "'H_HelmetAggressor_cover_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_Bandanna_blu", "", "", "", "" },
			{ "H_Bandanna_sand", "", "", "", "" },
			{ "H_Bandanna_gry", "", "", "", "" },
			{ "H_Bandanna_surfer_grn", "", "", "", "" },
			{ "H_Bandanna_surfer_blk", "", "", "", "" },
			{ "H_Bandanna_camo", "", "", "", "" },
			{ "H_Bandanna_cbr", "", "", "", "" },
			{ "H_Bandanna_sgg", "", "", "", "" },
			{ "H_Bandanna_khk", "", "", "", "" },
			{ "H_Bandanna_surfer", "", "", "", "" },
			{ "H_Beret_gen_F", "", "", "", "" },
			{ "H_Beret_CSAT_01_F", "", "", "", "'H_Beret_CSAT_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_Beret_blk", "", "", "", "" },
			{ "H_Beret_02", "", "", "", "'H_Beret_02' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_Beret_Colonel", "", "", "", "'H_Beret_Colonel' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_Watchcap_blk", "", "", "", "" },
			{ "H_Watchcap_khk", "", "", "", "" },
			{ "H_Watchcap_cbr", "", "", "", "" },
			{ "H_Watchcap_camo", "", "", "", "" },
			{ "H_Booniehat_mgrn", "", "", "", "" },
			{ "H_Booniehat_khk", "", "", "", "" },
			{ "H_Booniehat_oli", "", "", "", "" },
			{ "H_Booniehat_tan", "", "", "", "" },
			{ "H_HelmetCrew_B", "", "", "", "'H_HelmetCrew_B' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_HeadSet_yellow_F", "", "", "", "" },
			{ "H_HeadSet_orange_F", "", "", "", "" },
			{ "H_HeadSet_red_F", "", "", "", "" },
			{ "H_HeadSet_black_F", "", "", "", "" },
			{ "H_HeadSet_white_F", "", "", "", "" },
			{ "H_Hat_blue", "", "", "", "" },
			{ "H_Hat_brown", "", "", "", "" },
			{ "H_Hat_grey", "", "", "", "" },
			{ "H_Hat_tan", "", "", "", "" },
			{ "H_Hat_checker", "", "", "", "" },
			{ "H_Hat_camo", "", "", "", "" },
			{ "H_HeadBandage_bloody_F", "", "", "", "" },
			{ "H_HeadBandage_stained_F", "", "", "", "" },
			{ "H_HeadBandage_clean_F", "", "", "", "" },
			{ "H_Cap_marshal", "", "", "", "" },
			{ "H_MilCap_blue", "", "", "", "" },
			{ "H_MilCap_gen_F", "", "", "", "" },
			{ "H_MilCap_gry", "", "", "", "" },
			{ "H_MilCap_grn", "", "", "", "" },
			{ "H_Cap_blu", "", "", "", "" },
			{ "H_Cap_grn", "", "", "", "" },
			{ "H_Cap_tan", "", "", "", "" },
			{ "H_Cap_oli", "", "", "", "" },
			{ "H_Cap_police", "", "", "", "" },
			{ "H_Cap_press", "", "", "", "" },
			{ "H_Cap_red", "", "", "", "" },
			{ "H_Cap_blk", "", "", "", "" },
			{ "H_Cap_surfer", "", "", "", "" },
			{ "H_ParadeDressCap_01_AAF_F", "", "", "", "'H_ParadeDressCap_01_AAF_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_ParadeDressCap_01_CSAT_F", "", "", "", "'H_ParadeDressCap_01_CSAT_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_ParadeDressCap_01_LDF_F", "", "", "", "'H_ParadeDressCap_01_LDF_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_ParadeDressCap_01_US_F", "", "", "", "'H_ParadeDressCap_01_US_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_Hat_Safari_olive_F", "", "", "", "" },
			{ "H_Hat_Safari_sand_F", "", "", "", "" },
			{ "H_Cap_headphones", "", "", "", "" },
			{ "H_ShemagOpen_khk", "", "", "", "'H_ShemagOpen_khk' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_ShemagOpen_tan", "", "", "", "'H_ShemagOpen_tan' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_Shemag_olive", "", "", "", "'H_Shemag_olive' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "H_Helmet_Skate", "", "", "", "" },
			{ "H_PASGT_basic_blue_press_F", "", "", "", "" },
			{ "H_PASGT_basic_blue_F", "", "", "", "" },
			{ "H_PASGT_basic_olive_F", "", "", "", "" },
			{ "H_PASGT_basic_black_F", "", "", "", "" },
			{ "H_PASGT_basic_white_F", "", "", "", "" },
			{ "H_StrawHat", "", "", "", "" },
			{ "H_StrawHat_dark", "", "", "", "" }
		};
	};
	
	class Headgear_Wendigo {
		displayname = $STR_GAME_Hats;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'";
		clothing[] = {};
	};
	
	class Headgear_Buckethead {
		displayname = $STR_GAME_Hats;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'buckethead'";
		clothing[] = {
			{ "Intruders_BucketHead", $STR_SKIN_Default, "", "", "" }, //MOD
			{ "Intruders_BucketHead_Smile", "", "", "", "'Intruders_BucketHead_Smile' in (profileNamespace getVariable 'intruders_skinInventory')" } //MOD
		};
	};
	
	class Headgear_Trapper {
		displayname = $STR_GAME_Hats;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'trapper'";
		clothing[] = {};
	};
	
	class Goggles_Survivor {
		displayname = $STR_GAME_Glasses;
		conditions = "playerSide isEqualTo civilian";
		clothing[] = {
			{ "NONE", $STR_GAME_RemoveGoggles, "", "", "" },

			{ "G_Respirator_blue_F", "", "", "", "" },
			{ "G_Respirator_yellow_F", "", "", "", "" },
			{ "G_Respirator_white_F", "", "", "", "" },
			{ "G_AirPurifyingRespirator_02_olive_F", "", "", "", "'G_AirPurifyingRespirator_02_olive_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_AirPurifyingRespirator_02_sand_F", "", "", "", "'G_AirPurifyingRespirator_02_sand_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_AirPurifyingRespirator_02_black_F", "", "", "", "'G_AirPurifyingRespirator_02_black_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_AirPurifyingRespirator_01_F", "", "", "", "'G_AirPurifyingRespirator_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_Blindfold_01_black_F", "", "", "", "" },
			{ "G_Blindfold_01_white_F", "", "", "", "" },
			{ "G_Bandanna_shades", "", "", "", "" },
			{ "G_Bandanna_beast", "", "", "", "" },
			{ "G_Bandanna_tan", "", "", "", "" },
			{ "G_Bandanna_khk", "", "", "", "" },
			{ "G_Bandanna_oli", "", "", "", "" },
			{ "G_Bandanna_aviator", "", "", "", "" },
			{ "G_Bandanna_blk", "", "", "", "" },
			{ "G_Bandanna_sport", "", "", "", "" },
			{ "G_Aviator", "", "", "", "" },
			{ "G_Spectacles", "", "", "", "" },
			{ "G_Spectacles_Tinted", "", "", "", "" },
			{ "G_WirelessEarpiece_F", "", "", "", "" },
			{ "G_Combat", "", "", "", "" },
			{ "G_Combat_Goggles_tna_F", "", "", "", "" },
			{ "G_Squares", "", "", "", "" },
			{ "G_Squares_Tinted", "", "", "", "" },
			{ "G_RegulatorMask_F", "", "", "", "'G_RegulatorMask_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_Shades_Blue", "", "", "", "" },
			{ "G_Shades_Green", "", "", "", "" },
			{ "G_Shades_Red", "", "", "", "" },
			{ "G_Shades_Black", "", "", "", "" },
			{ "G_Sport_Red", "", "", "", "" },
			{ "G_Sport_Blackyellow", "", "", "", "" },
			{ "G_Sport_BlackWhite", "", "", "", "" },
			{ "G_Sport_Checkered", "", "", "", "" },
			{ "G_Sport_Blackred", "", "", "", "" },
			{ "G_Sport_Greenblack", "", "", "", "" },
			{ "G_Balaclava_oli", "", "", "", "'G_Balaclava_oli' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_Balaclava_blk", "", "", "", "'G_Balaclava_blk' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_Tactical_Clear", "", "", "", "" },
			{ "G_Tactical_Black", "", "", "", "" },
			{ "G_Balaclava_TI_tna_F", "", "", "", "'G_Balaclava_TI_tna_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_Balaclava_TI_blk_F", "", "", "", "'G_Balaclava_TI_blk_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "G_Lowprofile", "", "", "", "" },
			{ "G_Goggles_VR", "", "", "", "" }
		};
	};
	
	class Goggles_Wendigo {
		displayname = $STR_GAME_Glasses;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'wendigo'";
		clothing[] = {
			{ "NWTS_goggle_deer_mossy", $STR_SKIN_Default, "", "", "" }, //MOD
			{ "NWTS_goggle_deer", $STR_SKIN_Default, "", "", "" }, //MOD
			{ "NWTS_goggle_deer_bloody", $STR_SKIN_WendigoBloody, "", "", "" }, //MOD
			{ "NWTS_goggle_deer_glow", $STR_SKIN_WendigoGlow, "", "", "" } //MOD
		};
	};
	
	class Goggles_Trapper {
		displayname = $STR_GAME_Glasses;
		conditions = "playerSide isEqualTo east && player getVariable 'killer' isEqualTo 'trapper'";
		clothing[] = {
			{ "Intruders_HockeyMask", $STR_SKIN_Default, "", "", "" }, //MOD
			{ "Intruders_HockeyMask_black", "", "", "", "'Intruders_HockeyMask_black' in (profileNamespace getVariable 'intruders_skinInventory')" }, //MOD
			{ "Intruders_HockeyMask_white", "", "", "", "'Intruders_HockeyMask_white' in (profileNamespace getVariable 'intruders_skinInventory')" }, //MOD
			{ "Intruders_HockeyMask_pantomime", "", "", "", "'Intruders_HockeyMask_pantomime' in (profileNamespace getVariable 'intruders_skinInventory')" } //MOD
		};
	};
	
	class Vests_Survivor {
		displayname = $STR_GAME_Vests;
		conditions = "playerSide isEqualTo civilian";
		clothing[] = {
			{ "NONE", $STR_GAME_RemoveVests, "", "", "" },
			
			{ "V_LegStrapBag_coyote_F", "", "", "", "" },
			{ "V_LegStrapBag_olive_F", "", "", "", "" },
			{ "V_LegStrapBag_black_F", "", "", "", "" },
			{ "V_Chestrig_rgr", "", "", "", "" },
			{ "V_Chestrig_khk", "", "", "", "" },
			{ "V_Chestrig_oli", "", "", "", "" },
			{ "V_Chestrig_blk", "", "", "", "" },
			{ "V_TacVest_gen_F", "", "", "", "" },
			{ "V_Plain_crystal_F", "", "", "", "'V_Plain_crystal_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "V_SmershVest_01_F", "", "", "", "'V_SmershVest_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" }, //V_SmershVest_01_radio_F
			{ "V_PlateCarrier1_rgr", "", "", "", "" },
			{ "V_PlateCarrier1_blk", "", "", "", "" },
			{ "V_CarrierRigKBT_01_light_Olive_F", "", "", "", "'V_CarrierRigKBT_01_light_Olive_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "V_CarrierRigKBT_01_Olive_F", "", "", "", "'V_CarrierRigKBT_01_Olive_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "V_Pocketed_coyote_F", "", "", "", "" },
			{ "V_Pocketed_olive_F", "", "", "", "" },
			{ "V_Pocketed_black_F", "", "", "", "" },
			{ "V_TacVestIR_blk", "", "", "", "" },
			{ "V_TacVest_brn", "", "", "", "" },
			{ "V_TacVest_khk", "", "", "", "" },
			{ "V_TacVest_oli", "", "", "", "" },
			{ "V_TacVest_blk_POLICE", "", "", "", "" },
			{ "V_TacVest_blk", "", "", "", "" },
			{ "V_I_G_resistanceLeader_F", "", "", "", "" },
			{ "V_TacVest_camo", "", "", "", "" },
			{ "V_TacChestrig_grn_F", "", "", "", "" },
			{ "V_TacChestrig_cbr_F", "", "", "", "" },
			{ "V_TacChestrig_oli_F", "", "", "", "" },
			{ "V_PlateCarrier2_rgr", "", "", "", "" },
			{ "V_PlateCarrier2_blk", "", "", "", "" },
			{ "V_Press_F", "", "", "", "" }
		};
	};
	
	class Backpacks_Survivor {
		displayname = $STR_GAME_Backpack;
		conditions = "playerSide isEqualTo civilian";
		clothing[] = {
			{ "NONE", $STR_GAME_RemoveBackpacks, "", "", "" },
			
			{ "B_CivilianBackpack_01_Everyday_Astra_F", "", "", "", "" },
			{ "B_CivilianBackpack_01_Everyday_Black_F", "", "", "", "" },
			{ "B_CivilianBackpack_01_Everyday_Vrana_F", "", "", "", "" },
			{ "B_Messenger_Gray_F", "", "", "", "" },
			{ "B_Messenger_Coyote_F", "", "", "", "" },
			{ "B_Messenger_Olive_F", "", "", "", "" },
			{ "B_Messenger_Black_F", "", "", "", "" },
			{ "B_Carryall_green_F", "", "", "", "" },
			{ "B_SCBA_01_F", "", "", "", "'B_SCBA_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "B_RadioBag_01_black_F", "", "", "", "'B_RadioBag_01_black_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "B_Carryall_cbr", "", "", "", "" },
			{ "B_Carryall_khk", "", "", "", "" },
			{ "B_Carryall_oli", "", "", "", "" },
			{ "B_Carryall_blk", "", "", "", "" },
			{ "B_CombinationUnitRespirator_01_F", "", "", "", "'B_CombinationUnitRespirator_01_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "B_Kitbag_cbr", "", "", "", "" },
			{ "B_Kitbag_sgg", "", "", "", "" },
			{ "B_Kitbag_rgr", "", "", "", "" },
			{ "B_Kitbag_tan", "", "", "", "" },
			{ "B_CivilianBackpack_01_Sport_Blue_F", "", "", "", "" },
			{ "B_CivilianBackpack_01_Sport_Green_F", "", "", "", "" },
			{ "B_CivilianBackpack_01_Sport_Red_F", "", "", "", "" },
			{ "B_TacticalPack_rgr", "", "", "", "" },
			{ "B_TacticalPack_oli", "", "", "", "" },
			{ "B_TacticalPack_blk", "", "", "", "" },
			{ "B_ViperHarness_khk_F", "", "", "", "'B_ViperHarness_khk_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "B_ViperHarness_oli_F", "", "", "", "'B_ViperHarness_oli_F' in (profileNamespace getVariable 'intruders_skinInventory')" },
			{ "B_ViperHarness_blk_F", "", "", "", "'B_ViperHarness_blk_F' in (profileNamespace getVariable 'intruders_skinInventory')" }
		};
	};

	class Faces_Survivor {
		displayname = $STR_GAME_Faces;
		conditions = "playerSide isEqualTo civilian";
		clothing[] = {
			{ "NONE", $STR_SKIN_PersonalFace, "", "", "" },
			{ "GreekHead_A3_04", "Helmut Mueller", $STR_SKIN_DrugbaronLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "" },
			{ "WhiteHead_26", "Stanislaw Kowalski", $STR_SKIN_MaskedLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "" },
			{ "GreekHead_A3_11", "Hans Rammel", $STR_SKIN_AdjutantLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "" },
			{ "PersianHead_A3_02", "Sandro Kalaschnikow", $STR_SKIN_StolenCarDealerLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "" },
			{ "Bruce", "Bruce Willis", $STR_SKIN_HeroLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "" },
			{ "Hladas", "Martin Opterix", $STR_SKIN_JournalistLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "profileNamespace getVariable ['ARMAOPTERIX',false]" }, //CODE
			{ "LivonianHead_1", "Sonny Kolo", $STR_SKIN_HarvesterLore, "a3\ui_f\data\gui\rsc\rscdisplayarsenal\face_ca.paa", "" }
		};
	};
};