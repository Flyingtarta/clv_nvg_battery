if !(hasInterface) exitWith {};
#define HORAS 6
duracionBateria = 3600*HORAS; // duracion de la bateria (6hs)
estado_bateria = duracionBateria;
bateria = 100;

//consumo de bateria
addMissionEventHandler [ "EachFrame", {
	//baja bateria si no esta a pie
	if (isNil "bateria") exitwith {systemchat "esperando la carrosa"};
	_bateria = bateria;
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
_action = ["Change NVG battery","Change NVG battery","",{
		player removeitem "Laserbatteries";
		estado_bateria = duracionBateria;
		bateria = 100;
	},{"Laserbatteries" in (magazineCargo player)}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;



while {true} do {
	_vision = currentVisionMode player;
	_hmd = hmd player;
	if (_hmd isnotequalto "") then {
		if ( bateria > 0 && _vision > 0 && isnull (objectParent player) && ( _hmd in _nvg_list || "nvg" in toLower _hmd) ) then {
			if (_vision isequalto 1) then {
				estado_bateria = estado_bateria - (1*timeMultiplier);
			}else{
				estado_bateria = estado_bateria - (2*timeMultiplier);
			};
			bateria = linearConversion [0,duracionBateria,estado_bateria, 0,100,true];
		};
	};
	sleep 1;
};
