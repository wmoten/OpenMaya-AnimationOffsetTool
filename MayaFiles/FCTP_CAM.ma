//Maya ASCII 2017ff05 scene
//Name: FCTP_CAM.old.ma
//Last modified: Thu, Apr 19, 2018 01:40:28 PM
//Codeset: UTF-8
requires maya "2017ff05";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2017";
fileInfo "version" "2017";
fileInfo "cutIdentifier" "201706020738-1017329";
fileInfo "osv" "Linux 3.10.0-327.28.3.el7.x86_64 #1 SMP Thu Aug 18 19:05:49 UTC 2016 x86_64";
createNode transform -n "cam_rig";
	rename -uid "4C51E900-0000-5F9D-5AB9-B88D0000033A";
	addAttr -ci true -sn "FCTP_nodeName" -ln "FCTP_nodeName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".it" no;
	setAttr -l on ".FCTP_nodeName" -type "string" "rig";
createNode transform -n "cam_target_objects" -p "cam_rig";
	rename -uid "4C51E900-0000-5F9D-5AB9-BA6C00000397";
	addAttr -ci true -sn "FCTP_nodeName" -ln "FCTP_nodeName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovv" no;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".FCTP_nodeName" -type "string" "bbox";
createNode transform -n "cam_offset" -p "cam_rig";
	rename -uid "4C51E900-0000-5F9D-5AB9-BA5F0000038E";
	addAttr -ci true -sn "FCTP_nodeName" -ln "FCTP_nodeName" -dt "string";
	addAttr -ci true -sn "cameraFitPercent" -ln "cameraFitPercent" -dv 0.25 -min 0.01 
		-max 150 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".FCTP_nodeName" -type "string" "offset";
	setAttr ".cameraFitPercent" 100;
createNode transform -n "cam_rotate" -p "cam_offset";
	rename -uid "4C51E900-0000-5F9D-5AB9-CC1900000460";
	addAttr -ci true -sn "FCTP_nodeName" -ln "FCTP_nodeName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 0.61449999 0.070500009 0.046500023 ;
	setAttr ".t" -type "double3" 0 0 -6.4142874776823133e-16 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".ry";
	setAttr -k off ".rx";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".dla" yes;
	setAttr ".oclr" -type "float3" 1 1 1 ;
	setAttr -l on ".FCTP_nodeName" -type "string" "rotate";
createNode transform -n "cam_translate" -p "cam_rotate";
	rename -uid "5AF40900-0000-420C-5AB9-F96700000729";
	addAttr -ci true -sn "FCTP_nodeName" -ln "FCTP_nodeName" -dt "string";
	setAttr -l on -k off ".v";
	setAttr -k off ".tz";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".s";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".FCTP_nodeName" -type "string" "translate";
createNode transform -n "Tilt" -p "cam_translate";
	rename -uid "51B58900-0000-1B7A-5AC1-ED1F000008B8";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode transform -n "PanDollyPed" -p "Tilt";
	rename -uid "E1CFB900-0000-6053-5ABD-C47C000079CA";
	setAttr -l on -k off ".v";
	setAttr -k off ".ty";
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -2.3625545964023331e-13 0.21003135714375559 -0.056991499999526685 ;
	setAttr ".sp" -type "double3" -2.3625545964023331e-13 0.21003135714375559 -0.056991499999526685 ;
