/*--------------------------------------------------------------------------
    Author:		     Gonzka
    Date:	         31.01.2021
	Description:	 Definitely not a copy of Barbeque and Chili

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

if !("jamAndBanana" in (player getVariable "intruders_activePerks")) exitWith {};

private _intruderRevealed = false;
	
{
	if (side _x isEqualTo civilian && _x distance player > 40) then {
		[_x,"","",[1,1,1,1],4,false] spawn gonzka_fnc_auraNotification;
		_intruderRevealed = true;
	};
} forEach playableUnits;

if (_intruderRevealed) then {
	playSound "Orange_Timeline_FadeOut";
};