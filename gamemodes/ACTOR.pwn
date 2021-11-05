#define MAX_AKTOR 562

enum aktor
{
    aid,
    amodel,
    aada,
    anama[128],
    Float:aposx,
    Float:aposy,
    Float:aposz,
    Float:aposa,
    aworld,
    aint,
    acreate,
    Text3D:alabel
}
new aData[MAX_AKTOR][aktor];

stock Actor_Create(playerid, modelid)
{
    new Float:x,
        Float:y,
        Float:z,
        Float:angle;

    new query[123];

    if(GetPlayerPos(playerid, x, y, z) && GetPlayerFacingAngle(playerid, angle))
    {
        for(new i = 0; i < MAX_AKTOR; i++) if(!aData[i][aada])
        {
            aData[i][aada] = true;

            x += 1.0 * floatsin(-angle, degrees);
			y += 1.0 * floatcos(-angle, degrees);

            format(aData[i][anama], 128, "None");

            aData[i][aposx] = x;
            aData[i][aposy] = y;
            aData[i][aposz] = z;
            aData[i][aposa] = angle;
            aData[i][aworld] = GetPlayerVirtualWorld(playerid);
            aData[i][aint] = GetPlayerInterior(playerid);
            aData[i][amodel] = modelid;

            Actor_Refresh(i);
            mysql_format(g_SQL, query, sizeof(query), "INSERT INTO `actor` (`model`) VALUES('%d')", aData[i][amodel]);
            mysql_tquery(g_SQL, query, "OnActorCreate", "d", i);

            return i;
        }
    }
    printf("DEBUG: modelid: %d", modelid);
    return 1;
}

stock Actor_Refresh(id)
{
    new string[256];
    if(id != -1 && aData[id][aada])
    {
        if(IsValidDynamicActor(aData[id][acreate]))
            DestroyDynamicActor(aData[id][acreate]);

        if(IsValidDynamic3DTextLabel(aData[id][alabel]))
            DestroyDynamic3DTextLabel(aData[id][alabel]);

        format(string, sizeof(string), ""YELLOW_E"[ID: %d]\n{FFFFFF}%s", id, aData[id][anama]);
        aData[id][acreate] = CreateDynamicActor(aData[id][amodel], aData[id][aposx], aData[id][aposy], aData[id][aposz], aData[id][aposa], 1, 100.0, aData[id][aworld], aData[id][aint]);
        aData[id][alabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, aData[id][aposx], aData[id][aposy], aData[id][aposz], 2.5, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, aData[id][aworld], aData[id][aint]);
        ApplyDynamicActorAnimation(aData[id][acreate], "COP_AMBIENT", "COPLOOK_LOOP", 4.1, 1, 0, 0, 0, 0);
        if(id == 1)
        {
            ApplyDynamicActorAnimation(aData[id][acreate], "COP_AMBIENT", "COPLOOK_THINK", 4.1, 1, 0, 0, 0, 0);
        }
        if(id == 3)
        {
            ApplyDynamicActorAnimation(aData[id][acreate], "BAR", "BARMAN_IDLE", 4.1, 1, 0, 0, 0, 0);
        }
        return 1;
    }
    return 0;
}

stock Actor_Save(id)
{
    new cquery[500];
    mysql_format(g_SQL, cquery, sizeof(cquery), "UPDATE `actor` SET `model`='%d', `name`='%s', `posx`='%f', `posy`='%f', `posz`='%f', `angel`='%f', `world`='%d', `interior`='%d' WHERE `aid`='%d'", 
        aData[id][amodel], 
        aData[id][anama], 
        aData[id][aposx], 
        aData[id][aposy],
        aData[id][aposz],
        aData[id][aposa],
        aData[id][aworld],
        aData[id][aint],
        aData[id][aid]
    );

    return mysql_tquery(g_SQL, cquery);
}

function OnActorCreate(acid)
{
    if(acid == -1 || !aData[acid][aada])
        return 0;

    aData[acid][aid] = cache_insert_id();
    Actor_Save(acid);

    return 1;
}

