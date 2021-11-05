//Family System
#define MAX_FAMILY 5

enum familyss
{
	fName[50],
	fLeader[MAX_PLAYER_NAME],
	fMotd[100],
	fColor,
	Float:fExtpos[4],
	Float:fIntpos[4],
	fInt,
	Float:fSafepos[3],
	fMoney,
	fDrug,
	fGun[10],
	fAmmo[10],
	//Not Save
	Text3D:fLabelext,
	Text3D:fLabelint,
	Text3D:fLabelsafe,
	fPickext,
	fPickint,
	fPicksafe
};

new fData[MAX_FAMILY][familyss],
	Iterator:FAMILYS<MAX_FAMILY>;

Family_Save(id)
{
	new dquery[2048];
	format(dquery, sizeof(dquery), "UPDATE familys SET name='%s', leader='%s', motd='%s', color='%d', extposx='%f', extposy='%f', extposz='%f', extposa='%f', intposx='%f', intposy='%f', intposz='%f', intposa='%f', fint='%d'",
	fData[id][fName],
	fData[id][fLeader],
	fData[id][fMotd],
	fData[id][fColor],
	fData[id][fExtpos][0],
	fData[id][fExtpos][1],
	fData[id][fExtpos][2],
	fData[id][fExtpos][3],
	fData[id][fIntpos][0],
	fData[id][fIntpos][1],
	fData[id][fIntpos][2],
	fData[id][fIntpos][3],
	fData[id][fInt]);
	
	for (new i = 0; i < 10; i ++) 
	{
        format(dquery, sizeof(dquery), "%s, Weapon%d='%d', Ammo%d='%d'", dquery, i + 1, fData[id][fGun][i], i + 1, fData[id][fAmmo][i]);
    }
	
	format(dquery, sizeof(dquery), "%s, safex='%f', safey='%f', safez='%f', money='%d', drug='%d' WHERE ID='%d'",
	dquery,
	fData[id][fSafepos][0],
	fData[id][fSafepos][1],
	fData[id][fSafepos][2],
	fData[id][fMoney],
	fData[id][fDrug],
	id);
	return mysql_tquery(g_SQL, dquery);
}


Family_Refresh(id)
{
	if(id != -1)
	{
		if(IsValidDynamic3DTextLabel(fData[id][fLabelext]))
            DestroyDynamic3DTextLabel(fData[id][fLabelext]);

        if(IsValidDynamicPickup(fData[id][fPickext]))
            DestroyDynamicPickup(fData[id][fPickext]);

        if(IsValidDynamic3DTextLabel(fData[id][fLabelint]))
            DestroyDynamic3DTextLabel(fData[id][fLabelint]);

        if(IsValidDynamicPickup(fData[id][fPickint]))
            DestroyDynamicPickup(fData[id][fPickint]);
			
		if(IsValidDynamic3DTextLabel(fData[id][fLabelsafe]))
            DestroyDynamic3DTextLabel(fData[id][fLabelsafe]);

        if(IsValidDynamicPickup(fData[id][fPicksafe]))
            DestroyDynamicPickup(fData[id][fPicksafe]);
		
		new mstr[512], tstr[128];
		format(mstr,sizeof(mstr),"[Family ID: %d]\n{FFFFFF}%s\n{FFFFFF}Press {FF0000}ENTER {FFFFFF}to enter", id, fData[id][fName]);
		fData[id][fPickext] = CreateDynamicPickup(19130, 23, fData[id][fExtpos][0], fData[id][fExtpos][1], fData[id][fExtpos][2], 0, 0);
		fData[id][fLabelext] = CreateDynamic3DTextLabel(mstr, COLOR_YELLOW, fData[id][fExtpos][0], fData[id][fExtpos][1], fData[id][fExtpos][2]+0.35, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);

        if(fData[id][fIntpos][0] != 0.0 && fData[id][fIntpos][1] != 0.0 && fData[id][fIntpos][2] != 0.0)
        {
            format(mstr,sizeof(mstr),"[Family ID: %d]\n{FFFFFF}%s\n{FFFFFF}Press {FF0000}ENTER {FFFFFF}to exit", id, fData[id][fName]);

            fData[id][fLabelint] = CreateDynamic3DTextLabel(mstr, COLOR_YELLOW, fData[id][fIntpos][0], fData[id][fIntpos][1], fData[id][fIntpos][2]+0.7, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, fData[id][fInt]);
            fData[id][fPickint] = CreateDynamicPickup(19130, 23, fData[id][fIntpos][0], fData[id][fIntpos][1], fData[id][fIntpos][2], 0, fData[id][fInt], -1, 7);
        }
		if(fData[id][fSafepos][0] != 0.0 && fData[id][fSafepos][1] != 0.0 && fData[id][fSafepos][2] != 0.0)
		{
			format(tstr, sizeof(tstr), "[Family ID: %d]\nSafe Point", id);
			fData[id][fLabelsafe] = CreateDynamic3DTextLabel(tstr, COLOR_YELLOW, fData[id][fSafepos][0], fData[id][fSafepos][1], fData[id][fSafepos][2]+0.7, 5.0);
            fData[id][fPicksafe] = CreateDynamicPickup(1239, 23, fData[id][fSafepos][0], fData[id][fSafepos][1], fData[id][fSafepos][2], 0, -1, -1, 7);
		}
	}
}

