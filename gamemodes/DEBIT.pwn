#define MAX_DEBIT 1000

enum debit
{
    Dholder,
    Dname[128],
    Dnumber[128],
    Drek,
    Dpin,
    Dsaldo
}

new debData[MAX_DEBIT][debit],
    Iterator:kartu<MAX_DEBIT>;

new SaveInter[356];
new SaveList;

Debit_Save(id)
{
    new debq[1208];
    mysql_format(g_SQL, debq, sizeof(debq), "UPDATE `debit` SET `dholder`='%d', `dname`='%s', `dnumber`='%s', `drek`='%d', `dpin`='%d', `dsaldo`='%d' WHERE `did`='%d'",
    debData[id][Dholder],
    debData[id][Dname],
    debData[id][Dnumber],
    debData[id][Drek],
    debData[id][Dpin],
    debData[id][Dsaldo],
    id);
    return mysql_tquery(g_SQL, debq);
}

function OnDebitCreate(id)
{
    Debit_Save(id);
    return 1;
}

function LoadDebit()
{
    new rows = cache_num_rows();
    if(rows)
    {
        new did;
        for(new i; i < rows; i++)
        {
            cache_get_value_name_int(i, "did", did);
            cache_get_value_name_int(i, "dholder", debData[did][Dholder]);
            cache_get_value_name(i, "dname", debData[did][Dname], 128);
            cache_get_value_name(i, "dnumber", debData[did][Dnumber], 128);
            cache_get_value_name_int(i, "drek", debData[did][Drek]);
            cache_get_value_name_int(i, "dpin", debData[did][Dpin]);
            cache_get_value_name_int(i, "dsaldo", debData[did][Dsaldo]);

            Iter_Add(kartu, did);
        }
        printf("[DEBIT] Number of debit card loaded: %d", rows);
    }
}

//CMD
CMD:createrek(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 2246.46, -1757.03, 1014.77)) return Error(playerid, "Anda harus berada di Bank!");
    if(pData[playerid][pBankRek]) return Error(playerid, "Anda sudah mempunyai rekening");
    new str[526],
        rand1 = RandomEx(100, 200),
        rand2 = RandomEx(300, 400),
        rand3 = RandomEx(500, 600);
    format(SaveInter, sizeof(SaveInter), "%d-%d-%d", rand1, rand2, rand3);
    new query[256], rand = RandomEx(111111, 999999);
	new rek = rand+pData[playerid][pID];
	mysql_format(g_SQL, query, sizeof(query), "SELECT brek FROM players WHERE brek='%d'", rek);
	mysql_tquery(g_SQL, query, "BankRek", "id", playerid, rek);
	Info(playerid, "New rekening bank!");
    format(str, sizeof(str), "Pembuatan Rekening Bank, Anda otomatis mendapatkan 1 kartu ATM\nNama: %s\nNomor kartu: %s\nNomor Rekening: %d\nSilahkan masukkan pin Kartu ATM untuk melanjutkan:", pData[playerid][pName], SaveInter, rek);
    ShowPlayerDialog(playerid, DIALOG_CREATEATM, DIALOG_STYLE_PASSWORD, "Buat Kartu", str, "Next", "Exit");
    return 1;
}
CMD:mydebitcard(playerid)
{
    if(pData[playerid][pDebit] == 0) return Error(playerid, "Kamu tidak punya kartu atm");
    new head[256], bool:status = false, count = 1;
    format(head, sizeof(head), "No\tCard Number\tSaldo\n");
    foreach(new ii: kartu)
    {
        if(ii != -1)
        {
            if(debData[ii][Dholder] == pData[playerid][pID])
            {
                format(head, sizeof(head), "%s%d.\t%s\t{00ff00}%s\n", head, count, debData[ii][Dnumber], FormatMoney(debData[ii][Dsaldo]));
                count++;
                status = true;
            }
        }
    }
    if(status)
    {
        ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS, "My Card", head, "OK", "");
    }
    else
    {
        Error(playerid, "Kamu tidak punya kartu ATM");
    }
    return 1;
}