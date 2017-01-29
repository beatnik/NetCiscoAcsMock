use utf8;
package Net::Cisco::ACS::Mock::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Net::Cisco::ACS::Mock::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 1

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 identitygroupname

  data_type: 'text'
  is_nullable: 1

=head2 changepassword

  data_type: 'text'
  is_nullable: 1

=head2 enablepassword

  data_type: 'text'
  is_nullable: 1

=head2 enabled

  data_type: 'integer'
  is_nullable: 1

=head2 password

  data_type: 'text'
  is_nullable: 1

=head2 passwordneverexpires

  data_type: 'integer'
  is_nullable: 1

=head2 passwordtype

  data_type: 'text'
  is_nullable: 1

=head2 dateexceeds

  data_type: 'text'
  is_nullable: 1

=head2 dateexceedsenabled

  data_type: 'integer'
  is_nullable: 1

=head2 created

  data_type: 'text'
  is_nullable: 1

=head2 lastmodified

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "identitygroupname",
  { data_type => "text", is_nullable => 1 },
  "changepassword",
  { data_type => "text", is_nullable => 1 },
  "enablepassword",
  { data_type => "text", is_nullable => 1 },
  "enabled",
  { data_type => "integer", is_nullable => 1 },
  "password",
  { data_type => "text", is_nullable => 1 },
  "passwordneverexpires",
  { data_type => "integer", is_nullable => 1 },
  "passwordtype",
  { data_type => "text", is_nullable => 1 },
  "dateexceeds",
  { data_type => "text", is_nullable => 1 },
  "dateexceedsenabled",
  { data_type => "integer", is_nullable => 1 },
  "created",
  { data_type => "text", is_nullable => 1 },
  "lastmodified",
  { data_type => "text", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-01-19 22:38:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8HDMgzjHZ2imQoArsYnTVA

__PACKAGE__->set_primary_key("id");
# Manually added - is DBIx::Class picking up Primary Keys in SQLite??

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