createNode transform -n "cam" -p "PanDollyPed";
	rename -uid "4C51E900-0000-5F9D-5AB9-B790000002DE";
	addAttr -ci true -sn "FCTP_nodeName" -ln "FCTP_nodeName" -dt "string";
	addAttr -ci true -sn "RX" -ln "RX" -at "double";
	addAttr -ci true -sn "RY" -ln "RY" -at "double";
	addAttr -ci true -sn "Tilt" -ln "Tilt" -at "double";
	addAttr -ci true -sn "Pedestal" -ln "Pedestal" -at "double";
	addAttr -ci true -sn "Dolly" -ln "Dolly" -at "double";
	addAttr -ci true -sn "Pan" -ln "Pan" -at "double";
	addAttr -ci true -sn "CamFitPercent" -ln "CamFitPercent" -dv 100 -min 0.01 -max 
		150 -at "double";
	addAttr -ci true -sn "fitCamToPropVersion" -ln "fitCamToPropVersion" -dt "string";
	addAttr -ci true -sn "melCommand" -ln "melCommand" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.3594413058935741e-13 8.9845891300281754e-13 4.7341575309429707e-13 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -1.3930745675579361e-15 -5.4665783587654186e-15 3.1716650621594524e-14 ;
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999978 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -2.2204460492503126e-16 0.21003135714285714 -0.05699150000000007 ;
	setAttr ".sp" -type "double3" 0 0.21003135714285714 -0.056991500000000084 ;
	setAttr ".spt" -type "double3" -2.2204460492503126e-16 0 1.3877787807814451e-17 ;
	setAttr ".hdl" -type "double3" 0 0.21003135714285714 -0.056991500000000084 ;
	setAttr ".dh" yes;
	setAttr -l on ".FCTP_nodeName" -type "string" "cam";
	setAttr -k on ".RX";
	setAttr -k on ".RY";
	setAttr -k on ".Tilt";
	setAttr -k on ".Pedestal";
	setAttr -k on ".Dolly";
	setAttr -k on ".Pan";
	setAttr -k on ".CamFitPercent";
	setAttr -l on -cb on ".fitCamToPropVersion" -type "string" "0.1.0";
	setAttr -l on -cb on ".melCommand" -type "string" "fitCamToProp";
createNode camera -n "camShape" -p "cam";
	rename -uid "4C51E900-0000-5F9D-5AB9-B790000002DF";
	setAttr -k off ".v";
	setAttr ".rnd" no;
	setAttr ".cap" -type "double2" 1.41732 0.94488 ;
	setAttr ".ff" 0;
	setAttr ".ovr" 1.3;
	setAttr ".ncp" 1;
	setAttr ".fcp" 10000000;
	setAttr ".fd" 50;
	setAttr ".coi" 0.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "camera1";
	setAttr ".den" -type "string" "camera1_depth";
	setAttr ".man" -type "string" "camera1_mask";
	setAttr ".tp" -type "double3" -1.1920928955078125e-06 0 0 ;
	setAttr ".uls" yes;
	setAttr ".dr" yes;
	setAttr ".jc" yes;
	setAttr ".ai_translator" -type "string" "perspective";
createNode unitConversion -n "unitConversion2";
	rename -uid "E1CFB900-0000-6053-5ABD-C7D7000079F4";
	setAttr ".cf" 57.295779513082323;
createNode animCurveTA -n "RY1_rotateY";
	rename -uid "4C51E900-0000-5F9D-5AB9-CC9100000495";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  1 0 96 360;
createNode unitConversion -n "unitConversion4";
	rename -uid "E1CFB900-0000-6053-5ABD-C94E00007A36";
	setAttr ".cf" 0.017453292519943295;
createNode multiplyDivide -n "camOffsetPercent";
	rename -uid "50E55900-0000-20EB-5ABC-534100000336";
	setAttr ".op" 2;
createNode multiplyDivide -n "radiusDivFov";
	rename -uid "50E55900-0000-20EB-5ABC-54730000033D";
	setAttr ".op" 2;
createNode multiplyDivide -n "radiusXaspectRatio";
	rename -uid "50E55900-0000-20EB-5ABC-4F2C00000320";
createNode multiplyDivide -n "radius";
	rename -uid "2E87B900-0000-155C-5ABB-509C00000577";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 0.70999998 1 1 ;
createNode distanceBetween -n "distanceBetween1";
	rename -uid "0CEA8900-0000-4E09-5AD8-0E2600001495";
createNode multiplyDivide -n "focalLenxApature";
	rename -uid "87474900-0000-75B5-5ABB-5597000002C2";
	setAttr ".op" 2;
createNode multiplyDivide -n "halfofApature";
	rename -uid "87474900-0000-75B5-5ABB-5EB00000033F";
createNode condition -n "horzOrVertApature";
	rename -uid "50E55900-0000-20EB-5ABC-49C90000030D";
	setAttr ".op" 2;
	setAttr ".st" 1;
createNode unitConversion -n "mmTOinches";
	rename -uid "2E87B900-0000-155C-5ABB-31F3000002F3";
	setAttr ".cf" 0.03937;