function LoadActor()
{
    new rows = cache_num_rows();
    if(rows)
    {
        for(new i; i < rows; i++)
        {
            aData[i][aada] = true;
            cache_get_value_name_int(i, "aid", aData[i][aid]);
            cache_get_value_name_int(i, "model", aData[i][amodel]);
            cache_get_value_name(i, "name", aData[i][anama], 128);
            cache_get_value_name_float(i, "posx", aData[i][aposx]);
            cache_get_value_name_float(i, "posy", aData[i][aposy]);
            cache_get_value_name_float(i, "posz", aData[i][aposz]);
            cache_get_value_name_float(i, "angel", aData[i][aposa]);
            cache_get_value_name_int(i, "world", aData[i][aworld]);
            cache_get_value_name_int(i, "interior", aData[i][aint]);

            Actor_Refresh(i);
        }
        printf("[ACTOR] Number of actor loaded: %d", rows);
    }
    return 1;
}

CMD:createactor(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5) return PermissionError(playerid);

    static 
        model,
        id;

    /*new Float:x,
        Float:y,
        Float:z,
        Float:angle;*/

    if(sscanf(params, "d", model)) return Usage(playerid, "/createactor [Model ID]");

    if(model < 0 || model > 299) return Error(playerid, "Invalid skin model id. 0-299 only!");
    id = Actor_Create(playerid, model);
    printf("DEBUG: Modelid %d", model);

    if(id == -1) return Error(playerid, "You can't create more actor");

    return 1;
}
CMD:editactor(playerid, params[])
{
    if(pData[playerid][pAdmin] < 5) return PermissionError(playerid);

    static
        id,
        type[25],
        string[256];

    if(sscanf(params, "ds[25]S()[256]", id, type, string))
    {
        Usage(playerid, "/editactor <ID Actor><Type>");
        SendClientMessage(playerid, -1, "{173a2a}TYPE: {ffffff}Location, Name, Model, Delete");
        return 1;
    }

    if((id < 0 || id >= MAX_AKTOR) || !aData[id][aada]) return Error(playerid, "Invalid ID");
    
    if(!strcmp(type, "location", true))
    {
        GetPlayerPos(playerid, aData[id][aposx], aData[id][aposy], aData[id][aposz]);
        GetPlayerFacingAngle(playerid, aData[id][aposa]);

        aData[id][aposx] += 1.0 * floatsin(-aData[id][aposa], degrees);
		aData[id][aposy] += 1.0 * floatcos(-aData[id][aposa], degrees);

        aData[id][aworld] = GetPlayerVirtualWorld(playerid);
        aData[id][aint] = GetPlayerInterior(playerid);

        Actor_Refresh(id);
        Actor_Save(id);
    }
    else if(!strcmp(type, "name", true))
    {
        new nam[128];
        if(sscanf(string, "s[128]", nam)) return Usage(playerid, "/editactor <id aktor><name><nama aktor>");
        if(strlen(nam) < 1 || strlen(nam) > 128) return Error(playerid, "Only 1-128 character");

        format(aData[id][anama], 128, nam);
        Actor_Refresh(id);
        Actor_Save(id);
    }
    else if(!strcmp(type, "model", true))
    {
        new idmod;
        if(sscanf(string, "d", idmod)) return Usage(playerid, "/editactor <id aktor><model><id skin>");
        if(idmod < 0 || idmod > 299) return Error(playerid, "Invalid skin model id. 0-299 only!");

        aData[id][amodel] = idmod;
        Actor_Refresh(id);
        Actor_Save(id);
    }
    else if(!strcmp(type, "delete", true))
    {
        new delac[128];
        mysql_format(g_SQL, delac, sizeof(delac), "DELETE FROM `actor` WHERE `aid` = '%d'", id);
        mysql_tquery(g_SQL, delac);
        Actor_Refresh(id);
    }
    return 1;
}