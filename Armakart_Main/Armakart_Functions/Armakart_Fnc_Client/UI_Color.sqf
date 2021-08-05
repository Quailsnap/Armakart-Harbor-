/*
* 
* - Simply changes the player ui color
* 
*/ 

//Get the customization UI local to the player
#define _Background_UI_1 uiNamespace getVariable [ "UI_Color_1", controlNull ]
#define _Background_UI_2 uiNamespace getVariable [ "UI_Color_2", controlNull ]
#define _Background_UI_3 uiNamespace getVariable [ "UI_Color_3", controlNull ]
_UI_Color_int = profileNamespace getVariable "_UI_Color_int";
_UI_Color = profileNamespace getVariable "_UI_Color";

//Sets the color values
_Light_Blue = [0.133,0.349,0.522,0.65];
_Light_Green = [0.114,0.639,0.255,0.65];
_Light_Red = [0.749,0.141,0.129,0.65];
_Light_Orange = [0.961,0.404,0.106,0.65];
_Dark_Blue = [0,0.051,1,0.65];
_Purple = [0.584,0,1,0.65];
_Pink = [1,0.02,0.855,0.65];
_Black = [-1,-1,-1,0.65];
_Bronze = [0.69,0.549,0.341,0.65];
_Rose_Gold = [0.718,0.431,0.475,0.65];
_Yellow = [1,1,0,0.65];
_Grey = [0.412,0.412,0.412,0.65];

_UI_Color_int = _UI_Color_int + 1;

switch (_UI_Color_int) do
{

	case 1 : {

		_UI_Color = _Light_Blue;

	};

	case 2 : {

		_UI_Color = _Light_Green;

	};

	case 3 : {

		_UI_Color = _Light_Red;

	};

	case 4 : {

		_UI_Color = _Light_Orange;

	};

	case 5 : {

		_UI_Color = _Dark_Blue;

	};

	case 6 : {

		_UI_Color = _Purple;

	};

	case 7 : {

		_UI_Color = _Pink;

	};

	case 8 : {

		_UI_Color = _Black;

	};

	case 9 : {

		_UI_Color = _Bronze;

	};

	case 10 : {

		_UI_Color = _Rose_Gold;

	};

	case 11 : {

		_UI_Color = _Yellow;

	};

	case 12 : {

		_UI_Color = _Grey;
		_UI_Color_int = 0;

	};

};

profileNamespace setVariable ["_UI_Color_int", _UI_Color_int];

//Apllies the color value to the UI
{
_x ctrlSetBackgroundColor _UI_Color;
} forEach [_Background_UI_1, _Background_UI_2, _Background_UI_3];

//Applies the color value to the profile so we can use it to reset the menu to the corect color and use it in the Places screen.
profileNamespace setVariable ["_UI_Color", _UI_Color];