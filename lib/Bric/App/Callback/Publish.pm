package Bric::App::Callback::Publish;

# XXX: another one with extra %args
#$oc_id => undef
#$story_id => undef
#$media_id => undef
#$instant  => 0


use base qw(Bric::App::Callback);
__PACKAGE__->register_subclass(class_key => 'publish');
use strict;
use Bric::App::Session qw(:state :user);
use Bric::App::Util qw(:all);
use Bric::Biz::Asset::Business::Media;
use Bric::Biz::Asset::Business::Story;
use Bric::Util::Burner;
use HTML::Mason::Request;


sub preview : Callback {
    my $self = shift;
    my $m = HTML::Mason::Request->instance;

    # Grab the story and media IDs from the session.
    my ($story_pub_ids, $media_pub_ids, $story_pub, $media_pub);
    if (my $d = get_state_data(CLASS_KEY)) {
        ($story_pub_ids, $media_pub_ids, $story_pub, $media_pub) =
          @{$d}{qw(story media story_pub media_pub)};
        clear_state(CLASS_KEY);
    } elsif (! defined $story_id && ! defined $media_id ) {
        return;
    }

    # Instantiate the Burner object.
    my $b = Bric::Util::Burner->new({ out_dir => PREVIEW_ROOT });
    if (defined $media_id) {
        my $media = get_state_data('media_prof', 'media');
        unless ($media && (defined $media_id) && ($media->get_id == $media_id)) {
            $media = Bric::Biz::Asset::Business::Media->lookup
              ({ id => $media_id,
                 checkout => $param->{checkout} });
        }

        # Move out the story and then redirect to preview.
        #XXX: $oc_id
        my $url = $b->preview($media, 'media', get_user_id(), $m, $oc_id);
        &$send_msg("Redirecting to preview.");
        redirect_onload($url);
    } else {
        my $s = get_state_data('story_prof', 'story');
        unless ($s && defined $story_id && $s->get_id == $story_id) {
            $s = Bric::Biz::Asset::Business::Story->lookup
              ({ id => $story_id,
                 checkout => $param->{checkout} });
        }

        # Get all the related media to be previewed as well
        foreach my $ra ($s->get_related_objects) {
            next if (ref $ra eq 'Bric::Biz::Asset::Business::Story');

            # Make sure this media object isn't checked out.
            if ($ra->get_checked_out) {
                my $msg = 'Cannot auto-publish related media [_1] '
                  . 'because it is checked out';
                my $arg = '&quot;' . $ra->get_title . '&quot';
                add_msg($self->lang->maketext($msg, $arg));
                next;
            }
            # XXX: $oc_id
            $b->preview($ra, 'media', get_user_id(), $m, $oc_id);
        }
        # Move out the story and then redirect to preview.
        # XXX: $oc_id
        my $url = $b->preview($s, 'story', get_user_id(), $m, $oc_id);
        &$send_msg("Redirecting to preview.");
        redirect_onload($url);
    }
}

sub publish : Callback {
    my $self = shift;

    # Grab the story and media IDs from the session.
    my ($story_pub_ids, $media_pub_ids, $story_pub, $media_pub);
    if (my $d = get_state_data(CLASS_KEY)) {
        ($story_pub_ids, $media_pub_ids, $story_pub, $media_pub) =
          @{$d}{qw(story media story_pub media_pub)};
        clear_state(CLASS_KEY);
    } elsif (! defined $story_id && ! defined $media_id ) {
        return;
    }

    # Instantiate the Burner object.
    my $b = Bric::Util::Burner->new({ out_dir => STAGE_ROOT });
    my $stories = mk_aref($story_pub_ids);
    my $media = mk_aref($media_pub_ids);

    # Iterate through each story and media object to be published.
    my $count = @$stories;
    foreach my $sid (@$stories) {
        # Instantiate the story.
        my $s = $story_pub->{$sid} ||
          Bric::Biz::Asset::Business::Story->lookup({ id => $sid });
        $b->publish($s, 'story', get_user_id(), $param->{pub_date});
        my $arg = '&quot;' . $s->get_title . '&quot;';
        add_msg($self->lang->maketext("Story [_1] published.", $arg))
          if $count <= 3;
    }
    add_msg($self->lang->maketext("[_1] stories published."), $count)
      if $count > 3;

    $count = @$media;
    foreach my $mid (@$media) {
        # Instantiate the media.
        my $ma = $media_pub->{$mid} ||
          Bric::Biz::Asset::Business::Media->lookup({ id => $mid });
        $b->publish($ma, 'media', get_user_id(), $param->{pub_date});
        my $arg = '&quot;' . $ma->get_title . '&quot;';
        add_msg($self->lang->maketext("Media [_1] published.", $arg))
          if $count <= 3;
    }
    add_msg($self->lang->maketext("[_1] media published."), $count)
      if $count > 3;

    redirect_onload(last_page()) unless $instant;     # XXX: $instant
}


my $send_msg = sub {
    # XXX: BOING!
    $m->comp('/lib/util/status_msg.mc', @_);
};


1;
