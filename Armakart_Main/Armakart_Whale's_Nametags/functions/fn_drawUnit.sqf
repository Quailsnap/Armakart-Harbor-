//====================================================================================
//
//	fn_drawUnit.sqf - Initializes values for WHA nametags (heavily based on F3 and ST)
//
//	[_name,_nameColor,_locationData,_role,_groupName,_drawRoleAndGroup,_isCommander,
//	_cameraPositionAGL,_zoom] call wha_nametags_fnc_drawUnit;
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Declare variables.
//------------------------------------------------------------------------------------

params ["_unit","_vehicle","_name","_nameColor","_locationData","_role","_groupName",
		"_drawRoleAndGroup","_isPassenger","_isCommander","_cameraPositionAGL",
		"_zoom","_time","_startTime"];

// _unit (CAManBase): Unit the tag is being rendered on.
// _vehicle (Entity): Vehicle the unit is in. Possibly the unit.
// _name (string): Friendly name of tag to be rendered.
// _nameColor (color array [[],[],[],]): Original color of center nametag.
// _locationData {code}: Code that will be used to find the location to draw the tag.
// _role (string): Friendly role name to be rendered on top.
// _groupName (string): Friendly group name to be rendered on bottom.
// _drawRoleAndGroup (boolean): A flag used to point out noncursor units and prevent
//								them from having group and role tags.
// _isCommander (boolean): A flag used to point out vehicle non-commanders and prevent
//							them from being rendered as far as vehicle commanders.
// _cameraPositionAGL (positionAGL array [[],[],[]]): Current position of player camera.
// _zoom (decimal): Current zoom level of player camera.
// _time (decimal): For fading tags and displaying voice comms. Current time.
// _startTime (OPTIONAL, decimal): For fading tags. Time when tag was originally rendered.

//	Get player from global player setting.
//	This is necessary for Zeus remote control support.
private _player = WHA_NAMETAGS_PLAYER;


//------------------------------------------------------------------------------------
//	Get distance from player to target.
//------------------------------------------------------------------------------------

//	Find position tag will be rendered at using location data.
private _targetPositionAGL = call _locationData;

//	Find the distance from the player camera to this location.
private _camDistance = _cameraPositionAGL distance _targetPositionAGL;
private _distance = _player distance _targetPositionAGL;


//------------------------------------------------------------------------------------
//	Change the nametag if the target is speaking.
//------------------------------------------------------------------------------------

//	If the unit is speaking, apply little carets around their name.
//	TODO: move up a few scopes. GetData? Will stick on cursor
//	TODO: changes from mission we played
if ( _unit call wha_nametags_fnc_isSpeaking ) then
{
	private _timeEven = ((round time) % 2 == 0);
	_nameColor set [3,0.90];
	_name =
	if _timeEven then
	{ "> " + _name + " <" }
	else
	{ ">" + _name + "<" };
};
					
					
//------------------------------------------------------------------------------------
//	Applying initial transparency to tag depending on distance and time of day.
//------------------------------------------------------------------------------------

private _alpha =
if (!_drawRoleAndGroup || {!(_isCommander)})
then { 	linearConversion[WHA_NAMETAGS_DRAWDISTANCE_NEAR/1.3,WHA_NAMETAGS_DRAWDISTANCE_NEAR,
		(_distance / WHA_NAMETAGS_VAR_NIGHT),1,0,true] }
else { 	linearConversion[(((WHA_NAMETAGS_DRAWDISTANCE_CURSOR)*(_zoom))/1.3),
		(WHA_NAMETAGS_DRAWDISTANCE_CURSOR*_zoom),(((_distance) / WHA_NAMETAGS_VAR_NIGHT)),1,0,true] };

//	Apply the alpha coating to each color's transparency.
_nameColor set [3, (_nameColor select 3) * _alpha];


//------------------------------------------------------------------------------------
//	Adjust font size depending on player current zoom level.
//------------------------------------------------------------------------------------

//	TODO: Move up to onEachFrame scope.
//	Max out zoom at 1.67 regardless to avoid HUGE text.
private _zmin = _zoom min 1.67;

//	Adjust font sizes.
private _sizeMain 		= WHA_NAMETAGS_FONT_SIZE_MAIN* _zmin;
private _sizeSecondary 	= WHA_NAMETAGS_FONT_SIZE_SEC * _zmin;
//private _sizeVehicle 	= WHA_NAMETAGS_FONT_SIZE_VEH * _zmin;


