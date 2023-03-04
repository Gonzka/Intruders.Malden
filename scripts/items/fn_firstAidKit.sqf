/*
    Author:	Gonzka

    Self-healing
*/

firstAidKits = firstAidKits - 1;

//player playMove "ainvpknlmstpslaywnondnon_medic";
player action ["Heal", player];
sleep 2;

waitUntil {!(animationState player in ["ainvpknlmstpslaywnondnon_medic", "ainvppnemstpslaywnondnon_medic", "ainvpknlmstpslaywrfldnon_medic", "ainvppnemstpslaywrfldnon_medic", "ainvpknlmstpslaywpstdnon_medic", "ainvppnemstpslaywpstdnon_medic"])};
player setDamage 0;

["STR_SCORE_Heal",300] call gonzka_fnc_addBloodpoints;