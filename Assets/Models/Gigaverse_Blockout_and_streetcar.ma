//Maya ASCII 2022 scene
//Name: Gigaverse_Blockout_and_streetcar.ma
//Last modified: Sat, Sep 24, 2022 12:56:29 PM
//Codeset: 1252
requires maya "2022";
requires "stereoCamera" "10.0";
requires -nodeType "aiOptions" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter" "mtoa" "5.2.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202205171752-c25c06f306";
fileInfo "osv" "Windows 10 Education v2009 (Build: 19044)";
fileInfo "UUID" "78FE68A0-4C54-5ED6-6396-AE88E9071269";
fileInfo "license" "education";
createNode transform -n "PR_Plane_01";
	rename -uid "FD4336C4-4B9F-20E3-44C9-17BBF50E566F";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr ".s" -type "double3" 12.249138152412671 0.19096795209803033 12.249138152412671 ;
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "PR_Plane_01Shape" -p "PR_Plane_01";
	rename -uid "EEF27EAA-4DAB-4EB4-3BDE-CC8922EA7BE1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 1 3 0 3 2 0 2 0 0 3 5 0 5 4 0 4 2 0
		 5 7 0 7 6 0 6 4 0 7 1 0 0 6 0;
	setAttr -s 24 ".n[0:23]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0
		 1 0 0 1 0 0 1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2
		f 4 -3 4 5 6
		mu 0 4 2 3 5 4
		f 4 -6 7 8 9
		mu 0 4 4 5 7 6
		f 4 -9 10 -1 11
		mu 0 4 6 7 9 8
		f 4 -11 -8 -5 -2
		mu 0 4 1 10 11 3
		f 4 -12 -4 -7 -10
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "PR_BigBuilding_01";
	rename -uid "E49698D3-47E6-98D9-7386-529BCD30BBED";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr ".t" -type "double3" -1.9028346538543701 1.3681361675262451 -1.5016970634460449 ;
	setAttr ".s" -type "double3" 8.2570383378572316 2.5453042237484844 3.2043470809005532 ;
	setAttr ".rp" -type "double3" -2.8809075355529785 -1.2726522173131909 1.2726521004605362 ;
	setAttr ".sp" -type "double3" -0.49999998664828516 -0.50000004142489018 0.49999999551577901 ;
	setAttr ".spt" -type "double3" -2.3809075489046934 -0.77265217588830071 0.77265210494475722 ;
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "PR_BigBuilding_01Shape" -p "PR_BigBuilding_01";
	rename -uid "F09FFB6A-4947-9E8F-446E-5381A46FD407";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 1 3 0 3 2 0 2 0 0 3 5 0 5 4 0 4 2 0
		 5 7 0 7 6 0 6 4 0 7 1 0 0 6 0;
	setAttr -s 24 ".n[0:23]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0
		 1 0 0 1 0 0 1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2
		f 4 -3 4 5 6
		mu 0 4 2 3 5 4
		f 4 -6 7 8 9
		mu 0 4 4 5 7 6
		f 4 -9 10 -1 11
		mu 0 4 6 7 9 8
		f 4 -11 -8 -5 -2
		mu 0 4 1 10 11 3
		f 4 -12 -4 -7 -10
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "PR_SmallBuilding1_01";
	rename -uid "C71C432F-48B7-1188-4008-FEBD2B67A1FD";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr ".t" -type "double3" -1.9028346538543701 1.3681361675262451 3.265878438949585 ;
	setAttr ".s" -type "double3" 3.2535457612310088 2.5453042237484844 2.3586226672002422 ;
	setAttr ".rp" -type "double3" -2.8809075355529785 -1.2726522173131909 1.2726521004605362 ;
	setAttr ".sp" -type "double3" -0.49999998664828516 -0.50000004142489018 0.49999999551577901 ;
	setAttr ".spt" -type "double3" -2.3809075489046934 -0.77265217588830071 0.77265210494475722 ;
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "PR_SmallBuilding1_01Shape" -p "PR_SmallBuilding1_01";
	rename -uid "34AB509E-4E8A-D433-D962-BF9587D35015";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 1 3 0 3 2 0 2 0 0 3 5 0 5 4 0 4 2 0
		 5 7 0 7 6 0 6 4 0 7 1 0 0 6 0;
	setAttr -s 24 ".n[0:23]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0
		 1 0 0 1 0 0 1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2
		f 4 -3 4 5 6
		mu 0 4 2 3 5 4
		f 4 -6 7 8 9
		mu 0 4 4 5 7 6
		f 4 -9 10 -1 11
		mu 0 4 6 7 9 8
		f 4 -11 -8 -5 -2
		mu 0 4 1 10 11 3
		f 4 -12 -4 -7 -10
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "PR_SmallBuilding2_01";
	rename -uid "AF49C94A-4ECA-B233-3AFF-998D95B775BD";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr ".t" -type "double3" 2.7377355098724365 1.3681361675262451 3.265878438949585 ;
	setAttr ".s" -type "double3" 3.0514830410010076 2.5453042237484844 2.3586226672002422 ;
	setAttr ".rp" -type "double3" 0.73556049030015647 1.2726521257911718 1.2726519340236482 ;
	setAttr ".sp" -type "double3" 0.50000000139181444 0.5000000054676883 0.49999992495049095 ;
	setAttr ".spt" -type "double3" 0.23556048890834203 0.77265212032348352 0.77265200907315723 ;
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "PR_SmallBuilding2_01Shape" -p "PR_SmallBuilding2_01";
	rename -uid "AEF9B5C2-4628-B311-8D84-A4BCE0B7B71E";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 1 3 0 3 2 0 2 0 0 3 5 0 5 4 0 4 2 0
		 5 7 0 7 6 0 6 4 0 7 1 0 0 6 0;
	setAttr -s 24 ".n[0:23]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0
		 1 0 0 1 0 0 1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2
		f 4 -3 4 5 6
		mu 0 4 2 3 5 4
		f 4 -6 7 8 9
		mu 0 4 4 5 7 6
		f 4 -9 10 -1 11
		mu 0 4 6 7 9 8
		f 4 -11 -8 -5 -2
		mu 0 4 1 10 11 3
		f 4 -12 -4 -7 -10
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "PR_StreetCar_01";
	rename -uid "0E359652-4051-DF3E-F319-C2B92587C234";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr ".t" -type "double3" -4.0400533676147461 0.59548389911651611 0.95400750637054443 ;
	setAttr ".s" -type "double3" 2.5797947702930588 0.89888038009804749 0.89888038009804749 ;
	setAttr ".rp" -type "double3" -1.4350043929303093 -0.49999988220270053 0.50000005904201461 ;
	setAttr ".sp" -type "double3" -0.49999996473092789 -0.49999988220270053 0.50000005904201461 ;
	setAttr ".spt" -type "double3" -0.93500442819938145 0 0 ;
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "PR_StreetCar_01Shape" -p "PR_StreetCar_01";
	rename -uid "C89095CC-4552-6C8E-BA65-8292E48B1985";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 1 3 0 3 2 0 2 0 0 3 5 0 5 4 0 4 2 0
		 5 7 0 7 6 0 6 4 0 7 1 0 0 6 0;
	setAttr -s 24 ".n[0:23]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0
		 1 0 0 1 0 0 1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2
		f 4 -3 4 5 6
		mu 0 4 2 3 5 4
		f 4 -6 7 8 9
		mu 0 4 4 5 7 6
		f 4 -9 10 -1 11
		mu 0 4 6 7 9 8
		f 4 -11 -8 -5 -2
		mu 0 4 1 10 11 3
		f 4 -12 -4 -7 -10
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "PR_Startpoint_01";
	rename -uid "20B89BDB-4F73-68B1-2337-6EA50A56F028";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr ".t" -type "double3" -6.0301904678344727 0.2016032338142395 -5.0261931419372559 ;
	setAttr ".s" -type "double3" 0.086482445389146206 0.14603082358640998 0.97561283562114021 ;
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "PR_Startpoint_01Shape" -p "PR_Startpoint_01";
	rename -uid "070818A5-489B-423E-ED84-37B2D97BE650";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 1 3 0 3 2 0 2 0 0 3 5 0 5 4 0 4 2 0
		 5 7 0 7 6 0 6 4 0 7 1 0 0 6 0;
	setAttr -s 24 ".n[0:23]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0
		 1 0 0 1 0 0 1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2
		f 4 -3 4 5 6
		mu 0 4 2 3 5 4
		f 4 -6 7 8 9
		mu 0 4 4 5 7 6
		f 4 -9 10 -1 11
		mu 0 4 6 7 9 8
		f 4 -11 -8 -5 -2
		mu 0 4 1 10 11 3
		f 4 -12 -4 -7 -10
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "PR_GoalPioint_01";
	rename -uid "7416BE5D-4505-FFE9-82C9-31BDD8C80090";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr ".t" -type "double3" 5.0064458847045898 0.2016032338142395 6.0399079322814941 ;
	setAttr ".r" -type "double3" 0 -89.999999999999972 0 ;
	setAttr ".s" -type "double3" 0.086482445389146206 0.14603082358640998 0.97561283562114021 ;
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "PR_GoalPioint_01Shape" -p "PR_GoalPioint_01";
	rename -uid "EAEF5077-409A-6D4A-BD7C-B4B5BB1637B5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 1 3 0 3 2 0 2 0 0 3 5 0 5 4 0 4 2 0
		 5 7 0 7 6 0 6 4 0 7 1 0 0 6 0;
	setAttr -s 24 ".n[0:23]" -type "float3"  0 0 1 0 0 1 0 0 1 0 0 1 0 1
		 0 0 1 0 0 1 0 0 1 0 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 -1 0 0 -1 0 0 -1 0 0 -1 0 1 0 0
		 1 0 0 1 0 0 1 0 0 -1 0 0 -1 0 0 -1 0 0 -1 0 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 3 2
		f 4 -3 4 5 6
		mu 0 4 2 3 5 4
		f 4 -6 7 8 9
		mu 0 4 4 5 7 6
		f 4 -9 10 -1 11
		mu 0 4 6 7 9 8
		f 4 -11 -8 -5 -2
		mu 0 4 1 10 11 3
		f 4 -12 -4 -7 -10
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -s -n "persp";
	rename -uid "3AEAF6F7-4F3F-D7FB-267E-56B42FAA273F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -12.80031005041227 10.809310442819621 5.5187915937837593 ;
	setAttr ".r" -type "double3" -38.738352729944758 -64.200000000000699 -1.4615475254642709e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "7A9B8839-4B7E-ECC4-623A-82B1886328D5";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 16.518334520060748;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "2C772B10-4035-8B2A-D5E5-D2AC3C58973B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "856F0690-4DE7-F641-2C77-DD82BFAD6BA3";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "A46F8DA6-41D1-47D4-8E18-C0935367C876";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -4.9903622183485039 0.70258230123495524 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "41E4C4F6-4730-A212-791F-96BA4F16E3A9";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 2.6561503752067459;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "DFF08C8E-4F18-E524-1DD5-02BC6BF90207";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "DD85FC2D-44FE-CC56-C28C-BC80BD16720F";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 110.93157646614161;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "Streetcar1:imagePlane1";
	rename -uid "16DE5B31-4503-CC56-6B32-7ABE933BED9B";
	setAttr ".t" -type "double3" -139.22037477204063 4.5038399725984171 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
	setAttr ".s" -type "double3" 20.718641964836653 20.718641964836653 2.7221506392307098 ;
