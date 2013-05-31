
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Test::Run::Builder;

my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::Differences" => 0,
    "Test::More" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "wrapper to rsync/etc. to upload files to a remote server and give\ndownload links.",
  "dist_author" => [
    "Shlomi Fish <shlomif\@cpan.org>"
  ],
  "dist_name" => "App-Sky",
  "dist_version" => "0.0.1",
  "license" => "mit",
  "module_name" => "App::Sky",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Carp" => 0,
    "Exception::Class" => 0,
    "File::Basename" => 0,
    "File::HomeDir" => 0,
    "Getopt::Long" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Moo" => 0,
    "MooX" => 0,
    "Scalar::Util" => 0,
    "URI" => 0,
    "YAML::XS" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "script_files" => [
    "bin/sky",
    "bin/sky"
  ]
);


my $build = Test::Run::Builder->new(%module_build_args);

$build->create_build_script;
