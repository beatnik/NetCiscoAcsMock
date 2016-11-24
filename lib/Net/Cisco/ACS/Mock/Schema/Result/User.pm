package Net::Cisco::ACS::Mock::Schema::Result::User;
use base qw/DBIx::Class::Core/;

# Associated table in database
__PACKAGE__->table('users');

# Column definition
__PACKAGE__->add_columns(

     id => {
         data_type => 'integer',
         is_auto_increment => 1,
     },

     description => {
         data_type => 'text',
     },

     identitygroupname => {
         data_type => 'text',
     },

     name => {
         data_type => 'text',
     },

     changepassword => {
         data_type => 'text',
     },

     enablepassword => {
         data_type => 'text',
     },

     enabled => {
         data_type => 'integer',
     },

     password => {
         data_type => 'text',
     },

     passwordneverexpires => {
         data_type => 'integer',
     },
	 
     passwordtype => {
         data_type => 'text',
     },

     dateexceeds => {
         data_type => 'text',
     },

     dateexceedsenabled => {
         data_type => 'integer',
     },
	 
 );

 # Tell DBIC that 'id' is the primary key
 __PACKAGE__->set_primary_key('id');

 1;