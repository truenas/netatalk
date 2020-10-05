use strict;
use warnings;

use Test::More;
use Test::Command::Simple;

my $CMD = 'netatalk';

run_ok $CMD, '-V';
like stdout, qr/^$CMD \d[\d.]*/, 'version, stdout';
like stdout, qr/Zeroconf support:\tAvahi/, 'Zeroconf support';
like stdout, qr/Spotlight support:\tYes/, 'Spotlight support';
like stdout, qr{afpd:\t/usr/sbin/afpd}, 'afpd';
like stdout, qr{cnid_metad:\t/usr/sbin/cnid_metad}, 'cnid_metad';
like stdout, qr{tracker manager:\t/usr/bin/tracker daemon}, 'tracker manager';
like stdout, qr{dbus-daemon:\t/usr/bin/dbus-daemon}, 'dbus-daemon';
like stdout, qr{afp.conf:\t/etc/netatalk/afp.conf}, 'afp.conf';
like stdout, qr{dbus-session.conf:\t/etc/netatalk/dbus-session.conf}, 'dbus-session.conf';
like stdout, qr{netatalk lock file:\t/var/lock/netatalk}, 'netatalk lock file';
cmp_ok stderr, 'eq', '', 'help, stderr';

done_testing;
