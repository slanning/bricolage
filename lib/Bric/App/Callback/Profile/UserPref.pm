package Bric::App::Callback::Profile::UserPref;

use base qw(Bric::App::Callback::Profile);
__PACKAGE__->register_subclass;
use constant CLASS_KEY => 'user_pref';

use strict;
use Bric::App::Event qw(log_event);
use Bric::App::Util qw(:aref :msg);

my $disp_name = 'User Preference';


sub save : Callback {
    my $self = shift;

#    return unless $self->has_perms;

    my $param = $self->params;
    my $user_pref = Bric::Util::UserPref->lookup({ pref_id => $param->{pref_id},
                                                   user_id => $param->{user_id} });

    $user_pref ||= Bric::Util::UserPref->new({ pref_id => $param->{pref_id},
                                               user_id => $param->{user_id} });

    $user_pref->set_value($param->{value});
    $user_pref->save;

    my $name = $user_pref->get_name;

    log_event('user_pref_save', $user_pref);
    add_msg("$disp_name \"[_1]\" updated.", $name);
    $self->set_redirect("/admin/profile/user/$param->{user_id}");
}

sub delete : Callback {
    my $self = shift;

#    return unless $self->has_perms;

    my $param = $self->params;

    foreach my $id (@{ mk_aref($param->{'user_pref|delete_cb'}) }) {
        my $user_pref = Bric::Util::UserPref->lookup({ id => $id });

        next unless $user_pref;

        log_event('user_pref_reset', $user_pref);

        my $name = $user_pref->get_name;

        $user_pref->delete;

        add_msg("$disp_name \"[_1]\" reset.", $name);
    }

    $self->set_redirect("/admin/profile/user/$param->{user_id}");
}


1;