/*LoadFamily()
{
	mysql_tquery(g_SQL, "SELECT ID,name,leader,motd,color,extposx,extposy,extposz,extposa,intposx,intposy,intposz,intposa,fint,safex,safey,safez,money,drug FROM familys ORDER BY ID", "LoadFamilyData");
}*/

Family_WeaponStorage(playerid, fid)
{
    if(fid == -1)
        return 0;

    static
        string[320];

    string[0] = 0;

    for (new i = 0; i < 5; i ++)
    {
        if(!fData[fid][fGun][i])
            format(string, sizeof(string), "%sEmpty Slot\n", string);

        else
            format(string, sizeof(string), "%s%s (Ammo: %d)\n", string, ReturnWeaponName(fData[fid][fGun][i]), fData[fid][fAmmo][i]);
    }
    Dialog_Show(playerid, FamilyWeapons, DIALOG_STYLE_LIST, "Weapon Storage", string, "Select", "Cancel");
    return 1;
}

Family_OpenStorage(playerid, fid)
{
    if(fid == -1)
        return 0;

    new
        items[1],
        string[10 * 32];

    for (new i = 0; i < 5; i ++) if(fData[fid][fGun][i]) 
	{
        items[0]++;
    }
    format(string, sizeof(string), "Weapon Storage (%d/5)", items[0]);
    Dialog_Show(playerid, FamilyStorage, DIALOG_STYLE_LIST, "Family Storage", string, "Select", "Cancel");
    return 1;
}

function OnFamilyCreated(id)
{
	Family_Save(id);
	Family_Refresh(id);
	return 1;
}