//------------------------------------------------------------------------------------
//	If the tag being drawn is on cursor, render the role and group.
//------------------------------------------------------------------------------------

if (_drawRoleAndGroup && {!(_isPassenger)}) then
{
	//	Set the color for secondary tags.
	private _color =+ WHA_NAMETAGS_FONT_COLOR_OTHER;
	_color set [3, (_color select 3) * _alpha];

	//	If we're working with a fading tag, fade it out according to the difference
	//	between the start time and now.
	//	TODO: make the fade 'hang' a little bit. merge onto modless
	if (!isNil "_startTime") then
	{
		private _alphaCoef = (((_startTime + WHA_NAMETAGS_FADETIME) - _time)/WHA_NAMETAGS_FADETIME);
		_nameColor set [3, (_namecolor select 3) * _alphaCoef];
		_color     set [3, (_color select 3)     * _alphaCoef];
	};
	
	//--------------------------------------------------------------------------------
	//	Use space magic to realign the tags with the player's view.
	//	IE: If the player is above the target, normally the nametags (which are stacked -
	//	- vertically) would appear scrunched inside one another.
	//	This alleviates this by realigning them vertically.
	//
	//	Special thanks to cptnnick for this idea, code, implementation, everything!
	//--------------------------------------------------------------------------------

	//	First, get vector pointing directly forward from the player's view, wherever it is.
	//	TODO: Move up to onEachFrame scope.
	_vectorDir = _cameraPositionAGL vectorFromTo (positionCameraToWorld[0,0,1]);

	//	Second, and the biggest step, get the normal (magnitude 1) vector going upwards 
	//		along the player's screen (visually) by taking the cross product of the player's
	//		model upward vector and the player's view vector, and then take the cross product
	//		of that and a vector going directly from the camera to the nametag.

	//	Better explanation here 
	//		( forums.bistudio.com/forums/topic/206072-multi-line-text-in-drawicon3d )

	//	TODO: Simplify this code if possible.
	//	If not possible, cache what you can (vectorUp player vectorCrossProduct _vectorDir)
	//	in onEachFrame.
	private _vectorDiff = (vectorNormalized (((_vectorDir) vectorCrossProduct (vectorUp _player)) vectorCrossProduct (_targetPositionAGL vectorDiff _cameraPositionAGL)));

	//	Take that new normal vector and multiply it by the distance, then divide it by the zoom.
	
	private _targetPositionAGLTop =    _targetPositionAGL vectorAdd (_vectorDiff vectorMultiply (WHA_NAMETAGS_FONT_SPREAD_TOP_MULTI * _camDistance / _zoom));
	private _targetPositionAGLBottom = _targetPositionAGL vectorAdd ((_vectorDiff vectorMultiply (WHA_NAMETAGS_FONT_SPREAD_BOTTOM_MULTI * _camDistance / _zoom)) vectorMultiply -1);

	
	//--------------------------------------------------------------------------------
	//	Render the nametags.
	//--------------------------------------------------------------------------------

	//	Role tag (top).
	if ( !(_role isEqualTo "") && {WHA_NAMETAGS_SHOW_ROLE} ) then
	{
		drawIcon3D ["", _color, _targetPositionAGLTop, 
		0, 0, 0, _role,WHA_NAMETAGS_FONT_SHADOW,_sizeSecondary,WHA_NAMETAGS_FONT_FACE_SEC];
	};

	//	Group tag (bottom).
	if ( !(_groupName isEqualTo "") && {WHA_NAMETAGS_SHOW_GROUP} ) then
	{
		drawIcon3D ["", _color, _targetPositionAGLBottom, 
		0, 0, 0, _groupName,WHA_NAMETAGS_FONT_SHADOW,_sizeSecondary,WHA_NAMETAGS_FONT_FACE_SEC];
	};
};
	
//	TODO: Remove this testing thing
//	Name tag (middle).
//drawIcon3D ["\A3\ui_f\data\map\markers\flags\AAF_ca.paa", [0,0,0,1], _targetPositionAGL, 1, 1, 0, "",0,(_sizeMain+(_sizeMain*0.2)),WHA_NAMETAGS_FONT_FACE_MAIN];

//	Name tag (middle).
drawIcon3D ["", _nameColor, _targetPositionAGL, 0,0,0, _name,WHA_NAMETAGS_FONT_SHADOW,_sizeMain,WHA_NAMETAGS_FONT_FACE_MAIN];