createNode imagePlane -n "Streetcar1:imagePlaneShape1" -p "Streetcar1:imagePlane1";
	rename -uid "59457701-4E61-1318-4D24-279425387328";
	setAttr -k off ".v";
	setAttr ".fc" 98;
	setAttr ".imn" -type "string" "C:/Users/template/Desktop/New_Project//sourceimages/TTC-Flexicity-Streetcar.jpg";
	setAttr ".cov" -type "short2" 740 494 ;
	setAttr ".dlc" no;
	setAttr ".w" 7.4;
	setAttr ".h" 4.9399999999999995;
	setAttr ".cs" -type "string" "sRGB";
createNode transform -n "Streetcar1:pCube1";
	rename -uid "99A03CA7-4C67-7388-5B3C-058578FD453E";
	setAttr ".t" -type "double3" 0 0.7155028313561036 0 ;
	setAttr ".rp" -type "double3" -0.050169774748809015 0.095483899116516113 0.55512708425521851 ;
	setAttr ".sp" -type "double3" -0.050169774748809015 0.095483899116516113 0.55512708425521851 ;
createNode mesh -n "Streetcar1:pCubeShape1" -p "Streetcar1:pCube1";
	rename -uid "B6B9DEBD-4D7C-BDDB-0383-EA8E0600D60C";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.49999997019767761 0.10528019070625305 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode lambert -n "M_Plane_01";
	rename -uid "FEEFB2B7-45F3-153A-71AC-64A7CCD2451F";
createNode shadingEngine -n "PR_Plane_01SG";
	rename -uid "CB8AEFE2-479F-ED8E-E5FD-ECA37DAA599E";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
	rename -uid "4CC618C3-4E4F-3EDC-5405-2DA96F96BBC3";
createNode lambert -n "M_Building_01";
	rename -uid "93098334-4C31-E96D-4DB9-D2A88EDE2EC3";
	setAttr ".c" -type "float3" 0.1955 0.1955 0.1955 ;
createNode shadingEngine -n "PR_BigBuilding_01SG";
	rename -uid "65F75DC7-41E6-B144-C8C7-44AC193E5C95";
	setAttr ".ihi" 0;
	setAttr -s 3 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
	rename -uid "6548353F-432D-4599-FD5F-12B99C52C1EE";
createNode lambert -n "M_Streetcar_01";
	rename -uid "F0C6B7C9-44E1-D934-4CB2-C69BFEC85BBB";
	setAttr ".c" -type "float3" 0.2324 0.3123 0.1407 ;
createNode shadingEngine -n "PR_StreetCar_01SG";
	rename -uid "2640E53B-408B-605D-8084-0AA099E7A9D2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
	rename -uid "08AC5309-4F36-0A27-E691-E7BA5684E8C2";
createNode lambert -n "lambert4";
	rename -uid "0147D90E-4527-6A09-B9E7-92B926FC0E00";
	setAttr ".c" -type "float3" 0.29159999 0.045699999 0.045699999 ;
createNode shadingEngine -n "PR_Startpoint_01SG";
	rename -uid "EDE235B7-40B2-6E5B-C5D0-E6B996A84272";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
	rename -uid "01C02A3C-4AE3-F4AB-B8E7-D4B238D69C80";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "0C3FD305-453A-5C7A-0230-D59F8A853173";
	setAttr -s 6 ".lnk";
	setAttr -s 6 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "4502ECE5-47D2-30E0-3C72-4CB4F6CC4383";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "8A04E8B4-4710-B4B9-BF96-62ABA9387EC4";
createNode displayLayerManager -n "layerManager";
	rename -uid "5A25B854-407F-97A5-2538-38B48D1DF056";
createNode displayLayer -n "defaultLayer";
	rename -uid "E95C9CC9-4210-5E05-FE4F-7D940CF74E43";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "9B7D621A-4C9D-FDA8-0FFC-5F893325FF62";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "4EA997F9-4509-1725-986B-C09754B67EA8";
	setAttr ".g" yes;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "35AC0BDF-47D3-520D-6976-208943E83ACE";
	setAttr ".version" -type "string" "5.2.0";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "6D2D9B41-4999-204C-1C2C-FAA6DFF84C9C";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "BB94EDB4-493F-AB06-719B-92877A3235CC";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "87257D46-4D22-57C1-4AD1-3F9950EB6F22";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode polyCube -n "Streetcar1:polyCube1";
	rename -uid "CED969F1-448F-94A9-3FB6-03911A729A25";
	setAttr ".cuv" 4;
createNode polySplitRing -n "Streetcar1:polySplitRing1";
	rename -uid "A342240C-4B28-8678-7224-E097FD98D7C4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[10:11]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.88264936208724976;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing2";
	rename -uid "0255F91E-4CBC-3AC9-F14B-B5A094A2DE27";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[15]" "e[17]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.97699207067489624;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing3";
	rename -uid "E297FD6C-45A0-608E-0A80-0D8ABEA39D4F";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[23]" "e[25]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.85776352882385254;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing4";
	rename -uid "FA534894-440B-4CFB-F8E9-A4AA2DA0F445";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[31]" "e[33]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.024587942287325859;
	setAttr ".re" 33;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing5";
	rename -uid "6F8B5138-4805-7B9F-7DA1-13872AA5EE71";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[36:37]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.16157741844654083;
	setAttr ".re" 36;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing6";
	rename -uid "6B809D0D-4797-5CC8-B063-2599BC9CB704";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[44:45]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.031131042167544365;
	setAttr ".re" 44;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing7";
	rename -uid "F1DD5CE6-4ED8-B592-C0A7-72A2E5636865";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[52:53]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.18513761460781097;
	setAttr ".re" 52;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing8";
	rename -uid "35B4E7E3-4A6C-BB47-B0DD-44BE1506BEC8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[60:61]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.046942368149757385;
	setAttr ".re" 60;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing9";
	rename -uid "BB5D519A-489A-1CA8-50E2-30B0D6E061A7";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[10:13]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.097861699759960175;
	setAttr ".re" 11;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak1";
	rename -uid "3805BCC6-4EFC-C4A2-A08E-C59EFE6BEA54";
	setAttr ".uopa" yes;
	setAttr -s 32 ".tk[8:39]" -type "float3"  0 0 0.016141534 0 0 0.016141534
		 0 0 0.016141534 0 0 0.016141534 0 0 0.016141534 0 0 0.016141534 0 0 0.016141534 0
		 0 0.016141534 0 0 0.041250587 0 0 0.041250587 0 0 0.041250587 0 0 0.041250587 0 0
		 0.0035870224 0 0 0.0035870224 0 0 0.0035870224 0 0 0.0035870224 0 0 0.044837594 0
		 0 0.044837594 0 0 0.044837594 0 0 0.044837594 0 0 0.044837594 0 0 0.044837594 0 0
		 0.044837594 0 0 0.044837594 0 0 0.062772632 0 0 0.062772632 0 0 0.062772624 0 0 0.062772624
		 0 0 0.062772632 0 0 0.062772632 0 0 0.062772632 0 0 0.062772632;
createNode polySplitRing -n "Streetcar1:polySplitRing10";
	rename -uid "8D28C87F-4F8A-ED9F-FF33-65B0919A9CAC";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[68:69]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.96899253129959106;
	setAttr ".dr" no;
	setAttr ".re" 68;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode script -n "Streetcar1:uiConfigurationScriptNode";
	rename -uid "EFD3D42B-4309-16AC-04B6-2CB17C6DD25A";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 656\n            -height 731\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 656\n            -height 731\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n"
		+ "                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n"
		+ "                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n"
		+ "                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n"
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n"
		+ "                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n"
		+ "                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n"
		+ "\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 50 100 -ps 2 50 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 656\\n    -height 731\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 656\\n    -height 731\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Side View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 656\\n    -height 731\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Side View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera side` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 656\\n    -height 731\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 50 -size 500 -divisions 1 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "Streetcar1:sceneConfigurationScriptNode";
	rename -uid "7FFE8DB5-4738-AF43-C2EB-C587FC64977A";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode polySplitRing -n "Streetcar1:polySplitRing11";
	rename -uid "A98438B6-4D2C-0C84-E0A6-FAB3D873C87A";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[6:7]" "e[84:85]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.59210324287414551;
	setAttr ".dr" no;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak2";
	rename -uid "E89437CD-4854-EA21-9064-639D861DEC73";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[0]" -type "float3" 0.1645482 0.024137862 -0.04786402 ;
	setAttr ".tk[1]" -type "float3" -0.1645482 0.024137862 -0.04786402 ;
	setAttr ".tk[2]" -type "float3" 0.1645482 -0.1645482 -0.04786402 ;
	setAttr ".tk[3]" -type "float3" -0.1645482 -0.1645482 -0.04786402 ;
	setAttr ".tk[44]" -type "float3" 0 0 -0.11267202 ;
	setAttr ".tk[45]" -type "float3" 0 0 -0.11267202 ;
	setAttr ".tk[46]" -type "float3" 0 0 -0.11267202 ;
	setAttr ".tk[47]" -type "float3" 0 0 -0.11267202 ;
createNode polySplitRing -n "Streetcar1:polySplitRing12";
	rename -uid "4F71D10B-40C4-8EF0-12A3-C9B2AC85BE73";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[95]" "e[97]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.37263813614845276;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak3";
	rename -uid "BFC7A818-4182-B5F3-C020-8DB83047DA6E";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk[48:51]" -type "float3"  0.026552847 0.028309399 0
		 -0.026552847 0.028309399 0 -0.026552847 -0.028309399 0 0.026552847 -0.028309399 0;
createNode polySplitRing -n "Streetcar1:polySplitRing13";
	rename -uid "E62F8598-4ACD-0963-4D79-3384645A33B3";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[6:7]" "e[103]" "e[105]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.42712375521659851;
	setAttr ".re" 7;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak4";
	rename -uid "66F918B3-441F-7715-9315-C2BF9E945769";
	setAttr ".uopa" yes;
	setAttr -s 4 ".tk[52:55]" -type "float3"  0.017065229 0.019541034 0
		 -0.017065233 0.019541034 0 -0.017065233 -0.019541034 0 0.017065229 -0.019541034 0;
