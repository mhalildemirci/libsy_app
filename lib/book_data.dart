import 'package:flutter/material.dart';

class BookDataPage extends StatelessWidget {
  final Map<String, Map<String, String>> bookData = {
    'assets/pics/beyond good and evil.jpg': {
      'title': 'Beyond Good And Evil',
      'author': 'Friedrich Nietzsche'
    },
    'assets/pics/The Master of the World.jpg': {
      'title': 'The Master of the World',
      'author': 'Jules Verne'
    },
    'assets/pics/ay pesinde.jpg': {
      'title': 'AY Peşinde',
      'author': 'Refik Halid Karay'
    },
    'assets/pics/2 Poems.jpg': {
      'title': 'Oscar Wilde Poems',
      'author': 'Oscar Wilde'
    },
    'assets/pics/11 Intentions.jpg': {
      'title': 'Intentions',
      'author': 'Oscar Wilde'
    },
    'assets/pics/A Connecticut Yankee in King Arthurs Court.jpg': {
      'title': 'A Connecticut Yankee in King Arthurs Court',
      'author': 'Mark Twain'
    },
    'assets/pics/a modest proposal.jpg': {
      'title': 'A Modest Proposal',
      'author': 'Jonathan Swift'
    },
    'assets/pics/A Short History of the World.jpg': {
      'title': 'A Short History of the World',
      'author': 'HG Wells'
    },
    'assets/pics/a tale of two cities.jpg': {
      'title': 'Book',
      'author': 'Author'
    },
    'assets/pics/A Tangled Tale.jpg': {
      'title': 'A Tangled Tale',
      'author': 'Lewis Caroll'
    },
    'assets/pics/a treatise of human nature.jpg': {
      'title': 'A Treatise of Human Nature ',
      'author': 'David Hume'
    },
    'assets/pics/a vital problem of married.jpg': {
      'title': 'A Vital Problem of Married',
      'author': 'Philip Gibbs'
    },
    'assets/pics/a vısıt to three fonts.jpg': {
      'title': 'A Visit To Three Fonts',
      'author': 'Artur Conan Doyle'
    },
    'assets/pics/adventures in journalism.jpg': {
      'title': 'Adventures In Journalism',
      'author': 'Philip Gibbs'
    },
    'assets/pics/Adventures of Huckleberry Finn.jpg': {
      'title': 'Adventures of Huckleberry Finn',
      'author': 'Mark Twain'
    },
    'assets/pics/alemdagda bir yilan.jpg': {
      'title': 'Alemdağda Var Bir Yılan',
      'author': 'Sait Faik Abasıyanık '
    },
    'assets/pics/Alices Adventures in Wonderland.jpg': {
      'title': 'Alices Adventures in Wonderland',
      'author': 'Lewis Caroll'
    },
    'assets/pics/An Elegy on the Glory of her Sex.jpg': {
      'title': 'An Elegy on the Glory of her Sex',
      'author': 'Oliver Goldsmith'
    },
    'assets/pics/an enquiry concerning human understanding.jpg': {
      'title': 'An Enquiry Concerning Human Understanding',
      'author': 'David Hume'
    },
    'assets/pics/an enquiry concerning the principles of morals.jpg': {
      'title': 'An Enquiry Concerning The Principles Of Morals',
      'author': 'David Hume'
    },
    'assets/pics/Ann Veronica.jpg': {
      'title': 'Ann Veronica',
      'author': 'HG Wells'
    },
    'assets/pics/Around the World in 80 Days.jpg': {
      'title': 'Around the World in 80 Days',
      'author': 'Jules Verne'
    },
    'assets/pics/orwell.jpg': {'title': '1984', 'author': 'George Orwell'},
    'assets/pics/atesten gomlek.jpg': {
      'title': 'Ateşten Gömlek',
      'author': 'Halide Edib Adıvar '
    },
    'assets/pics/balkan harbi.jpg': {
      'title': 'Balkan Harbi',
      'author': 'Ömer Seyfettin'
    },
    'assets/pics/barnaby rudge.jpg': {
      'title': 'Barnaby Rudge',
      'author': 'Charles Dickens'
    },
    'assets/pics/Benjamin Franklin.jpg': {
      'title': 'Benjamin Franklin',
      'author': 'Benjamin Franklin'
    },
    'assets/pics/bes sehir.jpg': {
      'title': 'Beş Şehir',
      'author': 'Ahmet Hamdi Tanpınar'
    },
    'assets/pics/bleak house.jpg': {
      'title': 'Bleak House',
      'author': 'Charles Dickens'
    },
    'assets/pics/Boom, peace and quiet.jpg': {
      'title': 'Book',
      'author': 'Author'
    },
    'assets/pics/bozkurtlar diriliyor.jpg': {
      'title': 'Bozkurtlar Diriliyor',
      'author': 'Hüseyin Nihal Atsız'
    },
    'assets/pics/bozkurtlarin olumu.jpg': {
      'title': 'Bozkurtların Ölümü',
      'author': 'Hüseyin Nihal Atsız'
    },
    'assets/pics/bugunun saraylisi.jpg': {
      'title': 'Bügünün Saraylısı',
      'author': 'Refik Halid Karay'
    },
    'assets/pics/butun oykuler.jpg': {
      'title': 'Bütün Öyküler',
      'author': 'Sabahattin Ali'
    },
    'assets/pics/cakicinin ilk kursunu.jpg': {
      'title': 'Çakıcının İlk Kurşunu',
      'author': 'Sabahattin Ali'
    },
    'assets/pics/candide.jpg': {'title': 'The Candide', 'author': 'Voltaire'},
    'assets/pics/capitale de la douleur.jpg': {
      'title': 'Capital de la doleur',
      'author': 'Paul Elaurd'
    },
    'assets/pics/classic for chilldren.jpg': {
      'title': 'Classic for Chilldren',
      'author': 'Marcus Aurelius'
    },
    'assets/pics/cleopatra.jpg': {
      'title': 'The Cleopatra',
      'author': 'H. Ridder Haggard'
    },
    'assets/pics/Confidence.jpg': {
      'title': 'The Confidence',
      'author': 'Henry James'
    },
    'assets/pics/daniel deronda.jpg': {
      'title': 'Daniel Deronda',
      'author': 'George Elliot'
    },
    'assets/pics/david copperfield.jpg': {
      'title': 'David Copperfield',
      'author': 'Charles Dickens'
    },
    'assets/pics/Death in Venice.jpg': {
      'title': 'Death in Venice',
      'author': 'Thomas Mann'
    },
    'assets/pics/Der Zeuberberg.jpg': {
      'title': 'Der Zeuberberg',
      'author': 'Thomas Mann'
    },
    'assets/pics/dialogues concerning natural religion.jpg': {
      'title': 'Dialogues Concerning Natural Religion',
      'author': 'David Hume'
    },
    'assets/pics/dirilen iskelet.jpg': {
      'title': 'Dirilen İskelet',
      'author': 'Hüseyin Rahmi Gürpınar'
    },
    'assets/pics/divine comedy.jpg': {
      'title': 'Divine Comedy',
      'author': 'Dante Alighieri'
    },
    'assets/pics/dombey and son.jpg': {
      'title': 'Dombey And Son',
      'author': 'Charles Dickens'
    },
    'assets/pics/don quixote.jpg': {
      'title': 'Don Quixote',
      'author': 'Miguel de Cervantes'
    },
    'assets/pics/Dorothy amd the Wizard Oz.jpg': {
      'title': 'Dorothy amd the Wizard Oz',
      'author': 'Frank Baum'
    },
    'assets/pics/dream psychology.jpg': {'title': 'Book', 'author': 'Author'},
    'assets/pics/Edinburgh.jpg': {
      'title': 'Edinburg',
      'author': 'Robert Louis Stevenson'
    },
    'assets/pics/eight cousins.jpg': {
      'title': 'Eight Cousins',
      'author': 'Louısa May Alcot'
    },
    'assets/pics/fair margaret.jpg': {
      'title': 'Fair Margaret',
      'author': 'H. Ridder Haggard'
    },
    'assets/pics/faust 1.jpg': {
      'title': 'Faust Part: 1',
      'author': 'Wolfgang von Goethe'
    },
    'assets/pics/faust 2.jpg': {
      'title': 'Faust Part 2',
      'author': 'Wolfgang von Goethe'
    },
    'assets/pics/First and Last Things.jpg': {
      'title': 'First and Last Things',
      'author': 'HG Wells'
    },
    'assets/pics/Fundamental Principles of the Metaphysic of Morals.jpg': {
      'title': 'Fundamental Principles of the Metaphysic of Morals',
      'author': 'Immanuel Kant'
    },
    'assets/pics/general-introduction-to-psychoanalysis.jpg': {
      'title': 'Book',
      'author': 'Author'
    },
    'assets/pics/God the Invisible King.jpg': {
      'title': 'God the Invisible King',
      'author': 'HG Wells'
    },
    'assets/pics/great expectations.jpg': {
      'title': 'Great Expectations',
      'author': 'Charles Dickens'
    },
    'assets/pics/Gullivers travel.jpg': {
      'title': 'Gullivers Travel',
      'author': 'Jonathan Swift'
    },
    'assets/pics/hamlet.jpg': {
      'title': 'Hamlet',
      'author': 'william shakespeare'
    },
    'assets/pics/hard times.jpg': {
      'title': 'Hard Times',
      'author': 'Charles Dickens'
    },
    'assets/pics/Hawthorne.jpg': {
      'title': 'Hawthorne',
      'author': 'Henry James'
    },
    'assets/pics/henry v.jpg': {
      'title': 'Henry V',
      'author': 'william shakespeare'
    },
    'assets/pics/homage to catalonia.jpg': {
      'title': 'Homage To Catalonia',
      'author': 'George Orwell'
    },
    'assets/pics/hospital sketches.jpg': {
      'title': 'Hospital Sketches',
      'author': 'Louisa May Alcot'
    },
    'assets/pics/Human, All Too Human.jpg': {
      'title': 'Human, All Too Human',
      'author': 'Friedrich Nietzsche'
    },
    'assets/pics/hunger.jpg': {'title': 'The Hunger', 'author': 'Knut Hamsun'},
    'assets/pics/huzur.jpg': {
      'title': 'Huzur',
      'author': 'Ahmet Hamdi Tanpınar'
    },
    'assets/pics/ibni batuta.jpg': {
      'title': 'İbn Batuta Seyahatnamesi',
      'author': 'İbn Batuta'
    },
    'assets/pics/icmizde ki seytan.jpg': {
      'title': 'İçimizde ki Şeytan',
      'author': 'Sabahattin Ali'
    },
    'assets/pics/iffet.jpg': {
      'title': 'İffet',
      'author': 'Hüseyin Rahmi Gürpınar'
    },
    'assets/pics/iliad.jpg': {'title': 'Iliad', 'author': 'Homer'},
    'assets/pics/In the Days of the Comet.jpg': {
      'title': 'In the Days of the Comet',
      'author': 'HG Wells'
    },
    'assets/pics/in the penal colony.jpg': {
      'title': 'In The Penal Colony',
      'author': 'Franz Kafka'
    },
    'assets/pics/israel potter.jpg': {'title': 'Book', 'author': 'Author'},
    'assets/pics/istanbulun ic yuzu.jpg': {
      'title': 'İstanbulun İç Yüzü',
      'author': 'Refik Halid Karay'
    },
    'assets/pics/jack and jill.jpg': {
      'title': 'Jack And Jill',
      'author': 'Louisa May Alcot'
    },
    'assets/pics/jos boys.jpg': {
      'title': 'Jos Boys',
      'author': 'Louisa May Alcot'
    },
    'assets/pics/julius-caesar.jpg': {
      'title': 'Julius Caesar',
      'author': 'william shakespeare'
    },
    'assets/pics/kalp agrisi.jpg': {
      'title': 'Kalp Ağrısı',
      'author': 'Halide Edib Adıvar'
    },
    'assets/pics/kasagi.jpg': {'title': 'Kaşağı', 'author': 'Ömer Seyfettin'},
    'assets/pics/Kidnapped.jpg': {
      'title': 'Kidnapped',
      'author': 'Robert Louis Stevenson'
    },
    'assets/pics/kinglear.jpg': {
      'title': 'King Lear',
      'author': 'william shakespeare'
    },
    'assets/pics/Life on the Mississippi.jpg': {
      'title': 'Life on the Mississippi',
      'author': 'Mark Twain'
    },
    'assets/pics/macbeth.jpg': {'title': 'Book', 'author': 'Author'},
    'assets/pics/MAHUR BESTE.jpg': {
      'title': 'Mahur Beste',
      'author': 'Ahmet Hamdi Tanpınar'
    },
    'assets/pics/mansfield park.jpg': {
      'title': 'The Mansfield Park',
      'author': 'Jane Austen'
    },
    'assets/pics/markopasa ve yazilari.jpg': {
      'title': 'Markopaşa Ve Yazıları',
      'author': 'Sabahattin Ali'
    },
    'assets/pics/martin chuzzlewit.jpg': {
      'title': 'Martin Chuzzlewit',
      'author': 'Charles Dickens'
    },
    'assets/pics/medari maiset motoru.jpg': {
      'title': 'Medarı Maişet Motoru',
      'author': 'Sait Faik Abasıyanık'
    },
    'assets/pics/memleket hikayeleri.jpg': {
      'title': 'Memleket Hikayeleri',
      'author': 'Refik Halid Karay'
    },
    'assets/pics/merchant-of-venice.jpg': {
      'title': 'Merchant of Venice',
      'author': 'william shakespeare'
    },
    'assets/pics/metres.jpg': {
      'title': 'Metres',
      'author': 'Hüseyin Rahmi Gürpınar'
    },
    'assets/pics/micromeas.jpg': {'title': 'Micromeas', 'author': 'Voltaire'},
    'assets/pics/midsummernight.jpg': {
      'title': 'Mid Summer Night',
      'author': 'william shakespeare'
    },
    'assets/pics/moby dick.jpg': {
      'title': 'Moby Dick',
      'author': 'Herman Melville'
    },
    'assets/pics/moon of israel.jpg': {
      'title': 'Moon of Israel',
      'author': 'H. Ridder Haggard'
    },
    'assets/pics/Mr. Britling Sees It Through.jpg': {
      'title': 'Mr. Britling Sees It Through',
      'author': 'HG Wells'
    },
    'assets/pics/mrs  dalloway in bond street.jpg': {
      'title': 'Mrs. Dalloway In Bond Street',
      'author': 'Virgina Woolf'
    },
    'assets/pics/murebbiye.jpg': {
      'title': 'Mürebbiye',
      'author': 'Hüseyin Rahmi Gürpınar'
    },
    'assets/pics/nada the lily.jpg': {
      'title': 'Nada The Lily',
      'author': 'H. Ridder Haggard'
    },
    'assets/pics/natural selection.jpg': {
      'title': 'Natural Selection',
      'author': 'Charles Darwin'
    },
    'assets/pics/New Arabian.jpg': {
      'title': 'New Arabian',
      'author': 'Robert Louis Stevenson'
    },
    'assets/pics/new life.jpg': {
      'title': 'New Life',
      'author': 'Dante Alighieri'
    },
    'assets/pics/nicholas nickleby.jpg': {
      'title': 'Nicholas Nickleby',
      'author': 'Charles Dickens'
    },
    'assets/pics/Ninety Three.jpg': {
      'title': 'Ninety Three',
      'author': 'Victor Hugo'
    },
    'assets/pics/notes from the underground.jpg': {
      'title': 'Notes From The Underground',
      'author': 'Fyodor Dostoyevsky'
    },
    'assets/pics/Notes of a Son and Brother.jpg': {
      'title': 'Notes of a Son and Brother',
      'author': 'Henry James'
    },
    'assets/pics/Notre Dame de Paris.jpg': {
      'title': 'Notre Dame de Paris',
      'author': 'Victor Hugo'
    },
    'assets/pics/now it can be told.jpg': {
      'title': 'Now It Can Be Told',
      'author': 'Philip Gibbs'
    },
    'assets/pics/oliver twist.jpg': {
      'title': 'Oliver Twist',
      'author': 'Charles Dickens'
    },
    'assets/pics/our mutual friend.jpg': {
      'title': 'Our Mutual Friend',
      'author': 'Charles Dickens'
    },
    'assets/pics/our with spain for cuba freedom.jpg': {
      'title': 'Our With Spain For Cuba Freedom',
      'author': 'Trumbull White'
    },
    'assets/pics/oyle bir hikaye.jpg': {
      'title': 'Öyle Bir Hikaye',
      'author': 'Sait Faik Abasıyanık'
    },
    'assets/pics/poems of william blake.jpg': {
      'title': 'Poems of William Blake',
      'author': 'William Blake'
    },
    'assets/pics/pride and prejudice.jpg': {
      'title': 'Book',
      'author': 'Author'
    },
    'assets/pics/Prince Otto, a Romance.jpg': {
      'title': 'Prince Otto, a Romance',
      'author': 'Robert Louis Stevenson'
    },
    'assets/pics/Protagoras.jpg': {
      'title': 'The Protogaras',
      'author': 'Plato'
    },
    'assets/pics/resurrection.jpg': {
      'title': 'The Resurrection',
      'author': 'Leo Tolstoi'
    },
    'assets/pics/Rhyme and Reason.jpg': {
      'title': 'Rhyme and Reason',
      'author': 'Lewis Caroll'
    },
    'assets/pics/Roderick Hudson.jpg': {
      'title': 'Roderick Hudson',
      'author': 'Henry James'
    },
    'assets/pics/romeo-and-juliet.jpg': {
      'title': 'Romeo And Juliet',
      'author': 'william shakespeare'
    },
    'assets/pics/romola.jpg': {'title': 'Romola', 'author': 'George Elliot'},
    'assets/pics/rose in bloom.jpg': {
      'title': 'Rose In Bloom',
      'author': 'Louisa May Alcot'
    },
    'assets/pics/saatlerı ayarlama enstıtusu.jpg': {
      'title': 'Saatleri Ayarlama Enstitüsü',
      'author': 'Ahmet Hamdi Tanpınar'
    },
    'assets/pics/salommbo.jpg': {'title': 'Book', 'author': 'Author'},
    'assets/pics/saray ve otesi.jpg': {
      'title': 'Saray Ve Ötesi',
      'author': 'Halit Ziya Uşaklıgil'
    },
    'assets/pics/sehrın dısındakıler.jpg': {
      'title': 'Book',
      'author': 'Author'
    },
    'assets/pics/semaver.jpg': {
      'title': 'Semaver',
      'author': 'Sait Faik Abasıyanık-'
    },
    'assets/pics/sense and sensibility.jpg': {
      'title': 'Sense And Sensibility',
      'author': 'Jane Austen'
    },
    'assets/pics/sevda sokagi komedyasi.jpg': {
      'title': 'Sevda Sokağı Komedyası',
      'author': 'Halide Edib Adıvar'
    },
    'assets/pics/seyehatname.jpg': {
      'title': ' Evliya Çelebi Seyahatname',
      'author': 'Evliya Çelebi'
    },
    'assets/pics/she and allan.jpg': {
      'title': 'She And Allan',
      'author': 'H. Ridder Haggard'
    },
    'assets/pics/silas marner.jpg': {
      'title': 'Silas Marner',
      'author': 'George Elliot'
    },
    'assets/pics/sinekkli bakkal.jpg': {
      'title': 'Sinekli Bakkal',
      'author': 'Halide Edib Adıvar'
    },
    'assets/pics/sipsevdi.jpg': {
      'title': 'Şıp Sevdi',
      'author': 'Hüseyin Rahmi Gürpınar'
    },
    'assets/pics/songs of innocence.jpg': {
      'title': 'Songs of Innocence',
      'author': 'William Blake'
    },
    'assets/pics/St. Ives.jpg': {
      'title': 'St. Ives',
      'author': 'Robert Louis Stevenson'
    },
    'assets/pics/Sylvie and Bruno.jpg': {
      'title': 'Sylvie and Bruno',
      'author': 'Lewis Caroll'
    },
    'assets/pics/tatarcik.jpg': {
      'title': 'Tatarcık',
      'author': 'Halide Edib Adıvar'
    },
    'assets/pics/tempest.jpg': {
      'title': 'Tempest',
      'author': 'william shakespeare'
    },
    'assets/pics/The Adventures of Tom Sawyer.jpg': {
      'title': 'The Adventures of Tom Sawyer',
      'author': 'Mark Twain'
    },
    'assets/pics/The Ambassadors.jpg': {
      'title': 'The Ambassadors',
      'author': 'Henry James'
    },
    'assets/pics/the american.jpg': {
      'title': 'The American',
      'author': 'Henry James'
    },
    'assets/pics/The Antichrist.jpg': {
      'title': 'The Antichrist',
      'author': 'Friedrich Nietzsche'
    },
    'assets/pics/the beautiful and damned.jpg': {
      'title': 'The Beautiful And Damned',
      'author': 'F. Scott Fitzgerald'
    },
    'assets/pics/The Black Arrow. A Tale Of Two Roses.jpg': {
      'title': 'The Black Arrow',
      'author': 'Robert Louis Stevenson'
    },
    'assets/pics/the bostanians.jpg': {
      'title': 'The Bostanians',
      'author': 'Henry James'
    },
    'assets/pics/the brothers karamazoc.jpg': {
      'title': 'The Brosthers Karamazov',
      'author': 'Fyodor Dostoyevsky'
    },
    'assets/pics/The Burning Secret.jpg': {
      'title': 'The Burning Secret',
      'author': 'Stefan Zweig'
    },
    'assets/pics/The Chartreuse of Parma.jpg': {
      'title': 'The Chartreuse of Parma',
      'author': 'Stendhal'
    },
    'assets/pics/the confidence.jpg': {
      'title': 'The Confidence',
      'author': 'Herman Melville'
    },
    'assets/pics/The Cossacks.jpg': {
      'title': 'The Cossacks',
      'author': 'Leo Tolstoi'
    },
    'assets/pics/the crime and punishment.jpg': {
      'title': 'Crime And Punishment',
      'author': 'Fyodor Dostoyevsky'
    },
    'assets/pics/The Crime of the Congo.jpg': {
      'title': 'Crime of The Congo',
      'author': 'Artur Conan Doyle'
    },
    'assets/pics/The Critique of Pure Reason.jpg': {
      'title': 'The Critique of Pure Reason',
      'author': 'Immanuel Kant'
    },
    'assets/pics/the desert village.jpg': {
      'title': 'The Desert Village',
      'author': 'Oliver Goldsmith'
    },
    'assets/pics/The Door in the Wall.jpg': {
      'title': 'The Door in the Wall',
      'author': 'HG Wells'
    },
    'assets/pics/The Exemplary Novels of Cervantes.jpg': {
      'title': 'The Exemplary Novels of Cervantes',
      'author': 'Miguel de Cervantes'
    },
    'assets/pics/The First Men In The Moon.jpg': {
      'title': 'The First Men In The Moon',
      'author': 'HG Wells'
    },
    'assets/pics/The Food of the Gods.jpg': {
      'title': 'The Food of the Gods',
      'author': 'HG Wells'
    },
    'assets/pics/The Fur Country.jpg': {
      'title': 'The Fur Country',
      'author': 'Jules Verne'
    },
    'assets/pics/the gambler.jpg': {
      'title': 'The Gambler',
      'author': 'Fyodor Dostoyevsky'
    },
    'assets/pics/the genealogy of morals.jpg': {
      'title': 'The Genealogy of Norals',
      'author': 'Friedrich Nietzsche'
    },
    'assets/pics/the gold bug.jpg': {
      'title': 'The Gold Bug',
      'author': 'Edgar Alan Poe'
    },
    'assets/pics/the golden bowl.jpg': {
      'title': 'The Golden Bowl',
      'author': 'Henry James'
    },
    'assets/pics/The great boer war.jpg': {
      'title': 'Great Boer War',
      'author': 'Artur Conan Doyle'
    },
    'assets/pics/the great gatsby.jpg': {
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald'
    },
    'assets/pics/the history of england i.jpg': {
      'title': 'The History of England I',
      'author': 'David Hume'
    },
    'assets/pics/the history of england ii.jpg': {
      'title': 'The History of England II',
      'author': 'David Hume'
    },
    'assets/pics/the history of england iii.jpg': {
      'title': 'The History of England III',
      'author': 'David Hume'
    },
    'assets/pics/the history of england iv.jpg': {
      'title': 'The History of England IV',
      'author': 'David Hume'
    },
    'assets/pics/the history of england v.jpg': {
      'title': 'The History of England V',
      'author': 'David Hume'
    },
    'assets/pics/the history of england vi.jpg': {
      'title': 'The History of England VI',
      'author': 'David Hume'
    },
    'assets/pics/The History Of Mr. Polly.jpg': {
      'title': 'The History Of Mr. Polly',
      'author': 'HG Wells'
    },
    'assets/pics/The Hunting of the Snark.jpg': {
      'title': 'The Hunting of the Snark',
      'author': 'Lewis Caroll'
    },
    'assets/pics/the idiot.jpg': {
      'title': 'The Idiot',
      'author': 'Fyodor Dostoyevsky'
    },
    'assets/pics/the inferno.jpg': {
      'title': 'The Inferno',
      'author': 'Henri Barbusse'
    },
    'assets/pics/The Innocents Abroad, travel.jpg': {
      'title': 'The Innocents Abroad, Travel',
      'author': 'Mark Twain'
    },
    'assets/pics/The Invisible Man.jpg': {
      'title': 'The Invisible Man',
      'author': 'HG Wells'
    },
    'assets/pics/The Island of Dr. Moreau.jpg': {
      'title': 'The Island of Dr. Moreau',
      'author': 'HG Wells'
    },
    'assets/pics/the journal to stella.jpg': {
      'title': 'The Journal To Stella',
      'author': 'Jonathan Swift'
    },
    'assets/pics/the king solomon.jpg': {
      'title': 'King Solomon',
      'author': 'H. Ridder Haggard'
    },
    'assets/pics/the light.jpg': {
      'title': 'The Light',
      'author': 'Henri Barbusse'
    },
    'assets/pics/The Man in the Brown Suits.jpg': {
      'title': 'The Man in the Brown Suits',
      'author': 'Agatha Christine'
    },
    'assets/pics/the masque of the red death.jpg': {
      'title': 'The Masque of The Red Death',
      'author': 'Stendhal'
    },
    'assets/pics/The Murder on the links.jpg': {
      'title': 'The Murder on the links',
      'author': 'Agatha Christine'
    },
    'assets/pics/The Mysterious Island.jpg': {
      'title': 'The Mysterious Island',
      'author': 'Jules Verne'
    },
    'assets/pics/the mystery marie roget.jpg': {
      'title': 'The Mystery Marie Roget',
      'author': 'Edgar Alan Poe'
    },
    'assets/pics/the mystery of edwin drood.jpg': {
      'title': 'The Mystery of Edwin Drood',
      'author': 'Charles Dickens'
    },
    'assets/pics/the mystery of the blue train.jpg': {
      'title': 'The Mystery of The Blue Train',
      'author': 'Agatha Christine'
    },
    'assets/pics/The New Machiavelli.jpg': {
      'title': 'The New Machiavelli',
      'author': 'HG Wells'
    },
    'assets/pics/the portrait of dorian gray.jpg': {
      'title': 'The Portrait of Dorian Gray',
      'author': 'Oscar Wilde'
    },
    'assets/pics/The Prince and the Pauper.jpg': {
      'title': 'The Prince and the Pauper',
      'author': 'Mark Twain'
    },
    'assets/pics/the prince.jpg': {
      'title': 'The Prince',
      'author': 'Niccolo Machiveli'
    },
    'assets/pics/the raven.jpg': {'title': 'Book', 'author': 'Author'},
    'assets/pics/The Red and The Black.jpg': {
      'title': 'Book',
      'author': 'Author'
    },
    'assets/pics/The Research Magnificent.jpg': {
      'title': 'The Research Magnificent',
      'author': 'HG Wells'
    },
    'assets/pics/The Sea Lady.jpg': {
      'title': 'The Sea Lady',
      'author': 'HG Wells'
    },
    'assets/pics/The Secret Adversary.jpg': {
      'title': 'The Secret Adversary',
      'author': 'Agatha Christine'
    },
    'assets/pics/The sleeper awakes.jpg': {
      'title': 'The Sleeper Awake',
      'author': 'HG Wells'
    },
    'assets/pics/the soul of a nation.jpg': {
      'title': 'The Soul of A Nation',
      'author': 'Philip Gibbs'
    },
    'assets/pics/The Thomas Jefferson writes.jpg': {
      'title': 'The Thomas Jefferson writes',
      'author': 'Thomas Jefferson'
    },
    'assets/pics/The Time Machine.jpg': {
      'title': 'The Time Machine',
      'author': 'HG Wells'
    },
    'assets/pics/the trial.jpg': {
      'title': 'The Trial',
      'author': 'Franz Kafka'
    },
    'assets/pics/The Twilight of the Idols.jpg': {
      'title': 'The Twilight of the Idols',
      'author': 'Friedrich Nietzsche'
    },
    'assets/pics/the voyage of the beagle.jpg': {
      'title': 'The Voyage of The Beagle',
      'author': 'Charles Darwin'
    },
    'assets/pics/the voyage out.jpg': {
      'title': 'The Voyage Out',
      'author': 'Virgina Woolf'
    },
    'assets/pics/The War in the Air.jpg': {
      'title': 'The War in the Air',
      'author': 'HG Wells'
    },
    'assets/pics/The war in the east japan.jpg': {
      'title': 'The War In The East Japan',
      'author': 'Trumbull White'
    },
    'assets/pics/the war of the worlds.jpg': {
      'title': 'The War of The Worlds',
      'author': 'HG Wells'
    },
    'assets/pics/The Wheels of Chance.jpg': {
      'title': 'The Wheels of Chance',
      'author': 'HG Wells'
    },
    'assets/pics/the whıte company.jpg': {
      'title': 'White Company',
      'author': 'Artur Conan Doyle'
    },
    'assets/pics/the white nights.jpg': {
      'title': 'The White Nights',
      'author': 'Fyodor Dostoyevsky'
    },
    'assets/pics/The wizard of wall street and his wealth.jpg': {
      'title': 'The Wizard of Wall Street And His Wealth',
      'author': 'Trumbull White'
    },
    'assets/pics/The Wonderful Visit.jpg': {
      'title': 'The Wonderful Visit',
      'author': 'HG Wells'
    },
    'assets/pics/The World Set Free.jpg': {
      'title': 'The World Set Free',
      'author': 'HG Wells'
    },
    'assets/pics/the wuthering heights.jpg': {
      'title': 'The Wuthering Heights',
      'author': 'Emily Bronte'
    },
    'assets/pics/the-sorrows-of-young-werther.jpg': {
      'title': 'The Sorrows of Young Werther',
      'author': 'Wolfgang von Goethe'
    },
    'assets/pics/this side of paradise.jpg': {
      'title': 'This Side of Paradise',
      'author': 'F. Scott Fitzgerald'
    },
    'assets/pics/Three Sunsets and Other Poems.jpg': {
      'title': 'Three Sunsets and Other Poems',
      'author': 'Lewis Caroll'
    },
    'assets/pics/three-essays-on-the-theory-of-sexuality.jpg': {
      'title': 'Three Essays On The Theory of Sexuality',
      'author': 'Sigmund Freud'
    },
    'assets/pics/thus spake zarathustra.jpg': {
      'title': 'Thus Spake Zarathustra',
      'author': 'Friedrich Nietzsche'
    },
    'assets/pics/Tom Sawyer Abroad.jpg': {
      'title': 'Tom Sawyer Abroad',
      'author': 'Mark Twain'
    },
    'assets/pics/Tom Sawyer, Detective.jpg': {
      'title': 'Tom Sawyer, Detective',
      'author': 'Mark Twain'
    },
    'assets/pics/Tono-Bungay.jpg': {
      'title': 'Tono Bungay',
      'author': 'HG Wells'
    },
    'assets/pics/totem-and-taboo.jpg': {
      'title': 'Totem And Taboo',
      'author': 'Sigmund Freud'
    },
    'assets/pics/turkun atesle imtihani.jpg': {
      'title': 'Türkün Ateşle İmtihanı',
      'author': 'Halide Edib Adıvar'
    },
    'assets/pics/Twenty Thousand Leagues Under the Sea.jpg': {
      'title': 'Twenty Thousand Leagues Under the Sea',
      'author': 'Jules Verne'
    },
    'assets/pics/under fire.jpg': {
      'title': 'Under Fire',
      'author': 'Henri Barbusse'
    },
    'assets/pics/Under Sentence of Death.jpg': {
      'title': 'Under Sentence of Death',
      'author': 'Victor Hugo'
    },
    'assets/pics/Vicar of Wakefield.jpg': {
      'title': 'Vicar of Wakefield',
      'author': 'Oliver Goldsmith'
    },
    'assets/pics/vurun kahpeye.jpg': {
      'title': 'Vurun Kahpeye',
      'author': 'Halide Edib Adıvar'
    },
    'assets/pics/wanders.jpg': {
      'title': 'The Wanders',
      'author': 'Knut Hamsun'
    },
    'assets/pics/What is Enlightenment.jpg': {
      'title': 'Book',
      'author': 'Author'
    },
    'assets/pics/white bird.jpg': {
      'title': 'White Bird',
      'author': 'JM Barrie'
    },
    'assets/pics/Wilhelm Meister.jpg': {
      'title': 'Wilhelm Meister',
      'author': 'Wolfgang von Goethe'
    },
    'assets/pics/yasadigim gibi.jpg': {
      'title': 'Yaşadığım Gibi',
      'author': 'Ahmet Hamdi Tanpınar'
    },
    'assets/pics/yeni dunya.jpg': {
      'title': 'Yeni Dünya',
      'author': 'Sabahattin Ali'
    },
    'assets/pics/yezidin kizi.jpg': {
      'title': 'Yezidin Kızı',
      'author': 'Refik Halid Karay'
    },
    'assets/pics/zadig.jpg': {
      'title': 'Zadig Or The Book',
      'author': 'Voltaire'
    },
    'assets/pics/A Christmas Carol.jpg': {
      'title': 'A Christmas Carol',
      'author': 'Charles Dickens'
    },
    'assets/pics/A London Life.jpg': {
      'title': 'A London Life',
      'author': 'Henry James'
    },
    'assets/pics/A Modern Utopia.jpg': {
      'title': 'A Modern Utopia',
      'author': 'HG Wells'
    },
    'assets/pics/a plug year.jpg': {
      'title': 'A Journal of The Plug Year',
      'author': 'Daniel Defoe'
    },
    'assets/pics/america.jpg': {
      'title': 'The America',
      'author': 'Franz Kafka'
    },
    'assets/pics/animal farm.jpg': {
      'title': 'Animal Farm',
      'author': 'George Orwell'
    },
    'assets/pics/anna karenina.jpg': {
      'title': 'Anna Karenina',
      'author': 'Leo Tolstoi'
    },
    'assets/pics/art of war.jpg': {'title': 'Art of War', 'author': 'Sun Tzu'},
    'assets/pics/ayesha the return of she.jpg': {
      'title': 'Ayesha The Return of She',
      'author': 'H. Ridder Haggard'
    },
    'assets/pics/cadi.jpg': {
      'title': 'Cadı',
      'author': 'Hüseyin Rahmi Gürpınar'
    },
    'assets/pics/boon.jpg': {'title': 'The Boon', 'author': 'HG Wells'},
    'assets/pics/ask batagi.jpg': {
      'title': 'Aşk Batağı',
      'author': 'Hüseyin Rahmi Gürpınar'
    },
    'assets/pics/Anticipations.jpg': {
      'title': 'Anticipations',
      'author': 'HG Wells'
    },
    'assets/pics/aski memnu.jpg': {
      'title': 'Aşk-ı Memnu',
      'author': 'Halit Ziya Uşaklıgil'
    },
    'assets/pics/bealby.jpg': {'title': 'Bealby', 'author': 'HG Wells'},
    'assets/pics/kipps.jpg': {'title': 'The Kipps', 'author': 'HG Wells'},
    'assets/pics/Les Miserables.jpg': {
      'title': 'Les Miserables',
      'author': 'Victor Hugo'
    },
    'assets/pics/kirik hayatlar.jpg': {
      'title': 'Kırık Hayatlar',
      'author': 'Halit Ziya Uşaklıgil'
    },
    'assets/pics/Italian Hours.jpg': {
      'title': 'Italian Hours',
      'author': 'Henry James'
    },
    'assets/pics/little dorrit.jpg': {
      'title': 'Little Dorrit',
      'author': 'Charles Dickens'
    },
    'assets/pics/little men.jpg': {
      'title': 'Little Man',
      'author': 'Louisa May Alcot'
    },
    'assets/pics/little woman.jpg': {
      'title': 'Little Man',
      'author': 'Louisa May Alcot'
    },
    'assets/pics/meditations.jpg': {
      'title': 'The Meditations',
      'author': 'Marcus Aurelius'
    },
    'assets/pics/metamorphosis.jpg': {
      'title': 'Metamorphosis',
      'author': 'Franz Kafka'
    },
    'assets/pics/Middlemarch.jpg': {
      'title': 'Middlemarch',
      'author': 'George Elliot'
    },
    'assets/pics/pickwick club.jpg': {
      'title': 'Pickwick Club',
      'author': 'Charles Diknes'
    },
    'assets/pics/othello.jpg': {
      'title': 'Othello',
      'author': 'william shakespeare'
    },
    'assets/pics/odysey.jpg': {'title': 'Odysey', 'author': 'Homer'},
    'assets/pics/peter pan.jpg': {'title': 'Peter Pan', 'author': 'JM Barrie'},
    'assets/pics/mor salkimli ev.jpg': {
      'title': 'Mor Salkımlı Ev',
      'author': 'Halide Edib Adıvar'
    },
    'assets/pics/ruh adam.jpg': {
      'title': 'Ruh Adam',
      'author': 'Hüseyin Nihal Atsız'
    },
    'assets/pics/peter pan in kensington gardens.jpg': {
      'title': 'Peter Pan In Kensington Gardens',
      'author': 'JM Barrie'
    },
    'assets/pics/sherlock holmes.jpg': {
      'title': 'Sherlock Holmes',
      'author': 'Author'
    },

    'assets/pics/robinson crouse.jpg': {
      'title': 'Robinson Crouse',
      'author': 'Daniel Defoe'
    },
    'assets/pics/aydakı kadın.jpg': {
      'title': 'Aydaki Kadın',
      'author': 'Ahmet Hamdi Tanpınar'
    },
    'assets/pics/emma.jpg': {'title': 'Emma', 'author': 'Janne Austen'},
    'assets/pics/kurk mantolu madonna.jpg': {
      'title': 'Kürk Mantolu Madonna',
      'author': 'Sabahattin Ali'
    },
    'assets/pics/Love and Mr Lewisham.jpg': {
      'title': 'Love and Mr Lewisham',
      'author': 'HG Wells'
    },
    'assets/pics/madame bovary.jpg': {
      'title': 'Madame Bovary',
      'author': 'Salammbo'
    },
    'assets/pics/simdi sevisme vakti.jpg': {
      'title': 'Simdi-Sevisme-Vakti',
      'author': 'Sait Faik Abasıyanık'
    },
    // Diğer resimler ve ilgili kitap bilgileri buraya eklenir
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Data'),
      ),
      body: Center(
        child: Text('Book Data Page'),
      ),
    );
  }
}
