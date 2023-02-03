class Intruders {
    tag = "gonzka";
	
	class core {
		file = "scripts";
		class initKiller {};
		class initSurvivor {};
		class keyHandler {};
		class setupActions {};
		class setupEVH {};
	};
	
	class abilities {
		file = "scripts\abilities";
		class cloak {};
		class cloakParticles {};
		class cloakTransition {};
		class knockedOut {};
		class portalBlastWave {};
		class travelThroughPortal {};
	};
	
	class beartrap {
		file = "scripts\beartrap";
		class collectBeartrap {};
		class detachBeartrap {};
		class disarmBeartrap {};
		class markBeartrap {};
		class randomBeartraps {};
		class resetBeartrap {};
		class setBeartrap {};
		class stepInBeartrap {};
	};
	
	class characters {
		file = "scripts\characters";
		class initCharacter {};
		class initCustomVoicelines {};
	};
	
	class clothing {
		file = "scripts\clothing";
		class changeClothes {};
		class clothingFilter {};
		class clothingMenu {};
		class equipClothes {};
		class fetchCfgDetails {};
		class handleItem {};
		class levelCheck {};
		class loadGear {};
		class s_onSliderChange {};
		class saveGear {};
	};
	
	class endgame {
		file = "scripts\endgame";
		class checkWinFailConditions {};
		class escape {};
		class initEndgame {};
		class killerLeftGame {};
		class scoreboard {};
		class timeoutCountdown {};
	};
	
	class functions {
		file = "scripts\functions";
		class auraNotification {};
		class createFogParticles {};
		class dammaged {};
		class handleDamage {};
		class jumpFnc {};
		class loadingBar {};
		class notification {};
		class numberText {};
		class onFired {};
		class playerSkins {};
		class scream {};
		class selfHeal {};
		class setHoldActionDuration {};
		class spawnCamera {};
		class spawnPoint {};
		class statusbar {};
		class statusbarPlayers {};
	};
	
	class generator {
		file = "scripts\generator";
		class fakeExplosion {};
		class genActivate {};
		class generatorHoldAction {};
		class genFail {};
		class genSoundLoop {};
		class skillCheckMenuCtrl {};
		class sparkParticles {};
	};
	
	class items {
		file = "scripts\items";
		class chestHoldAction {};
		class firecracker {};
		class flashbang {};
		class openChest {};
		class redeemCode {};
		class smokeBomb {};
	};
	
	class killer {
		file = "scripts\killer";
		class heartbeat {};
		class onlyFirstPerson {};
		class palettStun {};
		class selectKiller {};
		class terrorMusic {};
		class terrorRadius {};
		class weapon {};
	};
	
	class mainmenu {
		file = "scripts\mainmenu";
		class btnfadeplus {};
		class fadebtn {};
		class menuCinematic {};
		class menucredits {};
		class menucreditsuf {};
		class menupartenariats {};
		class menuprincex {};
		class unfadebtn {};
	};
	
	class perks {
		file = "scripts\perks";
		class bitterMurmur {};
		class boobyTrap {};
		class counterforce {};
		class darkSense {};
		class dejaVu {};
		class hexUndying {};
		class hope {};
		class jamAndBanana {};
		class lethalPursuer {};
		class plunderersInstinct {};
		class premonition {};
		class selectPerk {};
		class sprintBurst {};
		class updatePerkMenu {};
		class updatePerkSlots {};
		class whispers {};
	};
	
	class quests {
		file = "scripts\quests";
		class addFunds {};
		class initQuest {};
		class questSuccess {};
		class questTerminal {};
		class waitUntilQuestCompleted {};
	};

	class seasoning {
		file = "scripts\seasoning";
		class clientSeason {};
		class eventNotification {};
		class loginReward {};
		class spawnPumpkins {};
		class weatherWinter {};
	};
	
	class shop {
		file = "scripts\shop";
		class addPerk {};
		class buyShopItem {};
		class updateShopMenu {};
	};
	
	class totems {
		file = "scripts\totems";
		class igniteHexTotem {};
		class revealHex {};
		class totemHoldAction {};
	};
	
	class wheelmenu {
		file = "scripts\wheelmenu";
		class buttonDown {};
		class buttonUp {};
		class removeWheel {};
		class setWheel {};
		class setWheelCursor {};
		class setWheelKey {};
	};
};

class Lockpicking {
    tag = "pizza";
	
	class lockpicking {
		file = "scripts\lockpicking";
		class handler_actions {};
		class handler_keydown {};
		class handler_keyup {};
		class handler_mousedown {};
		class hud_lockpick {};
		class lockpick {};
	};
};