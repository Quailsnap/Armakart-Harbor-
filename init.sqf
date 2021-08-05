//-------------Track Controls-------------\\

	//Everything that uses BIS_fnc_getParamValue can be found in Armakart_Main\Params.hpp

	//-Basic Controls-\\
		//Track Title\\

			Track_Title = 'Harbor'; //Should be name of your track, shown at intro

		//Number of Laps/Checkpoints\\

			Laps_number = ["Laps_number", 3] call BIS_fnc_getParamValue; //Can be as high as you want, just don't go under 2
			Checkpoints_number = 6; //!!MUST BE BETWEEN 1 AND 6 DO NOT GO OVER OR UNDER FOR ANY REASON!! (Simply delete the checkpoint and their trigger if you're not using them (make sure to delete from last to first))

		//Customization Phase Time\\

			Customization_Phase_Time = ["Customization_Phase_Time", 55] call BIS_fnc_getParamValue;

		//Voting Phase\\

			Voting_Phase_Enabled = ["Voting_Phase_Enabled", 1] call BIS_fnc_getParamValue;
			Voting_Phase_Time = ["Voting_Phase_Time", 25] call BIS_fnc_getParamValue;

		//Powerup Creep\\

			Powerup_Creep_Enabled = ["Powerup_Creep_Enabled", 1] call BIS_fnc_getParamValue;

	//-Advanced Controls-\\ (Please know what you're doing before fiddling with this)
		//Intro Cam Controls\\

			Radius_cam = 125; //Circle radius (distance to the checkpoints)
			Angle_cam = random 360; //Starting angle (compass direction)
			Altitude_cam = 55; //Camera altitude (height above ground)
			Speed_cam = 0.06; //Higher is faster

		//Kart Classname\\

			Kart_Calssname = 'C_Quadbike_01_F'; //WARNING: Some powerups might become unusable/require tweaking when using a different kart (Make sure to replace the vics the players spawn on)

/*
\\---------------------------------------//
*/

call compile preprocessFile "Armakart_Main\Armakart_Init.sqf";