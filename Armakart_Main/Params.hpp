class Params {
	class Space_0 {
		title = "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Sub_Space_0 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Laps_number {
		title = "Number of laps";

		texts[] = {"2", "3", "4", "5", "6", "7", "8"};
        values[] = {2, 3, 4, 5, 6, 7, 8};
		default = 3;
	};
	class Sub_Space_1 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Space_1 {
		title = "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Sub_Space_2 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Customization_Phase_Time {
		title = "Customization Phase time";

		texts[] = {"15", "25", "35", "45", "55", "65", "75", "85", "95", "105", "115", "125", "135"};
        values[] = {15, 25, 35, 45, 55, 65, 75, 85, 95, 105, 115, 125, 135};
		default = 55;
	};
	class Sub_Space_3 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Space_2 {
		title = "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Sub_Space_4 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Powerup_Creep_Enabled {
		title = "Powerup Creep is enabled";

		texts[] = {"Yes", "No"};
        values[] = {1, 2};
		default = 1;
	};
	class Sub_Space_5 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Space_3 {
		title = "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Sub_Space_6 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Voting_Phase_Enabled {
		title = "Voting Phase is enabled";

		texts[] = {"Yes", "No"};
        values[] = {1, 2};
		default = 1;
	};
	class Voting_Phase_Time {
		title = "Voting Phase time";

		texts[] = {"15", "25", "35", "45", "55", "65"};
        values[] = { 15, 25, 35, 45, 55, 65};
		default = 25;
	};
	class Sub_Space_7 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Space_4 {
		title = "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Sub_Space_8 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class ParamWeather {
		title = "Standard Weather";
		function = "potato_missionModules_fnc_setWeather";

		values[] = {-1,0,1,2,3,4,5,6,7,8};
		texts[] = {"Change only if Voting Phase is DISABLED", "Clear (Calm)", "Cloudy (Light Winds)", "Cloudy (Strong Winds)", "Overcast (Calm)", "Overcast (Light Winds)", "Overcast (Strong Winds)", "Rain (Light Winds)", "Rain (Strong Winds)", "Storm"};
		default = -1;
	};
	class ParamFog {
		title = "Standard Fog";
		function = "potato_missionModules_fnc_setFog";

		values[] = {-1,0,0.2,0.4,0.6};
		texts[] = {"Change only if Voting Phase is DISABLED", "None","Light","Medium","Heavy"};
		default = -1;
	};
	class ParamTimeOfDay {
		title = "Standard Time of Day";
		function = "potato_missionModules_fnc_setTime";

		values[] = {-1,0,1,2,3,4,5,6,7};
		texts[] = {"Change only if Voting Phase is DISABLED", "Dawn", "Early Morning", "Morning", "Noon", "Afternoon", "Evening", "Dusk", "Night"};
		default = -1;
	};
	class Sub_Space_9 {
		title = "";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
	class Space_5 {
		title = "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////";

		texts[] = {""};
        values[] = {-1};
		default = -1;
	};
};
