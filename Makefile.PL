
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Git-Megapull',
  NAME      => 'Git::Megapull',
  AUTHOR    => 'Ricardo\ SIGNES\ \<rjbs\@cpan\.org\>',
  ABSTRACT  => 'clone\ or\ update\ all\ repositories\ found\ elsewhere',
  VERSION   => '0.092560',
  EXE_FILES => [ qw(bin/git-megapull) ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "App::Cmd::Simple" => '0',
    "Config::INI::Reader" => '0',
    "autodie" => '0',
    "String::RewritePrefix" => '0',
    "JSON::XS" => '0',
    "LWP::Simple" => '0',
  },
);