function LoadFamilys()
{
    new rows = cache_num_rows();
 	if(rows)
  	{
   		new fid, name[50], leader[MAX_PLAYER_NAME], motd[100];
		for(new i; i < rows; i++)
		{
  			cache_get_value_int(i, "ID", fid);
	    	cache_get_value_name(i, "name", name);
			format(fData[fid][fName], 50, name);
		    cache_get_value_name(i, "leader", leader);
			format(fData[fid][fLeader], MAX_PLAYER_NAME, leader);
			cache_get_value_name(i, "motd", motd);
			format(fData[fid][fMotd], 100, motd);
		    cache_get_value_int(i, "color", fData[fid][fColor]);
		    cache_get_value_float(i, "extposx", fData[fid][fExtpos][0]);
		    cache_get_value_float(i, "extposy", fData[fid][fExtpos][1]);
		    cache_get_value_float(i, "extposz", fData[fid][fExtpos][2]);
		    cache_get_value_float(i, "extposa", fData[fid][fExtpos][3]);
		    cache_get_value_float(i, "intposx", fData[fid][fIntpos][0]);
		    cache_get_value_float(i, "intposy", fData[fid][fIntpos][1]);
		    cache_get_value_float(i, "intposz", fData[fid][fIntpos][2]);
		    cache_get_value_float(i, "intposa", fData[fid][fIntpos][3]);
		    cache_get_value_int(i, "fint", fData[fid][fInt]);
			cache_get_value_float(i, "safex", fData[fid][fSafepos][0]);
			cache_get_value_float(i, "safey", fData[fid][fSafepos][1]);
			cache_get_value_float(i, "safez", fData[fid][fSafepos][2]);
			cache_get_value_int(i, "money", fData[fid][fMoney]);
			cache_get_value_int(i, "drug", fData[fid][fDrug]);
			
			cache_get_value_int(i, "Weapon0", fData[fid][fGun][0]);
			cache_get_value_int(i, "Weapon1", fData[fid][fGun][1]);
			cache_get_value_int(i, "Weapon2", fData[fid][fGun][2]);
			cache_get_value_int(i, "Weapon3", fData[fid][fGun][3]);
			cache_get_value_int(i, "Weapon4", fData[fid][fGun][4]);
			cache_get_value_int(i, "Weapon5", fData[fid][fGun][5]);
			cache_get_value_int(i, "Weapon6", fData[fid][fGun][6]);
			cache_get_value_int(i, "Weapon7", fData[fid][fGun][7]);
			cache_get_value_int(i, "Weapon8", fData[fid][fGun][8]);
			cache_get_value_int(i, "Weapon9", fData[fid][fGun][9]);
			
			cache_get_value_int(i, "Ammo0", fData[fid][fAmmo][0]);
			cache_get_value_int(i, "Ammo1", fData[fid][fAmmo][1]);
			cache_get_value_int(i, "Ammo2", fData[fid][fAmmo][2]);
			cache_get_value_int(i, "Ammo3", fData[fid][fAmmo][3]);
			cache_get_value_int(i, "Ammo4", fData[fid][fAmmo][4]);
			cache_get_value_int(i, "Ammo5", fData[fid][fAmmo][5]);
			cache_get_value_int(i, "Ammo6", fData[fid][fAmmo][6]);
			cache_get_value_int(i, "Ammo7", fData[fid][fAmmo][7]);
			cache_get_value_int(i, "Ammo8", fData[fid][fAmmo][8]);
			cache_get_value_int(i, "Ammo9", fData[fid][fAmmo][9]);
			/*for (new j = 0; j < 10; j ++)
			{
				format(str, 24, "Weapon%d", j + 1);
				cache_get_value_int(i, str, fData[fid][fGun][j]);

				format(str, 24, "Ammo%d", j + 1);
				cache_get_value_int(i, str, fData[fid][fAmmo][j]);
			}*/
			
			Iter_Add(FAMILYS, fid);
			Family_Refresh(fid);
	    }
	    printf("[FAMILY] Number of Familys loaded: %d.", rows);
	}
}

//----------[ Family Commands ]-----------


