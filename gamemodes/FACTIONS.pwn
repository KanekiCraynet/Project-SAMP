#define MAX_FACTIONS 25

enum facinfo
{
    FacName[128],
    FacSafe,
    Float:Safe[3],
    FacInt,
    //Notsave
    Text3D:SafeLabel,
    SafePickup
}

new facData[MAX_FACTIONS][facinfo],
    facRank[MAX_FACTIONS][8][50],
    Iterator:fraksi<MAX_FACTIONS>;

new list_item;
Faction_Save(id)
{
    new fquery[2048];
    mysql_format(g_SQL, fquery, sizeof(fquery), "UPDATE `faction` SET `fname`='%s', `frank`='-,%s,%s,%s,%s,%s,%s,%s', `fsafe`='%d', `fint`='%d', `sposx`='%f', `sposy`='%f', `sposz`='%f' WHERE `fid`='%d'",
    facData[id][FacName],
    facRank[id][1],
    facRank[id][2],
    facRank[id][3],
    facRank[id][4],
    facRank[id][5],
    facRank[id][6],
    facRank[id][7],
    facData[id][FacSafe],
    facData[id][FacInt],
    facData[id][Safe][0],
    facData[id][Safe][1],
    facData[id][Safe][2],
    id);
    return mysql_tquery(g_SQL, fquery);
}
SplitString(const source[], dest[][], const delimiter = '|', const maxlength = sizeof(dest[]))
{
    new pos = -1, count, offset;

    while (source[++pos] != EOS)
	{
        if (source[pos] == delimiter)
		{
            strmid(dest[count++], source, offset, pos, maxlength);
            offset = pos + 1;
        }
    }

    if(source[pos] == EOS) strmid(dest[count], source, offset, pos, maxlength);
}

function LoadFactions()
{
    new row = cache_num_rows();
    new result[956];
    if(row)
    {
        new fid;
        for(new i; i < row; i++)
        {
            cache_get_value_name_int(i, "fid", fid);
            cache_get_value_name(i, "fname", facData[fid][FacName], 128);
            cache_get_value_name(i, "frank", result, 600);
            cache_get_value_name_int(i, "fsafe", facData[fid][FacSafe]);
            cache_get_value_name_int(i, "fint", facData[fid][FacInt]);
            cache_get_value_name_float(i, "sposx", facData[fid][Safe][0]);
            cache_get_value_name_float(i, "sposy", facData[fid][Safe][1]);
            cache_get_value_name_float(i, "sposz", facData[fid][Safe][2]);
            SplitString(result, facRank[fid], ',');
            Faction_Refresh(fid);
            Iter_Add(fraksi, fid);
        }
        printf("[FACTION] Number of faction loaded: %d", row);
    }
}

Faction_Refresh(fid)
{
    if(fid != 0)
    {
        if(IsValidDynamic3DTextLabel(facData[fid][SafeLabel]))
            DestroyDynamic3DTextLabel(facData[fid][SafeLabel]);

        if(IsValidDynamicPickup(facData[fid][SafePickup]))
            DestroyDynamicPickup(facData[fid][SafePickup]);

        new string[128];
        format(string, sizeof(string), "Faction "YELLOW_E"%s {FFFFFF}Safe", facData[fid][FacName]);
        facData[fid][SafePickup] = CreateDynamicPickup(1239, 23, facData[fid][Safe][0], facData[fid][Safe][1], facData[fid][Safe][2]+0.2, 0, facData[fid][FacInt], _, 4);
        facData[fid][SafeLabel] = CreateDynamic3DTextLabel(string, COLOR_BLUE, facData[fid][Safe][0], facData[fid][Safe][1], facData[fid][Safe][2]+0.5, 2.5);
    }
    return 1;
}

