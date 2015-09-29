/*
| Author:
|
|	Pfc.Christiansen
|_____
|
|   Description: Recover Weapons Crate
|
|	Created: 26.January 2015
|	Last modified: By:
|	Made for AhoyWorld.
*/

//Defines+mission name

_missionLocations = ["Shuhada","Shuhada_1","Shuhada_2","Shuhada_3","Shuhada_4","Shuhada_5","sinai","sinai_1","sinai_2","sinai_3","sinai_4","sinai_5","West_Sinai","West_Sinai_1","West_Sinai_2","West_Sinai_3","West_Sinai_4","West_Sinai_5","Resafa","Resafa_1","Resafa_2","Resafa_3","Resafa_4","Resafa_5","Nazal","Nazal_1","Nazal_2","Nazal_3","Nazal_4","Nazal_5","Nazal_6","Nazal_7","Al_Fallujah","Al_Fallujah_1","Al_Fallujah_2","Al_Fallujah_3","Al_Fallujah_4","Al_Fallujah_5","Industrial_Park","Industrial_Park_1","Industrial_Park_2","Industrial_Park_3","Industrial_Park_4","Industrial_Park_5","Askari","Askari_2","Askari_3","Askari_3","Askari_4","Askari_5","Jeghaifi","Jeghaifi_1","Jeghaifi_2","Jeghaifi_3","Jeghaifi_4","Jeghaifi_5","Shurta","Shurta_1","Shurta_2","Shurta_3","Shurta_4","Shurta_5","Mualumeen","Mualumeen_1","Mualumeen_2","Mualumeen_3","Mualumeen_4","Mualumeen_5","Muhandisin","Muhandisin_1","Muhandisin_2","Muhandisin_3","Muhandisin_4","Muhandisin_5","Jolan","Jolan_1","Jolan_2","Jolan_3","Jolan_4","Jolan_5","Jolan_6","Jolan_7","North_West","North_West_1","North_West_2","North_West_3","North_West_4","North_West_5","North_West_6","North_West_7"];

_dropZone = getMarkerPos "spawn_zone";
call KC_fnc_missionName;
_missionName = KC_missionName;

CRATE_SALV = 0;
CRATE_DEAD = 0;
// Get Random Mission Loc

_missionLoc = _missionLocations call BIS_fnc_selectRandom;



//Spawn In enemies
waituntil{DAC_NewZone == 0};
_DACvalues = ["m8",[3,0,0],[8,4,20,5],[],[],[],[0,0,0,0]];
[getMarkerPos _missionLoc,400,400,0,0,_DACvalues] call DAC_fNewZone;
waituntil{DAC_NewZone == 0};


//Create Crate

wep_crate = createVehicle ["B_supplyCrate_F", getMarkerPos _missionLoc, [], 100, "NONE" ];
wep_crate setVehicleLock "LOCKED";
[wep_crate,true,[0,2,0],0] call ace_dragging_fnc_setDraggable;

//Mission Hint+markers

 _misHintText = format
	[
		"<t align='center' size='2.2'>New Op</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>A helicopter dropped its slingload of experimental weapons while under fire, secure the cache before OPFOR manages to salvage it! The crate needs to be brought back to the Dropoff zone <br/><br/>",
		_missionName
	];

["Globalhint_EH", [_misHintText]] call ace_common_fnc_globalEvent;

_marker = createMarker ["mission8_mrk", getMarkerPos _missionLoc ];
"mission8_mrk" setMarkerShape "ICON";
"mission8_mrk" setMarkerType "selector_selectable";
"mission8_mrk" setMarkerColor "ColorBLUFOR";
"mission8_mrk" setMarkerText "Objective";

_marker2 = createMarker ["mission8_1", getMarkerPos _missionLoc];
"mission8_1" setMarkerShape "RECTANGLE";
"mission8_1" setMarkerSize [400,400];
"mission8_1" setMarkerBrush "Border";
"mission8_1" setMarkerColor "ColorOPFOR";

_marker3 = createMarker ["mission8_2_mrk", getMarkerPos "AOMarker"];
"mission8_2_mrk" setMarkerShape "ICON";
"mission8_2_mrk" setMarkerType "mil_dot";
"mission8_2_mrk" setMarkerText "A helicopter dropped its slingload of experimental weapons while under fire, secure the cache before OPFOR manage to salvage it. The crate needs to be brought back to the dropoff zone.";

//Trigger for salvaged crate + if crate dies
_trg = createTrigger ["EmptyDetector",_dropZone];
_trg setTriggerArea [20,20,20,false];
_trg setTriggerStatements ["wep_crate distance thistrigger < 10","CRATE_SALV = 1",""];

_trg2 = createTrigger ["EmptyDetector",getMarkerPos _missionLoc];
_trg2 setTriggerArea [20,20,20,false];
_trg2 setTriggerStatements ["!alive wep_crate","CRATE_DEAD = 1",""];


//EndMiss
waitUntil {CRATE_SALV == 1 or CRATE_DEAD == 1};


	if ( CRATE_SALV == 1) then
		{
							_misSUCText = format ["<t align='center' size='2.2'>OP Complete</t><br/><t size='1.5' align='center' color='#00FF80'>%1</t><br/>____________________<br/><t align='left'>Good job with %1, get ready for new tasking</t>",_missionName];
							["Globalhint_EH", [_misSUCText]] call ace_common_fnc_globalEvent;
		};
	if ( CRATE_DEAD == 1) then
		{
							_misFAILText = format ["<t align='center' size='2.2'>OP FAILED</t><br/><t size='1.5' align='center' color='#ff0000'>%1</t><br/>____________________<br/><t align='left'>Tough luck with %1, get ready for new tasking</t>",_missionName];
							["Globalhint_EH", [_misFAILText]] call ace_common_fnc_globalEvent;
		};



deleteVehicle _trg;
deleteVehicle _trg2;
deleteMarker "mission8_mrk";
deleteMarker "mission8_1";
deleteMarker "mission8_2_mrk";
sleep 30;
deleteVehicle wep_crate;
sleep 30;
waituntil{DAC_NewZone == 0};
["m8"] call DAC_fDeleteZone;
waituntil{DAC_NewZone == 0};
KC_MISS = false;
