/* 
*
* - Simply takes the variable with the highest number and switches the time and weather based off of that.
* 
*/

_Time = selectMax [TIME_E_MORNING, TIME_NOON, TIME_L_AFTERNOON, TIME_NIGHT, TIME_NIGHT_F_MOON];

  switch (_Time) do {

	case TIME_E_MORNING: {
	
		"|Armakart Track Time| : Early Morning won the vote!" remoteExec ["systemChat",0,true];
		skipTime ((4.45 - daytime + 24) % 24);

	};
	
	case TIME_NOON: {
	
		"|Armakart Track Time| : Noon won the vote!" remoteExec ["systemChat",0,true];
		skipTime ((12 - daytime + 24) % 24);

	};

	case TIME_L_AFTERNOON: {

		"|Armakart Track Time| : Late Afternoon won the vote!" remoteExec ["systemChat",0,true];
		skipTime ((19.15 - daytime + 24) % 24);
	
	};

	case TIME_NIGHT: {

		"|Armakart Track Time| : Night won the vote!" remoteExec ["systemChat",0,true];
		[[2000, 7, 8, 24, 0]] remoteExec ["setDate"];
	
	};

	case TIME_NIGHT_F_MOON: {

		"|Armakart Track Time| : Night (Full Moon) won the vote!" remoteExec ["systemChat",0,true];
		skipTime ((24 - daytime + 24) % 24);

	};

	default {TIME_NOON};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Tallied Time votes.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 2;

_Weather = selectMax [WEATHER_CLEAR, WEATHER_CLOUDY, WEATHER_FOGGY, WEATHER_LIGHT_RAIN, WEATHER_STORMY];

switch (_Weather) do {

	case WEATHER_CLEAR: {
	
		"|Armakart Track Weather| : Clear won the vote!" remoteExec ["systemChat",0,true];
		0 setOvercast 0;
		0 setFog 0;
		0 setRain 0;
		0 setLightnings 0;
		0 setWaves 0;
		forceWeatherChange;

	};

	case WEATHER_CLOUDY: {
	
		"|Armakart Track Weather| : Cloudy won the vote!" remoteExec ["systemChat",0,true];
		0 setOvercast 0.95;
		0 setFog 0;
		0 setRain 0;
		0 setLightnings 0;
		0 setWaves 0;
		_init_dir = random 360;
		setWind [_init_dir, _init_dir, false];
		forceWeatherChange;

	};

	case WEATHER_FOGGY: {

		"|Armakart Track Weather| : Foggy won the vote!" remoteExec ["systemChat",0,true];
		0 setOvercast 0.42;
		0 setFog 0.75;
		0 setRain 0;
		0 setLightnings 0;
		0 setWaves 0;
		forceWeatherChange;
	
	};

	case WEATHER_LIGHT_RAIN: {

		"|Armakart Track Weather| : Light Rain won the vote!" remoteExec ["systemChat",0,true];
		0 setOvercast 0.85;
		0 setFog 0;
		0 setRain 0.35;
		0 setLightnings 0;
		0 setWaves 0;
		_init_dir = random 360;
		setWind [_init_dir, _init_dir, false];
		forceWeatherChange;
	
	};

	case WEATHER_STORMY: {

		"|Armakart Track Weather| : Stormy won the vote!" remoteExec ["systemChat",0,true];
		0 setOvercast 1;
		0 setFog 0;
		0 setRain 1;
		0 setLightnings 1;
		0 setWaves 1;
		_init_dir = random 360;
		setWind [_init_dir, _init_dir, false];
		0 setGusts 0.85;
		forceWeatherChange;

	};

	default {WEATHER_CLEAR};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart Voting| : Tallied Weather votes.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";