//cmd
CMD:createfaction(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
        return PermissionError(playerid);

    new id = Iter_Free(fraksi);
    new nama[128], fQuery[128];
    if(id == -1) return Error(playerid, "Kamu tidak bisa membuar fraksi lagi");
    if(sscanf(params, "s[128]",nama)) return Usage(playerid, "/createfaction <Faction Name>");

    format(facData[id][FacName], 128, nama);

    Iter_Add(fraksi, id);

    SendClientMessageEx(playerid, -1, "fraksi %s telah  dengan id: %d", facData[id][FacName], id);

    mysql_format(g_SQL, fQuery, sizeof(fQuery), "INSERT INTO `faction` (`fid`,`fname`) VALUES ('%d','%s')", id, facData[id][FacName]);
    mysql_tquery(g_SQL, fQuery);
    return 1;
}
CMD:fpanel(playerid)
{
    if(pData[playerid][pAdmin] < 5)
        return PermissionError(playerid);

    String = "";
    new fstr[256], count = 0;
    for(new i = 1; i < MAX_FACTIONS; i++)
    {
        format(fstr, sizeof(fstr), "%d. %s\n", count, facData[i][FacName]);
        strcat(String, fstr);
        count++;
    }
    ShowPlayerDialog(playerid, DIALOG_EDITFRAKSI, DIALOG_STYLE_LIST, "Daftar Fraksi", String, "OK", "Keluar");
    return 1;
}
CMD:listfraksi(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
        return PermissionError(playerid);
    String = "";
    new fstr[256];
    for(new i = 1; i < MAX_FACTIONS; i++)
    {
        format(fstr, sizeof(fstr), "%i. %s\n", i, facData[i][FacName]);
        strcat(String, fstr);
    }
    ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_LIST, "Daftar Fraksi", String, "OK", "");
    return 1;
}
CMD:listrank(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
        return PermissionError(playerid);
    new id;
    if(sscanf(params, "d", id)) return Usage(playerid, "/listrank <fraction id>");

    String = "";
    new rstr[128];
    for(new i = 1; i < 8; i++)
    {
        format(rstr, sizeof(rstr), "%i. %s\n", i, facRank[id][i]);
        strcat(String, rstr);
    }
    ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_LIST, "Daftar Rank", String, "OK", "");
    return 1;
}
CMD:editfaction(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5)
        return PermissionError(playerid);

    new fid,
        type[24],
        string[129];

    if(sscanf(params, "ds[24]S()[129]", fid, type, string))
    {
        Usage(playerid, "/editfaction <Faction Id><Name>");
        Info(playerid, "location, money");
        return 1;
    }

    if(fid < 1 || fid >= MAX_FACTIONS) return Error(playerid, "Invalid ID!");

    if(!strcmp(type, "location", true))
    {
        GetPlayerPos(playerid, facData[fid][Safe][0], facData[fid][Safe][1], facData[fid][Safe][2]);
        facData[fid][FacInt] = GetPlayerInterior(playerid);

        Faction_Save(fid);
        Faction_Refresh(fid);
    }
    else if(!strcmp(type, "money", true))
    {
        new uang;
        if(sscanf(string, "d", uang)) return Usage(playerid, "/editfaction <Faction ID><money><jumlah>");

        facData[fid][FacSafe] += uang;
        Faction_Save(fid);

        Info(playerid, "Kamu menambah uang %s menjadi %s", facData[fid][FacName], FormatMoney(uang));
    }
    return 1;
}
CMD:open(playerid)
{
    if(pData[playerid][pFactionRank] < 5) return Error(playerid, "Kamu tidak memiliki izin");
    foreach(new fi: fraksi)
    {
        if(fi != -1)
        {
            if(fi == pData[playerid][pFaction])
            {
                if(pData[playerid][pFaction] != fi) Error(playerid, "Kamu tidak ada akses");
                new saldo[257];
                format(saldo, sizeof(saldo), "Faction safe %s: {00ff00}%s", facData[fi][FacName], FormatMoney(facData[fi][FacSafe]));
                if(IsPlayerInRangeOfPoint(playerid, 2.5, facData[fi][Safe][0], facData[fi][Safe][1], facData[fi][Safe][2]))
                {
                    ShowPlayerDialog(playerid, DIALOG_FACSAFE, DIALOG_STYLE_LIST, saldo, "Withdraw money\nDeposit Money", "Next", "Exit");
                }
            }
        }
    }
    return 1;
}