createNode multiplyDivide -n "cam_offset_percent";
	rename -uid "50E55900-0000-20EB-5ABC-585C000003FD";
	setAttr ".op" 2;
	setAttr ".i2" -type "float3" 100 1 1 ;
createNode unitConversion -n "unitConversion3";
	rename -uid "E1CFB900-0000-6053-5ABD-C7EB000079F5";
	setAttr ".cf" 0.017453292519943295;
createNode unitConversion -n "unitConversion1";
	rename -uid "E1CFB900-0000-6053-5ABD-C7B0000079F2";
	setAttr ".cf" 0.017453292519943295;
createNode plusMinusAverage -n "bboxCenter";
	rename -uid "5AF40900-0000-420C-5AB9-F05C00000573";
	addAttr -ci true -sn "cameraFitPercent" -ln "cameraFitPercent" -dv 0.25 -min 0 
		-max 1 -at "double";
	setAttr ".op" 3;
	setAttr -s 2 ".i3";
	setAttr -s 2 ".i3";
	setAttr -k on ".cameraFitPercent";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 11 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultResolution;
	setAttr ".dar" 1.7777777910232544;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "/marza/proj/fiat/tools/ocio/fiat.ocio";
	setAttr ".vtn" -type "string" "pointes (sRGB)";
	setAttr ".wsn" -type "string" "ACES - ACEScg";
	setAttr ".otn" -type "string" "pointes (sRGB)";
	setAttr ".potn" -type "string" "pointes (sRGB)";
connectAttr "bboxCenter.o3" "cam_offset.t";
connectAttr "unitConversion3.o" "cam_rotate.ry" -l on;
connectAttr "unitConversion1.o" "cam_rotate.rx" -l on;
connectAttr "camOffsetPercent.ox" "cam_translate.tz" -l on;
connectAttr "unitConversion4.o" "Tilt.rx" -l on;
connectAttr "cam.Pedestal" "PanDollyPed.ty" -l on;
connectAttr "cam.Pan" "PanDollyPed.tx" -l on;
connectAttr "cam.Dolly" "PanDollyPed.tz" -l on;
connectAttr "unitConversion2.o" "cam.RY";
connectAttr "RY1_rotateY.o" "unitConversion2.i";
connectAttr "cam.Tilt" "unitConversion4.i";
connectAttr "radiusDivFov.ox" "camOffsetPercent.i1x";
connectAttr "cam_offset_percent.ox" "camOffsetPercent.i2x";
connectAttr "radiusXaspectRatio.ox" "radiusDivFov.i1x";
connectAttr "focalLenxApature.ox" "radiusDivFov.i2x";
connectAttr "radius.ox" "radiusXaspectRatio.i1x";
connectAttr ":defaultResolution.dar" "radiusXaspectRatio.i2x";
connectAttr "distanceBetween1.d" "radius.i1x";
connectAttr "cam_target_objects.bbmx" "distanceBetween1.p1";
connectAttr "cam_target_objects.c" "distanceBetween1.p2";
connectAttr "halfofApature.ox" "focalLenxApature.i1x";
connectAttr "mmTOinches.o" "focalLenxApature.i2x";
connectAttr "horzOrVertApature.ocr" "halfofApature.i1x";
connectAttr ":defaultResolution.dar" "horzOrVertApature.ft";
connectAttr "camShape.hfa" "horzOrVertApature.cfr";
connectAttr "camShape.vfa" "horzOrVertApature.ctr";
connectAttr "camShape.fl" "mmTOinches.i";
connectAttr "cam.CamFitPercent" "cam_offset_percent.i1x";
connectAttr "cam.RY" "unitConversion3.i";
connectAttr "cam.RX" "unitConversion1.i";
connectAttr "cam_target_objects.bbmx" "bboxCenter.i3[0]";
connectAttr "cam_target_objects.bbmn" "bboxCenter.i3[1]";
connectAttr "bboxCenter.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "mmTOinches.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "radius.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "focalLenxApature.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "halfofApature.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "horzOrVertApature.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "radiusXaspectRatio.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "camOffsetPercent.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "radiusDivFov.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "cam_offset_percent.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "distanceBetween1.msg" ":defaultRenderUtilityList1.u" -na;
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
// End of FCTP_CAM.old.ma