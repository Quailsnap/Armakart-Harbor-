/*
* 
* - Handles the creation and orbiting of the Places Screen camera
* 
*/ 

if (!hasInterface) exitwith {};

_pos = selectRandom [CAMERA_LOOK_POS, CAMERA_LOOK_POS_1, CAMERA_LOOK_POS_2, CAMERA_LOOK_POS_3];
_pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

_logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2) + 3];
_logic = createVehicleLocal ["Land_ClutterCutter_small_F", _logic_pos, [], 0, "CAN_COLLIDE"];

_logic setDir Angle_cam;
_camPos = [_pos select 0, _pos select 1, (_pos select 2) + Altitude_cam];

_cam = "camera" camCreate _camPos;
_cam camSetPos _camPos;
_cam camSetTarget _logic;
_cam camCommit 0;

waitUntil {camcommitted _cam};

_cam attachto [_logic, [0, Radius_cam, Altitude_cam] ];
_cam cameraEffect ["internal", "BACK"];

while {Scoreboard_Active} do
{
	
	Angle_cam = Angle_cam + Speed_cam;
	_Logic setDir Angle_cam;
	uiSleep 0.015;
	
};

camDestroy _cam;
deleteVehicle _logic;