/* 
*
* - initializes the powerup blocks
* 
*/

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Begun Initializing Powerup Blocks.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

{

	//Adds texture to blocks, in case MM forgot any (Somehow)
	_x setObjectTextureGlobal [0, "Armakart_Main\Armakart_Functions\Armakart_Fnc_UI\Powerup_Block.jpg"];
	_x setObjectTextureGlobal[1, "#(argb,8,8,3)color(0.73,0.57,0.27,0.1)"];

	//Attaches a VR square to the Powerup Block object, which basically disables the collision on the Powerup Blocks so players can phase through them while on a vic
	_Ting = createVehicle ["VR_Area_01_square_1x1_yellow_F", getPosASL _x, [], 0, "CAN_COLLIDE"];
	_Ting setDir (getDir _x);
	_Ting hideObjectGlobal true;
	[_x, _Ting] call BIS_fnc_attachToRelative;

	//Setups the trigger
	_Dir = getDir _x;
	_trgSpc = createTrigger ["EmptyDetector", getPos _x];
	_trgSpc attachTo [_x, [0,0,1.4]];
	detach _trgSpc;
	[_trgSpc, [1, 3.45, _Dir, true, 2.4]] remoteExec ["setTriggerArea", 0, false];
	[_trgSpc, 0.25] remoteExec ["setTriggerInterval", 0, false];
	[_trgSpc, ["WEST", "PRESENT", true]] remoteExec ["setTriggerActivation", 0, false];
	[_trgSpc, ["vehicle player in thislist", 
	"
		_trigger = thistrigger;

		[_trigger] Spawn {
		params ['_trig'];
		_Block = getPos _trig nearestObject 'Land_VR_CoverObject_01_kneelHigh_F';
		playSound 'Item_Box_Hit';
		[_trig,['Item_Box_Hit',85]] remoteExec ['say3d'];

		[] Spawn {
		[] call NJP_Armakart_fnc_Armakart_Powerup_Master;
		};

		[_Block, true] remoteExec ['hideObjectGlobal', 0, false];
		_trig setPos [0,0,0];
		uiSleep 3.5;
		[_Block, false] remoteExec ['hideObjectGlobal', 0, false];
		_trig attachTo [_Block, [0,0,1.4]];
		detach _trig;
		};

	", ""] ] remoteExec ["setTriggerStatements", 0, false];

} forEach (allMissionObjects "Land_VR_CoverObject_01_kneelHigh_F");

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Completed Initializing Powerup Blocks.";
diag_log format ["|Armakart| : Time for Powerup Blocks to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";