createNode polySplitRing -n "Streetcar1:polySplitRing14";
	rename -uid "C2AEDA6F-4AFC-1767-7EBB-26A91D76011C";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 3 "e[10:11]" "e[79]" "e[81]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.57753521203994751;
	setAttr ".dr" no;
	setAttr ".re" 81;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak5";
	rename -uid "468B6734-48A5-3588-0330-2B9426E1B073";
	setAttr ".uopa" yes;
	setAttr -s 10 ".tk";
	setAttr ".tk[0]" -type "float3" 0.04603637 0.055671092 0 ;
	setAttr ".tk[1]" -type "float3" -0.04603637 0.055671092 0 ;
	setAttr ".tk[2]" -type "float3" 0.04603637 -0.055671092 0 ;
	setAttr ".tk[3]" -type "float3" -0.04603637 -0.055671092 0 ;
	setAttr ".tk[50]" -type "float3" 0 0.02294427 0 ;
	setAttr ".tk[51]" -type "float3" 0 0.02294427 0 ;
	setAttr ".tk[54]" -type "float3" 0 0.033194408 0 ;
	setAttr ".tk[55]" -type "float3" 0 0.033194408 0 ;
	setAttr ".tk[58]" -type "float3" 0 0.034145027 0 ;
	setAttr ".tk[59]" -type "float3" 0 0.034145027 0 ;
createNode polySplitRing -n "Streetcar1:polySplitRing15";
	rename -uid "5210DC00-43C0-66B2-CF43-B2B477C9705D";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 2 "e[10:11]" "e[116:117]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.40876337885856628;
	setAttr ".dr" no;
	setAttr ".re" 116;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak6";
	rename -uid "690ED48F-453B-44C4-553B-23930E810341";
	setAttr ".uopa" yes;
	setAttr -s 8 ".tk";
	setAttr ".tk[4]" -type "float3" 0.13418087 -0.13418087 -0.019132858 ;
	setAttr ".tk[5]" -type "float3" -0.13418087 -0.13418087 -0.019132858 ;
	setAttr ".tk[6]" -type "float3" 0.13418087 0.13418087 -0.019132858 ;
	setAttr ".tk[7]" -type "float3" -0.13418087 0.13418087 -0.019132858 ;
	setAttr ".tk[60]" -type "float3" -0.011561776 -0.011561776 0 ;
	setAttr ".tk[61]" -type "float3" 0.011561776 -0.011561776 0 ;
	setAttr ".tk[62]" -type "float3" 0.011561776 0.011561776 0 ;
	setAttr ".tk[63]" -type "float3" -0.011561776 0.011561776 0 ;
createNode polySplitRing -n "Streetcar1:polySplitRing16";
	rename -uid "98D3D348-4D25-E7AC-76E6-EAAE21B4D7B1";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 31 "e[0:3]" "e[14]" "e[18]" "e[22]" "e[26]" "e[30]" "e[34]" "e[38]" "e[42]" "e[46]" "e[50]" "e[54]" "e[58]" "e[62]" "e[66]" "e[70]" "e[74]" "e[78]" "e[82]" "e[86]" "e[90]" "e[94]" "e[98]" "e[102]" "e[106]" "e[110]" "e[114]" "e[118]" "e[122]" "e[126]" "e[130]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.27813780307769775;
	setAttr ".re" 1;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak7";
	rename -uid "E21481FC-4CD6-9056-EC82-558C7786F319";
	setAttr ".uopa" yes;
	setAttr -s 12 ".tk";
	setAttr ".tk[40]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[41]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[42]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[43]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[60]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[61]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[62]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[63]" -type "float3" 0 0 -0.0089700976 ;
	setAttr ".tk[64]" -type "float3" 0.015950993 0.015950993 -0.0089700976 ;
	setAttr ".tk[65]" -type "float3" -0.015950993 0.015950993 -0.0089700976 ;
	setAttr ".tk[66]" -type "float3" -0.015950993 -0.015950993 -0.0089700976 ;
	setAttr ".tk[67]" -type "float3" 0.015950993 -0.015950993 -0.0089700976 ;
createNode polySplitRing -n "Streetcar1:polySplitRing17";
	rename -uid "E49E9AC6-42C4-0D19-A0E7-DEAB167464D6";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 36 "e[4:5]" "e[8:9]" "e[16]" "e[19]" "e[24]" "e[27]" "e[32]" "e[35]" "e[40]" "e[43]" "e[48]" "e[51]" "e[56]" "e[59]" "e[64]" "e[67]" "e[72]" "e[75]" "e[80]" "e[83]" "e[88]" "e[91]" "e[96]" "e[99]" "e[104]" "e[107]" "e[112]" "e[115]" "e[120]" "e[123]" "e[128]" "e[131]" "e[166]" "e[199]" "e[234]" "e[267]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.54774457216262817;
	setAttr ".dr" no;
	setAttr ".re" 56;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak8";
	rename -uid "50C4513D-48F5-58B8-67C5-C39193FFC2B5";
	setAttr ".uopa" yes;
	setAttr -s 68 ".tk[68:135]" -type "float3"  0.14457692 0 0 0.18107302
		 0 0 0.19917896 0 0 0.22950932 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484
		 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484
		 0 0 0.24399818 0 0 0.2269282 0 0 0.18274416 0 0 0.18274416 0 0 0.22692822 0 0 0.24399818
		 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484
		 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.24977484 0 0 0.22950932 0 0 0.19917896
		 0 0 0.18107302 0 0 0.14457692 0 0 -0.14457691 0 0 -0.18107302 0 0 -0.19917895 0 0
		 -0.22950932 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484
		 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0
		 0 -0.2439982 0 0 -0.2269282 0 0 -0.18274415 0 0 -0.18274415 0 0 -0.2269282 0 0 -0.2439982
		 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0
		 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0 -0.24977484 0 0
		 -0.22950932 0 0 -0.19917895 0 0 -0.18107302 0 0 -0.14457691 0 0;
