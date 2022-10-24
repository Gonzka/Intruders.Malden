/*
    Author:	Gonzka

    The ambient music changes within the killer's terorr radius
*/

if (playerSide isEqualTo east) exitWith {};

private _inTerrorRadius = (player getVariable "threatLevel") > 0;
private _inTerrorRadiusUpdated = _inTerrorRadius;
private _track = [
	"Music_Menu_Contact","Music_Roaming_Night","Music_Roaming_Night_02","Music_Roaming_Day","Music_Roaming_Day_02", //CONTACT
	"OM_Music02","OM_Music03", //OLDMAN
	"AmbientTrack01a_F_Tacops","AmbientTrack01b_F_Tacops","AmbientTrack02a_F_Tacops","AmbientTrack02b_F_Tacops" //TACOPS
];
private _playlist = _track;
music = true;

while {sleep 1; alive player} do {
	_inTerrorRadiusUpdated = (player getVariable "threatLevel") > 0;
	if ((_inTerrorRadiusUpdated != _inTerrorRadius) || music) then {
		removeAllMusicEventHandlers "MusicStop";
		_inTerrorRadius = _inTerrorRadiusUpdated;
		if (_inTerrorRadiusUpdated) then {
			if (Killer getVariable "killer" isEqualTo "oldman") then {
				_track = "terrorMusic_oldman"
			} else {
				_track = selectRandom ["terrorMusic_1", "terrorMusic_2"];
			};
			//_track = format ["terrorMusic_%1", Killer getVariable "killer"];
			music = true;
		} else {
			_track = selectRandom _playlist;
			music = false; //true: ambient music, false: no ambient music
			2 fadeMusic 0;
			sleep 2;
		};
	};

	if (music) then {
		_EH = addMusicEventHandler ["MusicStop", {music = true}];
		music = false;
		playmusic _track;
		0 fadeMusic 0.5;
	};
};