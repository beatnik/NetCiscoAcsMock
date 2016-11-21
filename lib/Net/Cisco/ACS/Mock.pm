package Net::Cisco::ACS::Mock;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

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
}

1;

#http://localhost:3000/Rest/Identity/User/name/foo