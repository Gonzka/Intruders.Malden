/* 
	჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻
	჻჻  
	჻჻  ELYVION | HOLDING - (Previously Kreygers | Group)
	჻჻
	჻჻  Description : Managing the Closing of the Credits Menu
	჻჻
	჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻჻ 
*/


//-:- Crédits

((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlShow true;
((uiNamespace getVariable "menuprincipal")displayCtrl 1188) ctrlShow false;

((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlShow true;
((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlSetFade 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlCommit 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlSetFade 1;
((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlCommit 1.1;

((uiNamespace getVariable "menuprincipal")displayCtrl 1030) ctrlSetFade 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 1030) ctrlCommit 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 1030) ctrlSetFade 1;
((uiNamespace getVariable "menuprincipal")displayCtrl 1030) ctrlCommit 0.9;

((uiNamespace getVariable "menuprincipal")displayCtrl 1074) ctrlSetFade 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 1074) ctrlCommit 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 1074) ctrlSetFade 1;
((uiNamespace getVariable "menuprincipal")displayCtrl 1074) ctrlCommit 0.7;

((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlSetFade 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlCommit 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlSetFade 1;
((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlCommit 1.1;

sleep 1.1;

((uiNamespace getVariable "menuprincipal")displayCtrl 1178) ctrlShow false;

((uiNamespace getVariable "menuprincipal")displayCtrl 1030) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 1074) ctrlShow false;
((uiNamespace getVariable "menuprincipal")displayCtrl 0005) ctrlShow false;

((uiNamespace getVariable "menuprincipal")displayCtrl 0001) ctrlSetFade 1;
((uiNamespace getVariable "menuprincipal")displayCtrl 0001) ctrlCommit 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 0001) ctrlSetFade 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 0001) ctrlCommit 1.1;

((uiNamespace getVariable "menuprincipal")displayCtrl 0003) ctrlSetFade 1;
((uiNamespace getVariable "menuprincipal")displayCtrl 0003) ctrlCommit 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 0003) ctrlSetFade 0;
((uiNamespace getVariable "menuprincipal")displayCtrl 0003) ctrlCommit 1.1;

[] spawn gonzka_fnc_btnfadeplus;