CREATE TABLE `debit` (
    `did` int(11) PRIMARY KEY NOT NULL,
    `dholder` int(11) NOT NULL DEFAULT -1,
    `dname` varchar(128) NOT NULL DEFAULT 'None',
    `dnumber` varchar(356) NOT NULL DEFAULT 'None',
    `drek` int(11) NOT NUL DEFAULT 0,
    `dpin` int(11) NOT NULL DEFAULT 0,
    `dsaldo` int(11) NOT NULL DEFAULT 0
)   ENGINE=MyISAM DEFAULT CHARSET=latin1;