createNode polySplitRing -n "Streetcar1:polySplitRing18";
	rename -uid "7A74A7A8-45FB-D87D-72B2-6D80653DFFC8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[60:61]" "e[71]" "e[73]" "e[144]" "e[188]" "e[212]" "e[256]" "e[314]" "e[342]" "e[390]" "e[418]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.67328894138336182;
	setAttr ".dr" no;
	setAttr ".re" 314;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak9";
	rename -uid "D0C2754D-430E-8ED4-B9FC-8A96B083AC01";
	setAttr ".uopa" yes;
	setAttr -s 162 ".tk";
	setAttr ".tk[0]" -type "float3" 0 0.01338299 0.0020386209 ;
	setAttr ".tk[1]" -type "float3" 0 0.01338299 0.0020386209 ;
	setAttr ".tk[2]" -type "float3" 0.015891051 -0.017593218 0.0020386209 ;
	setAttr ".tk[3]" -type "float3" -0.015891051 -0.017593218 0.0020386209 ;
	setAttr ".tk[4]" -type "float3" 0.010161642 -0.0037625148 0 ;
	setAttr ".tk[5]" -type "float3" -0.010161642 -0.0037625148 0 ;
	setAttr ".tk[8]" -type "float3" -0.019444443 -0.025722867 0 ;
	setAttr ".tk[9]" -type "float3" 0.019444443 -0.025722867 0 ;
	setAttr ".tk[10]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[11]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[12]" -type "float3" -0.019444443 -0.025722867 0 ;
	setAttr ".tk[13]" -type "float3" 0.019444443 -0.025722867 0 ;
	setAttr ".tk[14]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[15]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[16]" -type "float3" -0.019444443 -0.025722867 0.0010683388 ;
	setAttr ".tk[17]" -type "float3" 0.019444443 -0.025722867 0.0010683388 ;
	setAttr ".tk[18]" -type "float3" 0 0.028252974 0.0010683388 ;
	setAttr ".tk[19]" -type "float3" 0 0.028252974 0.0010683388 ;
	setAttr ".tk[20]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[21]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[22]" -type "float3" 0.019444443 -0.025722867 0 ;
	setAttr ".tk[23]" -type "float3" -0.019444443 -0.025722867 0 ;
	setAttr ".tk[24]" -type "float3" 0 0.028252974 -0.0096150488 ;
	setAttr ".tk[25]" -type "float3" 0 0.028252974 -0.0096150488 ;
	setAttr ".tk[26]" -type "float3" 0.019444443 -0.025722867 -0.0096150488 ;
	setAttr ".tk[27]" -type "float3" -0.019444443 -0.025722867 -0.0096150488 ;
	setAttr ".tk[28]" -type "float3" 0 0.028252974 -0.0053416938 ;
	setAttr ".tk[29]" -type "float3" 0 0.028252974 -0.0053416938 ;
	setAttr ".tk[30]" -type "float3" 0.019444443 -0.025722867 -0.0053416938 ;
	setAttr ".tk[31]" -type "float3" -0.019444443 -0.025722867 -0.0053416938 ;
	setAttr ".tk[32]" -type "float3" 0 0.028252974 0.0010683388 ;
	setAttr ".tk[33]" -type "float3" 0 0.028252974 0.0010683388 ;
	setAttr ".tk[34]" -type "float3" 0.019444443 -0.025722867 0.0010683388 ;
	setAttr ".tk[35]" -type "float3" -0.019444443 -0.025722867 0.0010683388 ;
	setAttr ".tk[36]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[37]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[38]" -type "float3" 0.019444443 -0.025722867 0 ;
	setAttr ".tk[39]" -type "float3" -0.019444443 -0.025722867 0 ;
	setAttr ".tk[40]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[41]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[42]" -type "float3" 0.019444443 -0.025722867 0 ;
	setAttr ".tk[43]" -type "float3" -0.019444443 -0.025722867 0 ;
	setAttr ".tk[44]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[45]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[46]" -type "float3" 0.019444443 -0.025722867 0 ;
	setAttr ".tk[47]" -type "float3" -0.019444443 -0.025722867 0 ;
	setAttr ".tk[48]" -type "float3" -0.029602848 -0.023058943 0 ;
	setAttr ".tk[49]" -type "float3" 0.029602848 -0.023058943 0 ;
	setAttr ".tk[50]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[51]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[52]" -type "float3" -0.022514641 -0.020536525 0 ;
	setAttr ".tk[53]" -type "float3" 0.022514641 -0.020536525 0 ;
	setAttr ".tk[54]" -type "float3" 0 0.026765978 0 ;
	setAttr ".tk[55]" -type "float3" 0 0.026765978 0 ;
	setAttr ".tk[56]" -type "float3" -0.02377338 -0.029521253 0.0020386209 ;
	setAttr ".tk[57]" -type "float3" 0.02377338 -0.029521253 0 ;
	setAttr ".tk[58]" -type "float3" 0 0.020817982 0 ;
	setAttr ".tk[59]" -type "float3" 0 0.020817982 0.0020386209 ;
	setAttr ".tk[60]" -type "float3" -0.018994819 -0.025722867 0 ;
	setAttr ".tk[61]" -type "float3" 0.018994819 -0.025722867 0 ;
	setAttr ".tk[62]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[63]" -type "float3" 0 0.028252974 0 ;
	setAttr ".tk[64]" -type "float3" -0.012073491 -0.023058943 0 ;
	setAttr ".tk[65]" -type "float3" 0.012073491 -0.023058943 0 ;
	setAttr ".tk[68]" -type "float3" 0 0 0.0020386209 ;
	setAttr ".tk[69]" -type "float3" 0 0 0.0020386209 ;
	setAttr ".tk[74]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[75]" -type "float3" 0 0 -0.0053416938 ;
	setAttr ".tk[76]" -type "float3" 0 0 -0.0096150488 ;
	setAttr ".tk[78]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[91]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[93]" -type "float3" 0 0 -0.0096150488 ;
	setAttr ".tk[94]" -type "float3" 0 0 -0.0053416938 ;
	setAttr ".tk[95]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[100]" -type "float3" 0 0 0.0020386209 ;
	setAttr ".tk[101]" -type "float3" 0 0.01338299 0.0020386209 ;
	setAttr ".tk[102]" -type "float3" 0 0 0.0020386209 ;
	setAttr ".tk[108]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[109]" -type "float3" 0 0 -0.0053416938 ;
	setAttr ".tk[110]" -type "float3" 0 0 -0.0096150488 ;
	setAttr ".tk[112]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[125]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[127]" -type "float3" 0 0 -0.0096150488 ;
	setAttr ".tk[128]" -type "float3" 0 0 -0.0053416938 ;
	setAttr ".tk[129]" -type "float3" 0 0 0.0010683388 ;
	setAttr ".tk[135]" -type "float3" 0 0.01338299 0.0020386209 ;
	setAttr ".tk[136]" -type "float3" 0 0.25505924 -0.0053416938 ;
	setAttr ".tk[137]" -type "float3" 0 0.25505924 -0.0096150488 ;
	setAttr ".tk[138]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[139]" -type "float3" 0 0.25505924 0.0010683388 ;
	setAttr ".tk[140]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[141]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[142]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[143]" -type "float3" 0 0.25072658 0 ;
	setAttr ".tk[144]" -type "float3" 0 0.23792019 0 ;
	setAttr ".tk[145]" -type "float3" 0 0.20477369 0 ;
	setAttr ".tk[146]" -type "float3" 0 0.20477369 0 ;
	setAttr ".tk[147]" -type "float3" 0 0.20477369 0 ;
	setAttr ".tk[148]" -type "float3" 0 0.20477369 0 ;
	setAttr ".tk[149]" -type "float3" 0 0.23792019 0 ;
	setAttr ".tk[150]" -type "float3" 0 0.25072658 0 ;
	setAttr ".tk[151]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[152]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[153]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[154]" -type "float3" 0 0.25505924 0.0010683388 ;
	setAttr ".tk[155]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[156]" -type "float3" 0 0.25505924 -0.0096150488 ;
	setAttr ".tk[157]" -type "float3" 0 0.25505924 -0.0053416938 ;
	setAttr ".tk[158]" -type "float3" 0 0.25505924 0.0010683388 ;
	setAttr ".tk[159]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[160]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[161]" -type "float3" 0 0.22765018 0 ;
	setAttr ".tk[162]" -type "float3" 0 0.18970586 0 ;
	setAttr ".tk[163]" -type "float3" 0 0.1691564 0.0020386209 ;
	setAttr ".tk[164]" -type "float3" 0 0.11991026 0.0020386209 ;
	setAttr ".tk[165]" -type "float3" 0 0.11991026 0.0054724538 ;
	setAttr ".tk[166]" -type "float3" 0 0.11991026 0.0054724538 ;
	setAttr ".tk[167]" -type "float3" 0 0.11991026 0.0020386209 ;
	setAttr ".tk[168]" -type "float3" 0 0.1691564 0 ;
	setAttr ".tk[169]" -type "float3" 0 0.18970586 0 ;
	setAttr ".tk[170]" -type "float3" 0 0.22765018 0 ;
	setAttr ".tk[171]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[172]" -type "float3" 0 0.25505924 0 ;
	setAttr ".tk[173]" -type "float3" 0 0.25505924 0.0010683388 ;
	setAttr ".tk[174]" -type "float3" 0 -0.1760238 -0.0053416938 ;
	setAttr ".tk[175]" -type "float3" 0 -0.1760238 -0.0096150488 ;
	setAttr ".tk[176]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[177]" -type "float3" 0 -0.1760238 0.0010683388 ;
	setAttr ".tk[178]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[179]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[180]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[181]" -type "float3" 0 -0.17169106 0 ;
	setAttr ".tk[182]" -type "float3" 0 -0.15888476 0 ;
	setAttr ".tk[183]" -type "float3" 0 -0.12573822 0 ;
	setAttr ".tk[184]" -type "float3" 0 -0.12573822 0 ;
	setAttr ".tk[185]" -type "float3" 0 -0.12573822 0 ;
	setAttr ".tk[186]" -type "float3" 0 -0.12573822 0 ;
	setAttr ".tk[187]" -type "float3" 0 -0.15888476 0 ;
	setAttr ".tk[188]" -type "float3" 0 -0.17169106 0 ;
	setAttr ".tk[189]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[190]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[191]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[192]" -type "float3" 0 -0.1760238 0.0010683388 ;
	setAttr ".tk[193]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[194]" -type "float3" 0 -0.1760238 -0.0096150488 ;
	setAttr ".tk[195]" -type "float3" 0 -0.1760238 -0.0053416938 ;
	setAttr ".tk[196]" -type "float3" 0 -0.1760238 0.0010683388 ;
	setAttr ".tk[197]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[198]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[199]" -type "float3" 0 -0.1872094 0 ;
	setAttr ".tk[200]" -type "float3" 0 -0.1963806 0 ;
	setAttr ".tk[201]" -type "float3" 0 -0.20363781 0.0020386209 ;
	setAttr ".tk[202]" -type "float3" 0 -0.18535152 0.0020386209 ;
	setAttr ".tk[203]" -type "float3" 0 -0.18535152 0.0054724538 ;
	setAttr ".tk[204]" -type "float3" 0 -0.18535152 0.0054724538 ;
	setAttr ".tk[205]" -type "float3" 0 -0.18535152 0.0020386209 ;
	setAttr ".tk[206]" -type "float3" 0 -0.20363781 0 ;
	setAttr ".tk[207]" -type "float3" 0 -0.1963806 0 ;
	setAttr ".tk[208]" -type "float3" 0 -0.1872094 0 ;
	setAttr ".tk[209]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[210]" -type "float3" 0 -0.1760238 0 ;
	setAttr ".tk[211]" -type "float3" 0 -0.1760238 0.0010683388 ;
createNode polySplitRing -n "Streetcar1:polySplitRing19";
	rename -uid "EB63DEF6-4668-4F3C-747D-449BDF33142E";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[44:45]" "e[55]" "e[57]" "e[148]" "e[184]" "e[216]" "e[252]" "e[270]" "e[310]" "e[346]" "e[386]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.64712071418762207;
	setAttr ".dr" no;
	setAttr ".re" 310;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak10";
	rename -uid "F3FE3BD2-43AA-FD7D-46B2-A2B3AFF73759";
	setAttr ".uopa" yes;
	setAttr -s 24 ".tk[212:235]" -type "float3"  -3.7252903e-09 0 0.0044709919
		 -3.7252903e-09 0 0.0044710045 -3.7252903e-09 3.7252903e-09 0.0044710045 -3.7252903e-09
		 3.7252903e-09 0.0044710045 1.8626451e-09 3.7252903e-09 0.0044710045 3.7252903e-09
		 3.7252903e-09 0.0044710045 3.7252903e-09 0 0.0044710045 3.7252903e-09 0 0.0044709919
		 0 0 0.0044709919 1.8626451e-09 -3.7252903e-09 0.0044709919 -3.7252903e-09 -3.7252903e-09
		 0.0044709919 0 0 0.0044709919 -3.7252903e-09 0 -0.004471004 -3.7252903e-09 0 -0.004470998
		 -3.7252903e-09 3.7252903e-09 -0.0044709924 -3.7252903e-09 3.7252903e-09 -0.0044709924
		 1.8626451e-09 3.7252903e-09 -0.0044709924 3.7252903e-09 3.7252903e-09 -0.0044709924
		 3.7252903e-09 0 -0.004470998 3.7252903e-09 0 -0.004471004 0 0 -0.004471004 1.8626451e-09
		 -3.7252903e-09 -0.004471004 -3.7252903e-09 -3.7252903e-09 -0.004471004 0 0 -0.004471004;
createNode polySplitRing -n "Streetcar1:polySplitRing20";
	rename -uid "72A4EB44-4F0A-E905-B161-4B9B5370B07C";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[23]" "e[25]" "e[28:29]" "e[154]" "e[178]" "e[222]" "e[246]" "e[276]" "e[304]" "e[352]" "e[380]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.021167641505599022;
	setAttr ".re" 28;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak11";
	rename -uid "0AC9FDFE-48C9-C3A0-BA1B-E7AF9F6921D8";
	setAttr ".uopa" yes;
	setAttr -s 24 ".tk[236:259]" -type "float3"  0 0 0.0046362556 0 0 0.0046362677
		 0 0 0.0046362695 0 0 0.0046362695 0 0 0.0046362695 0 0 0.0046362695 0 0 0.0046362677
		 0 0 0.0046362556 0 0 0.0046362556 0 0 0.0046362556 0 0 0.0046362556 0 0 0.0046362556
		 0 0 -0.0046362695 0 0 -0.0046362672 0 0 -0.0046362551 0 0 -0.0046362551 0 0 -0.0046362551
		 0 0 -0.0046362551 0 0 -0.0046362672 0 0 -0.0046362695 0 0 -0.0046362695 0 0 -0.0046362695
		 0 0 -0.0046362695 0 0 -0.0046362695;
createNode polySplitRing -n "Streetcar1:polySplitRing21";
	rename -uid "133BFBD3-4748-2702-BE00-8FB98C91835B";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[15]" "e[17]" "e[20:21]" "e[156]" "e[176]" "e[224]" "e[244]" "e[278]" "e[302]" "e[354]" "e[378]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.56979846954345703;
	setAttr ".dr" no;
	setAttr ".re" 302;
	setAttr ".sma" 29.999999999999996;
	setAttr ".stp" 2;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak12";
	rename -uid "863EA7A2-4891-7812-AAEF-D0979E4A247B";
	setAttr ".uopa" yes;
	setAttr -s 60 ".tk";
	setAttr ".tk[20]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[21]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[22]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[23]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[24]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[25]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[26]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[27]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[76]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[77]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[92]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[93]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[110]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[111]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[126]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[127]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[137]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[138]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[155]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[156]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[175]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[176]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[193]" -type "float3" 0 0 0.018585168 ;
	setAttr ".tk[194]" -type "float3" 0 0 0.0053236671 ;
	setAttr ".tk[248]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[249]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[250]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[251]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[252]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[253]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[254]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[255]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[256]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[257]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[258]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[259]" -type "float3" 0 0 -0.0012355481 ;
	setAttr ".tk[260]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[261]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[262]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[263]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[264]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[265]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[266]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[267]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[268]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[269]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[270]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[271]" -type "float3" 0 0 0.080409259 ;
	setAttr ".tk[272]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[273]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[274]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[275]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[276]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[277]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[278]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[279]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[280]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[281]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[282]" -type "float3" 0 0 0.032239575 ;
	setAttr ".tk[283]" -type "float3" 0 0 0.032239575 ;
