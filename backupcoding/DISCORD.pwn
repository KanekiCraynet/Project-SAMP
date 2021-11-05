/*[DISCORD LOGS DEWATARP]*/
//Channel id
#define CHANNEL_ID "812937034272210986"
//Announcement Server
SendUpMsg()
{
    new DCC_Channel:g_Discord_Chat;

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

    DCC_SendChannelMessage(g_Discord_Chat, "Server is online, **Please wait until further announcement**");
}
JoinLog(playerid)
{
	new h, m, s;
	new day, month, year;
	gettime(h, m, s);
	getdate(year,month,day);
    new DCC_Channel:g_Discord_Chat;
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

    new string[128];
    format(string, sizeof string, "`%02d.%02d.%d - %02d:%02d:%02d`\n```css\n%s [ID: %d] Connecting```",day, month, year, h, m, s, name, playerid);
    DCC_SendChannelMessage(g_Discord_Chat, string);
}
LeaveLog(playerid, reason)
{
	new reasontext[526];
	switch(reason)
	{
	    case 0: reasontext = "Timeout/Crash";
	    case 1: reasontext = "Quit";
	    case 2: reasontext = "Kick/Ban";
	}
	new h, m, s;
	new day, month, year;
	gettime(h, m, s);
	getdate(year,month,day);
    new DCC_Channel:g_Discord_Chat;
	new name[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, name, sizeof name);

    if (_:g_Discord_Chat == 0)
    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

    new string[128];
    format(string, sizeof string, "`%02d.%02d.%d - %02d:%02d:%02d`\n```css\n%s [ID: %d] left(%s)```",day, month, year, h, m, s, name, playerid, reasontext);
    DCC_SendChannelMessage(g_Discord_Chat, string);
}
DeadLog(playerid, killerid, reason)
{
	if(killerid != INVALID_PLAYER_ID)
	{
		new reasontext[526];
		switch(reason)
		{
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
		new h, m, s;
		new day, month, year;
		gettime(h, m, s);
		getdate(year,month,day);
	    new DCC_Channel:g_Discord_Chat;

	    if (_:g_Discord_Chat == 0)
	    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

	    new string[128];
	    format(string, sizeof string, "%02d.%02d.%d - %02d:%02d:%02d - `%s [ID: %d] murdered %s [ID: %d] (%s)`",day, month, year, h, m, s, pData[killerid][pName], killerid, pData[playerid][pName], playerid, reasontext);
	    DCC_SendChannelMessage(g_Discord_Chat, string);
	}
	else
	{
		new reasontext[526];
		switch(reason)
		{
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
		new h, m, s;
		new day, month, year;
		gettime(h, m, s);
		getdate(year,month,day);
	    new DCC_Channel:g_Discord_Chat;
		new name[MAX_PLAYER_NAME + 1];
	    GetPlayerName(playerid, name, sizeof name);

	    if (_:g_Discord_Chat == 0)
	    g_Discord_Chat = DCC_FindChannelById(CHANNEL_ID); // Discord channel ID

	    new string[128];
	    format(string, sizeof string, "%02d.%02d.%d - %02d:%02d:%02d - `%s [ID: %d] death(%s)`",day, month, year, h, m, s, name, playerid, reasontext);
	    DCC_SendChannelMessage(g_Discord_Chat, string);
	}
}