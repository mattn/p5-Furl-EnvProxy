use inc::Module::Install;
name 'Furl-EnvProxy';
all_from 'lib/Furl/EnvProxy.pm';

requires 'Furl';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
