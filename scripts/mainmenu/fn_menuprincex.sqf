/* 
	჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻
	჻჻  
	჻჻  ELYVION | HOLDING - (Previously Kreygers | Group)
	჻჻
	჻჻  Description : File execution of the Main Menu
	჻჻
	჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻ 
*/

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

createDialog "menuprincipal";

if (playerSide isEqualTo east) then {
	createDialog "SelectKillerMenu";
} else {
	call gonzka_fnc_loadGear;
};

[] spawn gonzka_fnc_menuCinematic;

((uiNamespace getVariable "menuprincipal")displayCtrl 0073) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0074) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0075) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0076) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0077) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0078) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0079) ctrlShow false;

((uiNamespace getVariable "menuprincipal")displayCtrl 0188) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0178) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0177) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0187) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0176) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0186) ctrlShow false;

((uiNamespace getVariable "menuprincipal")displayCtrl 1188) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlShow false;

((uiNamespace getVariable "menuprincipal")displayCtrl 1074) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 1030) ctrlShow false;

((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlSetFade 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlCommit 0;

((uiNamespace getVariable "menuprincipal")displayCtrl 0083) buttonSetAction "playSound 'Click1'; player setVariable ['isReady',true,true]; closedialog 0;";
((uiNamespace getVariable "menuprincipal")displayCtrl 0084) buttonSetAction "playSound 'Click1'; createDialog 'PerkMenu';";
((uiNamespace getVariable "menuprincipal")displayCtrl 0085) buttonSetAction "playSound 'Click1'; [] spawn gonzka_fnc_clothingMenu";
((uiNamespace getVariable "menuprincipal")displayCtrl 0086) buttonSetAction "playSound 'Click1'; [] spawn gonzka_fnc_questTerminal;";
((uiNamespace getVariable "menuprincipal")displayCtrl 0087) buttonSetAction "playSound 'Click1'; createDialog 'ShopMenu';";
((uiNamespace getVariable "menuprincipal")displayCtrl 0089) buttonSetAction "playSound 'Click1'; [] spawn gonzka_fnc_fadebtn;";
((uiNamespace getVariable "menuprincipal")displayCtrl 0186) buttonSetAction "playSound 'Click1'; createDialog 'RedeemCodeMenu';";
((uiNamespace getVariable "menuprincipal")displayCtrl 0187) buttonSetAction "playSound 'Click1'; [] spawn gonzka_fnc_menucredits;";
((uiNamespace getVariable "menuprincipal")displayCtrl 0188) buttonSetAction "playSound 'Click1'; [] spawn gonzka_fnc_unfadebtn;";
((uiNamespace getVariable "menuprincipal")displayCtrl 1188) buttonSetAction "playSound 'Click1'; [] spawn gonzka_fnc_menucreditsuf;";