/*
* 
* - Handles creating the actual Places Screen, and listing the places.
* 
*/ 

#define _Scoreboard_UI uiNamespace getVariable [ "Places_UI", controlNull ]

Scoreboard_Active = true;

//Creates the Places Screen
createDialog "Scoreboard_UI";

//Default UI color incase player jip'd
_UI_Color = [0.133,0.349,0.522,0.65];

//Get the UI color that was used on the Customization UI and applies it
_UI_Color = profileNamespace getVariable "_UI_Color";
_Scoreboard_UI ctrlSetBackgroundColor _UI_Color;

//Get's the places array and applies them in order to the Places Screen
{

	lbAdd [1555,_x];

} forEach Places;

playMusic "";

//Plays some music
[] Spawn
{

	while {Scoreboard_Active} do
	{

		music_isPlaying = true;
		playMusic "Customization_Phase";
		
		waitUntil
		{

			uiSleep 1;

			not music_isPlaying

		};

	};
	
};