CMD:fcreate(playerid, params[])
{
	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);
		
	new fid = Iter_Free(FAMILYS);
	if(fid == -1) return Error(playerid, "You cant create more family slot empty!");
	new name[50], otherid, query[128];
	if(sscanf(params, "s[50]u", name, otherid)) return Usage(playerid, "/fcreate [name] [playerid]");
	if(otherid == INVALID_PLAYER_ID)
		return Error(playerid, "invalid playerid.");
	
	if(pData[otherid][pFamily] != -1)
		return Error(playerid, "Player tersebut sudah bergabung family");
		
	if(pData[otherid][pFaction] != 0)
		return Error(playerid, "Player tersebut sudah bergabung faction");
		
	pData[otherid][pFamily] = fid;
	pData[otherid][pFamilyRank] = 6;
		
	format(fData[fid][fName], 50, name);
	format(fData[fid][fLeader], 50, pData[otherid][pName]);
	format(fData[fid][fMotd], 50, "None");
	fData[fid][fColor] = 0;
	fData[fid][fExtpos][0] = 0;
	fData[fid][fExtpos][1] = 0;
	fData[fid][fExtpos][2] = 0;
	fData[fid][fExtpos][3] = 0;
	
	fData[fid][fIntpos][0] = 0;
	fData[fid][fIntpos][1] = 0;
	fData[fid][fIntpos][2] = 0;
	fData[fid][fIntpos][3] = 0;
	fData[fid][fInt] = 0;
	
	fData[fid][fMoney] = 0;
	fData[fid][fDrug] = 0;
	fData[fid][fSafepos][0] = 0;
	fData[fid][fSafepos][1] = 0;
	fData[fid][fSafepos][2] = 0;

	Iter_Add(FAMILYS, fid);
	Servers(playerid, "Anda telah berhasil membuat family ID: %d dengan leader: %s", fid, pData[otherid][pName]);
	Servers(otherid, "Admin %s telah menset anda sebagai leader dari family ID: %d", pData[playerid][pAdminname], fid);
	SendStaffMessage(COLOR_RED, "Admin %s telah membuat family ID: %d dengan leader: %s", pData[playerid][pAdminname], fid, pData[otherid][pName]);
	
	mysql_format(g_SQL, query, sizeof(query), "INSERT INTO familys SET ID=%d, name='%s', leader='%s'", fid, name, pData[otherid][pName]);
	mysql_tquery(g_SQL, query, "OnFamilyCreated", "i", fid);
	return 1;
}

CMD:fdelete(playerid, params[])
{
 	if(pData[playerid][pAdmin] < 4)
		return PermissionError(playerid);

    new fid, query[128];
	if(sscanf(params, "i", fid)) return Usage(playerid, "/fdelete [fid]");
	if(!Iter_Contains(FAMILYS, fid)) return Error(playerid, "The you specified ID of doesn't exist.");
	
    format(fData[fid][fName], 50, "None");
	format(fData[fid][fLeader], 50, "None");
	format(fData[fid][fMotd], 50, "None");
	fData[fid][fColor] = 0;
	fData[fid][fExtpos][0] = 0;
	fData[fid][fExtpos][1] = 0;
	fData[fid][fExtpos][2] = 0;
	fData[fid][fExtpos][3] = 0;
	
	fData[fid][fIntpos][0] = 0;
	fData[fid][fIntpos][1] = 0;
	fData[fid][fIntpos][2] = 0;
	fData[fid][fIntpos][3] = 0;
	fData[fid][fInt] = 0;
	
	fData[fid][fMoney] = 0;
	fData[fid][fDrug] = 0;
	fData[fid][fSafepos][0] = 0;
	fData[fid][fSafepos][1] = 0;
	fData[fid][fSafepos][2] = 0;
	
	DestroyDynamic3DTextLabel(fData[fid][fLabelext]);
	DestroyDynamicPickup(fData[fid][fPickext]);
	DestroyDynamic3DTextLabel(fData[fid][fLabelint]);
	DestroyDynamicPickup(fData[fid][fPickint]);
	DestroyDynamic3DTextLabel(fData[fid][fLabelsafe]);
	DestroyDynamicPickup(fData[fid][fPicksafe]);
	Iter_Remove(FAMILYS, fid);
	
	mysql_format(g_SQL, query, sizeof(query), "UPDATE accounts SET family=-1,familyrank=0 WHERE family=%d", fid);
	mysql_tquery(g_SQL, query);
	
	foreach(new ii : Player)
	{
 		if(pData[ii][pFamily] == fid)
   		{
			pData[ii][pFamily]= -1;
			pData[ii][pFamilyRank] = 0;
		}
	}

	mysql_format(g_SQL, query, sizeof(query), "DELETE FROM familys WHERE ID=%d", fid);
	mysql_tquery(g_SQL, query);
    SendStaffMessage(COLOR_RED, "Admin %s telah menghapus family ID: %d.", pData[playerid][pAdminname], fid);
	return 1;
}

