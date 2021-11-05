//------------[ Textdraw ]------------


//Info textdraw
new PlayerText:InfoTD[MAX_PLAYERS];
new Text:TextTime, Text:TextDate;

//Server Name textdraw
new Text:SOIRP_TXD;

//HBE textdraw Modern
new Text:TDEditor_TD[19];
//TD lokasi
new PlayerText:tdlok[MAX_PLAYERS];
//TD waktu
new Text:td_waktu;

new PlayerText:tdrob[MAX_PLAYERS];

/*new PlayerText:DPname[MAX_PLAYERS];
new PlayerText:DPmoney[MAX_PLAYERS];
new PlayerText:DPcoin[MAX_PLAYERS];*/
new PlayerText:PlayerTD[MAX_PLAYERS][7];
new PlayerText:tdblur_0[MAX_PLAYERS];
new PlayerText:newtdhbe[MAX_PLAYERS][7];
new PlayerText:newsveh[MAX_PLAYERS][7];

new PlayerText:DPvehname[MAX_PLAYERS];
new PlayerText:DPvehengine[MAX_PLAYERS];
new PlayerText:DPvehspeed[MAX_PLAYERS];
new Text:DPvehfare[MAX_PLAYERS];

//HBE textdraw Simple
new PlayerText:SPvehname[MAX_PLAYERS];
new PlayerText:SPvehengine[MAX_PLAYERS];
new PlayerText:SPvehspeed[MAX_PLAYERS];

new PlayerText:ActiveTD[MAX_PLAYERS];