createNode polyTweak -n "Streetcar1:polyTweak13";
	rename -uid "19D14F1A-4655-B71B-499D-96ABBBD0CDAC";
	setAttr ".uopa" yes;
	setAttr -s 156 ".tk";
	setAttr ".tk[8]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[9]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[10]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[11]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[12]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[13]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[14]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[15]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[16]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[17]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[18]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[19]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[20]" -type "float3" -1.9557774e-08 1.6763806e-08 0 ;
	setAttr ".tk[21]" -type "float3" 1.9557774e-08 1.6763806e-08 0 ;
	setAttr ".tk[22]" -type "float3" -8.8475645e-09 5.5879354e-09 0 ;
	setAttr ".tk[23]" -type "float3" 8.8475645e-09 5.5879354e-09 0 ;
	setAttr ".tk[24]" -type "float3" -2.0489097e-08 1.0244548e-08 0 ;
	setAttr ".tk[25]" -type "float3" 2.0489097e-08 1.0244548e-08 0 ;
	setAttr ".tk[26]" -type "float3" -1.2107193e-08 2.7939677e-09 0 ;
	setAttr ".tk[27]" -type "float3" 1.2107193e-08 2.7939677e-09 0 ;
	setAttr ".tk[36]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[37]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[38]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[39]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[73]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[76]" -type "float3" 8.3819032e-09 -2.0489097e-08 0 ;
	setAttr ".tk[77]" -type "float3" 2.3283064e-09 -1.9557774e-08 0 ;
	setAttr ".tk[78]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[79]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[80]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[89]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[90]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[91]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[92]" -type "float3" 2.3283064e-09 1.9557774e-08 0 ;
	setAttr ".tk[93]" -type "float3" 8.3819032e-09 2.0489097e-08 0 ;
	setAttr ".tk[96]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[107]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[110]" -type "float3" 1.8626451e-08 -2.0489097e-08 0 ;
	setAttr ".tk[111]" -type "float3" 1.7229468e-08 -1.9557774e-08 0 ;
	setAttr ".tk[112]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[113]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[114]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[123]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[124]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[125]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[126]" -type "float3" 1.7229468e-08 1.9557774e-08 0 ;
	setAttr ".tk[127]" -type "float3" 1.8626451e-08 2.0489097e-08 0 ;
	setAttr ".tk[130]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[137]" -type "float3" 2.0489097e-08 9.3132257e-10 0 ;
	setAttr ".tk[138]" -type "float3" 1.9557774e-08 5.1222742e-09 0 ;
	setAttr ".tk[139]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[140]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[141]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[152]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[153]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[154]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[155]" -type "float3" -1.9557774e-08 5.1222742e-09 0 ;
	setAttr ".tk[156]" -type "float3" -2.0489097e-08 9.3132257e-10 0 ;
	setAttr ".tk[159]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[172]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[175]" -type "float3" 2.0489097e-08 -3.259629e-09 0 ;
	setAttr ".tk[176]" -type "float3" 1.9557774e-08 0 0 ;
	setAttr ".tk[177]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[178]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[179]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[190]" -type "float3" 0 0 -0.0091775302 ;
	setAttr ".tk[191]" -type "float3" 0 0 -0.0069210897 ;
	setAttr ".tk[192]" -type "float3" 0 0 0.0010974405 ;
	setAttr ".tk[193]" -type "float3" -1.9557774e-08 0 0 ;
	setAttr ".tk[194]" -type "float3" -2.0489097e-08 -3.259629e-09 0 ;
	setAttr ".tk[197]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[210]" -type "float3" 0 0 0.00073175516 ;
	setAttr ".tk[212]" -type "float3" -0.0089464281 -0.0075458614 0 ;
	setAttr ".tk[213]" -type "float3" -0.0089464281 0.0061317002 0 ;
	setAttr ".tk[214]" -type "float3" -0.0089464281 0.0084409006 0 ;
	setAttr ".tk[215]" -type "float3" -0.0074513033 0.0089464281 0 ;
	setAttr ".tk[216]" -type "float3" 0.0074513322 0.0089464281 0 ;
	setAttr ".tk[217]" -type "float3" 0.0089464281 0.0084409006 0 ;
	setAttr ".tk[218]" -type "float3" 0.0089464281 0.0061317002 0 ;
	setAttr ".tk[219]" -type "float3" 0.0089464281 -0.0075458614 0 ;
	setAttr ".tk[220]" -type "float3" 0.0085985046 -0.0084861508 0 ;
	setAttr ".tk[221]" -type "float3" 0.0074513322 -0.0089464281 0 ;
	setAttr ".tk[222]" -type "float3" -0.0074513033 -0.0089464281 0 ;
	setAttr ".tk[223]" -type "float3" -0.0085985046 -0.0084861508 0 ;
	setAttr ".tk[224]" -type "float3" -0.0089464281 -0.0075458614 0 ;
	setAttr ".tk[225]" -type "float3" -0.0089464281 0.0061317002 0 ;
	setAttr ".tk[226]" -type "float3" -0.0089464281 0.0084409006 0 ;
	setAttr ".tk[227]" -type "float3" -0.0074513033 0.0089464281 0 ;
	setAttr ".tk[228]" -type "float3" 0.0074513322 0.0089464281 0 ;
	setAttr ".tk[229]" -type "float3" 0.0089464281 0.0084409006 0 ;
	setAttr ".tk[230]" -type "float3" 0.0089464281 0.0061317002 0 ;
	setAttr ".tk[231]" -type "float3" 0.0089464281 -0.0075458614 0 ;
	setAttr ".tk[232]" -type "float3" 0.0085985046 -0.0084861508 0 ;
	setAttr ".tk[233]" -type "float3" 0.0074513322 -0.0089464281 0 ;
	setAttr ".tk[234]" -type "float3" -0.0074513033 -0.0089464281 0 ;
	setAttr ".tk[235]" -type "float3" -0.0085985046 -0.0084861508 0 ;
	setAttr ".tk[236]" -type "float3" -2.0489097e-08 9.3132257e-10 0 ;
	setAttr ".tk[237]" -type "float3" -2.0489097e-08 -3.259629e-09 0 ;
	setAttr ".tk[238]" -type "float3" -2.0489097e-08 1.0244548e-08 0 ;
	setAttr ".tk[239]" -type "float3" 8.3819032e-09 2.0489097e-08 0 ;
	setAttr ".tk[240]" -type "float3" 1.8626451e-08 2.0489097e-08 0 ;
	setAttr ".tk[241]" -type "float3" 2.0489097e-08 1.0244548e-08 0 ;
	setAttr ".tk[242]" -type "float3" 2.0489097e-08 -3.259629e-09 0 ;
	setAttr ".tk[243]" -type "float3" 2.0489097e-08 9.3132257e-10 0 ;
	setAttr ".tk[244]" -type "float3" 1.6763806e-08 2.7939677e-09 0 ;
	setAttr ".tk[245]" -type "float3" 1.8626451e-08 -2.0489097e-08 0 ;
	setAttr ".tk[246]" -type "float3" 8.3819032e-09 -2.0489097e-08 0 ;
	setAttr ".tk[247]" -type "float3" -1.6763806e-08 2.7939677e-09 0 ;
	setAttr ".tk[260]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[261]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[262]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[263]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[264]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[265]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[266]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[267]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[268]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[269]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[270]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[271]" -type "float3" 0 0 -0.0010974405 ;
	setAttr ".tk[272]" -type "float3" -1.4901161e-08 5.5879354e-09 0 ;
	setAttr ".tk[273]" -type "float3" 5.1222742e-09 -1.9557774e-08 0 ;
	setAttr ".tk[274]" -type "float3" 1.7229468e-08 -1.9557774e-08 0 ;
	setAttr ".tk[275]" -type "float3" 1.4901161e-08 5.5879354e-09 0 ;
	setAttr ".tk[276]" -type "float3" 1.9557774e-08 5.1222742e-09 0 ;
	setAttr ".tk[277]" -type "float3" 1.9557774e-08 0 0 ;
	setAttr ".tk[278]" -type "float3" 1.9557774e-08 1.6763806e-08 0 ;
	setAttr ".tk[279]" -type "float3" 1.7229468e-08 1.9557774e-08 0 ;
	setAttr ".tk[280]" -type "float3" 5.1222742e-09 1.9557774e-08 0 ;
	setAttr ".tk[281]" -type "float3" -1.9557774e-08 1.6763806e-08 0 ;
	setAttr ".tk[282]" -type "float3" -1.9557774e-08 0 0 ;
	setAttr ".tk[283]" -type "float3" -1.9557774e-08 5.1222742e-09 0 ;
	setAttr ".tk[284]" -type "float3" -1.9557774e-08 5.1222742e-09 -0.0033483857 ;
	setAttr ".tk[285]" -type "float3" -1.9557774e-08 0 -0.0033483857 ;
	setAttr ".tk[286]" -type "float3" -1.9557774e-08 1.6763806e-08 -0.0033483857 ;
	setAttr ".tk[287]" -type "float3" 5.1222742e-09 1.9557774e-08 -0.0033483857 ;
	setAttr ".tk[288]" -type "float3" 1.7229468e-08 1.9557774e-08 -0.0033483857 ;
	setAttr ".tk[289]" -type "float3" 1.9557774e-08 1.6763806e-08 -0.0033483857 ;
	setAttr ".tk[290]" -type "float3" 1.9557774e-08 0 -0.0033483857 ;
	setAttr ".tk[291]" -type "float3" 1.9557774e-08 5.1222742e-09 -0.0033483857 ;
	setAttr ".tk[292]" -type "float3" 1.4901161e-08 5.5879354e-09 -0.0033483857 ;
	setAttr ".tk[293]" -type "float3" 1.7229468e-08 -1.9557774e-08 -0.0033483857 ;
	setAttr ".tk[294]" -type "float3" 5.1222742e-09 -1.9557774e-08 -0.0033483857 ;
	setAttr ".tk[295]" -type "float3" -1.4901161e-08 5.5879354e-09 -0.0033483857 ;
	setAttr ".tk[296]" -type "float3" -1.9557774e-08 5.1222742e-09 -0.012750228 ;
	setAttr ".tk[297]" -type "float3" -1.9557774e-08 0 -0.012750228 ;
	setAttr ".tk[298]" -type "float3" -1.9557774e-08 1.6763806e-08 -0.012750228 ;
	setAttr ".tk[299]" -type "float3" 5.1222742e-09 1.9557774e-08 -0.012750228 ;
	setAttr ".tk[300]" -type "float3" 1.7229468e-08 1.9557774e-08 -0.012750228 ;
	setAttr ".tk[301]" -type "float3" 1.9557774e-08 1.6763806e-08 -0.012750228 ;
	setAttr ".tk[302]" -type "float3" 1.9557774e-08 0 -0.012750228 ;
	setAttr ".tk[303]" -type "float3" 1.9557774e-08 5.1222742e-09 -0.012750228 ;
	setAttr ".tk[304]" -type "float3" 1.4901161e-08 5.5879354e-09 -0.012750228 ;
	setAttr ".tk[305]" -type "float3" 1.7229468e-08 -1.9557774e-08 -0.012750228 ;
	setAttr ".tk[306]" -type "float3" 5.1222742e-09 -1.9557774e-08 -0.012750228 ;
	setAttr ".tk[307]" -type "float3" -1.4901161e-08 5.5879354e-09 -0.012750228 ;