CMD:fedit(playerid, params[])
{
    static
        fid,
        type[24],
        string[128],
		otherid;

    if(pData[playerid][pAdmin] < 4)
        return PermissionError(playerid);

    if(sscanf(params, "ds[24]S()[128]", fid, type, string))
    {
        Usage(playerid, "/fedit [id] [name]");
        SendClientMessage(playerid, COLOR_YELLOW, "[NAMES]:{FFFFFF} location, interior, name, leader, safe, money, drug");
        return 1;
    }
    if((fid < 0 || fid >= MAX_FAMILY))
        return Error(playerid, "You have specified an invalid ID.");
	if(!Iter_Contains(FAMILYS, fid)) return Error(playerid, "The you specified ID of doesn't exist.");

    if(!strcmp(type, "location", true))
    {
		GetPlayerPos(playerid, fData[fid][fExtpos][0], fData[fid][fExtpos][1], fData[fid][fExtpos][2]);
		GetPlayerFacingAngle(playerid, fData[fid][fExtpos][3]);

        Family_Save(fid);
		Family_Refresh(fid);

        SendStaffMessage(COLOR_RED, "%s has adjusted the location of entrance ID: %d.", pData[playerid][pAdminname], fid);
    }
    else if(!strcmp(type, "interior", true))
    {
        GetPlayerPos(playerid, fData[fid][fIntpos][0], fData[fid][fIntpos][1], fData[fid][fIntpos][2]);
		GetPlayerFacingAngle(playerid, fData[fid][fIntpos][3]);

		fData[fid][fInt] = GetPlayerInterior(playerid);
        Family_Save(fid);
		Family_Refresh(fid);

        SendStaffMessage(COLOR_RED, "%s has adjusted the interior spawn of entrance ID: %d.", pData[playerid][pAdminname], fid);
    }
    else if(!strcmp(type, "name", true))
    {
        new name[50];

        if(sscanf(string, "s[50]", name))
            return Usage(playerid, "/fedit [id] [name] [fname]");

        format(fData[fid][fName], 50, name);
		Family_Save(fid);
		Family_Refresh(fid);

        SendStaffMessage(COLOR_LRED, "Admin %s has changed the family name ID: %d to: %s.", pData[playerid][pAdminname], fid, name);
    }
    else if(!strcmp(type, "leader", true))
    {
        if(sscanf(string, "d", otherid))
            return Usage(playerid, "/fedit [id] [leader] [playerid]");
		
		if(otherid == INVALID_PLAYER_ID)
			return Error(playerid, "invalid player fid");

        format(fData[fid][fLeader], 50, pData[otherid][pName]);
		Family_Save(fid);
		Family_Refresh(fid);

        SendStaffMessage(COLOR_LRED, "Admin %s has changed the family leader ID: %d to: %s.", pData[playerid][pAdminname], fid, pData[otherid][pName]);
    }
    else if(!strcmp(type, "safe", true))
    {
        GetPlayerPos(playerid, fData[fid][fSafepos][0], fData[fid][fSafepos][1], fData[fid][fSafepos][2]);

        Family_Save(fid);
		Family_Refresh(fid);
		
		SendStaffMessage(COLOR_LRED, "Admin %s has changed the family safepos ID: %d.", pData[playerid][pAdminname], fid);
    }
    else if(!strcmp(type, "money", true))
    {
        new money;

        if(sscanf(string, "d", money))
            return Usage(playerid, "/fedit [id] [money] [ammount]");

        fData[fid][fMoney] = money;
		
        Family_Save(fid);
		Family_Refresh(fid);
		
		SendStaffMessage(COLOR_LRED, "Admin %s has changed the family money ID: %d to %s.", pData[playerid][pAdminname], fid, FormatMoney(money));
    }
    else if(!strcmp(type, "drug", true))
    {
        new drug;

        if(sscanf(string, "d", drug))
            return Usage(playerid, "/fedit [id] [drug] [ammount]");

        fData[fid][fDrug] = drug;
		
        Family_Save(fid);
		Family_Refresh(fid);
		
		SendStaffMessage(COLOR_LRED, "Admin %s has changed the family drug ID: %d to %s.", pData[playerid][pAdminname], fid, drug);
    }
    return 1;
}