CreatePlayerTextDraws(playerid)
{
	//Info textdraw
	InfoTD[playerid] = CreatePlayerTextDraw(playerid, 148.888, 361.385, "Welcome!");
 	PlayerTextDrawLetterSize(playerid, InfoTD[playerid], 0.326, 1.654);
	PlayerTextDrawAlignment(playerid, InfoTD[playerid], 1);
	PlayerTextDrawColor(playerid, InfoTD[playerid], -1);
	PlayerTextDrawSetOutline(playerid, InfoTD[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, InfoTD[playerid], 0x000000FF);
	PlayerTextDrawFont(playerid, InfoTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, InfoTD[playerid], 1);
	
	ActiveTD[playerid] = CreatePlayerTextDraw(playerid, 274.000000, 176.583435, "Refulling...");
	PlayerTextDrawLetterSize(playerid, ActiveTD[playerid], 0.374000, 1.349166);
	PlayerTextDrawAlignment(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawColor(playerid, ActiveTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, ActiveTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, ActiveTD[playerid], 255);
	PlayerTextDrawFont(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetProportional(playerid, ActiveTD[playerid], 1);
	PlayerTextDrawSetShadow(playerid, ActiveTD[playerid], 0);
	
	//HBE Textdraw Modern
	/*DPname[playerid] = CreatePlayerTextDraw(playerid, 537.000000, 367.333251, "Dandy_Prasetyo");
	PlayerTextDrawLetterSize(playerid, DPname[playerid], 0.328999, 1.179998);
	PlayerTextDrawAlignment(playerid, DPname[playerid], 1);
	PlayerTextDrawColor(playerid, DPname[playerid], COLOR_YELLOW);
	PlayerTextDrawSetShadow(playerid, DPname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPname[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPname[playerid], 255);
	PlayerTextDrawFont(playerid, DPname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, DPname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPname[playerid], 0);

	DPmoney[playerid] = CreatePlayerTextDraw(playerid, 535.000000, 381.916473, "$50.000");
	PlayerTextDrawLetterSize(playerid, DPmoney[playerid], 0.231499, 1.034165);
	PlayerTextDrawAlignment(playerid, DPmoney[playerid], 1);
	PlayerTextDrawColor(playerid, DPmoney[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, DPmoney[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPmoney[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPmoney[playerid], 255);
	PlayerTextDrawFont(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPmoney[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPmoney[playerid], 0);

	DPcoin[playerid] = CreatePlayerTextDraw(playerid, 535.500000, 392.999877, "5000_Coin");
	PlayerTextDrawLetterSize(playerid, DPcoin[playerid], 0.246000, 0.952498);
	PlayerTextDrawAlignment(playerid, DPcoin[playerid], 1);
	PlayerTextDrawColor(playerid, DPcoin[playerid], -65281);
	PlayerTextDrawSetShadow(playerid, DPcoin[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPcoin[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPcoin[playerid], 255);
	PlayerTextDrawFont(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPcoin[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPcoin[playerid], 0);*/

	/*TDEditor_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 565.500000, 405.833404, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][3], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][3], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][3], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][3], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][3], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);

	TDEditor_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 565.500000, 420.416717, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][4], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][4], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][4], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][4], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);

	TDEditor_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 565.500000, 435.000091, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][5], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][5], 68.000000, 8.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][5], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][5], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][5], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);*/

	DPvehname[playerid] = CreatePlayerTextDraw(playerid, 431.000000, 367.333312, "Turismo");
	PlayerTextDrawLetterSize(playerid, DPvehname[playerid], 0.299499, 1.121665);
	PlayerTextDrawAlignment(playerid, DPvehname[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehname[playerid], COLOR_YELLOW);
	PlayerTextDrawSetShadow(playerid, DPvehname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehname[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehname[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehname[playerid], 0);

	DPvehengine[playerid] = CreatePlayerTextDraw(playerid, 462.000000, 381.916778, "ON");
	PlayerTextDrawLetterSize(playerid, DPvehengine[playerid], 0.229000, 0.940832);
	PlayerTextDrawAlignment(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehengine[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, DPvehengine[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehengine[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehengine[playerid], 0);

	DPvehspeed[playerid] = CreatePlayerTextDraw(playerid, 460.000000, 391.833312, "120_Mph");
	PlayerTextDrawLetterSize(playerid, DPvehspeed[playerid], 0.266999, 0.946666);
	PlayerTextDrawAlignment(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawColor(playerid, DPvehspeed[playerid], -1);
	PlayerTextDrawSetShadow(playerid, DPvehspeed[playerid], 0);
	PlayerTextDrawSetOutline(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, DPvehspeed[playerid], 255);
	PlayerTextDrawFont(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetProportional(playerid, DPvehspeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, DPvehspeed[playerid], 0);

	DPvehfare[playerid] = TextDrawCreate(462.000000, 401.166687, "$500.000");
	TextDrawLetterSize(DPvehfare[playerid], 0.216000, 0.952498);
	TextDrawAlignment(DPvehfare[playerid], 1);
	TextDrawColor(DPvehfare[playerid], 16711935);
	TextDrawSetShadow(DPvehfare[playerid], 0);
	TextDrawSetOutline(DPvehfare[playerid], 1);
	TextDrawBackgroundColor(DPvehfare[playerid], 255);
	TextDrawFont(DPvehfare[playerid], 1);
	TextDrawSetProportional(DPvehfare[playerid], 1);
	TextDrawSetShadow(DPvehfare[playerid], 0);

	/*TDEditor_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 459.000000, 415.749938, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][10], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][10], 61.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][10], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][10], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][10], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][10], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);

	TDEditor_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 459.500000, 432.083221, "LD_SPAC:white");
	PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][11], 0.000000, 0.000000);
	PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][11], 61.000000, 9.000000);
	PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][11], 1);
	PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][11], 16711935);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][11], 255);
	PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][11], 0);
	PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);*/
	
	//HBE textdraw Simple
	SPvehname[playerid] = CreatePlayerTextDraw(playerid, 540.000000, 366.749908, "Turismo");
	PlayerTextDrawLetterSize(playerid, SPvehname[playerid], 0.319000, 1.022498);
	PlayerTextDrawAlignment(playerid, SPvehname[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehname[playerid], -1);
	PlayerTextDrawSetShadow(playerid, SPvehname[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehname[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehname[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehname[playerid], 0);

	SPvehspeed[playerid] = CreatePlayerTextDraw(playerid, 538.000000, 412.833160, "250_Mph");
	PlayerTextDrawLetterSize(playerid, SPvehspeed[playerid], 0.275498, 1.244166);
	PlayerTextDrawAlignment(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehspeed[playerid], -1);
	PlayerTextDrawSetShadow(playerid, SPvehspeed[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehspeed[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehspeed[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehspeed[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehspeed[playerid], 0);

	SPvehengine[playerid] = CreatePlayerTextDraw(playerid, 611.500000, 414.000152, "ON");
	PlayerTextDrawLetterSize(playerid, SPvehengine[playerid], 0.280999, 1.104166);
	PlayerTextDrawAlignment(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawColor(playerid, SPvehengine[playerid], 16711935);
	PlayerTextDrawSetShadow(playerid, SPvehengine[playerid], 0);
	PlayerTextDrawSetOutline(playerid, SPvehengine[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid, SPvehengine[playerid], 255);
	PlayerTextDrawFont(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SPvehengine[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SPvehengine[playerid], 0);

	PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 553.000000, 427.000000, "_");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 4.370835, 2.199976);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 330.500000, 219.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 125);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 135);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

	PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 445.000000, 429.000000, "HUD:radar_burgershot");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][1], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][1], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][1], 0);

	PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 510.000000, 429.000000, "HUD:radar_datedrink");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);

	PlayerTD[playerid][3] = CreatePlayerTextDraw(playerid, 572.000000, 429.000000, "HUD:radar_centre");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][3], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][3], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][3], 0);

	PlayerTD[playerid][4] = CreatePlayerTextDraw(playerid, 463.000000, 429.000000, "100%");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][4], 0.449999, 1.700000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][4], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][4], 0);

	PlayerTD[playerid][5] = CreatePlayerTextDraw(playerid, 525.000000, 429.000000, "100%");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][5], 0.449999, 1.700000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][5], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][5], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][5], 0);

	PlayerTD[playerid][6] = CreatePlayerTextDraw(playerid, 588.000000, 429.000000, "100%");
	PlayerTextDrawFont(playerid, PlayerTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][6], 0.449999, 1.700000);
	PlayerTextDrawTextSize(playerid, PlayerTD[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, PlayerTD[playerid][6], 1);
	PlayerTextDrawColor(playerid, PlayerTD[playerid][6], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, PlayerTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][6], 0);

	//TD lokasi
	tdlok[playerid] = CreatePlayerTextDraw(playerid, 82.000000, 428.000000, "Los Ssntos");
	PlayerTextDrawFont(playerid, tdlok[playerid], 1);
	PlayerTextDrawLetterSize(playerid, tdlok[playerid], 0.316665, 1.449998);
	PlayerTextDrawTextSize(playerid, tdlok[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, tdlok[playerid], 1);
	PlayerTextDrawSetShadow(playerid, tdlok[playerid], 0);
	PlayerTextDrawAlignment(playerid, tdlok[playerid], 1);
	PlayerTextDrawColor(playerid, tdlok[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, tdlok[playerid], 255);
	PlayerTextDrawBoxColor(playerid, tdlok[playerid], 50);
	PlayerTextDrawUseBox(playerid, tdlok[playerid], 0);
	PlayerTextDrawSetProportional(playerid, tdlok[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, tdlok[playerid], 0);

	//TD BAnk robbery
	tdrob[playerid] = CreatePlayerTextDraw(playerid, 263.000000, 352.000000, "Bank Robbery: ~r~0 ~w~Seconds");
	PlayerTextDrawFont(playerid, tdrob[playerid], 1);
	PlayerTextDrawLetterSize(playerid, tdrob[playerid], 0.258333, 1.600000);
	PlayerTextDrawTextSize(playerid, tdrob[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, tdrob[playerid], 0);
	PlayerTextDrawSetShadow(playerid, tdrob[playerid], 0);
	PlayerTextDrawAlignment(playerid, tdrob[playerid], 1);
	PlayerTextDrawColor(playerid, tdrob[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, tdrob[playerid], 255);
	PlayerTextDrawBoxColor(playerid, tdrob[playerid], 50);
	PlayerTextDrawUseBox(playerid, tdrob[playerid], 0);
	PlayerTextDrawSetProportional(playerid, tdrob[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, tdrob[playerid], 0);

	//TD Blur
	tdblur_0[playerid] = CreatePlayerTextDraw(playerid, 318.000000, -4.000000, "_");
	PlayerTextDrawFont(playerid, tdblur_0[playerid], 1);
	PlayerTextDrawLetterSize(playerid, tdblur_0[playerid], 0.812497, 50.049961);
	PlayerTextDrawTextSize(playerid, tdblur_0[playerid], 305.000000, 641.000000);
	PlayerTextDrawSetOutline(playerid, tdblur_0[playerid], 1);
	PlayerTextDrawSetShadow(playerid, tdblur_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, tdblur_0[playerid], 2);
	PlayerTextDrawColor(playerid, tdblur_0[playerid], 255);
	PlayerTextDrawBackgroundColor(playerid, tdblur_0[playerid], 214);
	PlayerTextDrawBoxColor(playerid, tdblur_0[playerid], 233);
	PlayerTextDrawUseBox(playerid, tdblur_0[playerid], 1);
	PlayerTextDrawSetProportional(playerid, tdblur_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, tdblur_0[playerid], 0);

	//New HBE Modern
	newtdhbe[playerid][0] = CreatePlayerTextDraw(playerid, 571.000000, 365.000000, "_");
	PlayerTextDrawFont(playerid, newtdhbe[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, newtdhbe[playerid][0], 0.462500, 9.099998);
	PlayerTextDrawTextSize(playerid, newtdhbe[playerid][0], 298.500000, 137.500000);
	PlayerTextDrawSetOutline(playerid, newtdhbe[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, newtdhbe[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, newtdhbe[playerid][0], 2);
	PlayerTextDrawColor(playerid, newtdhbe[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, newtdhbe[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, newtdhbe[playerid][0], 227);
	PlayerTextDrawUseBox(playerid, newtdhbe[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, newtdhbe[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, newtdhbe[playerid][0], 0);

	newtdhbe[playerid][1] = CreatePlayerTextDraw(playerid, 517.000000, 373.000000, "HUD:radar_burgershot");
	PlayerTextDrawFont(playerid, newtdhbe[playerid][1], 4);
	PlayerTextDrawLetterSize(playerid, newtdhbe[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newtdhbe[playerid][1], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newtdhbe[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, newtdhbe[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, newtdhbe[playerid][1], 1);
	PlayerTextDrawColor(playerid, newtdhbe[playerid][1], 1296911802);
	PlayerTextDrawBackgroundColor(playerid, newtdhbe[playerid][1], -1);
	PlayerTextDrawBoxColor(playerid, newtdhbe[playerid][1], -206);
	PlayerTextDrawUseBox(playerid, newtdhbe[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, newtdhbe[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, newtdhbe[playerid][1], 0);

	newtdhbe[playerid][2] = CreatePlayerTextDraw(playerid, 518.000000, 399.000000, "HUD:radar_datedrink");
	PlayerTextDrawFont(playerid, newtdhbe[playerid][2], 4);
	PlayerTextDrawLetterSize(playerid, newtdhbe[playerid][2], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newtdhbe[playerid][2], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newtdhbe[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, newtdhbe[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, newtdhbe[playerid][2], 1);
	PlayerTextDrawColor(playerid, newtdhbe[playerid][2], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newtdhbe[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, newtdhbe[playerid][2], 50);
	PlayerTextDrawUseBox(playerid, newtdhbe[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, newtdhbe[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, newtdhbe[playerid][2], 0);

	newtdhbe[playerid][3] = CreatePlayerTextDraw(playerid, 517.000000, 424.000000, "HUD:radar_centre");
	PlayerTextDrawFont(playerid, newtdhbe[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, newtdhbe[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newtdhbe[playerid][3], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newtdhbe[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, newtdhbe[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, newtdhbe[playerid][3], 1);
	PlayerTextDrawColor(playerid, newtdhbe[playerid][3], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newtdhbe[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, newtdhbe[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, newtdhbe[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, newtdhbe[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, newtdhbe[playerid][3], 0);

	newtdhbe[playerid][4] = CreatePlayerTextDraw(playerid, 562.000000, 372.000000, "100%");
	PlayerTextDrawFont(playerid, newtdhbe[playerid][4], 3);
	PlayerTextDrawLetterSize(playerid, newtdhbe[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newtdhbe[playerid][4], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newtdhbe[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, newtdhbe[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, newtdhbe[playerid][4], 1);
	PlayerTextDrawColor(playerid, newtdhbe[playerid][4], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newtdhbe[playerid][4], 255);
	PlayerTextDrawBoxColor(playerid, newtdhbe[playerid][4], 50);
	PlayerTextDrawUseBox(playerid, newtdhbe[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, newtdhbe[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, newtdhbe[playerid][4], 0);

	newtdhbe[playerid][5] = CreatePlayerTextDraw(playerid, 562.000000, 397.000000, "100%");
	PlayerTextDrawFont(playerid, newtdhbe[playerid][5], 3);
	PlayerTextDrawLetterSize(playerid, newtdhbe[playerid][5], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newtdhbe[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newtdhbe[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, newtdhbe[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, newtdhbe[playerid][5], 1);
	PlayerTextDrawColor(playerid, newtdhbe[playerid][5], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newtdhbe[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, newtdhbe[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, newtdhbe[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, newtdhbe[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, newtdhbe[playerid][5], 0);

	newtdhbe[playerid][6] = CreatePlayerTextDraw(playerid, 562.000000, 422.000000, "100%");
	PlayerTextDrawFont(playerid, newtdhbe[playerid][6], 3);
	PlayerTextDrawLetterSize(playerid, newtdhbe[playerid][6], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newtdhbe[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newtdhbe[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, newtdhbe[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, newtdhbe[playerid][6], 1);
	PlayerTextDrawColor(playerid, newtdhbe[playerid][6], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newtdhbe[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, newtdhbe[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, newtdhbe[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, newtdhbe[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, newtdhbe[playerid][6], 0);

	//New Speedo Modern
	newsveh[playerid][0] = CreatePlayerTextDraw(playerid, 464.000000, 365.000000, "_");
	PlayerTextDrawFont(playerid, newsveh[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, newsveh[playerid][0], 0.462500, 9.099998);
	PlayerTextDrawTextSize(playerid, newsveh[playerid][0], 298.500000, 69.500000);
	PlayerTextDrawSetOutline(playerid, newsveh[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, newsveh[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, newsveh[playerid][0], 2);
	PlayerTextDrawColor(playerid, newsveh[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, newsveh[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, newsveh[playerid][0], 227);
	PlayerTextDrawUseBox(playerid, newsveh[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, newsveh[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, newsveh[playerid][0], 0);

	newsveh[playerid][1] = CreatePlayerTextDraw(playerid, 444.000000, 387.000000, "0 Mph");
	PlayerTextDrawFont(playerid, newsveh[playerid][1], 3);
	PlayerTextDrawLetterSize(playerid, newsveh[playerid][1], 0.595833, 2.549998);
	PlayerTextDrawTextSize(playerid, newsveh[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newsveh[playerid][1], 1);
	PlayerTextDrawSetShadow(playerid, newsveh[playerid][1], 0);
	PlayerTextDrawAlignment(playerid, newsveh[playerid][1], 1);
	PlayerTextDrawColor(playerid, newsveh[playerid][1], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newsveh[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, newsveh[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, newsveh[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, newsveh[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, newsveh[playerid][1], 0);

	newsveh[playerid][2] = CreatePlayerTextDraw(playerid, 384.000000, 365.000000, "_");
	PlayerTextDrawFont(playerid, newsveh[playerid][2], 1);
	PlayerTextDrawLetterSize(playerid, newsveh[playerid][2], 0.462500, 9.099998);
	PlayerTextDrawTextSize(playerid, newsveh[playerid][2], 298.500000, 84.500000);
	PlayerTextDrawSetOutline(playerid, newsveh[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, newsveh[playerid][2], 0);
	PlayerTextDrawAlignment(playerid, newsveh[playerid][2], 2);
	PlayerTextDrawColor(playerid, newsveh[playerid][2], -1);
	PlayerTextDrawBackgroundColor(playerid, newsveh[playerid][2], 255);
	PlayerTextDrawBoxColor(playerid, newsveh[playerid][2], 227);
	PlayerTextDrawUseBox(playerid, newsveh[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, newsveh[playerid][2], 1);
	PlayerTextDrawSetSelectable(playerid, newsveh[playerid][2], 0);

	newsveh[playerid][3] = CreatePlayerTextDraw(playerid, 349.000000, 382.000000, "HUD:radar_girlfriend");
	PlayerTextDrawFont(playerid, newsveh[playerid][3], 4);
	PlayerTextDrawLetterSize(playerid, newsveh[playerid][3], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newsveh[playerid][3], 17.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newsveh[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, newsveh[playerid][3], 0);
	PlayerTextDrawAlignment(playerid, newsveh[playerid][3], 1);
	PlayerTextDrawColor(playerid, newsveh[playerid][3], -1);
	PlayerTextDrawBackgroundColor(playerid, newsveh[playerid][3], 255);
	PlayerTextDrawBoxColor(playerid, newsveh[playerid][3], 50);
	PlayerTextDrawUseBox(playerid, newsveh[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, newsveh[playerid][3], 1);
	PlayerTextDrawSetSelectable(playerid, newsveh[playerid][3], 0);

	newsveh[playerid][4] = CreatePlayerTextDraw(playerid, 344.000000, 413.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, newsveh[playerid][4], 5);
	PlayerTextDrawLetterSize(playerid, newsveh[playerid][4], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, newsveh[playerid][4], 26.500000, 28.500000);
	PlayerTextDrawSetOutline(playerid, newsveh[playerid][4], 0);
	PlayerTextDrawSetShadow(playerid, newsveh[playerid][4], 0);
	PlayerTextDrawAlignment(playerid, newsveh[playerid][4], 1);
	PlayerTextDrawColor(playerid, newsveh[playerid][4], -1);
	PlayerTextDrawBackgroundColor(playerid, newsveh[playerid][4], 0);
	PlayerTextDrawBoxColor(playerid, newsveh[playerid][4], 255);
	PlayerTextDrawUseBox(playerid, newsveh[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, newsveh[playerid][4], 1);
	PlayerTextDrawSetSelectable(playerid, newsveh[playerid][4], 0);
	PlayerTextDrawSetPreviewModel(playerid, newsveh[playerid][4], 1650);
	PlayerTextDrawSetPreviewRot(playerid, newsveh[playerid][4], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, newsveh[playerid][4], 2, 1);

	newsveh[playerid][5] = CreatePlayerTextDraw(playerid, 379.000000, 381.000000, "1000.0%");
	PlayerTextDrawFont(playerid, newsveh[playerid][5], 3);
	PlayerTextDrawLetterSize(playerid, newsveh[playerid][5], 0.291666, 1.700000);
	PlayerTextDrawTextSize(playerid, newsveh[playerid][5], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newsveh[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, newsveh[playerid][5], 0);
	PlayerTextDrawAlignment(playerid, newsveh[playerid][5], 1);
	PlayerTextDrawColor(playerid, newsveh[playerid][5], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newsveh[playerid][5], 255);
	PlayerTextDrawBoxColor(playerid, newsveh[playerid][5], 50);
	PlayerTextDrawUseBox(playerid, newsveh[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, newsveh[playerid][5], 1);
	PlayerTextDrawSetSelectable(playerid, newsveh[playerid][5], 0);

	newsveh[playerid][6] = CreatePlayerTextDraw(playerid, 379.000000, 419.000000, "100%");
	PlayerTextDrawFont(playerid, newsveh[playerid][6], 3);
	PlayerTextDrawLetterSize(playerid, newsveh[playerid][6], 0.420833, 2.099999);
	PlayerTextDrawTextSize(playerid, newsveh[playerid][6], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, newsveh[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, newsveh[playerid][6], 0);
	PlayerTextDrawAlignment(playerid, newsveh[playerid][6], 1);
	PlayerTextDrawColor(playerid, newsveh[playerid][6], 1296911871);
	PlayerTextDrawBackgroundColor(playerid, newsveh[playerid][6], 255);
	PlayerTextDrawBoxColor(playerid, newsveh[playerid][6], 50);
	PlayerTextDrawUseBox(playerid, newsveh[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, newsveh[playerid][6], 1);
	PlayerTextDrawSetSelectable(playerid, newsveh[playerid][6], 0);
}

CreateTextDraw()
{
	//Date and Time
	TextDate = TextDrawCreate(499.999267, 6.471089,"--");
	TextDrawBackgroundColor(TextDate, 255);
	TextDrawFont(TextDate, 3);
	TextDrawLetterSize(TextDate, 0.36000, 1.400000);
	TextDrawSetOutline(TextDate, 1);
	TextDrawSetProportional(TextDate, 1);
	TextDrawSetShadow(TextDate, 1);
	TextDrawColor(TextDate,0xFFFFFFFF);

	TextTime = TextDrawCreate(547.5, 25.33,"--");
	TextDrawLetterSize(TextTime,0.330000, 1.100000);
	TextDrawFont(TextTime , 2);
	TextDrawSetOutline(TextTime , 1);
    TextDrawSetProportional(TextTime , 1);
	TextDrawBackgroundColor(TextTime, 255);
	TextDrawSetShadow(TextTime, 1);
	TextDrawColor(TextTime,0xFFFFFFFF);
	
	//Server Name
	SOIRP_TXD = TextDrawCreate(499.999267, 6.471089, "~p~SAMPINDO ~r~Roleplay");
	TextDrawLetterSize(SOIRP_TXD, 0.269998, 1.405864);
	TextDrawAlignment(SOIRP_TXD, 1);
	TextDrawColor(SOIRP_TXD, -1);
	TextDrawSetShadow(SOIRP_TXD, 0);
	TextDrawSetOutline(SOIRP_TXD, 1);
	TextDrawBackgroundColor(SOIRP_TXD, 0x000000FF);
	TextDrawFont(SOIRP_TXD, 1);
	TextDrawSetProportional(SOIRP_TXD, 1);


	//TD Waktu
	td_waktu = TextDrawCreate(550.000000, 29.000000, "[00:00:00]");
    TextDrawFont(td_waktu, 1);
    TextDrawLetterSize(td_waktu, 0.270832, 1.600000);
    TextDrawTextSize(td_waktu, 400.000000, 17.000000);
    TextDrawSetOutline(td_waktu, 1);
    TextDrawSetShadow(td_waktu, 0);
    TextDrawAlignment(td_waktu, 1);
    TextDrawColor(td_waktu, -1);
    TextDrawBackgroundColor(td_waktu, 255);
    TextDrawBoxColor(td_waktu, 50);
    TextDrawUseBox(td_waktu, 0);
    TextDrawSetProportional(td_waktu, 1);
    TextDrawSetSelectable(td_waktu, 0);
	
	//HBE textdraw Modern
	TDEditor_TD[0] = TextDrawCreate(531.000000, 365.583435, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[0], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[0], 164.000000, 109.000000);
	TextDrawAlignment(TDEditor_TD[0], 1);
	TextDrawColor(TDEditor_TD[0], COLOR_DARK);
	TextDrawSetShadow(TDEditor_TD[0], 0);
	TextDrawSetOutline(TDEditor_TD[0], 0);
	TextDrawBackgroundColor(TDEditor_TD[0], 255);
	TextDrawFont(TDEditor_TD[0], 4);
	TextDrawSetProportional(TDEditor_TD[0], 0);
	TextDrawSetShadow(TDEditor_TD[0], 0);

	TDEditor_TD[1] = TextDrawCreate(533.000000, 367.916778, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[1], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[1], 105.000000, 13.000000);
	TextDrawAlignment(TDEditor_TD[1], 1);
	TextDrawColor(TDEditor_TD[1], 0x80008080);
	TextDrawSetShadow(TDEditor_TD[1], 0);
	TextDrawSetOutline(TDEditor_TD[1], 0);
	TextDrawBackgroundColor(TDEditor_TD[1], 255);
	TextDrawFont(TDEditor_TD[1], 4);
	TextDrawSetProportional(TDEditor_TD[1], 0);
	TextDrawSetShadow(TDEditor_TD[1], 0);

	TDEditor_TD[2] = TextDrawCreate(543.500000, 399.416625, "");
	TextDrawLetterSize(TDEditor_TD[2], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[2], 15.000000, 20.000000);
	TextDrawAlignment(TDEditor_TD[2], 1);
	TextDrawColor(TDEditor_TD[2], -1);
	TextDrawSetShadow(TDEditor_TD[2], 0);
	TextDrawSetOutline(TDEditor_TD[2], 0);
	TextDrawBackgroundColor(TDEditor_TD[2], 0);
	TextDrawFont(TDEditor_TD[2], 5);
	TextDrawSetProportional(TDEditor_TD[2], 0);
	TextDrawSetShadow(TDEditor_TD[2], 0);
	TextDrawSetPreviewModel(TDEditor_TD[2], 2703);
	TextDrawSetPreviewRot(TDEditor_TD[2], 0.000000, 90.000000, 80.000000, 1.000000);

	TDEditor_TD[3] = TextDrawCreate(536.500000, 414.000030, "");
	TextDrawLetterSize(TDEditor_TD[3], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[3], 26.000000, 19.000000);
	TextDrawAlignment(TDEditor_TD[3], 1);
	TextDrawColor(TDEditor_TD[3], -1);
	TextDrawSetShadow(TDEditor_TD[3], 0);
	TextDrawSetOutline(TDEditor_TD[3], 0);
	TextDrawBackgroundColor(TDEditor_TD[3], 0);
	TextDrawFont(TDEditor_TD[3], 5);
	TextDrawSetProportional(TDEditor_TD[3], 0);
	TextDrawSetShadow(TDEditor_TD[3], 0);
	TextDrawSetPreviewModel(TDEditor_TD[3], 1546);
	TextDrawSetPreviewRot(TDEditor_TD[3], 0.000000, 0.000000, 200.000000, 1.000000);

	TDEditor_TD[4] = TextDrawCreate(543.000000, 428.000030, "");
	TextDrawLetterSize(TDEditor_TD[4], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[4], 17.000000, 17.000000);
	TextDrawAlignment(TDEditor_TD[4], 1);
	TextDrawColor(TDEditor_TD[4], -1);
	TextDrawSetShadow(TDEditor_TD[4], 0);
	TextDrawSetOutline(TDEditor_TD[4], 0);
	TextDrawBackgroundColor(TDEditor_TD[4], 0);
	TextDrawFont(TDEditor_TD[4], 5);
	TextDrawSetProportional(TDEditor_TD[4], 0);
	TextDrawSetShadow(TDEditor_TD[4], 0);
	TextDrawSetPreviewModel(TDEditor_TD[4], 2738);
	TextDrawSetPreviewRot(TDEditor_TD[4], 0.000000, 0.000000, 100.000000, 1.000000);

	TDEditor_TD[5] = TextDrawCreate(425.000000, 365.583557, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[5], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[5], 102.000000, 92.000000);
	TextDrawAlignment(TDEditor_TD[5], 1);
	TextDrawColor(TDEditor_TD[5], COLOR_DARK);
	TextDrawSetShadow(TDEditor_TD[5], 0);
	TextDrawSetOutline(TDEditor_TD[5], 0);
	TextDrawBackgroundColor(TDEditor_TD[5], 255);
	TextDrawFont(TDEditor_TD[5], 4);
	TextDrawSetProportional(TDEditor_TD[5], 0);
	TextDrawSetShadow(TDEditor_TD[5], 0);

	TDEditor_TD[6] = TextDrawCreate(428.000000, 367.916717, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[6], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[6], 97.000000, 11.000000);
	TextDrawAlignment(TDEditor_TD[6], 1);
	TextDrawColor(TDEditor_TD[6], 0x80008080);
	TextDrawSetShadow(TDEditor_TD[6], 0);
	TextDrawSetOutline(TDEditor_TD[6], 0);
	TextDrawBackgroundColor(TDEditor_TD[6], 255);
	TextDrawFont(TDEditor_TD[6], 4);
	TextDrawSetProportional(TDEditor_TD[6], 0);
	TextDrawSetShadow(TDEditor_TD[6], 0);

	TDEditor_TD[7] = TextDrawCreate(428.000000, 380.750030, "Engine:");
	TextDrawLetterSize(TDEditor_TD[7], 0.248998, 1.063333);
	TextDrawAlignment(TDEditor_TD[7], 1);
	TextDrawColor(TDEditor_TD[7], -1);
	TextDrawSetShadow(TDEditor_TD[7], 0);
	TextDrawSetOutline(TDEditor_TD[7], 1);
	TextDrawBackgroundColor(TDEditor_TD[7], 255);
	TextDrawFont(TDEditor_TD[7], 1);
	TextDrawSetProportional(TDEditor_TD[7], 1);
	TextDrawSetShadow(TDEditor_TD[7], 0);

	TDEditor_TD[8] = TextDrawCreate(428.000000, 389.499969, "Speed:");
	TextDrawLetterSize(TDEditor_TD[8], 0.266499, 1.191666);
	TextDrawAlignment(TDEditor_TD[8], 1);
	TextDrawColor(TDEditor_TD[8], -1);
	TextDrawSetShadow(TDEditor_TD[8], 0);
	TextDrawSetOutline(TDEditor_TD[8], 1);
	TextDrawBackgroundColor(TDEditor_TD[8], 255);
	TextDrawFont(TDEditor_TD[8], 1);
	TextDrawSetProportional(TDEditor_TD[8], 1);
	TextDrawSetShadow(TDEditor_TD[8], 0);

	TDEditor_TD[9] = TextDrawCreate(437.000000, 411.083343, "");
	TextDrawLetterSize(TDEditor_TD[9], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[9], 13.000000, 18.000000);
	TextDrawAlignment(TDEditor_TD[9], 1);
	TextDrawColor(TDEditor_TD[9], -1);
	TextDrawSetShadow(TDEditor_TD[9], 0);
	TextDrawSetOutline(TDEditor_TD[9], 0);
	TextDrawBackgroundColor(TDEditor_TD[9], 0);
	TextDrawFont(TDEditor_TD[9], 5);
	TextDrawSetProportional(TDEditor_TD[9], 0);
	TextDrawSetShadow(TDEditor_TD[9], 0);
	TextDrawSetPreviewModel(TDEditor_TD[9], 1240);
	TextDrawSetPreviewRot(TDEditor_TD[9], 0.000000, 0.000000, 0.000000, 1.000000);

	TDEditor_TD[10] = TextDrawCreate(434.500000, 425.666595, "");
	TextDrawLetterSize(TDEditor_TD[10], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[10], 20.000000, 21.000000);
	TextDrawAlignment(TDEditor_TD[10], 1);
	TextDrawColor(TDEditor_TD[10], -1);
	TextDrawSetShadow(TDEditor_TD[10], 0);
	TextDrawSetOutline(TDEditor_TD[10], 0);
	TextDrawBackgroundColor(TDEditor_TD[10], 0);
	TextDrawFont(TDEditor_TD[10], 5);
	TextDrawSetProportional(TDEditor_TD[10], 0);
	TextDrawSetShadow(TDEditor_TD[10], 0);
	TextDrawSetPreviewModel(TDEditor_TD[10], 1650);
	TextDrawSetPreviewRot(TDEditor_TD[10], 0.000000, 0.000000, 0.000000, 1.000000);
	
	TDEditor_TD[11] = TextDrawCreate(427.000000, 400.583374, "Fare:");
	TextDrawLetterSize(TDEditor_TD[11], 0.360498, 1.022500);
	TextDrawAlignment(TDEditor_TD[11], 1);
	TextDrawColor(TDEditor_TD[11], -1);
	TextDrawSetShadow(TDEditor_TD[11], 0);
	TextDrawSetOutline(TDEditor_TD[11], 1);
	TextDrawBackgroundColor(TDEditor_TD[11], 255);
	TextDrawFont(TDEditor_TD[11], 1);
	TextDrawSetProportional(TDEditor_TD[11], 1);
	TextDrawSetShadow(TDEditor_TD[11], 0);
	
	//HBE textdraw Simple
	TDEditor_TD[12] = TextDrawCreate(450.500000, 428.000091, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[12], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[12], 191.000000, 27.000000);
	TextDrawAlignment(TDEditor_TD[12], 1);
	TextDrawColor(TDEditor_TD[12], 175);
	TextDrawSetShadow(TDEditor_TD[12], 0);
	TextDrawSetOutline(TDEditor_TD[12], 0);
	TextDrawBackgroundColor(TDEditor_TD[12], 255);
	TextDrawFont(TDEditor_TD[12], 4);
	TextDrawSetProportional(TDEditor_TD[12], 0);
	TextDrawSetShadow(TDEditor_TD[12], 0);

	TDEditor_TD[13] = TextDrawCreate(450.000000, 422.166778, "");
	TextDrawLetterSize(TDEditor_TD[13], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[13], 17.000000, 34.000000);
	TextDrawAlignment(TDEditor_TD[13], 1);
	TextDrawColor(TDEditor_TD[13], -1);
	TextDrawSetShadow(TDEditor_TD[13], 0);
	TextDrawSetOutline(TDEditor_TD[13], 0);
	TextDrawBackgroundColor(TDEditor_TD[13], 0);
	TextDrawFont(TDEditor_TD[13], 5);
	TextDrawSetProportional(TDEditor_TD[13], 0);
	TextDrawSetShadow(TDEditor_TD[13], 0);
	TextDrawSetPreviewModel(TDEditor_TD[13], 2703);
	TextDrawSetPreviewRot(TDEditor_TD[13], 100.000000, 0.000000, -10.000000, 1.000000);

	TDEditor_TD[14] = TextDrawCreate(507.500000, 429.166748, "");
	TextDrawLetterSize(TDEditor_TD[14], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[14], 25.000000, 20.000000);
	TextDrawAlignment(TDEditor_TD[14], 1);
	TextDrawColor(TDEditor_TD[14], -1);
	TextDrawSetShadow(TDEditor_TD[14], 0);
	TextDrawSetOutline(TDEditor_TD[14], 0);
	TextDrawBackgroundColor(TDEditor_TD[14], 0);
	TextDrawFont(TDEditor_TD[14], 5);
	TextDrawSetProportional(TDEditor_TD[14], 0);
	TextDrawSetShadow(TDEditor_TD[14], 0);
	TextDrawSetPreviewModel(TDEditor_TD[14], 1546);
	TextDrawSetPreviewRot(TDEditor_TD[14], 0.000000, 0.000000, 100.000000, 1.000000);

	TDEditor_TD[15] = TextDrawCreate(574.500000, 427.999969, "");
	TextDrawLetterSize(TDEditor_TD[15], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[15], 20.000000, 19.000000);
	TextDrawAlignment(TDEditor_TD[15], 1);
	TextDrawColor(TDEditor_TD[15], -1);
	TextDrawSetShadow(TDEditor_TD[15], 0);
	TextDrawSetOutline(TDEditor_TD[15], 0);
	TextDrawBackgroundColor(TDEditor_TD[15], 0);
	TextDrawFont(TDEditor_TD[15], 5);
	TextDrawSetProportional(TDEditor_TD[15], 0);
	TextDrawSetShadow(TDEditor_TD[15], 0);
	TextDrawSetPreviewModel(TDEditor_TD[15], 2738);
	TextDrawSetPreviewRot(TDEditor_TD[15], 0.000000, 0.000000, 100.000000, 1.000000);

	TDEditor_TD[16] = TextDrawCreate(533.000000, 365.000061, "LD_SPAC:white");
	TextDrawLetterSize(TDEditor_TD[16], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[16], 105.000000, 62.000000);
	TextDrawAlignment(TDEditor_TD[16], 1);
	TextDrawColor(TDEditor_TD[16], 175);
	TextDrawSetShadow(TDEditor_TD[16], 0);
	TextDrawSetOutline(TDEditor_TD[16], 0);
	TextDrawBackgroundColor(TDEditor_TD[16], 255);
	TextDrawFont(TDEditor_TD[16], 4);
	TextDrawSetProportional(TDEditor_TD[16], 0);
	TextDrawSetShadow(TDEditor_TD[16], 0);

	TDEditor_TD[17] = TextDrawCreate(550.000000, 378.999938, "");
	TextDrawLetterSize(TDEditor_TD[17], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[17], 11.000000, 14.000000);
	TextDrawAlignment(TDEditor_TD[17], 1);
	TextDrawColor(TDEditor_TD[17], -1);
	TextDrawSetShadow(TDEditor_TD[17], 0);
	TextDrawSetOutline(TDEditor_TD[17], 0);
	TextDrawBackgroundColor(TDEditor_TD[17], 0);
	TextDrawFont(TDEditor_TD[17], 5);
	TextDrawSetProportional(TDEditor_TD[17], 0);
	TextDrawSetShadow(TDEditor_TD[17], 0);
	TextDrawSetPreviewModel(TDEditor_TD[17], 1240);
	TextDrawSetPreviewRot(TDEditor_TD[17], 0.000000, 0.000000, 0.000000, 1.000000);

	TDEditor_TD[18] = TextDrawCreate(546.500000, 391.249938, "");
	TextDrawLetterSize(TDEditor_TD[18], 0.000000, 0.000000);
	TextDrawTextSize(TDEditor_TD[18], 18.000000, 19.000000);
	TextDrawAlignment(TDEditor_TD[18], 1);
	TextDrawColor(TDEditor_TD[18], -1);
	TextDrawSetShadow(TDEditor_TD[18], 0);
	TextDrawSetOutline(TDEditor_TD[18], 0);
	TextDrawBackgroundColor(TDEditor_TD[18], 0);
	TextDrawFont(TDEditor_TD[18], 5);
	TextDrawSetProportional(TDEditor_TD[18], 0);
	TextDrawSetShadow(TDEditor_TD[18], 0);
	TextDrawSetPreviewModel(TDEditor_TD[18], 1650);
	TextDrawSetPreviewRot(TDEditor_TD[18], 0.000000, 0.000000, 0.000000, 1.000000);
}