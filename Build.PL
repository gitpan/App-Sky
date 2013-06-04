
use strict;
use warnings;

use Module::Build 0.3601;
use lib qw{inc}; use Test::Run::Builder;

my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "wrapper to rsync/etc. to upload files to a remote server and give\ndownload links.",
  "dist_author" => [
    "Shlomi Fish <shlomif\@cpan.org>"
  ],
  "dist_name" => "App-Sky",
  "dist_version" => "0.0.6",
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
    "MooX::late" => "0.010",
    "Scalar::Util" => 0,
    "URI" => 0,
    "YAML::XS" => 0,
    "perl" => "5.010",
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "script_files" => [
    "bin/sky",
    "bin/sky"
  ],
  "test_requires" => {
    "File::Spec" => 0,
    "Test::Differences" => 0,
    "Test::More" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Test::Run::Builder->new(%module_build_args);

$build->create_build_script;
