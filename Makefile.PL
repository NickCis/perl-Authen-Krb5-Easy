use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

# get some stuff we need to know
my ($krblibs, $krbincs);

if(system('which krb5-config &> /dev/null')){
	$krblibs = '-L' . prompt("Enter path to kerberos libraries:") . ' -lkrb5';
	$krbincs = '-I' . prompt("Enter path to kerberos headers:");
}else{
	$krblibs = `krb5-config --libs`;
	chomp($krblibs);
	$krbincs = `krb5-config --cflags`;
	chomp($krbincs);
}

WriteMakefile(
	'NAME' => 'Authen::Krb5::Easy',
	'VERSION_FROM' => 'Easy.pm', # finds $VERSION
	'PREREQ_PM' => {}, # e.g., Module::Name => 1.1
	'LIBS' => [$krblibs], # e.g., '-lm'
	'DEFINE' => '', # e.g., '-DHAVE_SOMETHING'
	'INC' => $krbincs, # e.g., '-I/usr/include/other'
);
