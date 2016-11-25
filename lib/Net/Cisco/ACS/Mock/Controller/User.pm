package Net::Cisco::ACS::Mock::Controller::User;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;
use XML::Simple;

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
    my $rs = $self->db->resultset('User');
    my $user;
	if ($name) 
	{ my $query_rs = $rs->search({ name => $name });
      $user = $query_rs->first;
    }
	if ($id) 
	{ my $query_rs = $rs->search({ id => $id });
      $user = $query_rs->first;
    }
    if (!$id && !$name)
    { my $query_rs = $rs->search;
      my %users = ();
      while (my $account = $query_rs->next)
      { $users{$account->name} =
        { id => $account->id, name => $account->name, description => $account->description,
          identitygroupname => $account->identitygroupname, changepassword => $account->changepassword,
          enablepassword => $account->enablepassword, enabled => $account->enabled, password => $account->password,
          passwordneverexpires => $account->passwordneverexpires, passwordtype => $account->passwordtype,
          dateexceeds => $account->dateexceeds, dateexceedsenabled =>$account->dateexceedsenabled
        };
      }

      $self->stash("users" => \%users);
      $self->render(template => 'user/queryall', format => 'xml', layout => 'userall');
      return;
    }
    
    $self->stash("user" => $user);
	$self->render(template => 'user/query', format => 'xml', layout => 'user');
}

sub update {
    my $self = shift;
    my $rs = $self->db->resultset('User');
    my $data = $self->req->body;
    my $xmlsimple = XML::Simple->new();
    my $xmlout = $xmlsimple->XMLin($data);
    my $query_rs = $rs->search({ name => $xmlout->{"name"} });
    my $account = $query_rs->first;
    $xmlout->{"dateExceedsEnabled"} = $xmlout->{"dateExceedsEnabled"} eq "true" ? 1 : 0;
    $xmlout->{"enabled"} = $xmlout->{"enabled"} eq "true" ? 1 : 0;
    $xmlout->{"enablePassword"} = $xmlout->{"enablePassword"} eq "true" ? 1 : 0;
    $xmlout->{"passwordNeverExpires"} = $xmlout->{"passwordNeverExpires"} eq "true" ? 1 : 0;    
    $account->update({ description => $xmlout->{"description"},
          identitygroupname => $xmlout->{"identityGroupName"},
          changepassword => $xmlout->{"changePassword"},
          enablepassword => $xmlout->{"enablePassword"},
          enabled => $xmlout->{"enabled"},
          password => $xmlout->{"password"},
          passwordneverexpires => $xmlout->{"passwordNeverExpires"},
          passwordtype => $xmlout->{"passwordType"},
          dateexceeds => $xmlout->{"dateExceeds"},
          dateexceedsenabled =>$xmlout->{"dateExceedsEnabled"}
          });
	$self->render(render => '', status => 200);	
}

sub create {
    my $self = shift;
    my $data = $self->req->body;
    my $xmlsimple = XML::Simple->new();
    my $xmlout = $xmlsimple->XMLin($data);
    $xmlout->{"dateExceedsEnabled"} = $xmlout->{"dateExceedsEnabled"} eq "true" ? 1 : 0;
    $xmlout->{"enabled"} = $xmlout->{"enabled"} eq "true" ? 1 : 0;
    $xmlout->{"enablePassword"} = $xmlout->{"enablePassword"} eq "true" ? 1 : 0;
    $xmlout->{"passwordNeverExpires"} = $xmlout->{"passwordNeverExpires"} eq "true" ? 1 : 0;    
    $xmlout->{"dateExceeds"} = ref($xmlout->{"dateExceeds"}) ? "" : $xmlout->{"dateExceeds"};
    $self->db->resultset('User')->create({
          name => $xmlout->{"name"},
          description => $xmlout->{"description"},
          identitygroupname => $xmlout->{"identityGroupName"},
          changepassword => $xmlout->{"changePassword"},
          enablepassword => $xmlout->{"enablePassword"}, # HASH ?!?
          enabled => $xmlout->{"enabled"},
          password => $xmlout->{"password"},
          passwordneverexpires => $xmlout->{"passwordNeverExpires"},
          passwordtype => $xmlout->{"passwordType"},
          dateexceeds => $xmlout->{"dateExceeds"}, # HASH?!?
          dateexceedsenabled =>$xmlout->{"dateExceedsEnabled"},
          id => "9999"
          });
	$self->render(render => '', status => 200);	
}

sub delete {
    my $self = shift;
	my $name = $self->param("name");
	my $id = $self->param("id");
	$self->render(template => 'user/delete', format => 'xml');	
}

1;
