/*
    Author:	Gonzka

    Lethal Pursuer Killer Perk
*/

if !("lethalPursuer" in (player getVariable "intruders_activePerks")) exitWith {};

{
    [_x,"","",[1,1,1,1],9,false] spawn gonzka_fnc_auraNotification;
} forEach playableUnits - [player];

playSound "Orange_Timeline_FadeOut";