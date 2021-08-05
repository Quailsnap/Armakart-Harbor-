class Crosshair	
{
	idd = 1345;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.82};
			onload = "uiNamespace setVariable [ 'Crosshair_1', _this select 0 ];";
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0103125 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.82};
			onload = "uiNamespace setVariable [ 'Crosshair_2', _this select 0 ];";
		};
	};	
};

class In_Race_UI	
{
	idd = 1345;

	duration = 99999999999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by Njpatman, v1.063, #Sowehi)
			////////////////////////////////////////////////////////

			class RscText_1000: RscText
			{
				idc = 1000;
				x = 0.133906 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.0721875 * safezoneW;
				h = 0.044 * safezoneH;
				onload = "uiNamespace setVariable [ 'Personal_UI_Background_1', _this select 0 ];";
			};
			class RscText_1002: RscText
			{
				idc = 1002;
				x = 0.0565625 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.0721875 * safezoneW;
				h = 0.044 * safezoneH;
				onload = "uiNamespace setVariable [ 'Personal_UI_Background_2', _this select 0 ];";
			};

			//////////////////////////////////////////////////

			class RscFrame_1802: RscFrame
			{
				idc = 1802;
				x = 0.133906 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.0721875 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class RscFrame_1803: RscFrame
			{
				idc = 1803;
				x = 0.0565625 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.0721875 * safezoneW;
				h = 0.044 * safezoneH;
			};

			//////////////////////////////////////////////////

			class RscStructuredText_1100: RscStructuredText
			{
				idc = 1100;
				text = ""; //--- ToDo: Localize;
				font = "puristaMedium";
				x = 0.799062 * safezoneW + safezoneX;
				y = 0.83 * safezoneH + safezoneY;
				w = 0.159844 * safezoneW;
				h = 0.088 * safezoneH;
				onload = "uiNamespace setVariable [ 'Personal_UI_Places', _this select 0 ];";
			};
			class RscStructuredText_1101: RscStructuredText
			{
				idc = 1101;
				text = ""; //--- ToDo: Localize;
				font = "puristaMedium";
				x = 0.0874999 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.044 * safezoneH;
				onload = "uiNamespace setVariable [ 'Personal_UI_CPs', _this select 0 ];";
			};
			class RscStructuredText_1102: RscStructuredText
			{
				idc = 1102;
				text = ""; //--- ToDo: Localize;
				font = "puristaMedium";
				x = 0.164843 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.044 * safezoneH;
				onload = "uiNamespace setVariable [ 'Personal_UI_Laps', _this select 0 ];";
			};

			//////////////////////////////////////////////////

			class RscPicture_1200: RscPicture
			{
				idc = 1200;
				text = "Armakart_Main\Armakart_Functions\Armakart_Fnc_UI\UI_FLAG.paa";
				x = 0.133906 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class RscPicture_1201: RscPicture
			{
				idc = 1201;
				text = "Armakart_Main\Armakart_Functions\Armakart_Fnc_UI\UI_CP.paa";
				x = 0.0565624 * safezoneW + safezoneX;
				y = 0.874 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.044 * safezoneH;
			};

			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT END
			////////////////////////////////////////////////////////
	};	
};

class Customization_Timer_UI	
{
	idd = 1235;

	duration = 99999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class Text: RscStructuredText
		{
			idc = 1104;

			text = "<br/> <t align = 'center'> If you've exited the Customization Menu, simply Self Interact >> Reset Menu</t> <br/><br/> <t align = 'center' size='0.7'> The Customization Phase Timer will not be 100% accurate, but it should give you a good idea of when the Customization Phase will end.</t>"; //--- ToDo: Localize;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.896 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.099 * safezoneH;
			onload = "uiNamespace setVariable [ 'Bottom_Top', _this select 0 ];";
		};
		class Timer_Title: RscStructuredText
		{
			idc = 1105;

			text = "<t align = 'center'  size='2'>--- Customization Time Left ---</t>"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.016 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.066 * safezoneH;
			onload = "uiNamespace setVariable [ 'Timer_Title', _this select 0 ];";			
		};			
	};	
};

class Timer
{

	idd = 1236;

	duration = 999;
	fadein = 0;
	fadeout = 0;
	movingEnable = false;

	class controls
	{
		class timer_text: RscStructuredText
		{
			idc = 10;

			x = 0.422656 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			onload ="uiNamespace setVariable [ 'TimerCtrl', _this select 0 ];";
		};
	};
};