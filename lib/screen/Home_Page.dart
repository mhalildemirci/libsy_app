import 'package:flutter/material.dart';
import 'package:libsy_app/books_data/beyondgood.dart';
import 'package:libsy_app/screen/articles_page.dart';
import 'package:libsy_app/screen/books_page.dart';
import 'package:libsy_app/screen/categories_page.dart';
import 'package:libsy_app/screen/details_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:libsy_app/screen/myListPage.dart';
import 'package:libsy_app/screen/search_page.dart';
import 'package:libsy_app/screen/DatabaseHelper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 0, 0, 1.0),
                Color.fromRGBO(69, 60, 60, 1.0),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: screenHeight * 0.04,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.1,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.white,
                      iconSize: screenWidth * 0.06,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                  screenWidth * 0.02,
                  screenHeight * 0.01,
                  screenWidth * 0.3,
                  0.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BooksPage(),
                            ),
                          );
                        },
                        child: buildButton("Books"),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticlesPage(),
                            ),
                          );
                        },
                        child: buildButton("Essays"),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoriesPage(),
                            ),
                          );
                        },
                        child: buildButton("Categories"),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyListPage(),
                            ),
                          );
                        },
                        child: buildButton("My List"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.04),
                      border: Border.all(
                        color: Color.fromRGBO(69, 60, 60, 1.0),
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/pics/beyond good and evil.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildIconButton(Icons.visibility, 'Read', () {
                            onTap(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>beyondgood()));
                            }
                          }),
                          buildIconButton(Icons.add, 'Add List', () async {
                            String imagePath =
                                'assets/pics/beyond good and evil.jpg';
                            bool isAlreadyAdded =
                                await DatabaseHelper.isImageAdded(imagePath);
                            if (!isAlreadyAdded) {
                              await DatabaseHelper.insertImage(imagePath);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Book added to the list'),
                                  backgroundColor: Colors.grey[900],
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('The book has already been added to the list'),
                                  backgroundColor: Colors.grey[900],
                                ),
                              );
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              slide('New Books', [
                '2 Poems.jpg',
                'A Christmas Carol.jpg',
                '11 Intentions.jpg',
                'A London Life.jpg',
                'A Modern Utopia.jpg',
                'a plug year.jpg',
                'america.jpg',
                'A Christmas Carol.jpg',
                'anna karenina.jpg',
                'art of war.jpg',
              ]),
              slide('Top 10', [
                'ayesha the return of she.jpg',
                'beyond good and evil.jpg',
                'the light.jpg',
                'boon.jpg',
                'The Master of the World.jpg',
                'Anticipations.jpg',
                'Alices Adventures in Wonderland.jpg',
                'bealby.jpg',
                'kipps.jpg',
                'Les Miserables.jpg',
              ]),
              slide('For You Recommends', [
                'Kidnapped.jpg',
                'jos boys.jpg',
                'Italian Hours.jpg',
                'kinglear.jpg',
                'little dorrit.jpg',
                'little men.jpg',
                'little woman.jpg',
                'anna karenina.jpg',
                'art of war.jpg',
              ]),
              slide('Interestend you books', [
                'meditations.jpg',
                'metamorphosis.jpg',
                'Middlemarch.jpg',
                'pickwick club.jpg',
                'A Modern Utopia.jpg',
                'othello.jpg',
                'odysey.jpg',
                'peter pan.jpg',
                'Prince Otto, a Romance.jpg',
                'art of war.jpg',
              ]),
              slide('Dramatic Artifacts', [
                'romola.jpg',
                'rose in bloom.jpg',
                'the light.jpg',
                'under fire.jpg',
                'wanders.jpg',
                'Death in Venice.jpg',
                'the-sorrows-of-young-werther.jpg',
                'salommbo.jpg',
                'she and allan.jpg',
                'sense and sensibility.jpg',
              ]),
              slide('World of Classics', [
                'peter pan in kensington gardens.jpg',
                'peter pan.jpg',
                'odysey.jpg',
                'sherlock holmes.jpg',
                'the idiot.jpg',
                'anna karenina.jpg',
                'Around the World in 80 Days.jpg',
                'art of war.jpg',
                'robinson crouse.jpg',
                'Gullivers travel.jpg',
              ]),
              slide('Full of Love Novels', [
                'the white nights.jpg',
                'anna karenina.jpg',
                'salommbo.jpg',
                'the beautiful and damned.jpg',
                'romeo-and-juliet.jpg',
                'emma.jpg',
                'the-sorrows-of-young-werther.jpg',
                'Love and Mr Lewisham.jpg',
                'madame bovary.jpg',
                'Ann Veronica.jpg',
                // orther images
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget slide(String info, List<String> imageList) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        screenWidth * 0.06,
        screenHeight * 0.02,
        screenWidth * 0.05,
        0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            info,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            height: screenHeight * 0.2 / 0.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          imageName: imageList[index],
                          description:
                              imageDescriptions[imageList[index]] ?? "",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.37,
                    height: screenHeight * 0.1,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage('assets/pics/${imageList[index]}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return Container(
      width: screenWidth * 0.2,
      height: screenHeight * 0.04,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.020,
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon, String text, Function() onTap) {
    return Container(
      height: screenHeight * 0.05,
      width: screenWidth * 0.33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(icon),
            iconSize: screenWidth * 0.04,
            color: Colors.black,
            onPressed: onTap,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}

// Define your imageDescriptions map here
Map<dynamic, String> imageDescriptions = {
  '2 Poems.jpg':
      'Oscar Wilde was a 19th-century Irish writer, playwright and poet.He is best known forhis plays and satirical works, but he also left important works as a poet.Wildes poetry is often noted for its aesthetic and emotional depth and is often rendered with irony and wit.',
  'A Christmas Carol.jpg':
      'The story begins with Scrooge being visited on Christmas Eve by the ghost of his old partner Jacob Marley. Marley comes to warn Scrooge of the consequences of his life of selfishness and lovelessness and convinces Scrooge to go on a journey visited by three ghosts.',
  '11 Intentions.jpg':
      'Oscar Wilde was a 19th-century Irish writer, playwright and poet.He is best known forhis plays and satirical works, but he also left important works as a poet.Wildes poetry is often noted for its aesthetic and emotional depth and is often rendered with irony and wit.',
  'A London Life.jpg':
      'The plot revolves around a crumbling marriage and its impact on many people, especially Laura Wing, the sister of his soon-to-be divorced wife.',
  'A Modern Utopia.jpg':
      'The novel is best known for the idea that a volunteer class of nobles, known as Samurai, could effectively govern a "kinetic, not static" world state[2] and thus "solve the problem of combining progress with political stability".',
  'a plug year.jpg':
      'It was written by Daniel Defoe in the form of a diary describing what happened during the great plague epidemic in London. The spread of the epidemic in the city, the difficulties people faced, the ways the disease spread and the reactions of the society to this tragedy are discussed in detail in the work.',
  'america.jpg':
      'The story begins with a young man, Karl Rossmann, being sent to America. Karl is exiled from Europe because of a shameful incident that shamed his family and he is forced to go to America.',
  'anna karenina.jpg':
      "It tells the story of Anna's unhappy marriage and her forbidden love affair with the young and charismatic officer Count Vronsky. Anna's love and social ostracism lead to her mental breakdown and a tragic ending.",
  'art of war.jpg':
      'It is a classic text written by the Chinese military strategist Sun Tzu. Dating back to the 5th century BC, it contains in-depth insights on military strategy and leadership.',
  'ayesha the return of she.jpg':
      'Ayesha, The Return of She is a gothic-fantasy novel by English Victorian writer H. Rider Haggard, published in 1905 as a sequel to She. Chronologically, it is the last novel in the Ayesha and Allan Quatermain series.',
  'beyond good and evil.jpg':
      'Beyond Good and Evil: An Introduction to a Future Philosophy is a book written by the German philosopher Friedrich Nietzsche, published in 1886.',
  'cadi.jpg':
      "he widower Naşit Nefi Efendi's has remarried and witches have begun to roam his mansion. Naşit Nefi Efendi's first wife, Mrs. Binnaz, returns as a witch, haunting Naşit Nefi Efendi and his wives and giving them no rest.",
  'boon.jpg':
      'is about a group of intellectuals and thinkers discussing the progress and evolutionary journey of humanity.',
  'ask batagi.jpg':
      "ailesinin şımarık bir şekilde yetiştirdiği ayran gönüllü sürekli kadınlardan sıkılan iki kez evlilik yapmış Naki Efendi'nin üçüncü eşi Bedia ile olan evliliğini anlatmış.Eski İstanbul yaşayışı , aşkları, iliskilerin ne derece bozuk olduğunu gözler önüne sermiş.",
  'Anticipations.jpg':
      'In "Anticipations", Wells discusses the social and technological developments of the early 20th century, political changes and how they might shape the future of humanity. ',
  'aski memnu.jpg':
      "Bihter, kendisinden yaşça büyük Adnan Bey ile evlendirilmiş, ancak daha sonra aşık olduğu Behlül ile yasak bir ilişki yaşamaya başlamıştır. Diğer taraftan, Adnan Bey'in yeğeni olan Nihal, Behlül'e platonik bir aşk beslemektedir.",
  'bealby.jpg':
      'Bealby, the protagonist of the novel, escapes to save himself from an unwanted family environment and finds a job in a hotel. However, here too, he finds himself involved in a series of events and embarks on unexpected adventures. ',
  'kipps.jpg':
      'Kipps, a tailor apprentice in a small town, suddenly becomes a rich man with an inherited fortune. Thanks to this fortune, he rises to higher social classes and meets various segments of English society.',
  'Les Miserables.jpg':
      "Valjean is unjustly sentenced to nineteen years in prison, after which he embarks on a moral journey as he tries to reintegrate into society. Alongside him are other characters, such as the police officer Javert.",
  'meditations.jpg':
      "Marcus Aurelius, as a ruler of the Roman Empire, faced the challenges of everyday life, while remaining firmly rooted in the teachings of Stoic philosophy. this book reflects his inner thoughts and spiritual struggles, while also addressing universal issues such as human nature, justice, virtue and destiny.",
  'metamorphosis.jpg':
      'The novel begins with an unexpected transformation of a man named Gregor Samsa. One morning, Gregor wakes up to find himself transformed into an insect. This transformation begins a process of alienation and isolation, both physical and psychological.',
  'Middlemarch.jpg':
      'The story begins with the dreams of Dorothea Brooke, a young and idealistic woman, about marriage. Dorothea marries Mr. Casaubon, a wealthy but elderly clergyman, only to find a life that is the opposite of her dreams of marriage.',
  'pickwick club.jpg':
      'The novel follows the adventures of the Pickwick Club, a group of individuals who come together under the leadership of a rich and cheerful man named Samuel Pickwick. ',
  'othello.jpg':
      '"Othello," is a famous tragedy play written by William Shakespeare. The play deals with themes such as jealousy, betrayal and racism and dramatizes the tragic fall of Othello, a soldier.',
  'odysey.jpg':
      "'The Odyssey' deals with universal themes such as loyalty, love, courage, honor, cunning and justice. In addition, Homer's epic offers a rich portrait of ancient Greek mythology, customs and values.",
  'peter pan.jpg':
      "'Peter Pan,' It is a famous children's book written by J.M. Barrie. The story tells the fantastic adventures of a boy named Peter Pan and three siblings named Wendy, John and Michael.",
  'Prince Otto, a Romance.jpg':
      "The novel is set in a fictional German principality called the Grand Duchy of Gerolstein. Prince Otto struggles hard to secure his throne and stabilize his country. But when Otto's throne is threatened, he must fight against various political intrigues and dangers to protect himself and his country.",
  'romola.jpg':
      'Romola, our main character, is an intelligent and beautiful woman. A mature and intelligent soul, Romola faces the betrayal of her husband Tito Melema and struggles to rebuild her life. ',
  'rose in bloom.jpg':
      'The novel is about the life of Rose Campbell, a young and talented woman. Rose is the character we met in the novel "Eight Cousins" when she was fourteen. Now she is twenty-one and the focus is on her relationships with the people around her, her love life and her personal development.',
  'the light.jpg':
      'It tells the story of war through the eyes of Jean Diaz, a French soldier. As Diaz fights alongside other soldiers on the front line, he confronts the terrible realities of war. The senselessness of war, the fear of death, and the worst in human beings are among the things Diaz and the other soldiers experience.',
  'under fire.jpg':
      'The novel tells the story of a French battalion during a year at the front, the daily life of the soldiers and their confrontation with the terrible realities of war.',
  'wanders.jpg':
      "The novel tells the story of Ove's adventures and the various characters he encounters while traveling through the Norwegian countryside. Ove is someone who does not conform to the norms of society and opposes traditional ways of life. ",
  'mor salkimli ev.jpg':
      "Mor Salkımlı Ev, Osmanlı İmparatorluğu'nun son dönemlerinde, İstanbul'da yaşayan bir ailenin hikayesini anlatır. Romanın baş karakteri Feride, modernleşme ve gelenek arasında sıkışıp kalan bir genç kadındır. ",
  'ruh adam.jpg':
      " Romanda hayatını askerliğe adamış bir adamın askerlik mesleğinden atıldıktan sonra yaşadığı ruhsal durumu, bir aşk çıkmazı içine düşmesi, aklı ve kalbi arasında kalmasından dolayı kendi nefsi ile olan mücadelesi anlatılır.",
  'she and allan.jpg':
      "The novel focuses on the character Ayesha, introduced in the previous novel 'She'. The story sheds light on Ayesha's past and her mysterious life.",
  'tatarcik.jpg':
      "Hikaye, genç ve güzel bir Türk kızı olan Nigâr'ın yaşamını merkeze alır. Nigâr, Batılılaşma ve modernleşme hareketlerinin etkisi altında kalan Osmanlı toplumunda kendi kimliğini bulmaya çalışırken, aynı zamanda geleneksel değerlerle modern yaşam arasında bir denge kurmaya çalışır.",
  'peter pan in kensington gardens.jpg':
      "The story begins with Peter Pan's disappearance as a baby and continues with his fantastic adventures in Kensington Gardens. Peter meets the other children in the gardens, talks to the animals and is drawn into a magical world.",
  'sherlock holmes.jpg':
      'Holmes is a clever and careful detective, using his observations and logic to solve cases. In the many stories of the series, Holmes and Watson confront murders, robberies, missing persons and mysterious events on the streets of London and other places of the period. ',
  'the idiot.jpg':
      'It tells the story of Prince Lev Nikolayevich Myshkin. Myshkin returns to Russia after a long period of treatment in Switzerland for a mental illness. However, he encounters difficulties in his social environment and among the people around him.',
  'Around the World in 80 Days.jpg':
      'Phileas Fogg makes a bet to travel around the world in 80 days, starting from London. Together with his servant Passepartout, they visit various countries and continents using trains, ships and other means of transportation. But along their journey, they encounter a detective and various challenges.',
  'robinson crouse.jpg':
      'The novel tells the story of Robinson Crusoe, an English sailor who is shipwrecked on a remote island and tries to survive there alone. Crusoe spends years on the island, struggling to survive, building shelters, finding food and filling his time with various activities to avoid feeling alone on the island.',
  'Gullivers travel.jpg':
      ' Gulliver goes on four different journeys: Lilliput, Brobdingnag, Laputa and Houyhnhnms. Each country has a different social structure, culture and worldview. Through his experiences in these different societies, Gulliver discovers human nature, social structures and human weaknesses.',
  'aydakı kadın.jpg':
      "Leyla çocuksuz evli bir kadındır. Once Suat'la sevişmiş, sonra izah edilemeyecek bir ruh hali ile Refik'le evlenmiştir.",
  'emma.jpg':
      'Emma is a novel about youthful pride and romantic misunderstandings. The novel is set in the fictional village of Highbury and the surrounding estates of Hartfield, Randalls and Donwell Abbey and is about the relationships between several families.',
  'kurk mantolu madonna.jpg':
      "Raif Efendi, içine kapanık, melankolik ve dış dünyaya uyum sağlamakta zorlanan bir karakterdir. Hayatı boyunca pek çok zorluğa katlanmış ve haksızlıklara karşı gelmekte başarısız olmuştur. Sevmediği bir kadınla evlenmiş ve çocukları olmuştur, ancak kendi isteklerine uygun bir hayat yaşayamamıştır. Gerçekten hissettiği tek mutlu anı günlüğüne yazmıştır.",
  'Love and Mr Lewisham.jpg':
      "At the beginning of the novel, Mr. Lewisham is an 18-year-old teacher at a boys' school in Sussex, earning forty pounds a year. He meets and falls in love with Ethel Henderson, who is visiting relatives.",
  'madame bovary.jpg':
      'The novel deals with the events and relationships experienced by Emma Bovary, the wife of Charles Bovary, a fair-hearted and conventional physician with high ideals and a love of excessive pomp, in order to escape from monotony.The author adopts the observant side of realism while describing the inner worlds of the figures.',
  'simdi sevisme vakti.jpg':
      "İstanbul'un sokaklarında dolaşan insanların hayatlarına, duygularına ve ilişkilerine dokunarak okuyucuyu derinden etkiler. Hüzünlü, melankolik ve bazen ironik tonlarıyla Sait Faik'in kısa öykülerinde insanın iç dünyası ve yaşamın karmaşıklığı ustalıkla işlenir.",
  'a modest proposal.jpg':
      "It is an essay by the Irish writer Jonathan Swift, published in 1729. It was written as a critical response to the British Empire's rule of Ireland. While addressing the poverty of Ireland and the negligence of the British government, Swift also draws attention to social problems in a humorous style.",
  'a vital problem of married.jpg':
      'Gibbs explores the challenges of the eighth year of marriage and how couples can navigate this sensitive period.',
  'Alices Adventures in Wonderland.jpg':
      "Alice was bored sitting by the river with her sister. And there was nothing to do. Once or twice she glanced at the book in her sister's hand, but she could not see any pictures or dialog, 'But what good is a book without pictures or dialog?' she thought.",
  'An Elegy on the Glory of her Sex.jpg':
      'Goldsmith was an 18th century English poet and this poem focuses on the place and importance of women in society. The poem is an elegy written on the death of a woman named Mary Blaize.',
  'A Connecticut Yankee in King Arthurs Court.jpg':
      ' The novel tells the story of a Connecticut man named Hank Morgan. One day, he accidentally falls into the time of King Arthur, in medieval England. Hank Morgan decides to transform medieval society by utilizing modern knowledge and technology.',
  'A Short History of the World.jpg':
      ' A Short History of the World is a work on the history of humanity by the British writer H. G. Wells.',
  'a tale of two cities.jpg':
      'A Tale of Two Cities is a novel written by Charles Dickens in 1859 to be published in newspapers and set in Paris and London during and before the French Revolution. ',
  'A Tangled Tale.jpg':
      'A collection of 10 humorous short stories by Lewis Carroll, published serially in The Monthly Packet between April 1880 and March 1885.',
  'treatise of human nature.jpg':
      'A Treatise on Human Nature: Being an Attempt to Introduce the Method of Experimental Reasoning into Moral Matters is a book by the Scottish philosopher David Hume.',
  'a vısıt to three fonts.jpg':
      'During the war, Doyle visited the fronts of France, Belgium and Italy to see the true face of the war. It is a series written after these visits and reveals the brutality, human drama and courage of the war.',
  'adventures in journalism.jpg':
      "It is a book written by Philip Gibbs. Philip Gibbs is a British journalist and author. It is a memoir of Gibbs' experiences and observations during his journalism career.",
  'Adventures of Huckleberry Finn.jpg':
      " It focuses on Huck Finn's time spent with Jim, a runaway slave, and his inner struggle against slavery. Huck experiences a conflict between the values imposed on him by society and his own conscience, and finally decides to fight for Jim's freedom. ",
  'alemdagda bir yilan.jpg':
      "1950 yılında yayımlanan bu kitap, yazarın kısa öyküleriyle doludur ve genellikle doğa, insan ilişkileri, toplumun çeşitli kesimleri ve İstanbul'un sokakları gibi konuları ele alır.",
  'atesten gomlek.jpg':
      "Roman, ana karakter olan Selma'nın yaşadığı hayatı ve Türk Kurtuluş Savaşı'nın etkilerini anlatır. Selma, savaşın ve toplumsal çalkantıların ortasında kendi kimliğini ve inançlarını bulmaya çalışır.",
  'bleak house.jpg':
      'On the one hand, the novel revolves around the case of Jarndyce and Jarndyce, a wealthy inheritance case, and on the other hand, it explores the lives and relationships of the different characters involved in this case.',
  'Boom, peace and quiet.jpg': '',
  'candide.jpg':
      'Candide is a young man known for his ignorant optimism and defends the thesis of a philosopher named Pangloss that "this world is the best world". However, Candide is forced to face the realities of life and loses his optimism as a result of the tragedies he experiences.  ',
  'an enquiry concerning human understanding.jpg':
      'Hume investigates how human beings acquire knowledge through information and experience and examines the limits of the human mind. In the work, he deals with topics such as causality, identity, space-time, causality and probability.',
  'an enquiry concerning the principles of morals.jpg':
      "While investigating the foundations of morality, Hume examines human nature and moral values. According to him, moral values are rooted not only in reason or God's will, but also in human nature.",
  'Ann Veronica.jpg':
      'Ann Veronica is a young woman full of the desire for independence. Challenging social norms and gender roles, she decides to lead her own life and make her own decisions.',
  'balkan harbi.jpg':
      " Osmanlı İmparatorluğu'nun Balkanlar'da yaşadığı savaşlardan birini konu alır. Ömer Seyfettin'in genellikle savaşın insanlar üzerindeki  etkilerini ve yarattığı trajedileri anlattığı bu hikaye, savaşın yıkıcı doğasını ve insanların savaş sırasında nasıl değiştiğini gösterir.",
  'barnaby rudge.jpg':
      "Barnaby is a simple and innocent young man, but his mother is full of dark secrets that haunt him. The novel explores Barnaby's inner world as well as the social and political upheavals he experiences.",
  'Benjamin Franklin.jpg':
      'In his book, Franklin presents excerpts from his own life and teaches readers valuable lessons on the road to success.',
  'bes sehir.jpg':
      "Ahmet Hamdi Tanpınar'ın, hayatının tesadüfleri olan Ankara, Erzurum, Konya, Bursa, İstanbul şehirlerini anlattığı deneme türü eseri.",
  'cakicinin ilk kursunu.jpg':
      " Aydın'da yaşamış olan ünlü bir eşkıyanın, Çakırcalı Mehmet Efe veya Çakıcı Efe denen eşkıyanın Hikâyesi.",
  'daniel deronda.jpg':
      'The novel explores different segments of British society, Jewish identity, and the impact of the British Empire, while exploring the personal and social development of the characters.',
  'dirilen iskelet.jpg':
      "Osmanlı toplumunun çeşitli kesitlerini ve dönemin sosyal yapılarını gözler önüne serer. Roman, İstanbul'da yaşayan farklı karakterlerin hayatlarını, ilişkilerini ve çatışmalarını anlatırken, toplumun alt sınıflarının yaşadığı zorlukları da yansıtır.",
  'dream psychology.jpg':
      'Freud argues that dreams are the expression of unconscious desires and that dreams use a symbolic language. According to him, deciphering the meaning of dreams is a way of revealing unconscious desires and anxieties.',
  'bozkurtlar diriliyor.jpg':
      "  Göktürk Devleti'nin kurucu lideri Bilge Kağan ve onun döneminde yaşanan olayları anlatırken, Türk milletinin milli kimliğini ve ruhunu vurgular.",
  'bozkurtlarin olumu.jpg':
      " Türk tarihindeki kritik bir dönem olan Malazgirt Meydan Muharebesi'ni ve sonrasını konu alır. Bu savaşta Türklerin Bizans İmparatorluğu'na karşı elde ettiği zafer anlatılırken, roman aynı zamanda Türk milletinin milli kimliğini ve ruhunu vurgular.",
  'bugunun saraylisi.jpg':
      "Bugünün Saraylısı, İstanbul'un farklı semtlerinde yaşayan çeşitli sosyal sınıflardan karakterlerin hayatlarını ve ilişkilerini konu alır. Roman, karakterlerin günlük yaşam mücadeleleri, aşkları, umutları ve hayal kırıklıklarını incelerken, aynı zamanda dönemin siyasi ve toplumsal atmosferini de yansıtır.",
  'butun oykuler.jpg':
      "aşk, özgürlük, adalet, yalnızlık ve umutsuzluk... Sabahattin Ali'nin anlatımı sade ve etkileyici oykuleri, okuyucuyu derinden etkileyen karakterleri ve olayları ıle dolu oyku serısı.",
  'capitale de la douleur.jpg':
      'is a collection of poems by the French poet Paul Éluard, published in 1926. In this collection, Éluard expresses his personal pain, trauma and emotional experiences in the post-World War I period.',
  'classic for chilldren.jpg':
      'While the novel is about the life and relationships of a modern American family, it also alludes to classical works and ancient Greco-Roman culture.',
  'cleopatra.jpg':
      'Cleopatra mixes historical action with supernatural events and can be described as a historical fantasy novel.',
  'Confidence.jpg':
      "Francie is torn between two men living in Europe with different social positions: Bernard Longueville, a rich and attractive young man, and Lord Lovelace, an English nobleman. Francie's relationship between these two men and her emotional turmoil are at the center of the novel.",
  'david copperfield.jpg':
      'After being bullied by his mother Clara and stepfather Mr. Murdstone, David goes to live with his mother and her maid Peggotty. Facing many twists and turns in his life, David works in different professions, builds various relationships and tries to cope with the difficulties of life.',
  'Death in Venice.jpg':
      "Gustav von Aschenbach is a successful German writer who comes to Venice for a summer vacation. However, his obsessive attraction to a beautiful young Polish boy causes a deep inner breakdown. As she struggles with her passionate desires and inner conflicts, she must also contend with Venice's corrupt and death-stricken atmosphere.",
  'Der Zeuberberg.jpg':
      'Hans Castorp goes to a sanatorium in the Swiss Alps with a visiting relative and plans to spend a few weeks there. However, after his short stay, he unexpectedly stays in the sanatorium for several years. During this time, he develops relationships with various patients and doctors and becomes more and more immersed in this isolated world.',
  'dialogues concerning natural religion.jpg':
      'In the work, two characters, Cleanthes and Philo, defend natural theology, while the third character, Demea, takes a more mystical and mysterious approach to religious beliefs. The debate between these three characters deals with fundamental issues in the philosophy of religion, such as the provability of divine existence, the nature of the concept of God, and the existence of evil and suffering in the world.',
  'divine comedy.jpg':
      "It describes Dante's own spiritual journey and reflects the poet's profound reflections on the nature of Divine Justice and the spiritual salvation of man. Dante's work consists of three parts: Inferno (Inferno), Purgatory (Purgatorio) and Paradise (Paradiso). In each section, Dante encounters prominent historical and mythological figures, and through these encounters he describes the human journey between heaven and hell.",
  'dombey and son.jpg':
      "Paul Dombey is the son of Mr. Dombey, a rich and ruthless businessman. Mr. Dombey sees his son as a tool to strengthen his presence in the business world. However, Paul's poor health and failure to develop according to his expectations triggers a series of events in the life of the Dombey family.",
  'don quixote.jpg':
      "It tells the story of a Spanish nobleman named Alonso Quixano who gets carried away by romantic novels of chivalry and embarks on chivalric adventures, calling himself 'Don Quixote'. Together with his sidekick Sancho Panza, Don Quixote fights imaginary enemies, defends goodness and justice, and encounters the funny and twisted sides of the real world.",
  'Dorothy amd the Wizard Oz.jpg':
      "It tells the story of Dorothy Gale's return from Kansas to Oz, where she has new adventures. This time Dorothy, her Kansas pet Toto and her friend Zeb are trapped in an underground cave that was swallowed by an earthquake. They then encounter various fantastical creatures and events as they escape.",
  'Edinburgh.jpg':
      "It is a work by Scottish writer Robert Louis Stevenson published in 1878. It is a travel book containing Stevenson's observations and impressions of the city of Edinburgh.",
  'great expectations.jpg':
      "Pip is a poor peasant boy. One day, he is mysteriously invited to the mansion of Miss Havisham, a mysteriously wealthy person. There he meets Estella, Miss Havisham's beautiful but cold-hearted adopted daughter. Pip's life changes unexpectedly after this event and he becomes a man with 'great expectations'.",
  'eight cousins.jpg':
      "After the death of her father, Rose moves in with her aunt and uncle, where she grows up with her eight cousins. The novel is about the relationships between Rose's family and her cousins, her adventures and her growing up.",
  'fair margaret.jpg':
      "Margaret falls in love with Hugh Hainault, heir to a noble family. However, Hugh's mother looks down on Margaret's family and rejects them. This strains the relationship between Margaret and Hugh and leads to a series of tragic events.",
  'faust 1.jpg':
      "Faust tells the story of a scholar's pact with the devil named Mephistopheles and the events that follow. Faust is introduced as a scholar in search of more knowledge and meaning. Mephistopheles promises Faust eternal knowledge and pleasure, but asks for his soul in return. Faust accepts this offer and experiences a series of events on human experience.",
  'faust 2.jpg':
      "Faust tells the story of a scholar's pact with the devil named Mephistopheles and the events that follow. Faust is introduced as a scholar in search of more knowledge and meaning. Mephistopheles promises Faust eternal knowledge and pleasure, but asks for his soul in return. Faust accepts this offer and experiences a series of events on human experience.",
  'henry v.jpg':
      "After taking the throne of England, Henry declares war on France and wins a great victory at the Battle of Agincourt. However, Henry's leadership and decisions had a profound impact on both his soldiers and his enemies.",
  'huzur.jpg':
      " Mümtaz, İstanbul'un karmaşık atmosferinde kendini ve ait olduğu değerleri sorgularken, aynı zamanda geçmişiyle ve aşkla olan ilişkisiyle yüzleşmek zorunda kalır.",
  'First and Last Things.jpg':
      'Wells seeks the balance between scientific facts and human inner experiences and criticizes the complexity of the modern world.',
  'Fundamental Principles of the Metaphysic of Morals.jpg':
      'Kant finds the basis of moral obligations in universal moral principles, which he calls the "categorical imperative". According to him, our moral actions derive from our ability to accept moral laws as universal, and the essence of moral values is the adoption of our moral imperatives by our free will.',
  'general-introduction-to-psychoanalysis.jpg':
      'Freud deals with topics such as the unconscious, the interpretation of dreams, defense mechanisms and the basic concepts of psychoanalysis.',
  'God the Invisible King.jpg':
      "Wells discusses the evolution and role of religion and the concept of God. He also presents his ideas on how science and religion can complement each other and adapt to the modern world's understanding of religion.",
  'hamlet.jpg':
      "Hamlet is in a strange mood in the palace after the death of his father. He encounters his father's ghost and asks him to avenge his death. Hamlet experiences moral, philosophical and emotional conflicts while trying to fulfill his obligation to take revenge. ",
  'hard times.jpg':
      "Through the lives and interactions of various characters living in an industrial city called Coketown, we see the social class divisions of the period, the difficulties of the working class, the criticism of the education system and its effects on people's empathy and human emotions.",
  'Hawthorne.jpg': '',
  'homage to catalonia.jpg':
      'In Homage to Catalonia, Orwell examines the complex political processes, conflicts and ideological divisions during the Spanish Civil War. He also criticizes the internal struggles on the Republican side and the influence of Soviet Union-backed communist groups.',
  'hospital sketches.jpg':
      'Alcott served as a nurse in the Union Army during the American Civil War. Based on these experiences, "Hospital Sketches" examines the medical conditions on the battlefield, the experiences of wounded soldiers and the effects of war on people. ',
  'Human, All Too Human.jpg':
      'Nietzsche examines human nature, social structures, moral values and cultural norms, but also the inner conflicts and contradictions of human beings. Nietzsche argues that man must openly recognize his weaknesses and flaws, and that accepting them can have a liberating effect.',
  'hunger.jpg':
      "The protagonist, living in poverty, finds himself in a dilemma between writing and working to survive. While focusing on themes such as poverty, hunger and social ostracization, the novel also explores the conflicts and dilemmas in the protagonist's inner world.",
  'In the Days of the Comet.jpg':
      'After a comet appears in the sky one day, Leadford begins to observe the social transformations and changing behavior of people around the world. The gas from the star destroys the evil in people and creates harmony and peace in the world.',
  'jos boys.jpg':
      'It follows the life of Jo March, one of the daughters of the March family, as an adult and the lives of the people around her. Jo establishes a school called Plumfield, where she takes care of the children while trying to raise them at the same time. ',
  'kinglear.jpg':
      "It begins with Lear's wish to divide his kingdom among his three daughters Goneril, Regan and Cordelia. However, after the responses from his daughters, Lear excludes his most loyal daughter Cordelia and shares his kingdom with his other two daughters. This decision triggers family conflicts and turns Lear's life upside down.",
  'markopasa ve yazilari.jpg':
      "Marko Paşa başlıklı öykü, Sabahattin Ali'nin Türk toplumunu eleştiren ve insan psikolojisi üzerine derinlemesine düşündüren hikayelerinden biridir.",
  'ibni batuta.jpg':
      " İbn Battuta'nın 30 yılı aşkın süren gezi macerasını, doğu ve batı arasında uzanan geniş coğrafyada yaşadığı deneyimleri, ticaret yollarını, yerel yönetimleri ve toplumsal yapıları aktarır.",
  'icmizde ki seytan.jpg':
      " Ahmet Celal, toplumun ve kendi iç dünyasının baskıları altında ezilmiş, tükenmiş bir adamdır. Roman, onun geçmişine ve yaşamının farklı dönemlerine geri dönerek, okuyucuya karakterin içsel çatışmalarını ve yabancılaşmasını anlatır.",
  'iffet.jpg':
      " Münevver Hanım, ahlaki değerlerine bağlı, iffetli bir kadındır. Ancak, hayatının bir döneminde kendisinden yaşça büyük olan Halit Bey ile karşılaşır ve aralarında imkansız bir aşk başlar. Bu aşk, toplumun ve ahlaki değerlerin onlara karşı tavır almasıyla büyük bir sınavdan geçer.",
  'iliad.jpg':
      ' The events that begin when Paris kidnaps Helen, the wife of Menelaus, brother of the Greek king Agamemnon, lead to a protracted war. The Iliad tells the story of the period leading up to the end of the war through the rage of Achilleus, the leader of the Greek warriors, the heroism of Hector and the tragic fates of many other characters.',
  'in the penal colony.jpg':
      'an officer punishes his criminals by strapping them to a torture device. However, the functioning of this device and the method of punishment are highly unusual and open to criticism.',
  'israel potter.jpg':
      "While fighting in various stages of the American Revolution, Israel Potter was captured during the war and taken to England by British ships. The novel details Israel Potter's experiences in England and his years in exile.",
  'istanbulun ic yuzu.jpg':
      "Halide Edib, İstanbul'un geleneksel yapısını, toplumsal normlarını ve değişen dönüşen dünyasını ele alırken, aynı zamanda Osmanlı İmparatorluğu'nun çalkantılı son dönemlerindeki siyasi ve toplumsal atmosferi de yansıtır.",
  'jack and jill.jpg':
      'Jack and Jill are two close friends living in a small town. As the novel progresses through the various events, games and learning experiences they go through together, it also deals with the growth and maturity of the characters.',
  'julius-caesar.jpg':
      "The assassination by a group of Roman senators, including Caesar's former ally Brutus, causes a major shake-up in the political atmosphere of Rome. In the aftermath of this assassination, conflicts between the Roman people and the generals begin and shake Rome.",
  'kalp agrisi.jpg':
      "Feride, evli bir adam olan Cemil'e aşık olur ve bu yasak aşkın yarattığı iç çatışmalarla başa çıkmak zorunda kalır. Roman, Feride'nin duygusal gelgitlerini, iç hesaplaşmalarını ve toplumsal normlarla çatışmasını anlatır.",
  'kasagi.jpg':
      "Osmanlı dönemi Türk toplumunun çeşitli yönlerini ve insan ilişkilerini ele alır. Kaşağı, köy yaşamı, gelenekler ve toplumsal yapının çeşitli yönlerini işleyen etkileyici bir hikayedir.",
  'Kidnapped.jpg':
      "It tells the story of David's abduction by a relative after the death of his parents and the adventures that follow. David encounters pirates, befriends fugitives and has to overcome many difficulties. ",
  'Life on the Mississippi.jpg':
      'In this work, Twain analyzes in detail the importance of the Mississippi River, the surrounding society and the way of life by sharing his own experiences and observations. The work also emphasizes the economic, social and cultural importance of the Mississippi River.',
  'macbeth.jpg':
      "It tells the story of Macbeth's ambitious plans to seize the throne as a result of the prophecies of the three witches, his own ambition and the provocations of his wife Lady Macbeth. However, as a result of the crimes they commit on the way to this ambition, the couple experience inner conflicts and move towards collapse.",
  'MAHUR BESTE.jpg':
      "Suat Bey, Türk müziği bestecisi olan bir karakterdir ve roman boyunca müzikle olan ilişkisi ve içsel dünyası önemli bir yer tutar.",
  'mansfield park.jpg':
      "Fanny grows up in Mansfield Park, the estate of the Bertrams, a wealthy family. The novel is about Fanny's experiences after she is adopted by her family for the estate and the social dynamics within the family.",
  'metres.jpg':
      "Roman, İstanbul'un fakir semtlerinden birinde geçer ve baş karakterlerinden biri olan Nuri Bey'in, yasak bir ilişki yaşadığı metresiyle olan ilişkisini konu alır. Roman, dönemin toplumsal normları ve ahlaki değerleriyle çatışan bu ilişkiyi merkeze alarak, insanın içsel çatışmalarını ve toplumsal baskıları işler.",
  'Mr. Britling Sees It Through.jpg':
      "After the outbreak of the war, Britling confronts the tragedies and social problems of war. The novel deals with Britling's experiences, inner conflicts and thoughts from the beginning to the end of the war, while also examining the effects of the war on his family and other characters around him.",
  'New Arabian.jpg':
      'It includes unusual and exciting stories set in different places and times. These stories deal with different themes such as adventure, romance, mystery and humor.',
  'Notes of a Son and Brother.jpg':
      "It contains James's memories and reflections on his family and childhood. The book is a journey of inner exploration into the author's family, childhood and family ties.",
  'martin chuzzlewit.jpg':
      "Martin is a wealthy and charming heir, yet arrogant and selfish. The novel depicts the turning points in Martin's life, his relationships with his family, his loves and conflicts, as well as various cross-sections of English society at the time.",
  'medari maiset motoru.jpg':
      "Roman, İstanbul'un farklı semtlerinden gelen bir grup karakterin etrafında dönüyor. Bu karakterler, farklı sosyal sınıflardan ve geçim kaynaklarından gelmekte olup, İstanbul'un karmaşık dokusunu temsil ederler.",
  'memleket hikayeleri.jpg':
      "Anadolu'nun farklı bölgelerinden ve insanlarından kesitler sunar. Hikayeler, genellikle sıradan insanların günlük yaşamlarından ve yaşadıkları olaylardan yola çıkarak, insan doğası, ahlaki sorunlar, toplumsal çatışmalar ve milli değerler gibi temaları ele alır.",
  'merchant-of-venice.jpg':
      "The play is set in Venice and tells the story of one of the main characters, the merchant Antonio, who is unable to pay his debt to the Jewish moneylender Shylock. The play is also about Antonio's close friend Bassanio's love affair with Portia, a rich woman, and his struggle to win her inheritance.",
  'micromeas.jpg':
      'is about two alien beings, Micromégas and his eight-kilometer-tall friend, who visit Earth. These aliens come from different planets and when they meet humans, they begin to observe their small minds and prejudices.',
  'midsummernight.jpg':
      'While exploring the fine line between love, imagination and reality, it also examines the interaction of different social classes and characters. The play is notable for its complex plot, rich characters and poetic language, as well as its playful and magical atmosphere.',
  'moby dick.jpg':
      'The novel centers on Ahab, the captain of the whaling ship Pequod, and his obsession with hunting Moby Dick, a legendary white whale. Ahab is a sailor whose leg was once amputated by Moby Dick and sets out on a hunting trip with his ship to seek revenge.',
  'moon of israel.jpg':
      'While the novel deals with the ancient history of Egypt and the Pharaonic period, it also deals with the life of the Jewish people in captivity and the exodus of the Israelites from Egypt. ',
  'mrs  dalloway in bond street.jpg':
      "Clarissa's inner monologues in her mind describe in detail the people around her and the atmosphere of the city. While shopping and watching the people around her, Clarissa is immersed in her past memories and emotions. ",
  'murebbiye.jpg':
      "Mürebbiye, ailenin küçük kızı Ayşe'nin gözünden olayları takip eder. Ayşe'nin anne ve babası, Batılı eğitim metotlarını benimsemiş ve çocuklarını modern bir şekilde yetiştirmek isteyen ilerici bir ailedir. Ancak, ailenin mürebbiyesi (dadısı) Fatma Hanım, geleneksel değerlere ve İslamiyet'e bağlılığını koruyarak modernleşmeye direnir.",
  'nada the lily.jpg':
      "The novel is set in ancient Egypt and tells of events during the reign of Pharaoh Meneptah. The story follows the life of Nada, a girl from the Zulu people. Nada acts with strength and determination to avenge her father's death and secure the freedom of her people.",
  'natural selection.jpg':
      "Natural Selection is a fundamental concept in Charles Darwin's theory of evolution. In this process, organisms with characteristics adapted to the environment have a better chance of survival and reproduction. In this way, genetic changes occur in populations over time and species evolve.",
  'new life.jpg':
      " It consists of poems in which Dante deals with the theme of love and death. Throughout the book, Dante describes his love for a woman named Beatrice and his emotional experiences under her influence. Beatrice is an idealized figure in Dante's poems and represents his spiritual salvation.",
  'nicholas nickleby.jpg':
      'Nicholas lives a difficult life with his mother and sister Kate. After the death of his father, the family is forced to struggle with financial difficulties. Nicholas takes responsibility for his mother and sister and goes to London to look for work. Here he has various adventures in a world full of educational institutions and fraud.',
  'Ninety Three.jpg':
      'The novel follows three different main story lines. The first is the rebellion and escape of Lantenac of La Vendeé, a ship captain. The second is the internal reckoning and difficult decisions of Cimourdain, the Republican general sent to put down the uprising. The third is the tragic story of a family, a father and son and the difficulties they face in the midst of uprising and civil war.',
  'notes from the underground.jpg':
      'The novel takes its name from the experiences of a rebellious character, the narrator, in the underworld. The narrator is a character who goes against the norms and expectations of society. Feeling himself outside of society and rejecting its values, this character experiences a great conflict in his own inner world.',
  'our with spain for cuba freedom.jpg':
      "Trumbull White provides a detailed account of the events leading up to the war and examines the conflicts, political and social dynamics during the war. He explores the motivations behind America's entry into the war and analyzes what was being done on a large scale in Cuba's quest for freedom.",
  'Protagoras.jpg':
      "Protogoras is one of the representatives of the sophists and is known as the master of rhetoric and argumentation. Socrates has an in-depth discussion with Protogoras on ethics and knowledge. Throughout the dialogue, Socrates questions concepts such as virtue, justice, goodness and wisdom and criticizes the sophists' arguments.",
  'sehrın dısındakıler.jpg':
      " Hayri, İstanbul'da yaşadığı kültürel ve entelektüel çevreden uzaklaşmıştır ve şehrin dışındaki sakin ve huzurlu bir hayata çekilmiştir. Ancak kasabada da çeşitli insanlar ve olaylarla karşılaşır ve bu yeni çevresinde kendini bulmaya çalışır.",
  'Notre Dame de Paris.jpg':
      "The main characters of the novel include a hunchbacked man named Quasimodo, the beautiful and naive Esmeralda, Princess Phoebus and Bishop Claude Frollo. The story tells of Quasimodo's love for Esmeralda and Frollo's obsessive pursuit of her. ",
  'now it can be told.jpg':
      "It is a book of British writer Philip Gibbs' memoirs about the First World War, published in 1920. It is based on Gibbs' experiences as a journalist during the war.",
  'oliver twist.jpg':
      'The story follows Oliver from his birth to his placement in an orphanage and his subsequent encounters with malicious orphanage officials and criminal gangs living on the streets. Despite his hardships on the streets, Oliver is a kind and innocent character. ',
  'our mutual friend.jpg':
      'The novel begins with the death of a wealthy heir named John Harmon and the subsequent intrigues between the people who want to claim his inheritance. According to his will, Harmon is expected to leave this inheritance to a family that has done him a favor. However, Harmon escaped from the hands of those who tried to kill him and started to live under another identity. ',
  'oyle bir hikaye.jpg':
      "Sait Faik'in öyküleri genellikle İstanbul'un sokaklarında geçer ve sıradan insanların hayatlarını, duygularını ve çatışmalarını ele alır. Doğanın ve denizin insanlar üzerindeki etkilerini sıkça işler ve genellikle melankolik bir hava taşır. ",
  'poems of william blake.jpg':
      'A collection of poems by the English poet, painter and printmaker William Blake. William Blake is one of the leading poets of the Romantic period and his work is known for its contemplation, mysticism and experimental use of language.',
  'pride and prejudice.jpg':
      'It centers on the search for marriage among the five daughters of the Bennet family. The story follows Elizabeth Bennet, one of the main characters, as she deals with her romantic relationships, her search for love and the expectations of society. Elizabeth meets the proud and wealthy Mr. Darcy and develops a bumpy relationship with him.',
  'resurrection.jpg':
      'It tells the story of Dmitri Nekhlyudov, an aristocratic youth, and his remorse after he accidentally causes the unjust imprisonment of a woman, and his attempt to redeem and atone for her. Nekhlyudov witnesses the dramatic transformation of this woman, Maslova, while at the same time strengthening his bond with her and undergoing a life-changing inner transformation.',
  'Rhyme and Reason.jpg':
      "The book contains poems written in a variety of themes and styles. Carroll's poems are full of language games, logic games and satirical references, while using a playful style. ",
  'Roderick Hudson.jpg':
      "The novel centers on the life and career of American sculptor Roderick Hudson. Hudson leaves America for Italy, where he is recognized as a talented artist. However, Hudson's career and personal relationships are fraught with personal difficulties as well as artistic ambitions and passions.",
  'romeo-and-juliet.jpg':
      'Romeo and Juliet are the children of two hostile families, the Montagues and the Capulets. However, these two young lovers feel a deep passion for each other despite the enmity of their families. Despite their passionate love, through a tragic series of events they find themselves involved in a suicide plot.',
  'saatlerı ayarlama enstıtusu.jpg':
      "Roman, İstanbul'da geçen bir günü anlatır ve birkaç farklı karakterin yaşamlarını ve ilişkilerini izler. Hikaye, Sabahattin Ali'nin ünlü öyküsü 'Kürk Mantolu Madonna' ile bağlantılıdır ve romanın ana karakterlerinden biri olan Hayri İrdal, Sabahattin Ali'nin eserlerine birkaç kez gönderme yapar.",
  'salommbo.jpg':
      "The story tells of a time when Carthage was struggling with internal and external dangers that threatened its existence. A rebellion breaks out in Carthage and Salammbô, the daughter of Carthage's general Hamilcar Barca, develops an emotional attachment to the rebel leader Matho. ",
  'saray ve otesi.jpg':
      ". Hikaye, Osmanlı sarayının içinden ve çevresinden farklı kesimlerden kadın karakterlerin gözünden anlatılır. Sarayda yaşayan kadınlar, çeşitli sınıf ve statülerden gelirler ve her biri kendi kişisel hikayesini ve deneyimini taşır.",
  'St. Ives.jpg':
      'The novel is about the adventures of St. Ives, who becomes involved in a French espionage network during the Napoleonic Wars. St. Ives embarks on a journey full of dangers to escape captivity and find love.',
  'Sylvie and Bruno.jpg':
      'The novel revolves around two fantastic characters. Sylvie is described as a fairy girl, while Bruno is a fictional character who interacts with humans. The story has a complex structure that intertwines the fantastic adventures of Sylvie and Bruno with real world events.',
  'the american.jpg':
      "At the center of the novel is an American billionaire named Christopher Newman. While traveling in Europe, Newman meets and falls in love with Claire de Cintré, the daughter of a French aristocratic family. However, the interests and traditional expectations of Claire's family stand in the way of Newman and Claire's relationship.",
  'semaver.jpg':
      "Sait Faik'in ustalıklı anlatımı ve derin gözlem yeteneği, okuyuculara sıradanlığın içinde gizlenmiş derinlikli duyguları ve insan ilişkilerini keşfetme fırsatı sunar.",
  'sense and sensibility.jpg':
      'Focusing on the lives of Elinor and Marianne, the two daughters of the Dashwood family, the novel explores the balance between emotional and rational responses, focusing on the different characters of the two girls. Elinor is a rational and calm character, while Marianne is emotional and passionate in nature. The novel revolves around the love lives and relationships of these two girls.',
  'sevda sokagi komedyasi.jpg':
      "Roman, İstanbul'un farklı sosyal sınıflarından ve kültürel arka planlardan gelen karakterlerin yaşadığı Sevda Sokağı'nda geçer. Hikaye, sokaktaki komşuluk ilişkileri, aile içi çatışmalar ve aşk üzerine odaklanır. ",
  'seyehatname.jpg':
      "Evliya Çelebi Seyahatnamesi, dünya edebiyatının en eski ve en kapsamlı seyahatnamelerinden biri olarak kabul edilir. Eser, Evliya Çelebi'nin gezdiği yerlerdeki doğal güzellikler, mimari yapılar, insanlar ve kültürel detaylar hakkında ayrıntılı ve renkli bir portre sunar. ",
  'silas marner.jpg':
      "It deals with themes such as the inner transformation of man, social exclusion, moral values and human relationships. The novel is famous for George Eliot's in-depth character analysis and social criticism. ",
  'sinekkli bakkal.jpg':
      "Roman, 19. yüzyıl sonlarında Osmanlı İmparatorluğu'nun son dönemlerinde, İstanbul'un çeşitli semtlerinden birinde bulunan Sinekli Bakkal adlı bir hanın etrafında döner. Hanın sahibi olan ve çeşitli kiracılarla ilişkilerini gözlemleyen İhsan Bey'in yaşamı ve hikayesi merkeze alınır.",
  'sipsevdi.jpg':
      "Romanın ana karakteri Meftun Bey'dir. Meftun Bey okumak için gittiği Fransa'nın Paris kentinde yıllarca kalır, fakat buraya asıl geliş sebebini unutup, eğitim görmekten kaçar.",
  'songs of innocence.jpg':
      'The collection of poems revolves around the theme of innocence and childhood. Blake emphasizes the purity and innocence of childhood, leading to deep reflections on human nature.',
  'tempest.jpg':
      "Prospero has been exiled to an island where he uses his magical powers to control its inhabitants. The play revolves around Prospero's desire for revenge against his enemies, the love life of his daughter Miranda and the interactions of supernatural beings.",
  'The Adventures of Tom Sawyer.jpg':
      "The novel takes place in St. Petersburg, a small town on the banks of the Mississippi River. The main character, Tom Sawyer, is a local boy. Tom's adventures enliven the quiet life of the town and offer a portrait of his imaginative world and that of his friends.",
  'The Ambassadors.jpg':
      'international relations, cultural conflicts, personal freedoms and emotional attachments. The novel explores the differences and contradictions between America and Europe, while also exploring the inner conflicts and emotional development of the individual.',
  'The Antichrist.jpg':
      "It contains Nietzsche's thoughts on concepts such as nihilism, the will to power and transcendental man. The work presents an in-depth critique of how moral values and religion hinder human freedom and power.",
  'the beautiful and damned.jpg':
      'Anthony lives a rich life thanks to his inheritance, but this leads him to laziness and a bohemian life. Gloria, on the other hand, is in search of beauty and wealth. However, their marriage becomes monotonous and full of disappointments.',
  'The Black Arrow. A Tale Of Two Roses.jpg':
      "It is about the rivalry between the York and Lancaster dynasties in King Henry III's struggle for power. The story revolves around a young man, Dick Shelton. Dick learns of a political conspiracy that killed his family and then decides to find a black archer to take revenge.",
  'the bostanians.jpg':
      "Olive is a woman with feminist and reformist views and one of the pioneers of the women's rights movement. The main event of the novel is Olive's attempt to influence Verena Tarrant, a female activist, and to mold her in line with her ideals. ",
  'The Cossacks.jpg':
      'The novel follows the story of Olenin, a young Russian nobleman. Olenin is tired of the oppressive rules and limitations of his society and decides to seek freedom and adventure among the Cossacks in the Caucasus. ',
  'The Exemplary Novels of Cervantes.jpg':
      'It is a work by Spanish writer Miguel de Cervantes, published in 1613. It is a novella collection of twelve short stories and is considered an important contribution of Cervantes to Spanish literature.',
  'The Door in the Wall.jpg':
      'As a child, Lionel often discovers a secret door in a wall and finds a wonderful garden and a world full of journeys. However, each time his chance to visit this fantastical world is short-lived, and over time the real world begins to overpower him.',
  'the great gatsby.jpg':
      "Gatsby is a man living in opulence and has gained not only wealth but also social status in the hope of reconnecting with his forbidden love, Daisy Buchanan. However, Gatsby's life and love are dramatically confronted with the emptiness and corruption of the American Dream",
  'the brothers karamazoc.jpg':
      'The novel revolves around the three sons of the Karamazov family, Dmitri, Ivan and Alyosha. It tells a complex story centered around themes such as family conflicts, moral complexities, religion and existential questions, love and crime. ',
  'The Burning Secret.jpg':
      'The story centers on the complex relationship between a mother and son. It revolves around Edgar, a young boy whom Baron, a handsome and charming man, meets in a hotel during a summer vacation and tries to establish a secret relationship.',
  'The Chartreuse of Parma.jpg':
      "Fabrice is a character living during the Napoleonic Wars and is confronted with the political and social events of the French Revolution and the rise of Napoleon. Fabrice's passionate love and adventurous life form the main plot of the novel.",
  'the confidence.jpg':
      'Set on a cruise ship, the novel depicts the interactions and discussions of various characters. among the characters is the Trust Man, a con man who constantly changes his identity. it shows how the con man acts in various disguises and how he affects the characters, while offering a critical look at various aspects of American society.',
  'the crime and punishment.jpg':
      'Raskolnikov is a law student living in poverty and has complex thoughts about the upper class of society. These thoughts lead him to plot the murder of a wealthy loan shark. ',
  'The Crime of the Congo.jpg':
      'It is a book by Irish journalist and writer Sir Arthur Conan Doyle, published in 1909. It was written to draw attention to the crimes of slavery and colonialism in the Congo under the rule of King Leopold II of Belgium.',
  'The Critique of Pure Reason.jpg':
      'The book presents a critical examination that explores the limits of human knowledge and the process of acquiring knowledge. Kant explores the possibilities of rational thought and reason, while discussing the limits of experience and the nature of knowledge that can be attained through reason.',
  'the desert village.jpg':
      'The poem describes the abandonment of an Irish village and the destruction of rural life. Goldsmith offers a profound critique of the effects of modernization and the decline of rural life. ',
  'The First Men In The Moon.jpg':
      "The novel follows the two main characters, Bedford and Cavor, on a fantastic journey to the Moon together. Cavor is a genius scientist and has invented a spaceship to explore the Moon. Bedford joins Cavor's project and together they embark on an adventurous journey to the Moon.",
  'The Food of the Gods.jpg':
      'The novel revolves around two main characters, Mr. Bensington and Mr. Redwood. The two discover a growth hormone and decide to test its effects on animals. However, these experiments unexpectedly spiral out of control and the discovered nutrient creates animals that grow much faster than normal and reach gigantic sizes.',
  'The Fur Country.jpg':
      'The story follows a group of intrepid adventurers as they attempt to establish a fur trading station in the cold and harsh conditions of Hudson Bay. While having to deal with polar expeditions, encounters with indigenous people and the challenges of the wilderness, they also tackle issues such as the conservation of natural resources and the sustainability of the trade.',
  'the gambler.jpg':
      "Alexei risks his love and even his material possessions because of his passion for gambling. Throughout the novel, Alexei's casino adventures and emotional turmoil are described, while at the same time providing an in-depth analysis of social class differences and human nature.",
  'the genealogy of morals.jpg':
      "It is a work by the German philosopher Friedrich Nietzsche, published in 1887. This book presents Nietzsche's in-depth analysis of the origin and evolution of moral values.",
  'the gold bug.jpg':
      'Legrand is a man living in Virginia who one day finds a treasure map by simply following the trail of an insect. This map points to a hidden treasure once used by pirates.',
  'the golden bowl.jpg':
      "The novel revolves around the marriage of American art collector Adam Verver and his daughter Maggie Verver to the British nobleman Prince Amerigo. However, the story also includes Prince Amerigo's passion for another woman to whom he is married, Charlotte Stant, and the complex relationships that this passion unravels. ",
  'The great boer war.jpg':
      'Discussing the conflicts between the British Empire and the Boer Republics, military strategies and the various battlefields, this book also discusses the social, political and military consequences of the war.',
  'The History Of Mr. Polly.jpg':
      'After a series of events, Alfred quits his job and starts looking for different adventures. However, his escape attempts have unexpected consequences and Alfred is forced to re-evaluate his own life. In the end, he embarks on an inner journey to find his own happiness.',
  'The Hunting of the Snark.jpg':
      'The book tells the story of a group of travelers on an adventure to hunt the "Snark", a mysterious and imaginary creature. The elite group, under the command of their leader Bellman, pursues the Snark and encounters various fantastic and bizarre adventures.',
  'The Innocents Abroad, travel.jpg':
      "Mark Twain offers an entertaining and sometimes cynical view of the societies and cultures of Europe and the Middle East at the time. Twain's sense of humor and satirical flair makes readers both laugh and think, and is an important example of the travel writing genre.",
  'the history of england i.jpg':
      "Hume's work of history deals with the various political events of the period, the monarchy, parliament, religious conflicts and the general development of England. However, Hume's understanding of history is not as detailed and document-oriented as that of modern historians. ",
  'the history of england ii.jpg':
      "Hume's work of history deals with the various political events of the period, the monarchy, parliament, religious conflicts and the general development of England. However, Hume's understanding of history is not as detailed and document-oriented as that of modern historians. ",
  'the history of england iii.jpg':
      "Hume's work of history deals with the various political events of the period, the monarchy, parliament, religious conflicts and the general development of England. However, Hume's understanding of history is not as detailed and document-oriented as that of modern historians. ",
  'the history of england iv.jpg':
      "Hume's work of history deals with the various political events of the period, the monarchy, parliament, religious conflicts and the general development of England. However, Hume's understanding of history is not as detailed and document-oriented as that of modern historians. ",
  'the history of england v.jpg':
      "Hume's work of history deals with the various political events of the period, the monarchy, parliament, religious conflicts and the general development of England. However, Hume's understanding of history is not as detailed and document-oriented as that of modern historians. ",
  'the history of england vi.jpg':
      "Hume's work of history deals with the various political events of the period, the monarchy, parliament, religious conflicts and the general development of England. However, Hume's understanding of history is not as detailed and document-oriented as that of modern historians. ",
  'the inferno.jpg':
      'is about the experiences of a group of soldiers who embark on a journey into the hell of war. As the soldiers face the terrible realities of war, they also discover the darker aspects of human nature. ',
  'The Invisible Man.jpg':
      "The novel begins when Griffin, a scientist, develops a formula that will make him invisible. However, after this experiment, the ability to become invisible completely changes Griffin's life and makes him uncontrollable.",
  'The Island of Dr. Moreau.jpg':
      "Edward the sailor is shipwrecked and washed up on Dr. Moreau's island, where a scientist is conducting horrific experiments on animals by manipulating human genes. Moreau's half-human, half-animal creatures create a tense atmosphere on the island.",
  'the journal to stella.jpg':
      "His relationship with Esther Johnson constitutes an important part of Swift's life. The letters contain Swift's personal thoughts, feelings and comments on the political events of the period. Through the letters, Swift often expresses to Stella how he thinks and feels about her.",
  'the king solomon.jpg':
      'Together with a group of adventurers, Quatermain embarks on a dangerous journey deep into Africa. On this adventurous journey, the heroes face various dangers and search for legendary riches.',
  'The Man in the Brown Suits.jpg':
      'Anne is bored with her ordinary life in London and decides to travel to Africa to add excitement to her life. The death of a mysterious man she meets on a cruise ship leads Anne into a series of dangerous events.',
  'the masque of the red death.jpg':
      'The story is set in a country plagued by a deadly epidemic called the red death, where Prince Prospero, a wealthy nobleman, decides to live an isolated life in his castle to protect himself from the epidemic. He organizes a masquerade ball in the castle and his guests have fun isolated from the outside world to protect themselves from the epidemic. However, one night at the ball, a figure appears: "The Red Death" himself.',
  'The Murder on the links.jpg':
      "The story begins with the murder of Renauld, a rich French man. Hercule Poirot arrives on the scene and sets out to solve the murder. With Renauld's death, various suspicions and mysteries arise. ",
  'The Mysterious Island.jpg':
      'Set during the American Civil War, a balloon used by a group of fugitives to escape the war is washed away by a hurricane and crashes on an island. The passengers of the balloon try to survive on this mysterious island in the South Pacific and discover its secrets.',
  'the portrait of dorian gray.jpg':
      'The main character, Dorian Gray, is a handsome young man. Basil Hallward, a painter, paints a portrait of Dorian and is mesmerized by his beauty and youth. Dorian is influenced by a friend, Lord Henry Wotton, and adopts a hedonistic lifestyle.',
  'The Prince and the Pauper.jpg':
      'Prince Edward is the son of King Henry VIII of England and lives a life of luxury. Tom Canty is from a poor family and lives near the palace. One day, they both discover that they have similar physical characteristics and decide to impersonate each other. However, this has unexpected consequences and both of their lives change drastically.',
  'The Sea Lady.jpg':
      'The main character of the novel, Nettie, a sea creature known as a mermaid, decides to come out of the sea and join humans to get to know them better. However, existing and being accepted in human society will not be as easy as she expects.',
  'The Time Machine.jpg':
      'It begins with a character, a scientist and inventor, who discovers the ability to travel through time with an invention he calls the Time Machine. Using the Time Machine, he embarks on a journey into the future. In the future, he discovers that different human species have evolved on Earth.',
  'the mystery marie roget.jpg':
      ' It begins with the mysterious disappearance of Marie Rogêt and the subsequent discovery of her dead body. The police, the press and the public show great interest in solving the murder, but the mystery remains unsolved. C. Auguste Dupin then decides to investigate the complex clues and evidence.',
  'the mystery of edwin drood.jpg':
      "Drood's disappearance worries readers and other characters, and a number of suspects emerge, including Rosa Bud, Drood's fiancée. As the novel nears its end, the mysterious events are expected to be solved, but the story is incomplete due to Dickens' sudden death.",
  'the mystery of the blue train.jpg':
      "The story begins with a murder on a blue train. The body of one of the train passengers, Ruth Kettering, attracts Poirot's attention and he tries to solve the murder. It turns out that a large inheritance is behind the murder and events unfold with a series of complex clues and suspects.",
  'The New Machiavelli.jpg':
      "Remington is determined to do whatever it takes to achieve political power and success. However, his ambition and passion lead him to face personal and moral challenges. As Remington tries to rise in the political arena by following Machiavelli's principles, he must also struggle with his own inner conflicts.",
  'the prince.jpg':
      'In the book, Machiavelli advises rulers to use all means to maintain and expand their power. He argues that idealistic and moral principles are insufficient in the real world and suggests that politics requires a pragmatic approach.',
  'the raven.jpg':
      'The story begins one winter night when a visitor arrives in the room where a man sits in solitude under the influence of his grief and depression. The visitor is "Raven", a crow. The crow questions the human soul and reflects the inner world of the man.',
  'The Red and The Black.jpg':
      'Julien comes from a low social class as the son of a priest, but is distinguished by his intelligence and desire to shape his own life. The novel begins with Julien taking a teaching position in the mansion of a wealthy family and then embarks on a journey full of aspirations for advancement and love affairs.',
  'The Research Magnificent.jpg':
      "Porphyry is known for his curiosity for knowledge and has deep thoughts about the future of humanity. The novel follows the turning points in Porphyry's life and his inner questioning, while examining how science and technology affect and change humanity.",
  'The Secret Adversary.jpg':
      'In 1919 London, demobilized soldier Tommy Beresford meets war volunteer Prudence "Tuppence" Cowley. Both unemployed and penniless. "They set up Young Adventurers, Ltd. Mr. Whittington follows Tuppence to present her work.',
  'The sleeper awakes.jpg':
      'Graham falls into a long sleep due to an illness and wakes up about two hundred years later. When he wakes up, the world has changed drastically; people live in big cities and society is run by a giant corporation.',
  'the soul of a nation.jpg':
      ' In his book, Gibbs examines the mood and social atmosphere of England during the First World War. Topics such as the effects of the war, the emotional reactions of the people and the deep effects of the war on society are discussed.',
  'The Thomas Jefferson writes.jpg':
      " These works reveal Jefferson's views, political ideas and ideals regarding specific events in American history. Jefferson's personal thoughts and feelings can also be found in these written works.",
  'the trial.jpg':
      'The story begins with the unexpected arrest and subsequent trial of the protagonist Josef K. However, K. does not know exactly what he is accused of and finds himself caught up in a complex legal system as he tries to understand why the process is happening.',
  'The Twilight of the Idols.jpg':
      'The book expands and deepens many of the themes Nietzsche deals with in his other works. Nietzsche criticizes moral values, religion and cultural norms. The book questions the foundations of Western civilization and discusses the collapse of human values.',
  'the voyage of the beagle.jpg':
      "The book describes Darwin's research, observations and discoveries in different geographical regions around the world. Darwin studied many different species and observed the relationships between different species in regions such as South America, the Galapagos Islands, Australia and New Zealand.",
  'the voyage out.jpg':
      'Rachel Vinrace joins a sea voyage from England to South America. During the voyage, Rachel meets different people and experiences a variety of experiences. Throughout the voyage, Rachel struggles to find her own identity and place, while reflecting on the relationships and social norms of the people around her.',
  'The War in the Air.jpg':
      'A British officer stumbles upon a revolutionary war plane invented by a German scientist he meets in a weather balloon. The plane is stolen for use and causes a worldwide war to break out.',
  'The war in the east japan.jpg':
      "Evans and Peattie examine in detail the various war strategies, operations and military campaigns of the Imperial Japanese Army. The book describes the Japanese army's attacks and occupation of China, Korea, Manchuria and other East Asian countries.",
  'the war of the worlds.jpg':
      'The story begins with a sudden Martian attack on Earth. The Martians destroy people and cities using their famous three-legged machines and deadly heat rails. The main character of the novel, an unnamed Englishman, narrates the events from where he lives.',
  'The Wheels of Chance.jpg':
      'The story is about Hoopdriver, a bicycle mechanic who goes on an unauthorized bicycle adventure. While living an ordinary life, Hoopdriver embarks on a romantic journey with a woman he meets by chance and falls in love with. ',
  'the whıte company.jpg':
      'The story follows the adventures of Alleyne Edricson, a brave young English soldier. Alleyne joins The White Company, a group of warriors dedicated to justice and chivalry. This group sets out to join the British army fighting the French.',
  'The wizard of wall street and his wealth.jpg':
      "This book tells the story of the life and fortune of John D. Rockefeller, a man of great influence in the financial world of the United States at the turn of the 20th century. The book examines Rockefeller's life from birth, his rise in business and his leadership in the oil industry. ",
  'The Wonderful Visit.jpg':
      'Set in an ordinary town in England, the story begins with an unexpected visit by an angel, Ariel. As Ariel wanders the world as an angel, she causes a series of interesting events in the town and leaves a deep impression on people.',
  'The World Set Free.jpg':
      'Set in the early 20th century, humanity discovers nuclear energy and uses it as a weapon. These weapons have devastating powers that destroy cities and change the world. ',
  'the wuthering heights.jpg':
      "The story begins with a mysterious orphan boy named Heathcliff being raised by the Earnshaw family. Heathcliff is introduced as a rough and tough boy, but over time his deep love for the family's daughter Catherine Earnshaw becomes the center of the story.",
  'the-sorrows-of-young-werther.jpg':
      'The novel is presented to the reader through the letters of the young and emotional Werther. As Werther expresses his love for the beautiful Charlotte, he also expresses his pain and conflicts. However, Charlotte has decided to marry another man.',
  'this side of paradise.jpg':
      "The novel depicts the life of Amory Blaine, a young and wealthy student at Princeton University. Focusing on Amory's education, relationships and personal growth, the story paints a portrait of American youth and society at the time.",
  'Three Sunsets and Other Poems.jpg':
      "Carroll's humorous and ironic style is also evident in these poems. The poem 'Three Sunsets' offers an in-depth reflection on nature and human emotions, while the other poems deal with different subjects.",
  'three-essays-on-the-theory-of-sexuality.jpg':
      'In the book, Freud provides a comprehensive analysis of the nature and development of sexuality and its effects on human psychology. Freud examines how sexual drives develop in childhood, the importance of sexual identity and sex life, and the social and cultural influences of sexuality.',
  'Tom Sawyer Abroad.jpg':
      'The story begins with Tom, Huck and Jim traveling around the world in an airship. However, the airship veers off course and they land on an island in a distant, unfamiliar land. Here, they encounter strange and funny events and interact with the natives of the island.',
  'Tom Sawyer, Detective.jpg':
      'Tom and Huck set out on an adventure to find a treasure that Jim, a former slave, has lost. Jim, who is the only person the duo can trace, had previously escaped on a charge of theft. Tom and Huck track Jim down to prove his innocence and have a series of adventures in the process.',
  'Tono-Bungay.jpg':
      "The novel is about the creation of a miraculous drug called 'Tono-Bungay', a kind of talisman and antidote, and the events surrounding it. It begins with the childhood memories of George Ponderevo, the nephew of this drug merchant, and then moves on to George's adulthood. ",
  'totem-and-taboo.jpg':
      'Totemism is a belief system in which a group of people feel attached to an animal or object and consider it sacred. Taboo is when society prohibits certain behaviors and considers them sacred.',
  'thus spake zarathustra.jpg':
      'Zarathustra retreats to the mountains where he spends ten years reflecting in order to bring a new system of morality and values to humanity. In the end, he brings to people the idea of the "Übermensch" (beyond-human) and proposes to go beyond traditional moral values.',
  'the white nights.jpg':
      "The novel is the story of four white nights spent by a young man in St. Petersburg with a young woman he meets and falls in love with. The young man meets Nastenka, a mysterious and melancholic woman, and confesses his feelings to her. However, there is another man in Nastenka's life.",
  'turkun atesle imtihani.jpg':
      'The book deals with the various stages of the national struggle and the heroism that took place during this period. Among the main characters is a group of young people from various social and economic backgrounds.',
  'Twenty Thousand Leagues Under the Sea.jpg':
      'The novel tells the adventures of Professor Aronnax, the marine biologist Conseil and the whaler Ned Land, who travel on a submarine called the Nautilus. The captain of the Nautilus is Captain Nemo, a mysterious merman. ',
  'Under Sentence of Death.jpg':
      'The story follows the endless adventures of a submarine crew after they are caught in a ship sinking operation. The crew is sentenced to death and imprisoned inside the submarine due to the fact that their ship sinking activities violate international law.',
  'Vicar of Wakefield.jpg':
      'Reverend Primrose is a meek and virtuous character, living a quiet life with her family. But through a series of unfortunate events, his family begins to fall on hard times.',
  'vurun kahpeye.jpg':
      "Romanda, idealist İstanbullu öğretmen Aliye’nin Anadolu’da bir kasabaya gidişi ve bölgede Milli Mücadele düşüncesine destek faaliyetleri aktarılır.",
  'What is Enlightenment.jpg': '',
  'white bird.jpg':
      'James has fallen deeply in love with a woman named Elspeth. However, Elspeth is engaged to David Webster, a man already at sea. Despite this, James continues to hope that Elspeth will eventually choose him.',
  'Wilhelm Meister.jpg':
      'Wilhelm Meister is a young man in search of self-discovery and self-realization. Although he comes from a working family, he is interested in the world of art and theater. ',
  'yasadigim gibi.jpg':
      "Kitap, Tanpınar'ın çocukluk yıllarından başlayarak yetişkinliğine kadar olan dönemi kapsar. Yazar, ailesi, eğitimi, edebi ve entelektüel merakları, çevresiyle ilişkileri ve edebiyat dünyasındaki deneyimleri hakkında okuyucuya içten bir şekilde bilgi verir.",
  'yeni dunya.jpg':
      "13 hikâyesinden oluşan Kitap yazarın hikâye alanında önemli bir yetkinliğe ulaştığının göstergesi olması bakından önemlidir. İçerik olarak kasaba ve köy yaşamı dışında düşkün kadınları ele alan hikâyeler önemli bir yer tutar.",
  'yezidin kizi.jpg':
      "bir gemi seyahati sırasında başlayıp uçsuz bucaksız Suriye çöllerinde devam eden gizemli bir aşk...",
  'zadig.jpg':
      'Zadig encounters disasters at various periods of his life and these disasters shape his character. Throughout the story, Zadig searches for concepts such as wisdom, justice and truth and encounters different people in the process.',
  'kirik hayatlar.jpg':
      "Kitaptaki olaylar Osmanlı’nın son döneminde geçmektedir. Osmanlı’nın son döneminde Türk halkında batıya karşı körü körüne bir özenti oluşur. Batıdan alınması gereken teknoloji, ilim, bilim değilde; bizim yaşantımıza ters düşen kültürü taklit edilir.",
  'Italian Hours.jpg':
      'The events in the book take place in the last period of the Ottoman Empire. In the last period of the Ottoman Empire, the Turkish people develop a blind wannabe for the West. Instead of the technology, science and science that should be taken from the West; the culture that is contrary to our lives is imitated.',
  'little dorrit.jpg':
      'Amy Dorrit, the main character of the novel, is a young girl born and raised in Marshalsea Prison in London. Her father is a man who lives in prison because of his debts. ',
  'little men.jpg':
      "The story revolves around the school called Plumfield where Jo March, one of the members of the March family introduced in 'Little Women', lives. Jo and her husband Professor Bhaer open a children's school called Plumfield, where children of different ages study together. ",
  'little woman.jpg':
      'Jo March, one of the main characters, and her three sisters come from an ordinary family living during the American Civil War. The novel is about the difficulties, joys, loves and disappointments the sisters experience as they transition from adolescence to adulthood. ',
  'king-Lear.jpg':
      "It begins with Lear's wish to divide his kingdom among his three daughters Goneril, Regan and Cordelia. However, after the responses from his daughters, Lear excludes his most loyal daughter Cordelia and shares his kingdom with his other two daughters. This decision triggers family conflicts and turns Lear's life upside down.",
  'orwell.jpg': 'A Famous George Orwell book'

  // Add other image descriptions here
};

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('tr'), // Turkish
      ],
      home: HomePage(),
    ),
  );
}
