use strict;
use warnings;
package Git::Megapull::Source::Github;
our $VERSION = '0.100110';
use base 'Git::Megapull::Source';
# ABSTRACT: clone/update all your repositories from github.com

use LWP::Simple qw(get);
use Config::INI::Reader;
use JSON 2 ();


sub repo_uris {
  my $config  = Config::INI::Reader->read_file("$ENV{HOME}/.gitconfig");
  my $login   = $config->{github}{login} || die "no github login\n";
  my $token   = $config->{github}{token} || die "no github token\n";

  my $json =
    get("http://github.com/api/v1/json/$login?login=$login&token=$token");

  my $data = eval { JSON->new->decode($json) };

  die "BAD JSON\n$@\n$json\n" unless $data;

  my @repos = @{ $data->{user}{repositories} };

  my %repo_uri;
  for my $repo (@repos) {
    # next if $repo->{private} and not $opt->{private};

    $repo_uri{ $repo->{name} } = sprintf 'git@github.com:%s/%s.git',
      $login,
      $repo->{name};
  }

  return \%repo_uri;
}

1;

__END__
=pod

=head1 NAME

Git::Megapull::Source::Github - clone/update all your repositories from github.com

=head1 VERSION

version 0.100110

=head1 OVERVIEW

This source for C<git-megapull> will look for a C<github> section in the file
F<~/.gitconfig>, and will use the login and token entries to auth with the
GitHub API, and get a list of your repositories.

=head1 METHODS

=head2 repo_uris

This routine does all the work and returns what Git::Megapull expects: a
hashref with repo names as keys and repo URIs as values.

=head1 WARNING

This source will probably be broken out into its own dist in the future.

=head1 TODO

  * add means to include/exclude private repos
  * add means to use alternate credentials
  * investigate using Github::API

=head1 AUTHOR

  Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

