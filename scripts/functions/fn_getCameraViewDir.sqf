/*
    Author:	Gonzka

    Returns the direction of the player's camera view
*/

private _pos1 = screenToWorld [0.5,0.5];
private _pos2 = getPos player;
private _dirWatching = ((((_pos1 select 0) - (_pos2 select 0)) atan2 ((_pos1 select 1) - (_pos2 select 1))) + 360) % 360;

_dirWatching;