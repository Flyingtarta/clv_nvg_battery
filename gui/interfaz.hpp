class RscPicture
{
		access = 0;
		idc = -1;
		type = 0;
		style = 48;
		colorBackground[] = {0,0,0,0};
		colorText[] = {1,1,1,1};
		font = "PuristaLight";
		sizeEx = 1;
		lineSpacing = 0;
		text = "";
		fixedWidth = 0;
		shadow = 0;
};

class bat_0 {
	idd = -1;
	movingEnable = 0;
	duration = 10000;
	fadein = 0;
	fadeout = 0;
	name = "bat_0";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		x = 0.4;//safeZoneX + safeZoneW// * 0.9;
		y = 0;//safeZoneY + safeZoneH// * 0.08;
		w = 0.20//*safeZoneH; //safeZoneH * 0.15;
		h = 0.20//*safeZoneW;//safeZoneH * 0.15
		idc = 1200;
		text = "clv_nvg_battery\img\Bat_0.paa";
	};
};

class bat_10 {
	idd = -1;
	movingEnable = 0;
	duration = 10000;
	fadein = 0;
	fadeout = 0;
	name = "bat_10";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		x = safeZoneX + safeZoneW * 0.9;
		y = safeZoneY + safeZoneH * 0.08;
		w = safeZoneH * 0.1;
		h = safeZoneH * 0.1;
		idc = 1200;
		text = "clv_nvg_battery\img\bat_10.paa";
	};
};

class bat_50 {
	idd = -1;
	movingEnable = 0;
	duration = 10000;
	fadein = 0;
	fadeout = 0;
	name = "bat_50";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		x = safeZoneX + safeZoneW * 0.9;
		y = safeZoneY + safeZoneH * 0.08;
		w = safeZoneH * 0.1;
		h = safeZoneH * 0.1;
		idc = 1200;
		text = "clv_nvg_battery\img\bat_50.paa";
	};
};

class bat_100 {
	idd = -1;
	movingEnable = 0;
	duration = 10000;
	fadein = 0;
	fadeout = 0;
	name = "bat_100";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		x = safeZoneX + safeZoneW * 0.9;
		y = safeZoneY + safeZoneH * 0.08;
		w = safeZoneH * 0.1;
		h = safeZoneH * 0.1;
		idc = 1200;
		text = "clv_nvg_battery\img\bat_100.paa";
	};
};
