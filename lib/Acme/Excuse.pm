package Acme::Excuse;

use strict;
use warnings;

BEGIN {
    use Mojo::UserAgent;

    # need this to coax Mojo::Reactor::EV to behave during compile time deaths
    use Mojo::Util qw/encode/;
    encode 'UTF-8', '42';

    $SIG{__DIE__} = sub {
        print Mojo::UserAgent->new
                ->get("http://www.programmerexcuses.com/")
                ->res->dom->at(".wrapper a")->text
            . "\n";

        exit
    };
}

q|
    Hardware (noun.): the part of a computer that you can kick.
|;

__END__

=encoding utf8

=for stopwords Znet Zoffix

=head1 NAME

Acme::Excuse - give excuses when your code fails

=head1 SYNOPSIS

=for pod_spiffy start code section

    $ perl -MAcme::Excuse -e 'oops a compile error!'
    Somebody must have changed my code
    $

=for pod_spiffy end code section

=for pod_spiffy start code section

    use Acme::Excuse;

    open my $fh, '<', 'non-existent' or die $!;
    # dies with an excuse, e.g.
    # "We didn't have enough time to peer review the final changes"

=for pod_spiffy end code section

=head1 DESCRIPTION

When your code fails, consult L<http://www.programmerexcuses.com/> and
give the correct excuse.

=head1 METHODS

None.

=head1 SEE ALSO

L<http://www.programmerexcuses.com/>

=for pod_spiffy hr

=head1 REPOSITORY

=for pod_spiffy start github section

Fork this module on GitHub:
L<https://github.com/zoffixznet/Acme-Excuse>

=for pod_spiffy end github section

=head1 BUGS

=for pod_spiffy start bugs section

To report bugs or request features, please use
L<https://github.com/zoffixznet/Acme-Excuse/issues>

If you can't access GitHub, you can email your request
to C<bug-Acme-Excuse at rt.cpan.org>

=for pod_spiffy end bugs section

=head1 AUTHOR

=for pod_spiffy start author section

=for pod_spiffy author ZOFFIX

=for pod_spiffy end author section

=head1 LICENSE

You can use and distribute this module under the same terms as Perl itself.
See the C<LICENSE> file included in this distribution for complete
details.

=cut