CMD:fsafe(playerid, params[])
{
	if(pData[playerid][pFamily] == -1)
		return Error(playerid, "Anda bukan anggota family");
		
	new fid = pData[playerid][pFamily];
	if(IsPlayerInRangeOfPoint(playerid, 3.0, fData[fid][fSafepos][0], fData[fid][fSafepos][1], fData[fid][fSafepos][2]))
    {
     	Dialog_Show(playerid, FSAFE, DIALOG_STYLE_LIST, "Family SAFE", "Storage\nVault\nDrug", "Select", "Cancel");
    }
 	else
   	{
     	Error(playerid, "You aren't in range in area family safe.");
    }
	return 1;
}

Dialog:FSAFE(playerid, response, listitem, inputtext[])
{
	if(!response) return 1;
	new fid = pData[playerid][pFamily];
	switch(listitem) 
	{
		case 0: Family_OpenStorage(playerid, fid);
	}
	return 1;
}

Dialog:FamilyStorage(playerid, response, listitem, inputtext[])
{
	new fid = pData[playerid][pFamily];
	if(response)
	{
		if(listitem == 0) 
		{
			Family_WeaponStorage(playerid, fid);
		}
	}
    return 1;
}


Dialog:FamilyWeapons(playerid, response, listitem, inputtext[])
{
	new fid = pData[playerid][pFamily];
    if(response)
    {
        if(fData[fid][fGun][listitem] != 0)
        {
			if(pData[playerid][pFactionRank] < 5)
				return Error(playerid, "Only boss can taken the weapon!");
				
            GivePlayerWeaponEx(playerid, fData[fid][fGun][listitem], fData[fid][fAmmo][listitem]);

            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has taken a \"%s\" from their weapon storage.", ReturnName(playerid), ReturnWeaponName(fData[fid][fGun][listitem]));

            fData[fid][fGun][listitem] = 0;
            fData[fid][fAmmo][listitem] = 0;

            Family_Save(fid);
            Family_WeaponStorage(playerid, fid);
        }
        else
        {
            new
                weaponid = GetPlayerWeaponEx(playerid),
                ammo = GetPlayerAmmo(playerid);

            if(!weaponid)
                return Error(playerid, "You are not holding any weapon!");

            /*if(weaponid == 23 && pData[playerid][pTazer])
                return Error(playerid, "You can't store a tazer into your safe.");

            if(weaponid == 25 && pData[playerid][pBeanBag])
                return Error(playerid, "You can't store a beanbag shotgun into your safe.");*/

            ResetWeapon(playerid, weaponid);
            SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s has stored a \"%s\" into their weapon storage.", ReturnName(playerid), ReturnWeaponName(weaponid));

            fData[fid][fGun][listitem] = weaponid;
            fData[fid][fAmmo][listitem] = ammo;

            Family_Save(fid);
            Family_WeaponStorage(playerid, fid);
        }
    }
    else
    {
        Family_OpenStorage(playerid, fid);
    }
    return 1;
}