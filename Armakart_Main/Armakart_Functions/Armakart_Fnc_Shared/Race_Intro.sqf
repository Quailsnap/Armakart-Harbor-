/*
* 
* - Uses two orbiting cams focused around random points on the track to do a "Intro"
* 
*/ 

CUSTOMIZATION_PHASE_CAM = false;

if (Voting_Phase_Enabled isEqualTo 2) then {
	//Removes Customization Menu Rest option
	[player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject;

	//Closes Customization Menu
	closeDialog 1234;
	"Customization_Timer_Layer" cutFadeOut 0.001;
};

//Do music
playMusic "";
playMusic "Intro";

//Track orbiting shot
INTRO_1 = true;

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

[_logic] Spawn {

	params ["_Logic"];
	private ["_Logic"];

	while {Angle_cam < (Angle_cam + 360) && INTRO_1} do
	{

			Angle_cam = Angle_cam + Speed_cam;
			_Logic setDir Angle_cam;
			uiSleep 0.005;
			
	};
};

uiSleep 7;

INTRO_1 = false;
camDestroy _cam;
deleteVehicle _logic;

//Final player orbiting shot
INTRO_2 = true;

_pos_2 = vehicle player;
_pos_2 = [getPosATL _pos_2 select 0, getPosATL _pos_2 select 1, getPosATL _pos_2 select 2];

_logic_pos_2 = [(_pos_2 select 0), (_pos_2 select 1), (_pos_2 select 2)];
_logic_2 = createVehicleLocal ["Land_ClutterCutter_small_F", _logic_pos_2, [], 0, "CAN_COLLIDE"];

_logic_2 setDir Angle_cam;
_camPos_2 = [_pos_2 select 0, _pos_2 select 1, _pos_2 select 2];

_cam_2 = "camera" camCreate _camPos_2;
_cam_2 camSetPos _camPos_2;
_cam_2 camSetTarget _logic_2;
_cam_2 camCommit 0;

waitUntil {camcommitted _cam_2};

_cam_2 attachto [_logic_2, [0, 8, 7] ];
_cam_2 cameraEffect ["internal", "BACK"];

[_logic_2] Spawn {

	params ["_Logic_2"];
	private ["_Logic_2"];

	while {Angle_cam < (Angle_cam + 360) && INTRO_2} do
	{

		Angle_cam = Angle_cam + Speed_cam;
		_logic_2 setDir Angle_cam;
		uiSleep 0.001;

	};

};

uiSleep 4;

INTRO_2 = false;

camDestroy _cam_2;
deleteVehicle _logic_2;
player cameraEffect ["terminate", "BACK"];

call NJP_Global_Fnc_Race_Start;
