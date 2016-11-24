package Net::Cisco::ACS::Mock::Schema;

# based on the DBIx::Class Schema base class
use base qw/DBIx::Class::Schema/;

# This will load any classes within
__PACKAGE__->load_namespaces();

1;