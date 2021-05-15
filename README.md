# clv_nvg_battery
add battery duration to night vision 

MULTIPLAYER COMPATIBLE
NEEDS ACE3

to make it work download the folder and pasteit on mission root folder, create a file called `description.ext` and paste this in it:

```

class CfgFunctions {
	#include "clv_nvg_battery\functions.hpp"
};

class RscTitles
{
  #include "clv_nvg_battery\gui\interfaz.hpp"
};

```

#DO NOT CHANGE FOLDER NAME

batterys have 5 hours duration, if you use time aceleration, this time will afect battery duration 
the batterys that use are from ACE3 "Laserbatteries" or laser designator bateries on magazines. 

this will be a mod in a future.

**Discalimer:**

**This scripts is in test phase if you need to disable it midgame execute on console:**

``missionnamespace setvariable ["TARTA_NVB_BATTERY_EXIT",true,true];``
