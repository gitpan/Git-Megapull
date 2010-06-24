
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'clone or update all repositories found elsewhere',
  'AUTHOR' => 'Ricardo SIGNES <rjbs@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Git-Megapull',
  'EXE_FILES' => [
    'bin/git-megapull'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'Git::Megapull',
  'PREREQ_PM' => {
    'App::Cmd::Simple' => '0',
    'Config::INI::Reader' => '0',
    'JSON' => '2',
    'LWP::Simple' => '0',
    'String::RewritePrefix' => '0',
    'autodie' => '0'
  },
  'VERSION' => '0.101750',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



