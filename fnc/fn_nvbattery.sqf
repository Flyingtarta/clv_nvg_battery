
if !(hasInterface) exitWith {};
/*
	Author:
		[calaveras] FlyingTarta
	Description:
	 	Adds battery duration to night vision googles
	Parameter(s):
		NOTHING
	Returns:
		NOTHING
*/
#define HORAS 5
TARTA_NVB_DURACIONBATERIA = 3600*HORAS; // duracion de la bateria (5hs)
TARTA_NVB_estadoBateria = TARTA_NVB_DURACIONBATERIA;
TARTA_NVB_bateria = 100;

//consumo de bateria
addMissionEventHandler [ "EachFrame", {
	if (missionnamespace getvariable ["TARTA_NVB_BATTERY_EXIT",false]) exitwith {};//debug
	//baja bateria si no esta a pie
	_bateria = TARTA_NVB_bateria;
	if (currentVisionMode player isequalto 1 && isnull (objectParent player)) then {
		if (_bateria > 50) then {
				10 cutRsc ["bat_100","PLAIN"];
		}else{
			if (_bateria > 10) then {
					10 cutRsc ["bat_50","PLAIN"];
			}else{
				if (_bateria > 0) then {
						10 cutRsc ["bat_10","PLAIN"];
				}else{
					if (_bateria isequalto 0) then {
							10 cutRsc ["bat_0","PLAIN"];
							//titleCut ["", "BLACK FADED",1];
							setAperture 1000000000000;
					};
				};
			};
		};
	}else{
		10 cutRsc ["RscTitleDisplayEmpty","PLAIN"];//borra 0 cutRsc ["RscTitleDisplayEmpty","PLAIN", 1];
		setAperture -1;
	};
}];
private _nvg_list = ["rhs_1PN138","rhsusf_ANPVS_14","rhsusf_ANPVS_15"];
//accion de ace de cambiar bateria
private _action = ["Change NVG battery","Change NVG battery","",{
		player removeitem "Laserbatteries";
		TARTA_NVB_estadoBateria = TARTA_NVB_DURACIONBATERIA;
		TARTA_NVB_bateria = 100;
	},{"Laserbatteries" in (magazineCargo player)}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;



while {true} do {
	if (missionnamespace getvariable ["TARTA_NVB_BATTERY_EXIT",false]) exitwith {};//debug
	_vision = currentVisionMode player;
	_hmd = hmd player;
	if (_hmd isnotequalto "") then {
		if ( TARTA_NVB_bateria > 0 && _vision > 0 && isnull (objectParent player) && ( _hmd in _nvg_list || "nvg" in toLower _hmd) ) then {
			if (_vision isequalto 1) then {
				TARTA_NVB_estadoBateria = TARTA_NVB_estadoBateria - (1*timeMultiplier);
			}else{
				TARTA_NVB_estadoBateria = TARTA_NVB_estadoBateria - (2*timeMultiplier);
			};
			TARTA_NVB_bateria = linearConversion [0,TARTA_NVB_DURACIONBATERIA,TARTA_NVB_estadoBateria, 0,100,true];
		};
	};
	sleep 1;
};
