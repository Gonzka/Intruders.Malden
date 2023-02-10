diag_log "[Intruders Client] Setting up MapObjects";

private _data = [
    //Hotel Kavala
    ["a3\structures_f\civ\accessories\treebin_f.p3d", [3410.57,12790.2,1.61293], [[0,0.999986,-0.00534068],[-0.0731338,0.00532638,0.997308]]],
	
	//Kavala SpeedBumpBlumen
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3609.26,13070.2,10.787], [[-0.998906,0.0467578,0],[0,0,1]]],
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3636.86,13231.5,10.5708], [[0.93758,-0.347506,0.0135319],[-0.00715439,0.0196289,0.999782]]],
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3618.13,13065.5,10.7939], [[-0.998906,0.0467578,0],[0,0,1]]],
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3618.33,13069.4,10.8021], [[-0.998906,0.0467578,0],[0,0,1]]],
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3609.11,13066.3,10.8022], [[-0.998906,0.0467578,0],[0,0,1]]],
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3645.65,13228.9,10.5311], [[0.953454,-0.301251,0.0131546],[-0.0141674,-0.00117749,0.999899]]],
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3646.79,13232.6,10.5703], [[0.953454,-0.301251,0.0131546],[-0.0141674,-0.00117749,0.999899]]],
	["a3\structures_f_enoch\civilian\accessories\concretetreeplanter_01_f.p3d", [3638.21,13235.2,10.4722], [[0.93758,-0.347506,0.0135319],[-0.00715439,0.0196289,0.999782]]],
	
	//Hotel Kavala
	["a3\plants_f\tree\t_phoenixc1s_f.p3d", [3410.51,12790.3,0.776375], [[0.951116,0.308834,0],[0,0,1]]],
	
	//Kavala
	["a3\plants_f\tree\t_phoenixc3s_f.p3d", [3623.79,13156,10.055], [[0,0.999943,0.0106636],[-0.00532323,-0.0106635,0.999929]]],
	
	//Markt Hinterhof
	["a3\vegetation_f_argo\trees\t_cupressus_stricta_2s_f.p3d", [3671.02,13093.8,9.94106], [[-0.362202,-0.9321,0],[0,0,1]]],
    ["a3\plants_f\bush\b_neriumo2s_f.p3d", [3665.07,13093.6,10.7276], [[0.956601,-0.291401,0],[0,0,1]]],
    ["a3\vegetation_f_enoch\bush\b_sambucusnigra_2s.p3d", [3670.62,13122.5,10.1849], [[-0.550714,-0.834694,0],[0,0,1]]],
    ["a3\plants_f\bush\b_neriumo2s_white_f.p3d", [3671.09,13102.8,10.7913], [[0,1,0],[0,0,1]]],

	//Auktionshaus Kavala
	["a3\vegetation_f_enoch\tree\t_betula_pendula_2f.p3d", [3702.1,13103.4,11.0151], [[0,0.999986,0.00532655],[-0.0572388,-0.00531781,0.998346]]],
	["a3\plants_f\tree\t_broussonetiap1s_f.p3d", [3695.15,13122.2,11.0614], [[0,0.999872,-0.0159977],[-0.0159977,0.0159956,0.999744]]],
	["a3\vegetation_f_enoch\tree\t_pyruscommunis_3s.p3d", [3684.43,13122.7,10.8059], [[0,0.99985,0.0173315],[-0.0253251,-0.017326,0.999529]]],
	
	//Autohändler Kavala
	["a3\plants_f\tree\t_populusn3s_f.p3d", [3640.41,13178.1,10.3034], [[0.996403,-0.0840189,0.011074],[-0.0106641,0.0053262,0.999929]]],
	["a3\plants_f\tree\t_fraxinusav2s_f.p3d", [3665.07,13195.7,10.4744], [[-0.997192,0.0517759,-0.0541008],[-0.0545853,-0.00798897,0.998477]]],
	["a3\plants_f\bush\b_ficusc1s_f.p3d", [3643.86,13192.7,10.2421], [[0.975088,0.221819,0.000588277],[0,-0.00265204,0.999996]]],
	["a3\plants_f\bush\b_ficusc1s_f.p3d", [3665.55,13191.8,10.4544], [[-0.962638,0.269842,-0.0226393],[-0.0279894,-0.0159951,0.99948]]],
	["a3\plants_f\bush\b_ficusc1s_f.p3d", [3645.84,13178,10.3644], [[-0.297007,0.954826,-0.00969519],[-0.00265204,0.00932847,0.999953]]],
	["a3\plants_f\tree\t_ficusb2s_f.p3d", [3669.85,13207,10.5487], [[0.875126,-0.474512,0.0948251],[-0.12045,-0.0238166,0.992434]]],
	["a3\plants_f\tree\t_ficusb1s_f.p3d", [3651.61,13176.6,10.6508], [[-0.930064,0.367398,0],[0,0,1]]],
	["a3\plants_f\bush\b_neriumo2s_f.p3d", [3643.44,13190.1,10.2565], [[0.133173,-0.991071,0.00660772],[0,0.00666711,0.999978]]],
	
	//Kavala SpeedBumpBlumen
	["a3\plants_f\bush\b_neriumo2s_f.p3d", [3618.26,13069.5,11.2926], [[0.0549502,0.998489,0],[0,0,1]]],
	["a3\plants_f\bush\b_neriumo2s_f.p3d", [3609.28,13066.2,11.2793], [[-0.0549462,-0.998489,0],[0,0,1]]],
	["a3\plants_f\bush\b_neriumo2s_f.p3d", [3638.2,13235.1,10.9299], [[-0.18685,-0.982388,0],[0,0,1]]],
	["a3\plants_f\bush\b_neriumo2s_f.p3d", [3645.55,13229,10.9894], [[0.336271,0.930895,-0.142674],[-0.0898678,0.182524,0.979086]]],
	["a3\plants_f\bush\b_neriumo2s_white_f.p3d", [3618.05,13065.5,11.2926], [[0.0549502,0.998489,0],[0,0,1]]],
	["a3\plants_f\bush\b_neriumo2s_white_f.p3d", [3609.32,13070.1,11.2794], [[-0.0549501,-0.998489,0],[0,0,1]]],
	["a3\plants_f\bush\b_neriumo2s_white_f.p3d", [3636.9,13231.4,11.0337], [[-0.186848,-0.982389,0],[0,0,1]]],
	["a3\plants_f\bush\b_neriumo2s_white_f.p3d", [3646.72,13232.9,11.0295], [[0.336274,0.930894,-0.142675],[-0.0898703,0.182526,0.979085]]],
	
	//Bäume neben SpeedBump
	["a3\plants_f\tree\t_populusn3s_f.p3d", [3654.41,13230,10.4826], [[0.30019,-0.953837,0.00901484],[-0.0173282,0.00399615,0.999842]]],
    ["a3\plants_f\tree\t_populusn3s_f.p3d", [3652.11,13223.8,10.4029], [[0,0.999978,0.00666818],[-0.00666818,-0.00666803,0.999956]]]
];

private "_object";
{
	_object = createSimpleObject [(_x select 0), (ASLToAGL(_x select 1)), true];
	_object setVectorDirAndUp (_x select 2);
	_object setPosASL (_x select 1);
	_object enableSimulation false;
	_object allowDamage false;
} forEach _data;

diag_log "[Intruders Client] MapObjects completed";