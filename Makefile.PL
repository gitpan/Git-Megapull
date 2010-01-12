
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



WriteMakefile(
  DISTNAME  => 'Git-Megapull',
  NAME      => 'Git::Megapull',
  AUTHOR    => "Ricardo\ SIGNES\ \<rjbs\@cpan\.org\>",
  ABSTRACT  => "clone\ or\ update\ all\ repositories\ found\ elsewhere",
  VERSION   => '0.100110',
  EXE_FILES => [ "bin\/git\-megapull" ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "App::Cmd::Simple" => '0',
    "Config::INI::Reader" => '0',
    "autodie" => '0',
    "ExtUtils::MakeMaker" => '6.11',
    "String::RewritePrefix" => '0',
    "JSON" => '2',
    "LWP::Simple" => '0',
  },
  test => {TESTS => 't/*.t'}
);