createNode deleteComponent -n "Streetcar1:deleteComponent1";
	rename -uid "590EAD25-4235-CFED-8870-81995D1BD2E2";
	setAttr ".dc" -type "componentList" 1 "f[107]";
createNode deleteComponent -n "Streetcar1:deleteComponent2";
	rename -uid "22A6BDC4-4FBA-8E53-AB5F-DF89D134D91F";
	setAttr ".dc" -type "componentList" 1 "f[73]";
createNode deleteComponent -n "Streetcar1:deleteComponent3";
	rename -uid "A03DB9F8-4E46-8ED2-1143-A494CB70661F";
	setAttr ".dc" -type "componentList" 1 "f[152]";
createNode deleteComponent -n "Streetcar1:deleteComponent4";
	rename -uid "FBE78CB8-42AB-726E-629E-CD98E937FA51";
	setAttr ".dc" -type "componentList" 1 "f[189]";
createNode deleteComponent -n "Streetcar1:deleteComponent5";
	rename -uid "9F2ECB66-4563-5D04-B4EF-B5934D5A55B3";
	setAttr ".dc" -type "componentList" 10 "f[18:25]" "f[73]" "f[89:90]" "f[106]" "f[122:123]" "f[132:133]" "f[151]" "f[169:170]" "f[188]" "f[242:253]";
createNode deleteComponent -n "Streetcar1:deleteComponent6";
	rename -uid "D6583BBB-4A2B-671A-AAF3-50978E80A447";
	setAttr ".dc" -type "componentList" 11 "f[1]" "f[3:5]" "f[14:17]" "f[65:66]" "f[78:79]" "f[95:96]" "f[108:109]" "f[118:119]" "f[133:134]" "f[152:153]" "f[167:168]";
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge1";
	rename -uid "F496D178-4E27-B6BC-60C9-E184E8B7BDFB";
	setAttr ".ics" -type "componentList" 2 "e[398]" "e[454]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 200;
	setAttr ".sv2" 234;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge2";
	rename -uid "1D936883-4EC5-0347-F9FC-CBB16929ACE1";
	setAttr ".ics" -type "componentList" 2 "e[400]" "e[453]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 201;
	setAttr ".sv2" 233;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge3";
	rename -uid "EE356601-48D8-1E38-56B3-CABEC5DF4940";
	setAttr ".ics" -type "componentList" 2 "e[402]" "e[452]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 202;
	setAttr ".sv2" 232;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge4";
	rename -uid "BBFA2E7D-442A-2F95-46E2-6BAA912525E3";
	setAttr ".ics" -type "componentList" 2 "e[404]" "e[451]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 203;
	setAttr ".sv2" 231;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge5";
	rename -uid "4BFDA026-42FE-31D3-5E23-2EBED01B5A7E";
	setAttr ".ics" -type "componentList" 2 "e[406]" "e[450]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 204;
	setAttr ".sv2" 230;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge6";
	rename -uid "56702F34-4C22-DAB3-EE8D-2AA0B7E19A1B";
	setAttr ".ics" -type "componentList" 2 "e[407]" "e[449]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 205;
	setAttr ".sv2" 229;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge7";
	rename -uid "4DEE3DC8-460E-6EAD-51A7-1B8A04BB26B2";
	setAttr ".ics" -type "componentList" 2 "e[408]" "e[448]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 206;
	setAttr ".sv2" 228;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge8";
	rename -uid "D51C0677-4704-91E6-DBEE-AC8F24B7A164";
	setAttr ".ics" -type "componentList" 2 "e[413]" "e[455]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 211;
	setAttr ".sv2" 235;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge9";
	rename -uid "608907A9-4021-27D5-F6C8-E18AA77B1401";
	setAttr ".ics" -type "componentList" 2 "e[412]" "e[440]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 210;
	setAttr ".sv2" 224;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge10";
	rename -uid "2E535957-42CC-6487-20E0-CCBE330055E9";
	setAttr ".ics" -type "componentList" 2 "e[411]" "e[442]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 209;
	setAttr ".sv2" 225;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge11";
	rename -uid "EE571D14-4287-D842-F03F-9BA15A7303DA";
	setAttr ".ics" -type "componentList" 2 "e[410]" "e[444]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 208;
	setAttr ".sv2" 226;
	setAttr ".d" 1;
createNode polyBridgeEdge -n "Streetcar1:polyBridgeEdge12";
	rename -uid "E7D636C7-47C6-1531-A924-CF8B53AEDEE0";
	setAttr ".ics" -type "componentList" 2 "e[409]" "e[446]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".c[0]"  0 1 1;
	setAttr ".dv" 0;
	setAttr ".sv1" 207;
	setAttr ".sv2" 227;
	setAttr ".d" 1;
createNode polySplitRing -n "Streetcar1:polySplitRing22";
	rename -uid "71FFBFE8-4CEB-F4FA-49F1-FE9A35F6376F";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[504:515]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.1059010848402977;
	setAttr ".re" 510;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing23";
	rename -uid "67E5FCAF-406A-5625-0A6A-79B6976F2825";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 1 "e[504:515]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.84479415416717529;
	setAttr ".dr" no;
	setAttr ".re" 510;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing24";
	rename -uid "4CE551E8-4EAF-6BA8-08C5-D09BCCF9C22D";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[516:517]" "e[519]" "e[521]" "e[523]" "e[525]" "e[527]" "e[529]" "e[531]" "e[533]" "e[535]" "e[537]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.91604411602020264;
	setAttr ".dr" no;
	setAttr ".re" 516;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing25";
	rename -uid "AACF0F19-4346-F373-E2E9-8D856BF64EA8";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 11 "e[516:517]" "e[519]" "e[521]" "e[523]" "e[525]" "e[527]" "e[529]" "e[531]" "e[533]" "e[535]" "e[537]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.97804450988769531;
	setAttr ".dr" no;
	setAttr ".re" 516;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polySplitRing -n "Streetcar1:polySplitRing26";
	rename -uid "5873F1DB-422D-9FF2-40CE-7199F5209D9C";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 52 "e[222:223]" "e[227]" "e[229]" "e[231]" "e[233]" "e[235]" "e[237]" "e[243]" "e[250:251]" "e[253]" "e[255]" "e[271]" "e[273]" "e[275]" "e[284]" "e[289]" "e[303]" "e[305]" "e[309]" "e[311]" "e[321]" "e[323]" "e[325]" "e[327]" "e[329]" "e[331]" "e[333]" "e[341]" "e[343]" "e[345]" "e[350]" "e[362]" "e[374]" "e[386]" "e[398]" "e[408]" "e[424]" "e[436]" "e[448]" "e[454]" "e[458]" "e[470]" "e[482]" "e[494]" "e[528]" "e[539]" "e[552]" "e[563]" "e[576]" "e[587]" "e[600]" "e[611]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.73663759231567383;
	setAttr ".dr" no;
	setAttr ".re" 255;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyTweak -n "Streetcar1:polyTweak14";
	rename -uid "0ADD1BD7-4568-3B9C-4546-F8B51ABD417C";
	setAttr ".uopa" yes;
	setAttr -s 81 ".tk";
	setAttr ".tk[24]" -type "float3" 0 0 2.7939677e-09 ;
	setAttr ".tk[25]" -type "float3" 0 0 -2.3283064e-10 ;
	setAttr ".tk[26]" -type "float3" 0 0 -2.3283064e-10 ;
	setAttr ".tk[93]" -type "float3" 0 0 -2.3283064e-10 ;
	setAttr ".tk[110]" -type "float3" 0 0 -2.3283064e-10 ;
	setAttr ".tk[127]" -type "float3" 0 0 -2.3283064e-10 ;
	setAttr ".tk[137]" -type "float3" 0 0 -2.3283064e-10 ;
	setAttr ".tk[175]" -type "float3" 0 0 -2.3283064e-10 ;
	setAttr ".tk[194]" -type "float3" 0 0 2.7939677e-09 ;
	setAttr ".tk[200]" -type "float3" -0.0096270302 -0.0081199352 0 ;
	setAttr ".tk[201]" -type "float3" -0.0096270302 0.0065981848 0 ;
	setAttr ".tk[202]" -type "float3" -0.0096270302 0.0090830466 0 ;
	setAttr ".tk[203]" -type "float3" -0.0080181956 0.0096270312 0 ;
	setAttr ".tk[204]" -type "float3" 0.0080181956 0.0096270312 0 ;
	setAttr ".tk[205]" -type "float3" 0.0096270302 0.0090830466 0 ;
	setAttr ".tk[206]" -type "float3" 0.0096270302 0.0065981848 0 ;
	setAttr ".tk[207]" -type "float3" 0.0096270302 -0.0081199352 0 ;
	setAttr ".tk[208]" -type "float3" 0.0092526525 -0.0091317613 0 ;
	setAttr ".tk[209]" -type "float3" 0.0080181956 -0.0096270312 0 ;
	setAttr ".tk[210]" -type "float3" -0.0080181956 -0.0096270312 0 ;
	setAttr ".tk[211]" -type "float3" -0.0092526525 -0.0091317613 0 ;
	setAttr ".tk[224]" -type "float3" -0.0069331191 -0.0068425341 0 ;
	setAttr ".tk[225]" -type "float3" -0.0060081258 -0.0072136456 0 ;
	setAttr ".tk[226]" -type "float3" 0.0060081258 -0.0072136456 0 ;
	setAttr ".tk[227]" -type "float3" 0.0069331191 -0.0068425341 0 ;
	setAttr ".tk[228]" -type "float3" 0.0072136461 -0.0060843611 0 ;
	setAttr ".tk[229]" -type "float3" 0.0072136461 0.0049440954 0 ;
	setAttr ".tk[230]" -type "float3" 0.0072136461 0.0068060318 0 ;
	setAttr ".tk[231]" -type "float3" 0.0060081258 0.0072136456 0 ;
	setAttr ".tk[232]" -type "float3" -0.0060081258 0.0072136456 0 ;
	setAttr ".tk[233]" -type "float3" -0.0072136461 0.0068060318 0 ;
	setAttr ".tk[234]" -type "float3" -0.0072136461 0.0049440954 0 ;
	setAttr ".tk[235]" -type "float3" -0.0072136461 -0.0060843611 0 ;
	setAttr ".tk[236]" -type "float3" -0.0095337005 -0.0080412179 0 ;
	setAttr ".tk[237]" -type "float3" -0.0095337005 0.0065342169 0 ;
	setAttr ".tk[238]" -type "float3" -0.0095337005 0.0089949882 0 ;
	setAttr ".tk[239]" -type "float3" -0.00794046 0.0095336977 0 ;
	setAttr ".tk[240]" -type "float3" 0.00794046 0.0095336977 0 ;
	setAttr ".tk[241]" -type "float3" 0.0095337005 0.0089949882 0 ;
	setAttr ".tk[242]" -type "float3" 0.0095337005 0.0065342169 0 ;
	setAttr ".tk[243]" -type "float3" 0.0095337005 -0.0080412179 0 ;
	setAttr ".tk[244]" -type "float3" 0.0091629513 -0.0090432335 0 ;
	setAttr ".tk[245]" -type "float3" 0.00794046 -0.0095336977 0 ;
	setAttr ".tk[246]" -type "float3" -0.00794046 -0.0095336977 0 ;
	setAttr ".tk[247]" -type "float3" -0.0091629513 -0.0090432335 0 ;
	setAttr ".tk[248]" -type "float3" -0.0095337005 -0.0080412179 0 ;
	setAttr ".tk[249]" -type "float3" -0.0095337005 0.0065342169 -9.3132257e-10 ;
	setAttr ".tk[250]" -type "float3" -0.0095337005 0.0089949882 -9.3132257e-10 ;
	setAttr ".tk[251]" -type "float3" -0.00794046 0.0095336977 0 ;
	setAttr ".tk[252]" -type "float3" 0.00794046 0.0095336977 0 ;
	setAttr ".tk[253]" -type "float3" 0.0095337005 0.0089949882 0 ;
	setAttr ".tk[254]" -type "float3" 0.0095337005 0.0065342169 0 ;
	setAttr ".tk[255]" -type "float3" 0.0095337005 -0.0080412179 0 ;
	setAttr ".tk[256]" -type "float3" 0.0091629513 -0.0090432335 0 ;
	setAttr ".tk[257]" -type "float3" 0.00794046 -0.0095336977 0 ;
	setAttr ".tk[258]" -type "float3" -0.00794046 -0.0095336977 0 ;
	setAttr ".tk[259]" -type "float3" -0.0091629513 -0.0090432335 -4.6566129e-10 ;
	setAttr ".tk[272]" -type "float3" 0.0096270302 0.0065981848 0 ;
	setAttr ".tk[273]" -type "float3" 0.0096270302 0.0090830466 0 ;
	setAttr ".tk[274]" -type "float3" 0.0080181956 0.0096270312 0 ;
	setAttr ".tk[275]" -type "float3" -0.0080181956 0.0096270312 0 ;
	setAttr ".tk[276]" -type "float3" -0.0096270302 0.0090830466 0 ;
	setAttr ".tk[277]" -type "float3" -0.0096270302 0.0065981848 0 ;
	setAttr ".tk[278]" -type "float3" -0.0096270302 -0.0081199352 0 ;
	setAttr ".tk[279]" -type "float3" -0.0092526525 -0.0091317613 0 ;
	setAttr ".tk[280]" -type "float3" -0.0080181956 -0.0096270312 0 ;
	setAttr ".tk[281]" -type "float3" 0.0080181956 -0.0096270312 0 ;
	setAttr ".tk[282]" -type "float3" 0.0092526525 -0.0091317613 0 ;
	setAttr ".tk[283]" -type "float3" 0.0096270302 -0.0081199352 0 ;
	setAttr ".tk[284]" -type "float3" 0.0072136461 0.0049440954 0 ;
	setAttr ".tk[285]" -type "float3" 0.0072136461 0.0068060318 0 ;
	setAttr ".tk[286]" -type "float3" 0.0060081258 0.0072136456 0 ;
	setAttr ".tk[287]" -type "float3" -0.0060081258 0.0072136456 0 ;
	setAttr ".tk[288]" -type "float3" -0.0072136461 0.0068060318 0 ;
	setAttr ".tk[289]" -type "float3" -0.0072136461 0.0049440954 0 ;
	setAttr ".tk[290]" -type "float3" -0.0072136461 -0.0060843625 0 ;
	setAttr ".tk[291]" -type "float3" -0.0069331191 -0.0068425341 0 ;
	setAttr ".tk[292]" -type "float3" -0.0060081258 -0.0072136456 0 ;
	setAttr ".tk[293]" -type "float3" 0.0060081258 -0.0072136456 0 ;
	setAttr ".tk[294]" -type "float3" 0.0069331191 -0.0068425341 0 ;
	setAttr ".tk[295]" -type "float3" 0.0072136461 -0.0060843625 0 ;
