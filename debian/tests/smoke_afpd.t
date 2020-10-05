use strict;
use warnings;

use Test::More;
use Test::Command::Simple;

my $CMD = 'afpd';

run_ok $CMD, '-V';
like stdout, qr/^$CMD \d[\d.]*/, 'version, stdout';
like stdout, qr/AFP versions:\t2.2 3.0 3.1 3.2 3.3 3.4/, 'AFP versions';
like stdout, qr/CNID backends:\tdbd last tdb mysql/, 'CNID backends';
like stdout, qr/Zeroconf support:\tAvahi/, 'Zeroconf support';
like stdout, qr/TCP wrappers support:\tYes/, 'TCP wrappers support';
like stdout, qr/Quota support:\tYes/, 'Quota support';
like stdout, qr/Admin group support:\tYes/, 'Admin group support';
like stdout, qr/Valid shell checks:\tYes/, 'Valid shell checks';
like stdout, qr/cracklib support:\tNo/, 'cracklib support';
like stdout, qr/EA support:\tad \| sys/, 'EA support';
like stdout, qr/ACL support:\tYes/, 'ACL support';
like stdout, qr/LDAP support:\tYes/, 'LDAP support';
like stdout, qr/D-Bus support:\tYes/, 'D-Bus support';
like stdout, qr/Spotlight support:\tYes/, 'Spotlight support';
like stdout, qr/DTrace probes:\tYes/, 'DTrace probes';
like stdout, qr{afp.conf:\t/etc/netatalk/afp.conf}, 'afp.conf';
like stdout, qr{extmap.conf:\t/etc/netatalk/extmap.conf}, 'extmap.conf';
like stdout, qr{state directory:\t/var/lib/netatalk/}, 'state directory';
like stdout, qr{afp_signature.conf:\t/var/lib/netatalk/afp_signature.conf}, 'afp_signature.conf';
like stdout, qr{afp_voluuid.conf:\t/var/lib/netatalk/afp_voluuid.conf}, 'afp_voluuid.conf';
like stdout, qr{UAM search path:\t/usr/lib/netatalk//}, 'UAM search path';
like stdout, qr{Server messages path:\t/var/lib/netatalk/msg/}, 'Server messages path';
cmp_ok stderr, 'eq', '', 'help, stderr';

done_testing;
