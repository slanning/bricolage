package Bric::Biz::Asset::Business::Parts::Tile::Container::DevTest;
################################################################################

use strict;
use warnings;

use base qw(Bric::Biz::Asset::Business::Parts::Tile::DevTest);

use Test::More;
use Bric::Biz::Asset::Business::Story;
use Bric::Biz::Asset::Business::Media;
use Bric::Biz::Asset::Business::Parts::Tile::Container;
use Bric::Biz::ATType;
use Bric::Biz::AssetType;
use Test::MockModule;

##############################################################################
# Utility methods
##############################################################################
# The class we're testing. Override this method in subclasses.
sub class { 'Bric::Biz::Asset::Business::Parts::Tile::Container' }
my $rel_story_uuid = '4162F712-1DD2-11B2-B17E-C09EFE1DC403';
my $rel_media_uuid = '4162F713-1DD3-11B3-B17F-C09EFE1DC404';

##############################################################################
# Arguments to the new() constructor. Used by construct(). Override as
# necessary in subclasses.
sub new_args {
    my $self = shift;

    (object  => $self->get_story,
     element => $self->get_elem,
     site_id => 100,
    )
}

##############################################################################
# Constructs a new object.
sub construct {
    my $self = shift;

    $self->class->new({$self->new_args, @_});
}
################################################################################
# Test the constructors

sub test_new : Test(10) {
    my $self = shift;

    ok (my $cont = $self->construct,    'Construct Container');
    ok (my $at  = $cont->get_element,   'Get Element Object');
    ok (my $atd = ($at->get_data)[0],   'Get Data Element Object');
    ok ($cont->add_data($atd, 'Chomp'), 'Add Data');
    ok ($cont->save,                    'Save Container');
    ok (my $c_id = $cont->get_id,       'Get Container ID');

    $self->add_del_ids([$c_id], $cont->S_TABLE);

    ok (my $lkup = $self->class->lookup({object_type => 'story',
                                         id          => $c_id}),
        'Lookup Container');

    is ($lkup->get_data('deck', 2), 'Chomp',   'Compare Data');

    ok (my $list = $self->class->list({object_type => 'story'}),
        'List Story Containers');
    ok (grep($_->get_id == $cont->get_id, @$list), 'Container is listed');
}