createNode polySplitRing -n "Streetcar1:polySplitRing27";
	rename -uid "CD0FC246-44BF-912E-D571-9598706EB8B4";
	setAttr ".uopa" yes;
	setAttr ".ics" -type "componentList" 53 "e[284]" "e[289]" "e[303]" "e[305]" "e[309]" "e[311]" "e[321]" "e[323]" "e[325]" "e[327]" "e[329]" "e[331]" "e[333]" "e[341]" "e[343]" "e[345]" "e[362]" "e[386]" "e[408]" "e[436]" "e[454]" "e[470]" "e[494]" "e[528]" "e[552]" "e[576]" "e[600]" "e[612:613]" "e[615]" "e[617]" "e[619]" "e[621]" "e[623]" "e[639]" "e[641]" "e[645]" "e[651]" "e[653]" "e[655]" "e[657]" "e[659]" "e[661]" "e[665]" "e[671]" "e[673]" "e[675]" "e[677]" "e[679]" "e[681]" "e[683]" "e[699]" "e[701]" "e[703]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".wt" 0.48162829875946045;
	setAttr ".dr" no;
	setAttr ".re" 612;
	setAttr ".sma" 29.999999999999996;
	setAttr ".div" 1;
	setAttr ".p[0]"  0 0 1;
	setAttr ".fq" yes;
createNode polyExtrudeFace -n "Streetcar1:polyExtrudeFace1";
	rename -uid "5558DC87-4F32-12CC-D851-8E924012284F";
	setAttr ".ics" -type "componentList" 1 "f[406:410]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 -13.530015 86.836571 ;
	setAttr ".rs" 56651;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -10.874226093292236 -15.012819494712584 85.612030430833642 ;
	setAttr ".cbx" -type "double3" 10.874226093292236 -12.047209751999892 88.061114768428055 ;
createNode polyTweak -n "Streetcar1:polyTweak15";
	rename -uid "958DA544-459C-1EFE-3AAA-D497F47D962F";
	setAttr ".uopa" yes;
	setAttr -s 3 ".tk";
	setAttr ".tk[165]" -type "float3" 0 0.015219878 0 ;
	setAttr ".tk[170]" -type "float3" 0 0.015219882 0 ;
	setAttr ".tk[171]" -type "float3" 0 -2.7939677e-09 0 ;
createNode polyExtrudeFace -n "Streetcar1:polyExtrudeFace2";
	rename -uid "43C3C0BC-4682-5CA5-EBCE-A782BA826C2B";
	setAttr ".ics" -type "componentList" 1 "f[406:410]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 -13.530015 86.836571 ;
	setAttr ".rs" 48852;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -10.874226093292236 -15.012819494712584 85.612030430833642 ;
	setAttr ".cbx" -type "double3" 10.874226093292236 -12.047209751999892 88.061114768428055 ;
createNode polyExtrudeFace -n "Streetcar1:polyExtrudeFace3";
	rename -uid "3ADA7723-457F-A620-1B9B-D1A11E3E35CC";
	setAttr ".ics" -type "componentList" 1 "f[406:410]";
	setAttr ".ix" -type "matrix" 30 0 0 0 0 40.333332975457132 0 0 0 0 192.43770151879079 0
		 0 0 0 1;
	setAttr ".ws" yes;
	setAttr ".pvt" -type "float3" 0 -13.530015 86.836571 ;
	setAttr ".rs" 34587;
	setAttr ".c[0]"  0 1 1;
	setAttr ".cbn" -type "double3" -10.874226093292236 -15.012819494712584 85.612030430833642 ;
	setAttr ".cbx" -type "double3" 10.874226093292236 -12.047209751999892 88.061114768428055 ;
createNode polyTweak -n "polyTweak1";
	rename -uid "2DFE6D3A-41D7-E599-933E-83A9679A6EE7";
	setAttr ".uopa" yes;
	setAttr -s 68 ".tk";
	setAttr ".tk[2]" -type "float3" 0 0.019251565 -0.0015131126 ;
	setAttr ".tk[3]" -type "float3" 0 0.019251565 -0.0015131126 ;
	setAttr ".tk[40]" -type "float3" 0 0.012032229 -0.0037827818 ;
	setAttr ".tk[41]" -type "float3" 0 0.012032229 -0.0037827818 ;
	setAttr ".tk[44]" -type "float3" 0 0.0048128911 -0.0032784103 ;
	setAttr ".tk[45]" -type "float3" 0 0.0048128911 -0.0032784103 ;
	setAttr ".tk[56]" -type "float3" 0 0.019251565 -0.0015131126 ;
	setAttr ".tk[57]" -type "float3" 0 0.0048128911 -0.0032784103 ;
	setAttr ".tk[58]" -type "float3" 0 0.012032229 -0.0037827818 ;
	setAttr ".tk[84]" -type "float3" 0 0.019251565 -0.0015131126 ;
	setAttr ".tk[85]" -type "float3" 0 0.0048128911 -0.0032784103 ;
	setAttr ".tk[86]" -type "float3" 0 0.012032229 -0.0037827818 ;
	setAttr ".tk[134]" -type "float3" 0 0.03369024 0 ;
	setAttr ".tk[137]" -type "float3" 0 0.03369024 0 ;
	setAttr ".tk[308]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[309]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[310]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[311]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[312]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[313]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[314]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[315]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[316]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[317]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[318]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[319]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[320]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[321]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[322]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[323]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[324]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[325]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[326]" -type "float3" 0 0.45520294 0 ;
	setAttr ".tk[327]" -type "float3" 0 0.43584973 0 ;
	setAttr ".tk[328]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[329]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[330]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[331]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[332]" -type "float3" 0 0.43584973 0 ;
	setAttr ".tk[333]" -type "float3" 0 0.45520294 0 ;
	setAttr ".tk[334]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[335]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[336]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[337]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[338]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[339]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[340]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[341]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[342]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[343]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[344]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[345]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[346]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[347]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[348]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[349]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[350]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[351]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[352]" -type "float3" 0 0.45520291 0 ;
	setAttr ".tk[353]" -type "float3" 0 0.41651797 0 ;
	setAttr ".tk[354]" -type "float3" 0 0.37952641 0 ;
	setAttr ".tk[355]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[356]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[357]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[358]" -type "float3" 0 0.35786849 0 ;
	setAttr ".tk[359]" -type "float3" 0 0.37952641 0 ;
	setAttr ".tk[360]" -type "float3" 0 0.41651797 0 ;
	setAttr ".tk[361]" -type "float3" 0 0.45520291 0 ;
