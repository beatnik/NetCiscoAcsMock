package Net::Cisco::ACS::Mock;
use Mojo::Base 'Mojolicious';
use Net::Cisco::ACS::Mock::Schema;
use Mojo::Log;

# This method will run once at server start
sub startup {
  my $self = shift;
  my $schema = Net::Cisco::ACS::Mock::Schema->connect('dbi:SQLite:acs.db');
  $self->helper(db => sub { return $schema; });
  $self->log( Mojo::Log->new( path => "log/development.log", level => 'debug' ) );  
  # Router
  my $r = $self->routes;
  # Normal route to controller
  $r->get("/Rest/Identity/User/name/:name")->to('User#query');  
  $r->get('/Rest/Identity/User/id/:id')->to('User#query');  
  $r->get('/Rest/Identity/User')->to('User#query');
  $r->put('/Rest/Identity/User')->to('User#update');
  $r->post('/Rest/Identity/User')->to('User#create');
  $r->delete('/Rest/Identity/User/name/:name')->to('User#delete');
  $r->delete('/Rest/Identity/User/id/:id')->to('User#delete');

  $r->get("/Rest/Identity/IdentityGroup/name/:name")->to('IdentityGroup#query');  
  $r->get('/Rest/Identity/IdentityGroup/id/:id')->to('IdentityGroup#query');  
  $r->get('/Rest/Identity/IdentityGroup')->to('IdentityGroup#query');
  $r->put('/Rest/Identity/IdentityGroup')->to('IdentityGroup#update');
  $r->post('/Rest/Identity/IdentityGroup')->to('IdentityGroup#create');
  $r->delete('/Rest/Identity/IdentityGroup/name/:name')->to('IdentityGroup#delete');
  $r->delete('/Rest/Identity/IdentityGroup/id/:id')->to('IdentityGroup#delete');

}

1;
