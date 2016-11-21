package Net::Cisco::ACS::Mock::Controller::User;
use Mojo::Base 'Mojolicious::Controller';

my %users =
( "foo" =>
  { "description" => "Foo User",
    "identityGroupName" => "All Groups:Foo",
	"changePassword" => "true",
	"enablePassword" => "Secret",
	"enabled" => "true",
	"password" => "Secret",
	"passwordNeverExpires" => "true",
	"passwordType" => "Internal",
	"dateExceeds" => "",
	"dateExceedsEnabled" => "false",
	"id" => 1,
	"name" => "foo"
  },
  "bar" =>
  { "description" => "Bar User",
    "identityGroupName" => "All Groups:Bar",
	"changePassword" => "true",
	"enablePassword" => "Secret",
	"enabled" => "true",
	"password" => "Secret",
	"passwordNeverExpires" => "true",
	"passwordType" => "Internal",
	"dateExceeds" => "",
	"dateExceedsEnabled" => "false",
	"id" => 2,
	"name" => "foo"
  }
);

my %id =
( 1 => "foo",
  2 => "bar"
);

sub query {
    my $self = shift;
	my $name = $self->param("name");
	my $id = $self->param("id");
	my $user;
	if ($id) { $user = $users{$id{$id}}; }
	if ($name) { $user = $users{$name}; }
	$self->stash("user" => $user);
	$self->render(template => 'user/query', format => 'xml');
}

sub update {
    my $self = shift;
	my $name = $self->param("name");
	my $id = $self->param("id");
	$self->render(template => 'user/update', format => 'xml');	
}

sub create {
    my $self = shift;
	my $name = $self->param("name");
	my $id = $self->param("id");
	$self->render(template => 'user/create', format => 'xml');	
}

sub delete {
    my $self = shift;
	my $name = $self->param("name");
	my $id = $self->param("id");
	$self->render(template => 'user/delete', format => 'xml');	
}

1;