createNode transformGeometry -n "transformGeometry1";
	rename -uid "FEE81D03-4A7A-EE11-8A8E-B89EC53B840B";
	setAttr ".txf" -type "matrix" 0 0 -0.84762296401478732 0 0 1.1395819748417455 0 0
		 5.4371538316516714 0 0 0 0.11708909587783203 0.095483899116516113 0.55512708425521851 1;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 6 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 9 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya-legacy/config.ocio";
	setAttr ".vtn" -type "string" "sRGB gamma (legacy)";
	setAttr ".vn" -type "string" "sRGB gamma";
	setAttr ".dn" -type "string" "legacy";
	setAttr ".wsn" -type "string" "scene-linear Rec 709/sRGB";
	setAttr ".ovt" no;
	setAttr ".povt" no;
	setAttr ".otn" -type "string" "sRGB gamma (legacy)";
	setAttr ".potn" -type "string" "sRGB gamma (legacy)";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr ":defaultColorMgtGlobals.cme" "Streetcar1:imagePlaneShape1.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "Streetcar1:imagePlaneShape1.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "Streetcar1:imagePlaneShape1.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "Streetcar1:imagePlaneShape1.ws";
connectAttr ":sideShape.msg" "Streetcar1:imagePlaneShape1.ltc";
connectAttr "transformGeometry1.og" "Streetcar1:pCubeShape1.i";
connectAttr "M_Plane_01.oc" "PR_Plane_01SG.ss";
connectAttr "PR_Plane_01Shape.iog" "PR_Plane_01SG.dsm" -na;
connectAttr "PR_Plane_01SG.msg" "materialInfo1.sg";
connectAttr "M_Plane_01.msg" "materialInfo1.m";
connectAttr "M_Building_01.oc" "PR_BigBuilding_01SG.ss";
connectAttr "PR_BigBuilding_01Shape.iog" "PR_BigBuilding_01SG.dsm" -na;
connectAttr "PR_SmallBuilding1_01Shape.iog" "PR_BigBuilding_01SG.dsm" -na;
connectAttr "PR_SmallBuilding2_01Shape.iog" "PR_BigBuilding_01SG.dsm" -na;
connectAttr "PR_BigBuilding_01SG.msg" "materialInfo2.sg";
connectAttr "M_Building_01.msg" "materialInfo2.m";
connectAttr "M_Streetcar_01.oc" "PR_StreetCar_01SG.ss";
connectAttr "PR_StreetCar_01Shape.iog" "PR_StreetCar_01SG.dsm" -na;
connectAttr "PR_StreetCar_01SG.msg" "materialInfo3.sg";
connectAttr "M_Streetcar_01.msg" "materialInfo3.m";
connectAttr "lambert4.oc" "PR_Startpoint_01SG.ss";
connectAttr "PR_Startpoint_01Shape.iog" "PR_Startpoint_01SG.dsm" -na;
connectAttr "PR_GoalPioint_01Shape.iog" "PR_Startpoint_01SG.dsm" -na;
connectAttr "PR_Startpoint_01SG.msg" "materialInfo4.sg";
connectAttr "lambert4.msg" "materialInfo4.m";
relationship "link" ":lightLinker1" "PR_Plane_01SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "PR_BigBuilding_01SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "PR_StreetCar_01SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "PR_Startpoint_01SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "PR_Plane_01SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "PR_BigBuilding_01SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "PR_StreetCar_01SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "PR_Startpoint_01SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "Streetcar1:polyCube1.out" "Streetcar1:polySplitRing1.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing1.mp";
connectAttr "Streetcar1:polySplitRing1.out" "Streetcar1:polySplitRing2.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing2.mp";
connectAttr "Streetcar1:polySplitRing2.out" "Streetcar1:polySplitRing3.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing3.mp";
connectAttr "Streetcar1:polySplitRing3.out" "Streetcar1:polySplitRing4.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing4.mp";
connectAttr "Streetcar1:polySplitRing4.out" "Streetcar1:polySplitRing5.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing5.mp";
connectAttr "Streetcar1:polySplitRing5.out" "Streetcar1:polySplitRing6.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing6.mp";
connectAttr "Streetcar1:polySplitRing6.out" "Streetcar1:polySplitRing7.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing7.mp";
connectAttr "Streetcar1:polySplitRing7.out" "Streetcar1:polySplitRing8.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing8.mp";
connectAttr "Streetcar1:polyTweak1.out" "Streetcar1:polySplitRing9.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing9.mp";
connectAttr "Streetcar1:polySplitRing8.out" "Streetcar1:polyTweak1.ip";
connectAttr "Streetcar1:polySplitRing9.out" "Streetcar1:polySplitRing10.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing10.mp";
connectAttr "Streetcar1:polyTweak2.out" "Streetcar1:polySplitRing11.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing11.mp";
connectAttr "Streetcar1:polySplitRing10.out" "Streetcar1:polyTweak2.ip";
connectAttr "Streetcar1:polyTweak3.out" "Streetcar1:polySplitRing12.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing12.mp";
connectAttr "Streetcar1:polySplitRing11.out" "Streetcar1:polyTweak3.ip";
connectAttr "Streetcar1:polyTweak4.out" "Streetcar1:polySplitRing13.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing13.mp";
connectAttr "Streetcar1:polySplitRing12.out" "Streetcar1:polyTweak4.ip";
connectAttr "Streetcar1:polyTweak5.out" "Streetcar1:polySplitRing14.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing14.mp";
connectAttr "Streetcar1:polySplitRing13.out" "Streetcar1:polyTweak5.ip";
connectAttr "Streetcar1:polyTweak6.out" "Streetcar1:polySplitRing15.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing15.mp";
connectAttr "Streetcar1:polySplitRing14.out" "Streetcar1:polyTweak6.ip";
connectAttr "Streetcar1:polyTweak7.out" "Streetcar1:polySplitRing16.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing16.mp";
connectAttr "Streetcar1:polySplitRing15.out" "Streetcar1:polyTweak7.ip";
connectAttr "Streetcar1:polyTweak8.out" "Streetcar1:polySplitRing17.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing17.mp";
connectAttr "Streetcar1:polySplitRing16.out" "Streetcar1:polyTweak8.ip";
connectAttr "Streetcar1:polyTweak9.out" "Streetcar1:polySplitRing18.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing18.mp";
connectAttr "Streetcar1:polySplitRing17.out" "Streetcar1:polyTweak9.ip";
connectAttr "Streetcar1:polyTweak10.out" "Streetcar1:polySplitRing19.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing19.mp";
connectAttr "Streetcar1:polySplitRing18.out" "Streetcar1:polyTweak10.ip";
connectAttr "Streetcar1:polyTweak11.out" "Streetcar1:polySplitRing20.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing20.mp";
connectAttr "Streetcar1:polySplitRing19.out" "Streetcar1:polyTweak11.ip";
connectAttr "Streetcar1:polyTweak12.out" "Streetcar1:polySplitRing21.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing21.mp";
connectAttr "Streetcar1:polySplitRing20.out" "Streetcar1:polyTweak12.ip";
connectAttr "Streetcar1:polySplitRing21.out" "Streetcar1:polyTweak13.ip";
connectAttr "Streetcar1:polyTweak13.out" "Streetcar1:deleteComponent1.ig";
connectAttr "Streetcar1:deleteComponent1.og" "Streetcar1:deleteComponent2.ig";
connectAttr "Streetcar1:deleteComponent2.og" "Streetcar1:deleteComponent3.ig";
connectAttr "Streetcar1:deleteComponent3.og" "Streetcar1:deleteComponent4.ig";
connectAttr "Streetcar1:deleteComponent4.og" "Streetcar1:deleteComponent5.ig";
connectAttr "Streetcar1:deleteComponent5.og" "Streetcar1:deleteComponent6.ig";
connectAttr "Streetcar1:deleteComponent6.og" "Streetcar1:polyBridgeEdge1.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge1.mp";
connectAttr "Streetcar1:polyBridgeEdge1.out" "Streetcar1:polyBridgeEdge2.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge2.mp";
connectAttr "Streetcar1:polyBridgeEdge2.out" "Streetcar1:polyBridgeEdge3.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge3.mp";
connectAttr "Streetcar1:polyBridgeEdge3.out" "Streetcar1:polyBridgeEdge4.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge4.mp";
connectAttr "Streetcar1:polyBridgeEdge4.out" "Streetcar1:polyBridgeEdge5.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge5.mp";
connectAttr "Streetcar1:polyBridgeEdge5.out" "Streetcar1:polyBridgeEdge6.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge6.mp";
connectAttr "Streetcar1:polyBridgeEdge6.out" "Streetcar1:polyBridgeEdge7.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge7.mp";
connectAttr "Streetcar1:polyBridgeEdge7.out" "Streetcar1:polyBridgeEdge8.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge8.mp";
connectAttr "Streetcar1:polyBridgeEdge8.out" "Streetcar1:polyBridgeEdge9.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge9.mp";
connectAttr "Streetcar1:polyBridgeEdge9.out" "Streetcar1:polyBridgeEdge10.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge10.mp";
connectAttr "Streetcar1:polyBridgeEdge10.out" "Streetcar1:polyBridgeEdge11.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge11.mp";
connectAttr "Streetcar1:polyBridgeEdge11.out" "Streetcar1:polyBridgeEdge12.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyBridgeEdge12.mp";
connectAttr "Streetcar1:polyBridgeEdge12.out" "Streetcar1:polySplitRing22.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing22.mp";
connectAttr "Streetcar1:polySplitRing22.out" "Streetcar1:polySplitRing23.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing23.mp";
connectAttr "Streetcar1:polySplitRing23.out" "Streetcar1:polySplitRing24.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing24.mp";
connectAttr "Streetcar1:polySplitRing24.out" "Streetcar1:polySplitRing25.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing25.mp";
connectAttr "Streetcar1:polyTweak14.out" "Streetcar1:polySplitRing26.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing26.mp";
connectAttr "Streetcar1:polySplitRing25.out" "Streetcar1:polyTweak14.ip";
connectAttr "Streetcar1:polySplitRing26.out" "Streetcar1:polySplitRing27.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polySplitRing27.mp";
connectAttr "Streetcar1:polyTweak15.out" "Streetcar1:polyExtrudeFace1.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyExtrudeFace1.mp";
connectAttr "Streetcar1:polySplitRing27.out" "Streetcar1:polyTweak15.ip";
connectAttr "Streetcar1:polyExtrudeFace1.out" "Streetcar1:polyExtrudeFace2.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyExtrudeFace2.mp";
connectAttr "Streetcar1:polyExtrudeFace2.out" "Streetcar1:polyExtrudeFace3.ip";
connectAttr "Streetcar1:pCubeShape1.wm" "Streetcar1:polyExtrudeFace3.mp";
connectAttr "Streetcar1:polyExtrudeFace3.out" "polyTweak1.ip";
connectAttr "polyTweak1.out" "transformGeometry1.ig";
connectAttr "PR_Plane_01SG.pa" ":renderPartition.st" -na;
connectAttr "PR_BigBuilding_01SG.pa" ":renderPartition.st" -na;
connectAttr "PR_StreetCar_01SG.pa" ":renderPartition.st" -na;
connectAttr "PR_Startpoint_01SG.pa" ":renderPartition.st" -na;
connectAttr "M_Plane_01.msg" ":defaultShaderList1.s" -na;
connectAttr "M_Building_01.msg" ":defaultShaderList1.s" -na;
connectAttr "M_Streetcar_01.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "Streetcar1:pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
// End of Gigaverse_Blockout_and_streetcar.ma
