/*
    Author:	BRPVP

    Returns the day of the week. A number representing the week day. 0 is sunday ... 6 is saturday.
*/

private _date = [systemTime select 0, systemTime select 1, systemTime select 2, 0, 0]; 
private _yearBefore = ((_date select 0) -1) max 0; 
private _qttLeapYears = floor (_yearBefore / 4); 
private _qttNormalYears = _yearBefore - _qttLeapYears; 
private _days = _qttNormalYears + _qttLeapYears * (366 / 365); 
_days = _days + dateToNumber _date; 
(round (_days / (1 / 365))) mod 7