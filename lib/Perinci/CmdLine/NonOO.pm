package Perinci::CmdLine::NonOO;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Perinci::Sub::Gen::FromClass qw(gen_func_from_class);

require Exporter;
our @ISA       = qw(Exporter);
our @EXPORT_OK = qw(run_cmdline_app);

my $res = gen_func_from_class(
    class  => 'Perinci::CmdLine::Lite',
    method => 'run',
    name   => 'run_cmdline_app',
);
die "Can't create run_cmdline_app(): $res->[0] - $res->[1]"
    unless $res->[0] == 200;

1;
# ABSTRACT: Non-OO interface for Perinci::CmdLine

=head1 SYNOPSIS

 use Perinci::CmdLine::NonOO qw(run_cmdline_app);
 run_cmdline_app(url => '/Foo/bar');

which is equivalent to:

 use Perinci::CmdLine::Lite;
 my $cli = Perinci::CmdLine::Lite->new(url => '/Foo/bar');
 $cli->run;


=head1 STATUS

Experimental, proof of concept.


=head1 DESCRIPTION

L<Perinci::CmdLine> (or its alternatives L<Perinci::CmdLine::Lite>,
L<Perinci::CmdLine::Any>) is a command-line application framework. It "exports"
your functions as a CLI application. However, Perinci::CmdLine itself has an OO
interface, which can be seen as ironic. This module is an attempt to fix this.
It's basically a thin functional interface wrapper over Perinci::CmdLine::Lite.

Because I'm lazy, it currently uses L<Perinci::Sub::Gen::FromClass> and adds a
bit of startup overhead. If you're concerned with startup overhead, you should
use Perinci::CmdLine::Lite directly.


=head1 TODO

Support switching to Perinci::CmdLine instead of Perinci::CmdLine::Lite.


=head1 SEE ALSO

L<Perinci::CmdLine>, L<Perinci::CmdLine::Lite>, L<Perinci::CmdLine::Any>

=cut
