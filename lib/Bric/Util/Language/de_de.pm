package Bric::Util::Language::de_de;

=head1 NAME

Bric::Util::Language::de_de - Bricolage German translation

=head1 VERSION

$Revision: 1.16 $

=cut

our $VERSION = (qw$Revision: 1.16 $ )[-1];

=head1 DATE

$Date: 2004-03-01 21:33:29 $

=head1 SYNOPSIS

  use base qw( Bric );

=head1 DESCRIPTION

Translation to German using Lang::Maketext.

=cut

@ISA = qw(Bric::Util::Language);

use constant key => 'de_de';

%Lexicon =
  (

# Date
   'Jan' => 'Jan',
   'Feb' => 'Feb',
   'Mar' => 'Mär',
   'Apr' => 'Apr',
   'May' => 'Mai',
   'Jun' => 'Jun',
   'Jul' => 'Jul',
   'Aug' => 'Aug',
   'Sep' => 'Sep',
   'Oct' => 'Okt',
   'Nov' => 'Nov',
   'Dec' => 'Dez',
   'Day' => 'Tag',
   'Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec' =>
   'Jan Feb Mär Apr Mai Jun Jul Aug Sep Okt Nov Dez',
   'Month' => 'Monat',

# Time
   'Date'=>'Datum',
   'Hour'=> 'Stunde',
   'Minute'=>'Minute',
   'Second'=>'Sekunde',

#Expiries
   '1 Day' => '1 Tag',
   '3 Days' => '1 Tage',
   '5 Days' => '5 Tage',
   '10 Days' => '10 Tage',
   '15 Days' => '15 Tage',
   '20 Days' => '20 Tage',
   '30 Days' => '30 Tage',
   '45 Days' => '45 Tage',
   '90 Days' => '90 Tage',
   '180 Days' => '180 Tage',
   '1 Year' => '1 Jahr',



# Priotity
   'High'=> 'Hoch',
   'Low'     => 'Niedrig',
   'Medium High' => 'Mittelhoch',
   'Medium Low' => 'Mittelniedrig',
   'Normal'  => 'Normal',

# Areas
   'Alert Type Manager' => 'Meldungstypenverwaltung',
   'Category Manager' => 'Kategorienverwaltung',
   'Contributor Type Manager ' => 'Mitarbeiterartenverwaltung',
   'Current Output Channels' => 'Aktuelle Ausgabekanäle',
   'Destination Manager' => 'Zielverwaltung',
   'Element Manager' => 'Elementverwaltung',
   'Element Type Manager' => 'Elementtypenverwaltung',
   'Group Manager' => 'Gruppenverwaltung',
   'Job Manager' => 'Auftragsverwaltung',
   'Manager' => 'Verwaltung',
   'Media Gallery' => 'Mediengalerie',
   'Media Type Manager' => 'Medientypenverwaltung',
   'Preference Manager ' => 'Einstellungen',
   'Source Manager '           => 'Quellenverwaltung',
   'Source Manager' => 'Quellenverwaltung',
   'User Manager' => 'Benutzerverwaltung',
   'Workflow Manager '         => 'Workflowverwaltung',
   'Workflow Manager' => 'Workflowverwaltung',
   'Workspace for [_1]' => 'Arbeitsbereich für [_1]',

# Interface Objects
   'Checkbox'  => 'Checkbox',
   'Columns' => 'Spalten',
   'Custom Fields' => 'Anwendungsspezifische Felder',
   'Page' => 'Seite',
   'Pulldown'  => 'Auswahl',
   'Radio Buttons' => 'Schaltknöpfe',
   'Rows'      => 'Reihen',
   'Size'      => 'Größe',
   'Template'  => 'Vorlage',
   'Text Area' => 'Textbereich',
   'Workflows' => 'Workflows',
   'Workflow'  => 'Workflow',
   '[_1] Field Text' => 'Text im Feld [_1]',

# General Information
  '&quot;Story&quot;' => '&quot;Beitrag&quot;',
  '&quot;Template&quot;' => '&quot;Vorlage&quot;',
  'ADMIN' => 'VERWALTUNG',
  'ADVANCED SEARCH' => 'FORTGESCHRITTENE SUCHE',
  'Actions' => 'Aktionen',
  'Active' => 'Aktiv',
  'Active Media' => 'Aktive Medien',
  'Active Stories' => 'Aktive Beiträge',
  'Active Templates' => 'Aktive Vorlagen',
  'Ad String' => 'Anzeigentext',
  'Ad String 2' => 'Anzeigentext 2',
  'Ad Strings' => 'Anzeigentexte',
  'Admin' => 'Verwaltung',
  'Advanced Search' => 'Fortgeschrittene Suche',
  'Alert Types' => 'Meldungstypen',
  'All' => 'Alles',
  'All Contributors' => 'Alle Mitarbeiter',
  'All Elements' => 'Alle Elemente',
  'All Groups' => 'Alle Gruppen',
  'Available Groups' => 'Verfügbare Gruppen',
  'Available Output Channels' => 'Verfügbare Ausgabekanäle',
  'Bricolage' => 'Bricolage',
  'By Last' => 'Nach Nachname',
  'By Source name' => 'Nach Quellenname',
  'CONTACTS' => 'ANSPRECHPARTNER',
  'Caption' => 'Titel',
  'Categories' => 'Kategorien',
  'Category' => 'Kategorie',
  'Category Assets' => 'Kategoriengüter',
  'Category Profile' => 'Kategorienprofil',
  'Category tree' => 'Kategorienbaum',
  'Characters' => 'Zeichen',
  'Choose Site' => 'Site wählen',
  'Contacts' => 'Ansprechpartner',
  'Content' => 'Inhalt',
  'Content Type' => 'Inhaltstyp',
  'Contributor Roles' => 'Mitarbeiterrollen',
  'Contributor Type' => 'Mitarbeitertyp',
  'Contributor Type Profile' => 'Mitarbeitertypenprofil',
  'Contributor Types' => 'Mitarbeitertypen',
  'Contributors' => 'Mitarbeiter',
  'Cookie' => 'Cookie',
  'Copy' => 'Kopieren',
  'Cover Date' => 'Titeldatum',
  'Current Groups' => 'Aktuelle Gruppen',
  'Current Note' => 'Aktuelle Notiz',
  'Current Version' => 'Aktuelle Version',
  'Currently Related Story' => 'Aktuell Verwandter Beitrag',
  'DISTRIBUTION' => 'VERTEILUNG',
  'Data Elements' => ' Datenelemente',
  'Default Value' => 'Ausgangswert',
  'Deployed Date' => 'Datum der Ausbringung',
  'Description' => 'Beschreibung',
  'Desk Permissions' => 'B&uuml;rorechte',
  'Desks' => 'B&uuml;ros',
  'Destinations' => 'Ziele',
  'Directory' => 'Verzeichnis',
  'Display Name' => 'Namen Anzeigen',
  'Domain Name' => 'Domainname',
  'Download' => 'Download',
  'Element' => 'Element',
  'Element Profile' => 'Elementprofil',
  'Element Type' => 'Elementtyp',
  'Element Type Profile' => 'Elementtypprofil',
  'Element Types' => 'Elementtypen',
  'Elements' => 'Elemente',
  'Error' => 'Fehler',
  'Event Type' => 'Ereignistyp',
  'Events' => 'Ereignisse',
  'Existing %n' => 'Existierende %n',
  'EXISTING CATEGORIES' => 'EXISTIERENDE KATEGORIEN',
  'EXISTING DESTINATIONS' => 'EXISTIERENDE ZIELE',
  'EXISTING ELEMENT TYPES' => 'EXISTIERENDE ELEMENTTYPEN',
  'EXISTING ELEMENTS' => 'EXISTIERENDE ELEMENTE',
  'EXISTING MEDIA TYPES' => 'EXISTIERENDE MEDIENTYPEN',
  'EXISTING OUTPUT CHANNELS' => 'EXISTIERENDE AUSGABEKANÄLE',
  'EXISTING SOURCES' => 'EXISTIERENDE QUELLEN',
  'EXISTING USERS' => 'EXISTIERENDE BENUTZER',
  'Expiration' => 'Verfall',
  'Expire Date' => 'Verfallsdatum',
  'Extension' => 'Endung',
  'Extensions' => 'Endungen',
  'Fields' => 'Felder',
  'File Name' => 'Dateiname',
  'File Path' => 'Dateipfad',
  'File Type' => 'Dateityp',
  'First' => 'Vorname',
  'First Name' => 'Vorname',
  'First Published' => 'Erste Ver\xc3\xb6ffentlichung',
  'Fixed' => 'Fester URL',
  'Generic' => 'Generisch',
  'Group Type' => 'Gruppentyp',
  'Groups' => 'Gruppen',
  'HTML::Template' => 'HTML::Template',
  'ID' => 'ID',
  'Information' => 'Information',
  'Jobs' => 'Aufträge',
  'Key Name' => 'Schlüsselname',
  'Label' => 'Etikett',
  'Last' => 'Name',
  'Last Name' => 'Nachname',
  'Legal' => 'Rechtsabteilung',
  'Log' => 'Protokoll',
  'Login ' => 'Benutzername',
  'Login and Password' => 'Benutzername und Passwort',
  'MIME Type' => 'MIME-Type',
  'Mason' => 'Mason',
  'Max size' => 'Max. Größe',
  'Maximum size' => 'Maximale Größe',
  'MEDIA' => 'MEDIEN',
  'Media' => 'Medien',
  'Media Profile' => 'Medienprofil',
  'Media Type' => 'Medientyp',
  'Media Type Element' => 'Medientyp',
  'Media Type Profile' => 'Medientypenprofil',
  'Media Types' => 'Medientypen',
  'Member Type  ' => 'Mitgliedstyp',
  'Members' => 'Mitglieder',
  'My Alerts' => 'Meine Meldungen',
  'MY WORKSPACE' => 'MEIN ARBEITSBEREICH',
  'My Workspace' => 'Mein Arbeitsbereich',
  'NAME' => 'NAME',
  'Name' => 'Name',
  'Never' => 'Nie',
  'New' => 'Neu',
  'New Role Name' => 'Name der neuen Rolle',
  'New password' => 'Neues Paﬂwort',
  'No' => 'Nein',
  'No custom fields defined.' => 'Keine anwendungsspezifischen Felder definiert',
  'Normal' => 'Normal',
  'Note' => 'Notiz',
  'Note saved.' => 'Notiz gespeichert.',
  'Notes' => 'Notizen',
  'OS' => 'Betriebssystem',
  'Old password' => 'Altes Passwort',
  'Option, Label' => 'Option, Etikett',
  'Options, Label' => 'Optionen, Etikett',
  'Order' => 'Reihenfolge',
  'Organization' => 'Organisation',
  'Output Channel' => 'Ausgabekanal',
  'Output Channels' => 'Ausgabekanäle',
  'Owner' => 'Besitzer',
  'PREFERENCES' => 'EINSTELLUNGEN',
  'PROPERTIES' => 'EIGENSCHAFTEN',
  'PUBLISHING' => 'VERÖFFENTLICHUNG',
  'Parent Category' => 'Übergeordnete Kategorie',
  'Password' => 'Passwort',
  'Pending ' => 'Im Wartezustand',
  'Pending %n' => '%n im Wartezustand',
  'Position' => 'Position',
  'Post' => 'Post',
  'Pre' => 'Pre',
  'Preferences' => 'Einstellungen',
  'Prefix' => 'Präfix',
  'Previews' => 'Vorschau',
  'Primary Category' => 'Primärkategorie',
  'Primary Output Channel' => 'Primärer Ausgabekanal',
  'Priority' => 'Priorität',
  'Profile' => 'Profil',
  'Properties' => 'Eigenschaften',
  'Publish Date' => 'Veröffentlichungsdatum',
  'Publish Desk' => 'Veröffentlichungsb&uuml;ro',
  'Publishes' => 'Veröffentlichung',
  'Recipients' => 'Empfänger',
  'Related Media' => 'Verwandte Medien',
  'Related Story' => 'Verwandte Beiträge',
  'Repeatable' => 'Wiederholbar',
  'Required' => 'Benötigt',
  'Resources' => 'Ressourcen',
  'Role' => 'Rolle',
  'Roles' => 'Rollen',
  'STORIES' => 'BEITRÄGE',
  'SYSTEM' => 'SYSTEM',
  'Separator String' => 'Trennzeichen',
  'Simple Search' => 'Einfache Suche',
  'Site Profile' => 'Siteprofil',
  'Sites' => 'Sites', 
  'Site'  => 'Site',
  'Slug' => 'Kurzname',
  'Source' => 'Quelle',
  'Source Profile' => 'Quellenprofil',
  'Source name' => 'Quellenname',
  'Sources' => 'Quellen',
  'Start Desk' => 'Anfangsb&uuml;ro',
  'Statistics' => 'Statistiken',
  'STORY' => 'BEITRAG',
  'Story' => 'Beitrag',
  'Story Type' => 'Beitragstyp',
  'Story Type Element' => 'Beitragstyp',
  'Subelements' => 'Subelemente',
  'Teaser' => 'Kurzumschreibung',
  'TEMPLATE' => 'VORLAGE',
  'Template Name' => 'Vorlagenname',
  'Template Type' => 'Vorlagentyp',
  'Text box' => 'Textfeld',
  'Title' => 'Titel',
  'Trail' => 'Protokoll',
  'Type' => 'Typ',
  'URI' => 'URI',
  'URL' => 'URL',
  'Username' => 'Benutzername',
  'Users' => 'Benutzer',
  'Value Name' => 'Wertname',
  'Version' => 'Version',
  'Welcome to Bricolage.' => 'Willkommen zu Bricolage',
  'Welcome to [_1].' => 'Willkommen zu [_1]',
  'Words' => 'Worte',
  'Workflow Permissions' => 'Workflowrechte',
  'Year' => 'Jahr',
  'Yes' => 'Ja',
  '_AUTO' => 1,
  'all' => 'alle',
  'one per line' => 'eines pro Zeile',
  'to' => 'für',

# Action Commands

   'Associate' => 'Assoziieren',
   'Add New Field' => 'Neues Feld hinzufügen',
   'Add a New Alert Type' => 'Neuen Meldungstyp hinzufügen',
   'Add a New Category' => 'Neue Kategorie hinzufügen',
   'Add a New Contributor' => 'Neuen Mitarbeiter hinzufügen',
   'Add a New Contributor Type' => 'Neuen Mitarbeitertypen hinzufügen',
   'Add a New Desk' => 'Neues B&uuml;ro hinzufügen',
   'Add a New Destination' => 'Neues Ziel hinzufügen',
   'Add a New Element Type' => 'Neuen Elementtypen hinzufügen',
   'Add a New Element' => 'Neues Element hinzufügen',
   'Add a New Group' => 'Neue Gruppe hinzufügen',
   'Add a New Media Type' => 'Neuen Medientyp hinzufügen',
   'Add a New Output Channel' => 'Neuen Ausgabekanal hinzufügen',
   'Add a New Source' => 'Neue Quelle hinzufügen',
   'Add a New Workflow' => 'Neuen Workflow hinzufügen',
   'Add a New Keyword' => 'Neues Stichwort hinzufügen',
   'Add a New User' => 'Neuen Benutzer hinzufügen',
   'Add to Element' => 'Zum Element hinzufügen',
   'Add to Include' => 'Zum Include hinzufügen',
   'Add' => 'Hinzufügen',
   'Allow multiple' => 'Mehrere zulassen',
   'Burner' => 'Brenner',
   'Check In Assets' => 'Güter einchecken',
   'Check In to Edit' => 'Zur Redaktion einchecken',
   'Check In to Publish' => 'Zur Veröffentlichung einchecken',
   'Check In to' => 'Einchecken zu',
   'Check In' => 'Einchecken',
   'Checkin' => 'Einchecken',
   'Check Out' => 'Auschecken',
   'Checkout' => 'Auschecken',
   'Choose Contributors' => 'Mitarbeiter auswählen',
   'Choose Related Media' => 'Verwandte Medien auswählen',
   'Choose Subelements' => 'Subelemente auswählen',
   'Create a New Category' => 'Neue Kategorie erstellen',
   'Create a New Media' => 'Neues Medium erstellen',
   'Create a New Story' => 'Neuen Beitrag erstellen',
   'Create a New Template' => 'Neue Vorlage erstellen',
   'Delete this Desk from all Workflows' =>
   'Dieses B&uuml;ro aus allen Workflows löschen',
   'Delete this Element' => 'Dieses Element löschen',
   'Delete this Profile' => 'Dieses Profil löschen',
   'Delete' => 'Löschen',
   'Deploy' => 'Ausbringen',
   'Download' => 'Herunterladen',
   'Edit' => 'Editieren',
   'Expire' => 'Verfallen lassen',
   'Find Media' => 'Medien Finden',
   'Find Stories' => 'Beiträge Finden',
   'Find Templates' => 'Vorlagen Finden',
   'Manage' => 'Verwalten',
   'Move Assets' => 'Güter verschieben',
   'Move to' => 'Verschieben zu',
   'New Media ' => 'Neue Medien ',
   'New Media' => 'Neue Medien',
   'New Story' => 'Neuer Beitrag',
   'New Template' => 'Neue Vorlage',
   'Preview in' => 'Vorschau in',
   'Publish' => 'Veröffentlichen',
   'Relate' => 'In Bezug bringen',
   'Remove' => 'Löschen',
   'Repeat new password' => 'Neues Passwort wiederholen',
   'SEARCH' => 'SUCHEN',
   'SUBMIT' => 'ABSENDEN',
   'Scheduler' => 'Planer',
   'Select Desk' => 'B&uuml;ro wählen',
   'Select Role' => 'Rolle wählen',
   'Select an Event Type' => 'Ereignistyp wählen',
   'Select' => 'Wählen',
   'Sort By' => 'Sortieren nach',
   'Submit' => 'Absenden',
   'Switch Roles' => 'Rollen tauschen',
   'Template Profile' => 'Vorlagenprofil',
   'Template Code' => 'Vorlagencode',
   'Un-Associate' => 'Disassoziieren',
   'Upload a file' => 'Datei hochladen',
   'User Override' => 'Benutzer übergehen',
   'View' => 'Ansehen',
   'Workflow Profile' => 'Workflowprofil',
   'Grant [_1] members permission to access assets in these categories.' =>
     '[_1] Mitgliedern den Zugriff auf Güter dieser Kategorien gewähren.',
   'Grant [_1] members permission to access assets in these workflows.' =>
     '[_1] Mitgliedern den Zugriff auf Güter dieser Workflows gewähren.',
   'Grant [_1] members permission to access assets on these desks.' =>
     '[_1] Mitgliedern den Zugriff auf Güter dieser B&uuml;ros gewähren.',
   'Grant [_1] members permission to access the members of these groups.' =>
     '[_1] Mitgliedern den Zugriff auf Mitglieder dieser Gruppen gewähren.',
   'Grant the members of the following groups permission to access the members of the [_1] group.' =>
     'Mitgliedern der folgenden Gruppen den Zugriff auf Mitglieder der Gruppe [_1] gewähren.',


# System reply messages
  '"[_1]" Elements saved.' => '"[_1]" Elemente gespeichert.',
  '%n Found' => 'Gefundene %n',
  '404 NOT FOUND' => '404 - SEITE NICHT GEFUNDEN',
  'A site with the [_1] "[_2]" already exists' => 'Eine Site mit [_1] "[_2]" existiert bereits',
  'Action profile "[_1]" deleted.' => 'Aktionsprofil "[_1]" gelöscht.',
  'Action profile "[_1]" saved.' => 'Aktionsprofil "[_1]" gespeichert.',
  'Add a New Action' => 'Neue Aktion hinzufügen',
  'Add a New Server' => 'Neuen Server hinzufügen',
  'Alert Type profile "[_1]" deleted.' => 'Benachrichtigungstypprofil "[_1]" gelöscht.',
  'Alert Type profile "[_1]" saved.' => 'Benachrichtigungstypprofil "[_1]" gespeichert.',
  'Alias in Category' => 'Alias in Kategorie',
  'Alias to "[_1]" created and saved.' => 'Alias auf "[_1]" erstellt und gespeichert.',
  'All Types' => 'Alle Typen',
  'An "[_1]" attribute already exists. Please try another name.' => 'Ein Attribut "[_1]" existiert bereits. Bitte versuchen Sie einen anderen Namen.',
  'An active template already exists for the selected output channel, category, element and burner you selected.  You must delete the existing template before you can add a new one.' => 'Für die gewählte Kombination von Ausgabekanal, Kategorie, Element und Burner existiert bereits eine aktive Vorlage. Sie müssen die existierende Vorlage löschen bevor Sie eine neue hinzufügen können.',
  'An error occurred while processing your request:' => 'Beim bearbeiten Ihrer Anfrage ist ein Fehler aufgetreten:',
  'An error occurred.' => 'Es ist ein Fehler aufgetreten.',
  'At least one extension is required.' => 'Mindestens eine Erweiterung ist erforderlich.',
  'Bad element name "[_1]". Did you mean "[_2]"?' => 'Ungültiger Elementname "[_1]". Meinten Sie "[_2]"?',
  'Cannot auto-publish related media "[_1]" because it is checked out.' => 'Kann verwandtes Medium "[_1]" nicht automatisch veröffentlichen, da es ausgecheckt ist.',
  'Cannot auto-publish related story "[_1]" because it is checked out.' => 'Kann verwandten Beitrag "[_1]" nicht automatisch veröffentlichen, da er ausgecheckt ist.',
  'Cannot both delete and make primary a single output channel.' => 'Kann nicht gleichzeitig einen einzelnen primären Ausgabekanal löschen und anlegen.',
  'Cannot cancel "[_1]" because it is currently executing.' => 'Kann "[_1]" nicht abbrechen, da es zur Zeit ausgeführt wird.',
  'Cannot create an alias to a media in the same site.' => 'Kann keinen Alias auf ein Medium in der selben Site legen.',
  'Cannot create an alias to a story in the same site.' => 'Kann keinen Alias auf einen Beitrag in der selben Site legen.',
  'Cannot move "[_1]" asset "[_2]" while it is checked out' => 'Kann "[_1]" Gut "[_2]" nicht verschieben solange es ausgecheckt ist.',
  'Cannot preview asset "[_1]" because there are no Preview Destinations associated with its output channels.' => 'Kann Gut "[_1]" nicht vorführen, da keine Vorschauziele mit seinem Ausgabekanal verknüpft sind.',
  'Cannot publish asset "[_1]" to "[_2]" because there are no Destinations associated with this output channel.' => 'Kann Gut "[_1]" nicht nach "[_2]" veröffentlichen, da keine Ziele mit diesem Ausgabekanal verknöpft sind.',
  'Cannot publish checked-out media "[_1]"' => 'Kann ausgechecktes Medium "[_1]" nicht veröffentlichen.',
  'Cannot publish checked-out story "[_1]"' => 'Kann ausgecheckten Beitrag "[_1]" nicht veröffentlichen.',
  'Cannot publish media "[_1]" because it is checked out.' => 'Kann Medium "[_1]" nicht veröffentlichen, da es ausgecheckt ist.',
  'Cannot publish story "[_1]" because it is checked out.' => 'Kann Beitrag "[_1]" nicht veröffentlichen, da dieser ausgecheckt ist.',
  'Cascade into Subcategories' => 'Subkategorien einbinden',
  'Category "[_1]" added.' => 'Kategorie "[_1]" hinzugefügt.',
  'Category "[_1]" cannot be deleted.' => 'Kategorie "[_1]" kann nicht gelöscht werden.',
  'Category "[_1]" disassociated.' => 'Kategorie "[_1]" disassoziiert.',
  'Category Permissions' => 'Kategorierechte',
  'Category URI' => 'URI der Kategorie',
  'Category profile "[_1]" and all its categories deleted.' => 'Kategorieprofil "[1]" und alle zugehörigen Kategorien gelöscht.',
  'Category profile "[_1]" deleted.' => 'Kategorieprofil "[_1]" gelöscht.',
  'Category profile "[_1]" saved.' => 'Kategorieprofil "[_1]" gespeichert.',
  'Changes not saved: permission denied.' => 'Änderungen nicht gespeichert: unerlaubter Zugriff.',
  'Check In to [_1]' => 'Nach [_1] einchecken',
  'Choose a Related Story' => 'Verwandten Beitrag auswählen',
  'Contributor "[_1]" disassociated.' => 'Mitarbeiter "[_1]" disassoziiert.',
  'Contributor Type Manager' => 'Mitarbeitertypverwaltung',
  'Contributor profile "[_1]" deleted.' => 'Mitarbeiterprofil "[_1]" gelöscht.',
  'Contributor profile "[_1]" saved.' => 'Mitarbeiterprofil "[_1]" gespeichert.',
  'Contributors disassociated.' => 'Mitarbeiter disassoziiert.',
  'Copy Resources' => 'Ressourcen kopieren',
  'Cover Date incomplete.' => 'Titeldatum fehlerhaft.',
  'Delete this Category and All its Subcategories' => 'Diese Kategorie und alle Subkategorien löschen',
  'Deployed Version' => 'Ausgebrachte Version',
  'Desk profile "[_1]" deleted from all workflows.' => 'B&uuml;roprofil "[_1]" aus allen Workflows gelöscht.',
  'Destination' => 'Ziel',
  'Destination Profile' => 'Zielprofil',
  'Destination not specified' => 'Ziel nicht angegeben',
  'Destination profile "[_1]" deleted.' => 'Zielprofil "[_1]" gelöscht.',
  'Destination profile "[_1]" saved.' => 'Zielprofil "[_1]" gespeichert.',
  'Directory name "[_1]" contains invalid characters. Please try a different directory name.' => 'Der Verzeichnisname "[_1]" enthält ungültige Zeichen. Verwenden Sie bitte einen anderen Verzeichnisnamen.',
  'Distributing files.' => 'Dateien werden verteilt.',
  'Document Root' => 'Dokumenten-Stammverzeichnis',
  'Element "[_1]" deleted.' => 'Element "[_1]" gelöscht.',
  'Element "[_1]" saved.' => 'Element "[_1]" gespeichert.',
  'Element Type profile "[_1]" deleted.' => 'Elementtypprofil "[_1]" gelöscht.',
  'Element Type profile "[_1]" saved.' => 'Elementtypprofil "[_1]" gespeichert.',
  'Expire Date incomplete.' => 'Verfallsdatum unvollständig.',
  'Extension "[_1]" ignored.' => 'Erweiterung "[_1]" ignoriert.',
  'Extension "[_1]" is already used by media type "[_2]".' => 'Erweiterung "[_1]" wird bereits vom Medientyp "[_2]" verwendet.',
  'FTP' => 'FTP',
  'Field "[_1]" appears more than once but it is not a repeatable element.  Please remove all but one.' => 'Das Feld "[_1]" erscheint mehrmals, ist aber ein nicht wiederholbares Element. Bitte entfernen Sie alle bis auf eines.',
  'Field profile "[_1]" deleted.' => 'Feldprofil "[_1]" gelöscht.',
  'Field profile "[_2]" saved.' => 'Feldprofil "[_1]" gespeichert.',
  'File System' => 'Dateisystem',
  'Find Media To Alias' => 'Als Alias geeignete Medien finden',
  'Find Story To Alias' => 'Als Alias geeignete Beiträge finden',
  'Find a media to alias' => 'Als Alias geeignetes Medium finden',
  'Find a story to alias' => 'Als Alias geeigneten Beitrag finden',
  'From' => 'Von',
  'Group Label' => 'Gruppenkennzeichen',
  'Group Memberships' => 'Gruppenmitgliedschaften',
  'Group cannot be deleted.' => 'Gruppe kann nicht gelöscht werden.',
  'Group profile "[_1]" deleted.' => 'Gruppenprofil "[_1]" gelöscht.',
  'Group profile "[_1]" saved.' => 'Gruppenprofil "[_1]" gespeichert.',
  'Hi [_1]!' => 'Hallo [_1]!',
  'Host Name' => 'Hostname',
  'Invalid date value for "[_1]" field.' => 'Ungültiger Datumswert für Feld "[_1]".',
  'Invalid page request' => 'Ungültige Seitenanfrage',
  'Invalid password. Please try again.' => 'Passwort ungültig. Bitte versuchen Sie es nochmal.',
  'Invalid username or password. Please try again.' => 'Benutzername oder Passwort ungültig. Bitte versuchen Sie es nochmal.',
  'Job profile "[_1]" deleted.' => 'Auftragsprofil "[_1]" gelöscht.',
  'Job profile "[_1]" saved.' => 'Auftragsprofil "[_1]" gespeichert.',
  'Keyword' => 'Stichwort',
  'Keyword Manager' => 'Stichwortverwaltung',
  'Keyword Profile' => 'Stichwortprofil',
  'Keywords' => 'Stichworte',
  'Keywords saved.' => 'Stichworte gespeichert.',
  'Login "[_1]" contains invalid characters.' => 'Benutzername "[_1]" enthält ungültige Zeichen.',
  'Login "[_1]" is already in use. Please try again.' => 'Benutzername "[_1]" ist bereits vergeben. Bitte wählen Sie einen anderen Namen.',
  'Login cannot be blank. Please enter a login.' => 'Benutzername darf nicht leer sein. Bitte tragen Sie einen Benutzernamen ein.',
  'Login must be at least [_1] characters.' => 'Benutzername muß mindestens [_1] Zeichen lang sein.',
  'MEDIA FOUND' => 'GEFUNDENE MEDIEN',
  'Media "[_1]" check out canceled.' => 'Checkout des Mediums "[_1]" abgebrochen.',
  'Media "[_1]" created and saved.' => 'Medium "[_1]" erzeugt und gespeichert.',
  'Media "[_1]" deleted.' => 'Medium "[_1]" gelöscht.',
  'Media "[_1]" published.' => 'Medium "[_1]" veröffentlicht.',
  'Media "[_1]" reverted to V.[_2]' => 'Medium "[_1]" auf Version "[_2]" zurückgefallen',
  'Media "[_1]" saved and checked in to "[_2]".' => 'Medium "[_1]" gespeichert und nach "[_2]" eingecheckt.',
  'Media "[_1]" saved and moved to "[_2]".' => 'Medium "[_1]" gespeichert und nach "[_2]" verschoben.',
  'Media "[_1]" saved and shelved.' => 'Medium "[_1]" gespeichert und archiviert.',
  'Media "[_1]" saved.' => 'Medium "[_1]" gespeichert.',
  'Media Type profile "[_1]" deleted.' => 'Medientypprofil "[_1]" gelöscht.',
  'Media Type profile "[_1]" saved.' => 'Medientypprofil "[_1]" gespeichert.',
  'Move Method' => 'Verschiebungsmethode',
  'Move to Desk' => 'Verschieben zum B&uuml;ro',
  'Name is required.' => 'Name wird benötigt.',
  'Needs to be Deployed' => 'Muß ausgebracht werden',
  'Needs to be Published' => 'Muß veröffentlicht werden',
  'New Alias' => 'Neuer Alias',
  'New passwords do not match. Please try again.' => 'Die neuen Passwörter stimmen nicht überein. Bitte versuchen Sie es nochmal.',
  'No Alias' => 'Kein Alias',
  'No alert types were found' => 'Keine Benachrichtigungstypen gefunden',
  'No categories were found' => 'Keine Kategorien gefunden',
  'No contributor types were found' => 'Keine Mitarbeitertypen gefunden',
  'No contributors defined' => 'Keine Mitarbeiter definiert',
  'No contributors defined.' => 'Keine Mitarbeiter definiert.',
  'No destinations were found' => 'Keine Ziele gefunden',
  'No element types were found' => 'Keine Elementtypen gefunden',
  'No elements are present.' => 'Keine Elemente vorhanden.',
  'No elements have been added.' => 'Keine Elemente hinzugefügt.',
  'No elements were found' => 'Keine Elemente gefunden',
  'No existing notes.' => 'Keine Notizen vorhanden.',
  'No file associated with media "[_1]". Skipping.' => 'Keine Datei mit Medium "[_1]" verknüpft, wird übersprungen.',
  'No file has been uploaded' => 'Es wurde keine Datei hochgeladen',
  'No groups were found' => 'Keine Gruppen gefunden',
  'No jobs were found' => 'Keine Aufträge gefunden',
  'No keywords defined.' => 'Keine Stichworte definiert.',
  'No media file is associated with asset "[_1]", so none will be distributed.' => 'Keine Mediendatei mit Gut "[_1]" verknüpft, entsprechend wird keine verteilt.',
  'No media types were found' => 'Keine Medientypen gefunden',
  'No media were found' => 'Keine Medien gefunden',
  'No output channels were found' => 'Keine Ausgabekanäle gefunden',
  'No output to preview.' => 'Keine Ausgabe zur Vorschau',
  'No related Stories' => 'Keine verwandten Beiträge',
  'No servers were found' => 'Keine Server gefunden',
  'No sources were found' => 'Keine Quellen gefunden',
  'No stories were found' => 'Keine Beiträge gefunden',
  'No templates were found' => 'Keine Vorlagen gefunden',
  'No users were found' => 'Keine Benutzer gefunden',
  'No workflows were found' => 'Keine Workflows gefunden',
  'Note: Container element "[_1]" removed in bulk edit but will not be deleted.' => 'Achtung: Containerelement "[_1]" im Blockeditor entfernt, wird aber nicht gelöscht.',
  'Note: Data element "[_1]" is required and cannot be completely removed.  Will delete all but one.' => 'Achtung: Datenelement "[_1]" wird benötigt und kann nicht vollständig entfernt werden. Lösche alle bis auf eines.',
  'Object Group Permissions' => 'Objektgruppenrechte',
  'Or Pick a Type' => 'Oder wählen Sie einen Typ',
  'Output Channel profile "[_1]" deleted.' => 'Ausgabenkanalprofil "[_1]" gelöscht.',
  'Output Channel profile "[_1]" saved.' => 'Ausgabenkanalprofil "[_1]" gespeichert.',
  'PENDING JOBS' => 'Aufträge im Wartezustand',
  'Parent cannot choose itself or its child as its parent. Try a different parent.' => 'Übergeordnete Kategorie kann nicht sich oder eine Unterkategorie als übergeordnet auswählen. Verwenden Sie bitte eine andere übergeordnete Kategorie.',
  'Password contains illegal preceding or trailing spaces. Please try again.' => 'Passwort enthält unerlaubte Leerzeichen an Anfang oder Ende. Bitte versuchen Sie es nochmal.',
  'Passwords cannot have spaces at the beginning!' => 'Passwörter dürfen keine Leerzeichen am Anfang enthalten!',
  'Passwords cannot have spaces at the end!' => 'Passwörter dürfen keine Leerzeichen am Ende enthalten!',
  'Passwords do not match!  Please re-enter.' => 'Passwörter stimmen nicht überein! Bitte erneut eingeben.',
  'Passwords must be at least [_1] characters!' => 'Passwörter müssen mindestens [_1] Zeichen lang sein!',
  'Passwords must match!' => 'Die Passwörter müssen übereinstimmen!',
  'Permission Denied' => 'Zugriff verweigert',
  'Permission to checkout "[_1]" denied.' => 'Checkout von "[_1]" mangels Rechten verweigert.',
  'Permission to delete "[_1]" denied.' => 'Löschen von "[_1]" mangels Rechten verweigert.',
  'Permissions saved.' => 'Rechte gespeichert',
  'Please check the URL and try again. If you feel you have reached this page as a result of a server error or other bug, please notify the server administrator. Be sure to include as much detail as possible, including the type of browser, operating system, and the steps leading up to your arrival here.' => 'Bitte überprüfen Sie den URL und versuchen Sie es erneut. Wenn Sie der Meinung sind, daß Sie diese Seite aufgrund eines Serverfehlers oder eines anderen Problems angezeigt bekommen, verständigen Sie bitte den Administrator des Servers. Geben Sie bitte soviel Details wie möglich an, inklusive dem Browsertyp, Betriebssystem und wie Sie an diese Seite gekommen sind.',
  'Please click [_1]here[_2] to start.' => 'Bitte [_1]hier[_2] klicken zum Start.',
  'Please log in:' => 'Bitte einloggen:',
  'Please select a primary category.' => 'Bitte eine Primärkategorie auswählen.',
  'Please select a story type.' => 'Bitte einen Beitragstyp auswählen.',
  'Preference "[_1]" updated.' => 'Einstellung "[_1]" aktualisiert.',
  'Problem adding "[_1]"' => 'Problem beim Hinzufügen von "[_1]".',
  'Problem deleting "[_1]"' => 'Problem beim Löschen von "[_1]".',
  'Published Version' => 'Veröffentlichte Version',
  'Redirecting to preview.' => 'Umleitung zur Vorschau.',
  'Related Media to Alias' => 'Zum Alias geeignete verwandte Medien',
  'Related Story to Alias' => 'Zum Alias geeignete verwandte Beiträge',
  'STORY INFORMATION' => 'BEITRAGSINFORMATION',
  'Scheduled Time' => 'Geplante Zeit',
  'Select Alias' => 'Alias wählen',
  'Select Categories' => 'Kategorie wählen',
  'Separator Changed.' => 'Separator geändert.',
  'Server profile "[_1]" deleted.' => 'Serverprofil "[_1]" gelöscht.',
  'Server profile "[_1]" saved.' => 'Serverprofil "[_1]" gespeichert.',
  'Servers' => 'Server',
  'Site "[_1]" requires a primary output channel.' => 'Site "[_1]" benötigt einen primären Ausgabekanal',
  'Site profile "[_1]" deleted.' => 'Siteprofil "[_1]" gelöscht.',
  'Site profile "[_1]" saved.' => 'Siteprofil "[_1]" gespeichert.',
  'Slug must conform to URI character rules.' => 'Kurzname muß den Regeln für Zeichen innerhalb eines URIs entsprechen.',
  'Sort Name' => 'Name der Sortierung',
  'Source profile "[_1]" deleted.' => 'Quellenprofil "[_1]" gelöscht.',
  'Source profile "[_1]" saved.' => 'Quellenprofil "[_1]" gespeichert.',
  'Status' => 'Status',
  'Stories' => 'Beiträge',
  'Stories in this category' => 'Beiträge in dieser Kategorie',
  'Story "[_1]" check out canceled.' => 'Checkout des Beitrags "[_1]" abgebrochen.',
  'Story "[_1]" created and saved.' => 'Beitrag "[_1]" erstellt und gesichert.',
  'Story "[_1]" deleted.' => 'Beitrag "[_1]" gelöscht.',
  'Story "[_1]" published.' => 'Beitrag "[_1]" veröffentlicht.',
  'Story "[_1]" reverted to V.[_2].' => 'Beitrag "[_1]" auf Version [_2] zurückgefallen.',
  'Story "[_1]" saved and checked in to "[_2]".' => 'Beitrag "[_1]" gesichert und nach "[_2]" eingecheckt.',
  'Story "[_1]" saved and moved to "[_2]".' => 'Beitrag "[_1]" gesichert und nach "[_2]" verschoben.',
  'Story "[_1]" saved and shelved.' => 'Beitrag "[_1]" gesichert und archiviert.',
  'Story "[_1]" saved.' => 'Beitrag "[_1]" gesichert.',
  'Template "[_1]" check out canceled.' => 'Checkout der Vorlage "[_1]" abgebrochen.',
  'Template "[_1]" deleted.' => 'Vorlage "[_1]" gelöscht.',
  'Template "[_1]" saved and checked in to "[_2]".' => 'Vorlage "[_1]" gespeichert und nach "[_2]" eingecheckt.',
  'Template "[_1]" saved and moved to "[_2]".' => 'Vorlage "[_1]" gespeichert und nach "[_2]" verschoben.',
  'Template "[_1]" saved and shelved.' => 'Vorlage "[_1]" gespeichert und archiviert.',
  'Template "[_1]" saved.' => 'Template "[_1]" gespeichert.',
  'Template Includes' => 'Vorlagen-Includes',
  'Template compile failed: [_1]' => 'Compilierung der Vorlage gescheitert: [_1]',
  'Template deployed.' => 'Vorlage ausgebracht',
  'Templates' => 'Vorlagen',
  'Templates Found' => 'Gefundene Vorlagen',
  'Text to search' => 'Suchbegriff',
  'The URI "[_1]" is not unique. Please change the cover date, output channels, category, or file name as necessary to make the URIs unique.' => 'Der URI "[_1]"  ist nicht eindeutig. Bitte ändern Sie Titeldatum, Ausgabekanal, Kategorie oder Dateinamen wie benötigt um den URI eindeutig zu machen.',
  'The URL you requested, <b>[_1]</b>, was not found on this server' => 'Der von Ihnen angeforderte URL, <b>[_1]</b>, konnte auf diesem Server nicht gefunden werden',
  'The name "[_1]" is already used by another Alert Type.' => 'Der Name "[_1]" wird bereits für einen anderen Benachrichtigungstyp verwendet.',
  'The name "[_1]" is already used by another Desk.' => 'Der Name "[_1]" wird bereits von einem anderen B&uuml;ro verwendet.',
  'The name "[_1]" is already used by another Destination.' => 'Der Name "[_1]" wird bereits für ein anderes Ziel verwendet',
  'The name "[_1]" is already used by another Element Type.' => 'Der Name "[_1]" wird bereits für einen anderen Elementtypen verwendet.',
  'The name "[_1]" is already used by another Media Type.' => 'Der Name "[_1]" wird bereits für einen anderen Medientyp verwendet.',
  'The name "[_1]" is already used by another Output Channel.' => 'Der Name "[_1]" wird bereits für einen anderen Ausgabekanal verwendet.',
  'The name "[_1]" is already used by another Server in this Destination.' => 'Der Name "[_1]" wird bereits für einen anderen Server in diesem Ziel verwendet',
  'The name "[_1]" is already used by another Source.' => 'Der Name "[_1]" wird bereits von einen anderen Quelle verwendet.',
  'The name "[_1]" is already used by another Workflow.' => 'Der Name "[_1]" wird bereits von einem anderen Workflow verwendet.',
  'The slug can only contain alphanumeric characters (A-Z, 0-9, - or _)!' => 'Der Kurzname darf nur alphanumerische Zeichen (A-Z, 0-9, - oder _) enthalten!',
  'The slug, category and cover date you selected would have caused this story to have a URI conflicting with that of story [_1].' => 'Die von Ihnen gewählten Werte für Kurzname, Kategorie und Titeldatum hätten diesem Beitrag einen URI gegeben, der mit dem des Beitrags [_1] kollidiert.',
  'This day does not exist! Your day is changed to the' => 'Dieser Tag existiert nicht! Tag wurde geändert auf',
  'This story has not been assigned to a category.' => 'Dieser Beitrag wurde noch keiner Kategorie zugeordnet.',
  'To' => 'Zu',
  'URI "[_1]" is already in use. Please try a different directory name or parent category.' => 'Der URI "[_1]" ist bereits in Gebrauch. Bitte verwenden Sie einen anderen Verzeichnisnamen oder Kategorie.',
  'Un-relate' => 'Bezug auflösen',
  'User profile "[_1]" deleted.' => 'Benutzerprofil "[_1]" gelöscht.',
  'User profile "[_1]" saved.' => 'Benutzerprofil "[_1]" gespeichert.',
  'Usernames must be at least 6 characters!' => 'Benutzernamen müssen mindestens 6 Zeichen lang sein!',
  'Using Bricolage without JavaScript can result in corrupt data and system instability. Please activate JavaScript in your browser before continuing.' => 'Bricolage ohne JavaScript zu benutzen kann zu Datenkorruption und Systeminstabilität führen. Bitte aktivieren Sie JavaScript in Ihrem Browserbevor Sie fortfahren.',
  'V.' => 'V.',
  'Value of [_1] cannot be empty' => 'Wert von [_1] darf nicht leer sein',
  'Warning! Bricolage is designed to run with JavaScript enabled.' => 'Warnung! Bricolage benötigt zum Betrieb aktiviertes JavaScript.',
  'Warning! State inconsistent: Please use the buttons provided by the application rather than the \'Back\'/\'Forward\' buttons.' => 'Warnung! Inkonsistenter Zustand: Bitte verwenden Sie die von der Applikation zur Verfügung gestellten Buttons anstelle der \'Back\'/\'Forward\' (\'Zurück\'/\'Vor\') Knöpfe des Browsers.',
  'Warning:  Use of element\'s \'name\' field is deprecated for use with element method \'get_container\'.  Please use the element\'s \'key_name\' field instead.' => 'Warnung: von der Verwendung des Feldes \'Name\' des Elementes mit der Methode \'get_container\' wird abgeraten. Verwenden Sie statt dessen bitte das Feld \'key_name\' des Elementes.',
  'Warning:  Use of element\'s \'name\' field is deprecated for use with element method \'get_data\'.  Please use the element\'s \'key_name\' field instead.' => 'Warnung: von der Verwendung des Feldes \'Name\' des Elementes mit der Methode \'get_data\' wird abgeraten. Verwenden Sie statt dessen bitte das Feld \'key_name\' des Elementes.',
  'Warning: object "[_1]" had no associated desk.  It has been assigned to the "[_2]" desk.' => 'Warnung: das Objekt "[_1]" ist mit keinem B&uuml;ro verknüpft. Es wurde dem B&uuml;ro "[_2]" zugeordnet.',
  'Warning: object "[_1]" had no associated workflow.  It has been assigned to the "[_2]" workflow.' => 'Warnung: das Objekt "[_1]" ist mit keinem Workflow verknüpft. Es wurde dem Workflow "[_2]" zugeordnet.',
  'Warning: object "[_1]" had no associated workflow.  It has been assigned to the "[_2]" workflow. This change also required that this object be moved to the "[_3]" desk.' => 'Warnung: das Objekt "[_1]" ist mit keinem Workflow verknüpft. Es wurde dem Workflow "[_2]" zugeordnet. Diese Änderung bedingt, daß das Objekt zusätzlich dem B&uuml;ro "[_3]" zugeordnet wird.',
  'Welcome to [_1]' => 'Willkommen zu [_1]',
  'Workflow profile "[_1]" deleted.' => 'Workflowprofil "[_1]" gelöscht.',
  'Writing files to "[_1]" Output Channel.' => 'Dateien werden auf den Ausgabekanal "[_1]" geschrieben.',
  'You are about to permanently delete items! Do you wish to continue?' => 'Sie sind dabei, Gegenstände permanent zu löschen! Wollen Sie damit fortfahren?',
  'You cannot remove all Sites.' => 'Sie können nicht alle Sites löschen.',
  'You have not been granted <b>[_1]</b> access to the <b>[_2]</b> [_3]' => 'Ihnen wurde kein <b>[_1]</b> Zugriff auf <b>[_2]</b> [_3] gewährt',
  'You must be an administrator to use this function.' => 'Sie müssen ein Administrator sein um diese Funktion zu benutzen.',
  'You must select an Element or check the &quot;Generic&quot; check box.' => 'Sie müssen ein Element auswählen oder die &quot;Gen√©ric&quot; checkbox aktivieren.',
  'You must select an Element.' => 'Sie müssen ein Element auswählen',
  'You must supply a unique name for this role!' => 'Sie müssen einen eindeutigen Namen für diese Rolle angeben!',
  'You must supply a value for ' => 'Bitte geben Sie einen Wert an für ',
  '[_1] recipients changed.' => '[_1] Empfänger geändert.',
  '[quant,$quant,Contributors] [_1] [quant,$quant,disassociated].' => '[quant,$quant,Mitarbeiter] [_1] [quant,$quant,disassoziiert].',
  '[quant,_1,Alert] acknowledged.' => '[quant,_1,Benachrichtigung,Benachrichtigungen] bestätigt.',
  '[quant,_1,Contributor] "[_2]" associated.' => '[quant,_1,Mitarbeiter] "[_2]" assoziiert.',
  '[quant,_1,Template] deployed.' => '[quant,_1,Vorlage,Vorlagen] ausgebracht.',
  '[quant,_1,media,media] published.' => '[quant,_1,Medium,Medien] veröffentlicht',
  '[quant,_1,story,stories] published.' => '[quant,_1,Beitrag,Beiträge] veröffentlicht',
  'contains illegal characters!' => ' enthält unzulässige Zeichen!',
   '_AUTO' => 1,
  );

=begin comment

I'll gladly accept suggestions concerning some of the more obscure words,
such as
Alert == Benachrichtigung
Media == Medium
Contributor == Mitarbeiter
Assets == Güter
Also, I'm certain there are plenty of typos and other errors in this
translation, which I'll gradually try to remove. I'd be very grateful for
any error pointers.

To Translate:


=end comment

=cut

1;

__END__

=head1 AUTHOR

Thorsten Biel <T.Biel@ITadmin.com>

=head1 SEE ALSO

NONE

=cut