##############################################################################
# Test pod.
sub test_pod : Test(223) {
    my $self = shift;

    # First, we'll need a story element type.
    ok my $story_et = Bric::Biz::ATType->new({
        name          => 'Testing',
        top_level     => 1,
        related_story => 1,
        related_media => 1,
    }), "Create a story element type";
    ok $story_et-> save, "Save story element type";
    $self->add_del_ids($story_et->get_id, 'at_type');

    # Next, a subelement.
    ok my $sub_et = Bric::Biz::ATType->new({
        name      => 'Subby',
        top_level => 0,
    }), "Create a subelement element type";
    ok $sub_et-> save, "Save subelement element type";
    $self->add_del_ids($sub_et->get_id, 'at_type');

    # And finally, a page subelement.
    ok my $page_et = Bric::Biz::ATType->new({
        name      => 'Pagey',
        top_level => 0,
        paginated => 1,
    }), "Create a page element type";
    ok $page_et-> save, "Save page element type";
    $self->add_del_ids($page_et->get_id, 'at_type');

    # We also need a media element type type.
    ok my $media_et = Bric::Biz::ATType->new({
        name          => 'Media',
        top_level     => 1,
        media         => 1,
    }), "Create a media element type type";
    ok $media_et-> save, "Save media element type type";
    $self->add_del_ids($media_et->get_id, 'at_type');

    # Create a media type.
    ok my $media_type = Bric::Biz::AssetType->new({
        key_name  => '_media_',
        name      => 'Media Testing',
        burner    => Bric::Biz::AssetType::BURNER_MASON,
        type__id  => $media_et->get_id,
        reference => 0, # No idea what this is.
    }), "Create media type";
    ok $media_type->add_site(100), "Add the site ID";
    ok $media_type->add_output_channels([1]), "Add the output channel";
    ok $media_type->set_primary_oc_id(1, 100),
      "Set it as the primary OC";;
    ok $media_type->save, "Save the test media type";
    $self->add_del_ids($media_type->get_id, 'element');

    # Create a story type.
    ok my $story_type = Bric::Biz::AssetType->new({
        key_name  => '_testing_',
        name      => 'Testing',
        burner    => Bric::Biz::AssetType::BURNER_MASON,
        type__id  => $story_et->get_id,
        reference => 0, # No idea what this is.
    }), "Create story type";
    ok $story_type->add_site(100), "Add the site ID";
    ok $story_type->add_output_channels([1]), "Add the output channel";
    ok $story_type->set_primary_oc_id(1, 100),
      "Set it as the primary OC";;
    ok $story_type->save, "Save the test story type";
    $self->add_del_ids($story_type->get_id, 'element');

    # Give it a header field.
    ok my $head = $story_type->new_data({
        key_name    => 'header',
        required    => 0,
        quantifier  => 1,
        sql_type    => 'short',
        place       => 1,
        publishable => 1, # Huh?
        max_length  => 0, # Unlimited
    }), "Add a field";

    # Give it a paragraph field.
    ok my $para = $story_type->new_data({
        key_name    => 'para',
        required    => 0,
        quantifier  => 1,
        sql_type    => 'short',
        place       => 2,
        publishable => 1, # Huh?
        max_length  => 0, # Unlimited
    }), "Add a field";

    # Save the story type with its fields.
    ok $story_type->save, "Save element with the fields";
    $self->add_del_ids($head->get_id, 'at_data');
    $self->add_del_ids($para->get_id, 'at_data');

    # Create a subelement.
    ok my $pull_quote = Bric::Biz::AssetType->new({
        key_name  => '_pull_quote_',
        name      => 'Pull Quote',
        burner    => Bric::Biz::AssetType::BURNER_MASON,
        type__id  => $sub_et->get_id,
        reference => 0, # No idea what this is.
    }), "Create a subelement element";

    ok $pull_quote->save, "Save the subelement element";
    $self->add_del_ids($pull_quote->get_id, 'element');

    # Give it a paragraph field.
    ok my $pq_para = $pull_quote->new_data({
        key_name    => 'para',
        required    => 1,
        quantifier  => 1,
        sql_type    => 'short',
        place       => 1,
        publishable => 1, # Huh?
        max_length  => 0, # Unlimited
    }), "Add a field";

    # Give it a by field.
    ok my $by = $pull_quote->new_data({
        key_name    => 'by',
        required    => 1,
        quantifier  => 0,
        sql_type    => 'short',
        place       => 2,
        publishable => 1, # Huh?
        max_length  => 0, # Unlimited
    }), "Add a field";

    # Give it a date field.
    ok my $date = $pull_quote->new_data({
        key_name    => 'date',
        required    => 1,
        quantifier  => 0,
        sql_type    => 'date',
        place       => 3,
        publishable => 1, # Huh?
        max_length  => 0, # Unlimited
    }), "Add a field";

    # Save the pull quote with its fields.
    ok $pull_quote->save, "Save subelement with the fields";
    $self->add_del_ids($pq_para->get_id, 'at_data');
    $self->add_del_ids($by->get_id, 'at_data');
    $self->add_del_ids($date->get_id, 'at_data');

    # Create a page subelement.
    ok my $page = Bric::Biz::AssetType->new({
        key_name  => '_page_',
        name      => 'Page',
        burner    => Bric::Biz::AssetType::BURNER_MASON,
        type__id  => $page_et->get_id,
        reference => 0, # No idea what this is.
    }), "Create a page subelement element";

    # Give it a paragraph field.
    ok my $page_para = $page->new_data({
        key_name    => 'para',
        required    => 0,
        quantifier  => 0,
        sql_type    => 'short',
        place       => 1,
        publishable => 1, # Huh?
        max_length  => 0, # Unlimited
    }), "Add a field";

    # Save it.
    ok $page->add_containers([$pull_quote->get_id]), 'Add pull quote to page';
    ok $page->save, "Save the page subelement element";
    $self->add_del_ids($page->get_id, 'element');

    # Add the subelements to the story type element.
    ok $story_type->add_containers([$pull_quote->get_id, $page->get_id]),
        "Add the subelements";
    ok $story_type->save, 'Save the story type with the subelements';

    # Now it's time to create a story!
    ok my $story = Bric::Biz::Asset::Business::Story->new({
        user__id    => $self->user_id,
        site_id     => 100,
        element__id => $story_type->get_id,
        source__id  => 1,
        title       => 'This is a Test',
        slug        => 'test_pod',
    }), "Create test story";

    ok $story->add_categories([1]), "Add it to the root category";
    ok $story->set_primary_category(1),
      "Make the root category the primary category";
    ok $story->set_cover_date('2005-03-22 21:07:56'), "Set the cover date";
    ok $story->checkin, "Check in the story";
    ok $story->save, "Save the story";
    $self->add_del_ids($story->get_id, 'story');

    # Add some content to it.
    ok my $elem = $story->get_element, "Get the story element";
    ok $elem->add_data($para, 'This is a paragraph'), "Add a paragraph";
    ok $elem->add_data($para, 'Second paragraph'), "Add another paragraph";
    ok $elem->add_data($head, "And then..."), "Add a header";
    ok $elem->add_data($para, 'Third paragraph'), "Add a third paragraph";

    # Add a pull quote.
    ok my $pq = $elem->add_container($pull_quote), "Add a pull quote";
    ok $pq->get_data_element('para')->set_data(
        "Ask not what your country can do for you.\n="
          . 'Ask what you can do for your country.'
    ), "Add a paragraph with an apparent POD tag";
    ok $pq->get_data_element('by')->set_data("John F. Kennedy"),
      "Add a By to the pull quote";
    ok $pq->get_data_element('date')->set_data('1961-01-20 00:00:00'),
      "Add a date to the pull quote";

    # Add some Unicode content.
    ok $elem->add_data(
        $para,
        '圳地在圭圬圯圩夙多夷夸妄奸妃好她如妁字存宇守宅安寺尖屹州帆并年'
    ), "Add a Chinese paragraph";
    ok $elem->add_data(
        $para,
        '橿梶鰍潟割喝恰括活渇滑葛褐轄且鰹叶椛樺鞄株兜竃蒲釜鎌噛鴨栢茅萱'
    ), "Add a Japanese paragraph";
    ok $elem->add_data(
        $para,
        '뼈뼉뼘뼙뼛뼜뼝뽀뽁뽄뽈뽐뽑뽕뾔뾰뿅뿌뿍뿐뿔뿜뿟뿡쀼쁑쁘쁜쁠쁨쁩삐'
    ), "Add a Korean paragraph";

    # Add another pull quote.
    ok my $pq2 = $elem->add_container($pull_quote), "Add another pull quote";
    ok $pq2->get_data_element('para')->set_data(
        "So, first of all, let me assert my firm belief that the only\n\n"
        . '=thing we have to fear is fear itself -- nameless, unreasoning, '
        . 'unjustified terror which paralyzes needed efforts to convert '
        . 'retreat into advance.'
    ), "Add a paragraph with a near POD tag to the pull quote";
    ok $pq2->get_data_element('by')->set_data("Franklin D. Roosevelt"),
      "Add a By to the pull quote";
    ok $pq2->get_data_element('date')->set_data('1933-03-04 00:00:00'),
      "Add a date to the pull quote";

    # Make it so!
    ok $elem->save, "Save the story element";

    # Fake out UUID generation for the relstory.
    my $mock_uuid = Test::MockModule->new('Data::UUID');
    $mock_uuid->mock(create_str => $rel_story_uuid);

    # Create a story that can be a related story.
    ok my $rel_story = Bric::Biz::Asset::Business::Story->new({
        user__id    => $self->user_id,
        site_id     => 100,
        element__id => $story_type->get_id,
        source__id  => 1,
        title       => 'Test Related Story',
        slug        => 'test_related',
    }), "Create test story";
    $mock_uuid->unmock('create_str');

    ok $rel_story->add_categories([1]), "Add it to the root category";
    ok $rel_story->set_primary_category(1),
      "Make the root category the primary category";
    ok $rel_story->set_cover_date('2005-03-23 21:07:56'), "Set the cover date";
    ok $rel_story->checkin, "Check in the story";
    ok $rel_story->save, "Save the story";
    my $rel_story_uri  = $rel_story->get_primary_uri;
    my $rel_story_id   = $rel_story->get_id;
    $self->add_del_ids($rel_story->get_id, 'story');

    # Create a media document.
    $mock_uuid->mock(create_str => $rel_media_uuid);
    ok my $media = Bric::Biz::Asset::Business::Media->new({
        user__id    => $self->user_id,
        site_id     => 100,
        element__id => $media_type->get_id,
        source__id  => 1,
        title       => 'This is a Test',
        slug        => 'test_pod',
    }), "Create test media";
    $mock_uuid->unmock('create_str');

    ok $media->set_category__id(1), "Add it to the root category";
    ok $media->set_cover_date('2005-03-22 21:07:56'), "Set the cover date";
    ok $media->save, "Save the media";
    $self->add_del_ids($media->get_id, 'media');

    # Associate the media file and check it in.
    ok $media->upload_file(*DATA, 'testfile.txt');
    ok $media->checkin, "Check in the media";
    ok $media->save, "Save the media again";
    my $rel_media_id  = $media->get_id;
    my $rel_media_uri = $media->get_uri;

    # Relate the story and media.
    ok $elem->set_related_instance_id($rel_story_id), 'Add related story';
    ok $elem->set_related_media_id($rel_media_id), 'Add related media';

    # Okay, now down to business.
    is $elem->serialize_to_pod, $self->pod_output,
        'Check the POD serialization';

    # Update from POD.
    ok $elem->update_from_pod($self->pod_output), 'Update from POD';

    # Check the contents.
    is $elem->get_data('para'),    'This is a paragraph', 'Check first para';
    is $elem->get_data('para', 2), 'Second paragraph',    'Check second para';
    is $elem->get_data('header'),  'And then...',         'Check header';
    is $elem->get_data('para', 3), 'Third paragraph',     'Check third para';
    is $elem->get_related_instance_id, $rel_story_id,     'Check relstory id';

    # Check the pull quote.
    is $elem->get_container('_pull_quote_'), $pq,
        'The pull quote object should be the same';
    is $pq->get_data('para'),
        "Ask not what your country can do for you.\n"
        . '\=Ask what you can do for your country.',
        'Check pull quote paragraph';
    is $pq->get_data('by'), 'John F. Kennedy', 'Check pull quote by';
    is $pq->get_data('date'), '1961-01-20 00:00:00', 'Check pull quote date';

    # Try deserializeing with a default field.
    (my $stripped_pod = $self->pod_output) =~ s/(?:    )?=para\n\n//g;
    ok $elem->update_from_pod($stripped_pod, 'para'),
        "Update from POD with a default field";

    # Check the contents.
    is $elem->get_data('para'), 'This is a paragraph', 'Check first para';
    is $elem->get_data('para', 2), 'Second paragraph', 'Check second para';
    is $elem->get_data('header'), 'And then...', 'Check header';
    is $elem->get_data('para', 3), 'Third paragraph', 'Check third para';
    ok my $header = $elem->get_data_element('header'), 'Grab the header';

    # Check the pull quote.
    is $elem->get_container('_pull_quote_'), $pq,
        'The pull quote object should be the same';
    is $pq->get_data('para'),
        "Ask not what your country can do for you.\n"
        . '\=Ask what you can do for your country.',
        'Check pull quote paragraph';
    is $pq->get_data('by'), 'John F. Kennedy', 'Check pull quote by';
    is $pq->get_data('date'), '1961-01-20 00:00:00', 'Check pull quote date';
    ok my $pq_para_field = $pq->get_data_element('para'),
        'Grab the pull quote para';

    # Add a new field.
    $stripped_pod = "=header\n\nIn the beginning...\n\n$stripped_pod";
    ok $elem->update_from_pod($stripped_pod, 'para'),
        "Update from POD with a default field";

    # Check the contents.
    is $elem->get_data_element('header'), $header,
        'First header should still be first';
    is $elem->get_data('header'), 'In the beginning...',
        'But its content should be different';
    is $elem->get_data('para'), 'This is a paragraph', 'Check first para';
    is $elem->get_data('para', 2), 'Second paragraph', 'Check second para';
    is $elem->get_data('header', 2), 'And then...', 'Check second header';
    is $elem->get_data('para', 3), 'Third paragraph', 'Check third para';

    # Now add another paragraph to the pull quote.
    $stripped_pod =~ s/Ask not/My fellow Americans,\n\n    Ask not/;
    ok $elem->update_from_pod($stripped_pod, 'para'),
        "Update from POD with a default field";

    # Check the contents.
    is $elem->get_data_element('header'), $header,
        'First header should still be first';
    is $elem->get_data('header'), 'In the beginning...',
        '... And its content should still be different';
    is $elem->get_data('para'), 'This is a paragraph', 'Check first para';
    is $elem->get_data('para', 2), 'Second paragraph', 'Check second para';
    is $elem->get_data('header', 2), 'And then...', 'Check second header';
    is $elem->get_data('para', 3), 'Third paragraph', 'Check third para';

    # Check the pull quote.
    is $elem->get_container('_pull_quote_'), $pq,
        'The pull quote object should be the same';
    is $pq->get_data_element('para'), $pq_para_field,
        '... And its first para should be the same object';
    is $pq->get_data('para'), 'My fellow Americans,',
        'But its contents should be different';
    is $pq->get_data('para', 2),
        "Ask not what your country can do for you.\n"
        . '\=Ask what you can do for your country.',
        '... While the second paragraph is the original';
    is $pq->get_data('by'), 'John F. Kennedy', 'Check pull quote by';
    is $pq->get_data('date'), '1961-01-20 00:00:00', 'Check pull quote date';

    # Add another pull quote.
    ok $elem->update_from_pod($self->pod_output_plus_pq),
        'Update from POD with extra pull quote';
    ok my @pqs = $elem->get_elements('_pull_quote_'), 'Get pull quotes';
    is scalar @pqs, 3, 'Should have three pull quotes';
    is $pqs[0]->get_data('by'),   'John F. Kennedy',       'Check first PQ by';
    is $pqs[0]->get_data('date'), '1961-01-20 00:00:00',   'Check first PQ date';
    is $pqs[1]->get_data('by'),   'Franklin D. Roosevelt', 'Check second PQ by';
    is $pqs[1]->get_data('date'), '1933-03-04 00:00:00',   'Check second PQ date';
    is $pqs[2]->get_data('by'),   'Neil Armstrong',        'Check second PQ by';
    is $pqs[2]->get_data('date'), '1970-07-20 00:00:00',   'Check second PQ date';

    # Now update it with the original POD to ensure one pq is removed.
    ok $elem->update_from_pod($self->pod_output),
        'Update from POD without extra pull quote';
    ok @pqs = $elem->get_elements('_pull_quote_'), 'Get pull quotes';
    is scalar @pqs, 2, 'Should have two pull quotes';
    is $pqs[0]->get_data('by'),   'John F. Kennedy',       'Check first PQ by';
    is $pqs[0]->get_data('date'), '1961-01-20 00:00:00',   'Check first PQ date';
    is $pqs[1]->get_data('by'),   'Franklin D. Roosevelt', 'Check second PQ by';
    is $pqs[1]->get_data('date'), '1933-03-04 00:00:00',   'Check second PQ date';

    # Try adding a page with its own pull quote subelement.
    ok $elem->update_from_pod($self->pod_output_plus_page),
        'Update from POD with page and different indent';

    # Check the contents.
    is $elem->get_data('para'), 'This is a paragraph', 'Check first para';
    is $elem->get_data('para', 2), 'Second paragraph', 'Check second para';
    is $elem->get_data('header'), 'And then...', 'Check header';
    is $elem->get_data('para', 3), 'Third paragraph', 'Check third para';

    # Check the pull quote.
    is $elem->get_container('_pull_quote_'), $pq,
        'The pull quote object should be the same';
    is $pq->get_data('para'),
        "Ask not what your country can do for you.\n"
        . '\=Ask what you can do for your country.',
        'Check pull quote paragraph';
    is $pq->get_data('by'), 'John F. Kennedy', 'Check pull quote by';
    is $pq->get_data('date'), '1961-01-20 00:00:00', 'Check pull quote date';

    # Check the page.
    ok my $page_elem = $elem->get_container('_page_');
    is $page_elem->get_data('para'),
        "This is the first paragraph from page one.\nIt isn't a long "
        . "paragraph.\nBut it'll do.",
        'Check the page paragraph';
    ok my $ppara = $page_elem->get_data_element('para'), 'Get page para';
    is $ppara->get_place, 0, q{Check page paragraph's place};
    is $ppara->get_object_order, 1, q{Check page paragraph's obj order};
    ok my $subpq = $page_elem->get_container('_pull_quote_'),
        q{Get page's pull quote};
    is $subpq->get_place, 1, q{Check the pull quote's place};
    is $ppara->get_object_order, 1, q{Check pull quote's obj order};
    is $subpq->get_data('para'),
        q{Granted, Opera has been available for a while, but it remains the }
        . q{province of a devoted few -- the Amiga of Web browsers.},
        q{Check the page pull quote's paragraph};
    is $subpq->get_data('by'), 'Chad Dickerson', q{... And its by};
    is $subpq->get_data('date'), '2004-12-03 00:00:00', q{... And its date};

    # Test a bad default field.
    eval { $elem->update_from_pod('', 'par') };
    ok my $err = $@, 'Catch invalid default field excetpion';
    isa_ok $err, 'Bric::Util::Fault::Error::Invalid';
    is $err->error, 'No such field "par", did you mean "para"?',
        'Should get the correct exception message';
    is_deeply $err->maketext,
        ['No such field "[_1]", did you mean "[_2]"?', 'par', 'para' ],
        'Should get the correct maketext array';

    # Try a bad field.
    eval { $elem->update_from_pod("=para\n\nfoo\n\n=par\n\n") };
    ok $err = $@, 'Catch invalid field exception';
    isa_ok $err, 'Bric::Util::Fault::Error::Invalid';
    is $err->error, 'No such field "par" at line 5. Did you mean "para"?',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No such field "[_1]" at line [_2]. Did you mean "[_3]"?',
        'par',
        5,
        'para',
    ], 'Should get the correct maketext array';

    # Try a bad subelement.
    eval { $elem->update_from_pod("=para\n\nfoo\n\n=begin page\n\n") };
    ok $err = $@, 'Catch invalid subelement exception';
    isa_ok $err, 'Bric::Util::Fault::Error::Invalid';
    is $err->error, 'No such subelement "page" at line 5. Did you mean "_page_"?',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No such subelement "[_1]" at line [_2]. Did you mean "[_3]"?',
        'page',
        5,
        '_page_',
    ], 'Should get the correct maketext array';

    # Try repeating a fields not allowed to be repeated.
    eval { $elem->update_from_pod("=begin _pull_quote_\n\n=by\n\nFoo\n\n=by\n\n") };
    ok $err = $@, 'Catch non-repeatable field exception';
    isa_ok $err, 'Bric::Util::Fault::Error::Invalid';
    is $err->error,
        'Non-repeatable field "by" appears more than once beginning at '
      . 'line 7. Please remove all but one.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'Non-repeatable field "[_1]" appears more than once beginning at '
      . 'line [_2]. Please remove all but one.',
        'by',
        7,
    ], 'Should get the correct maketext array';

    # Try repeating a default field not allowed to be repeated.
    $para = $elem->get_element->get_data('para');
    ok $para->set_quantifier(0), 'Disallow repeating for paragarphs';
    ok $para->save, 'Save paragraph field type';
    eval { $elem->update_from_pod("=para\n\nfoo\n\n=para\n\n", 'para') };
    ok $err = $@, 'Catch non-repeatable default field exception';
    isa_ok $err, 'Bric::Util::Fault::Error::Invalid';
    is $err->error,
        'Non-repeatable field "para" appears more than once beginning at '
      . 'line 5. Please remove all but one.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'Non-repeatable field "[_1]" appears more than once beginning at '
      . 'line [_2]. Please remove all but one.',
        'para',
        5,
    ], 'Should get the correct maketext array';

    # Allow repeatable paragraphs again.
    ok $para->set_quantifier(1), 'Aallow repeating for paragarphs again';
    ok $para->save, 'Save paragraph field type';

    # Try a bad tag.
    eval { $elem->update_from_pod("=para\n\nfoo\n\n=foo bar\n\n") };
    ok $err = $@, 'Catch bad tag field exception';
    isa_ok $err, 'Bric::Util::Fault::Error::Invalid';
    is $err->error,
        'Unknown tag "=foo bar" at line 5.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'Unknown tag "[_1]" at line [_2].',
        '=foo bar',
        5,
    ], 'Should get the correct maketext array';

    # Try without a related story.
    (my $strip_rel = $self->pod_output) =~ s/^=related_story_uuid\s+\S+\n\n//;
    ok $elem->update_from_pod($strip_rel), 'Parse POD without a related story';
    is $elem->get_related_instance_id, undef, 'Related ID should be undef';

    # Try without a related media.
    $strip_rel =~ s/^=related_media_uuid\s+\S+\n\n//;
    ok $elem->update_from_pod($strip_rel), 'Parse POD without a related media';
    is $elem->get_related_media_id, undef, 'Related ID should be undef';

    # Try with a related_story_id.
    ok $elem->update_from_pod("=related_story_id $rel_story_id\n\n$strip_rel"),
        'Parse POD with related_story_id';
    is $elem->get_related_instance_id, $rel_story_id,
        'Related story ID should be set again';

    # Try with a related_media_id.
    ok $elem->update_from_pod("=related_media_id $rel_media_id\n\n$strip_rel"),
        'Parse POD with related_media_id';
    is $elem->get_related_media_id, $rel_media_id,
        'Related media ID should be set again';

    # Try with related_story_uri.
    ok $elem->update_from_pod("=related_story_uri $rel_story_uri\n\n$strip_rel"),
        'Parse POD with related_story_uri';
    is $elem->get_related_instance_id, $rel_story_id,
        'Related story ID should be correct';

    # Try with related_media_uri.
    ok $elem->update_from_pod("=related_media_uri $rel_media_uri\n\n$strip_rel"),
        'Parse POD with related_media_uri';
    is $elem->get_related_media_id, $rel_media_id,
        'Related media ID should be correct';

    # Try with related_story_url.
    my $rel_story_url = "http://www.example.com$rel_story_uri";
    ok $elem->update_from_pod("=related_story_url $rel_story_url\n\n$strip_rel"),
        'Parse POD with related_story_url';
    is $elem->get_related_instance_id, $rel_story_id,
        'Related story ID should be correct';

    # Try with related_media_url.
    my $rel_media_url = "http://www.example.com$rel_media_uri";
    ok $elem->update_from_pod("=related_media_url $rel_media_url\n\n$strip_rel"),
        'Parse POD with related_media_url';
    is $elem->get_related_media_id, $rel_media_id,
        'Related media ID should be correct';

    # Try a bogus story site.
    $rel_story_url = "http://www.nosuchexample.com$rel_story_uri";
    eval {
        $elem->update_from_pod("=related_story_url $rel_story_url\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid site exception';
    is $err->error,
        'No such site "www.nosuchexample.com" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No such site "[_1]" at line [_2].',
        'www.nosuchexample.com',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus media site.
    $rel_media_url = "http://www.nosuchexample.com$rel_media_uri";
    eval {
        $elem->update_from_pod("=related_media_url $rel_media_url\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid site exception';
    is $err->error,
        'No such site "www.nosuchexample.com" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No such site "[_1]" at line [_2].',
        'www.nosuchexample.com',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus story URL.
    $rel_story_url = 'http://www.example.com/foo/bar/bat/';
    eval {
        $elem->update_from_pod("=related_story_url $rel_story_url\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid site URI exception';
    is $err->error,
        'No such URI "/foo/bar/bat/" in site "www.example.com" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No such URI "[_1]" in site "[_2]" at line [_3].',
        '/foo/bar/bat/',
        'www.example.com',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus media URL.
    $rel_media_url = 'http://www.example.com/foo/bar/bat.txt';
    eval {
        $elem->update_from_pod("=related_media_url $rel_media_url\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid site URI exception';
    is $err->error,
        'No such URI "/foo/bar/bat.txt" in site "www.example.com" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No such URI "[_1]" in site "[_2]" at line [_3].',
        '/foo/bar/bat.txt',
        'www.example.com',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus story ID.
    eval {
        $elem->update_from_pod("=related_story_id -1\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid ID exception';
    is $err->error,
        'No story document found for ID "-1" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No story document found for ID "[_1]" at line [_2].',
        '-1',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus media ID.
    eval {
        $elem->update_from_pod("=related_media_id -1\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid ID exception';
    is $err->error,
        'No media document found for ID "-1" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No media document found for ID "[_1]" at line [_2].',
        '-1',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus story UUID.
    eval {
        $elem->update_from_pod("=related_story_uuid -1\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid UUID exception';
    is $err->error,
        'No story document found for UUID "-1" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No story document found for UUID "[_1]" at line [_2].',
        '-1',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus media UUID.
    eval {
        $elem->update_from_pod("=related_media_uuid -1\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid UUID exception';
    is $err->error,
        'No media document found for UUID "-1" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No media document found for UUID "[_1]" at line [_2].',
        '-1',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus story URI.
    eval {
        $elem->update_from_pod("=related_story_uri /foo/\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid URI exception';
    is $err->error,
        'No story document found for URI "/foo/" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No story document found for URI "[_1]" at line [_2].',
        '/foo/',
        1,
    ], 'Should get the correct maketext array';

    # Try a bogus media URI.
    eval {
        $elem->update_from_pod("=related_media_uri /foo/\n\n$strip_rel");
    };
    ok $err = $@, 'Catch invalid URI exception';
    is $err->error,
        'No media document found for URI "/foo/" at line 1.',
        'Should get the correct exception message';
    is_deeply $err->maketext, [
        'No media document found for URI "[_1]" at line [_2].',
        '/foo/',
        1,
    ], 'Should get the correct maketext array';
}

sub pod_output {
    return qq{=related_story_uuid $rel_story_uuid

=related_media_uuid $rel_media_uuid

=para

This is a paragraph

=para

Second paragraph

=header

And then...

=para

Third paragraph

=begin _pull_quote_

    =para

    Ask not what your country can do for you.
    \\=Ask what you can do for your country.

    =by

    John F. Kennedy

    =date

    1961-01-20 00:00:00

=end _pull_quote_

=para

圳地在圭圬圯圩夙多夷夸妄奸妃好她如妁字存宇守宅安寺尖屹州帆并年

=para

橿梶鰍潟割喝恰括活渇滑葛褐轄且鰹叶椛樺鞄株兜竃蒲釜鎌噛鴨栢茅萱

=para

뼈뼉뼘뼙뼛뼜뼝뽀뽁뽄뽈뽐뽑뽕뾔뾰뿅뿌뿍뿐뿔뿜뿟뿡쀼쁑쁘쁜쁠쁨쁩삐

=begin _pull_quote_

    =para

    So, first of all, let me assert my firm belief that the only

    \\=thing we have to fear is fear itself -- nameless, unreasoning, unjustified terror which paralyzes needed efforts to convert retreat into advance.

    =by

    Franklin D. Roosevelt

    =date

    1933-03-04 00:00:00

=end _pull_quote_

}
}

sub pod_output_plus_pq {
    return shift->pod_output . q{=begin _pull_quote_

    =para

    That's one small step for man, one giant leap for mankind

    =by

    Neil Armstrong

    =date

    1970-07-20 00:00:00

=end _pull_quote_

}
}

sub pod_output_plus_page {
    return shift->pod_output . q{=begin _page_

    =para

    This is the first paragraph from page one.
    It isn't a long paragraph.
    But it'll do.

    =begin _pull_quote_
  
          =para
  
          Granted, Opera has been available for a while, but it remains the province of a devoted few -- the Amiga of Web browsers.
  
          =by
  
          Chad Dickerson
  
          =date
  
          2004-12-03 00:00:00
  
    =end _pull_quote

=end _page_

}
}
1;

__DATA__
This will be used for the test media file.
