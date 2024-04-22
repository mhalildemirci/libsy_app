import 'package:flutter/material.dart';
import 'package:libsy_app/books_data/poems2.dart';
import 'package:libsy_app/screen/DatabaseHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:libsy_app/book_data.dart';
import 'package:libsy_app/books_data/achristmascarol.dart';
import 'package:libsy_app/books_data/aconnecticut.dart';
import 'package:libsy_app/books_data/adventruressherlock.dart';
import 'package:libsy_app/books_data/adventuresjournalism.dart';
import 'package:libsy_app/books_data/adventurestomsawyer.dart';
import 'package:libsy_app/books_data/aeysha.dart';
import 'package:libsy_app/books_data/ajournal.dart';
import 'package:libsy_app/books_data/alemdag.dart';
import 'package:libsy_app/books_data/alicesadventures.dart';
import 'package:libsy_app/books_data/alondon.dart';
import 'package:libsy_app/books_data/ambassadors.dart';
import 'package:libsy_app/books_data/american.dart';
import 'package:libsy_app/books_data/amerika.dart';
import 'package:libsy_app/books_data/amodernutopia.dart';
import 'package:libsy_app/books_data/amodestproposal.dart';
import 'package:libsy_app/books_data/anelegysex.dart';
import 'package:libsy_app/books_data/anenquirypricinples.dart';
import 'package:libsy_app/books_data/anenquiryunderstanding.dart';
import 'package:libsy_app/books_data/animalfarm.dart';
import 'package:libsy_app/books_data/annakareninda.dart';
import 'package:libsy_app/books_data/annveronica.dart';
import 'package:libsy_app/books_data/antichrist.dart';
import 'package:libsy_app/books_data/anticipations.dart';
import 'package:libsy_app/books_data/arounddays.dart';
import 'package:libsy_app/books_data/artofwar.dart';
import 'package:libsy_app/books_data/ashorthistory.dart';
import 'package:libsy_app/books_data/askbatagi.dart';
import 'package:libsy_app/books_data/askimemnu.dart';
import 'package:libsy_app/books_data/atestengomlek.dart';
import 'package:libsy_app/books_data/aydakikadin.dart';
import 'package:libsy_app/books_data/aypesinde.dart';
import 'package:libsy_app/books_data/balkanharbi.dart';
import 'package:libsy_app/books_data/barnabyrudge.dart';
import 'package:libsy_app/books_data/bealby.dart';
import 'package:libsy_app/books_data/beautifuldamned.dart';
import 'package:libsy_app/books_data/bessehir.dart';
import 'package:libsy_app/books_data/beyondgood.dart';
import 'package:libsy_app/books_data/blackarrow.dart';
import 'package:libsy_app/books_data/bleakhouse.dart';
import 'package:libsy_app/books_data/bluetrain.dart';
import 'package:libsy_app/books_data/boon.dart';
import 'package:libsy_app/books_data/bostonians.dart';
import 'package:libsy_app/books_data/bozkurtlardiriliyor.dart';
import 'package:libsy_app/books_data/bozkurtlaroluyor.dart';
import 'package:libsy_app/books_data/brotherskaramazov.dart';
import 'package:libsy_app/books_data/brownsuit.dart';
import 'package:libsy_app/books_data/bugununsaraylisi.dart';
import 'package:libsy_app/books_data/burningsecret.dart';
import 'package:libsy_app/books_data/butunoykuler1.dart';
import 'package:libsy_app/books_data/cadi.dart';
import 'package:libsy_app/books_data/cakici.dart';
import 'package:libsy_app/books_data/candide.dart';
import 'package:libsy_app/books_data/capitale.dart';
import 'package:libsy_app/books_data/ceaser.dart';
import 'package:libsy_app/books_data/chartreuseparma.dart';
import 'package:libsy_app/books_data/classicforchilld.dart';
import 'package:libsy_app/books_data/cleopatra.dart';
import 'package:libsy_app/books_data/confidence.dart';
import 'package:libsy_app/books_data/cossacks.dart';
import 'package:libsy_app/books_data/crimecongo.dart';
import 'package:libsy_app/books_data/crimepunishment.dart';
import 'package:libsy_app/books_data/danielderonda.dart';
import 'package:libsy_app/books_data/davidcopperfield.dart';
import 'package:libsy_app/books_data/deathinvenice.dart';
import 'package:libsy_app/books_data/derzuberberg.dart';
import 'package:libsy_app/books_data/desertvillage.dart';
import 'package:libsy_app/books_data/dialoguesconcerning.dart';
import 'package:libsy_app/books_data/dirileniskelet.dart';
import 'package:libsy_app/books_data/divinecomedy.dart';
import 'package:libsy_app/books_data/dombeyandson.dart';
import 'package:libsy_app/books_data/donquixote.dart';
import 'package:libsy_app/books_data/doowall.dart';
import 'package:libsy_app/books_data/doriangray.dart';
import 'package:libsy_app/books_data/dorothywizardoz.dart';
import 'package:libsy_app/books_data/drmoreu.dart';
import 'package:libsy_app/books_data/edinburg.dart';
import 'package:libsy_app/books_data/eightcousins.dart';
import 'package:libsy_app/books_data/emma.dart';
import 'package:libsy_app/books_data/evliyacelebicilt1.dart';
import 'package:libsy_app/books_data/exemplary.dart';
import 'package:libsy_app/books_data/fairmargaret.dart';
import 'package:libsy_app/books_data/faust1.dart';
import 'package:libsy_app/books_data/faust2.dart';
import 'package:libsy_app/books_data/firstlastthings.dart';
import 'package:libsy_app/books_data/firstmen.dart';
import 'package:libsy_app/books_data/foodgods.dart';
import 'package:libsy_app/books_data/franklin.dart';
import 'package:libsy_app/books_data/fundamentalprinciples.dart';
import 'package:libsy_app/books_data/furcountry.dart';
import 'package:libsy_app/books_data/gambler.dart';
import 'package:libsy_app/books_data/genealogymorals.dart';
import 'package:libsy_app/books_data/godinvisibleking.dart';
import 'package:libsy_app/books_data/goldbug.dart';
import 'package:libsy_app/books_data/goldenbowl.dart';
import 'package:libsy_app/books_data/greatboerwar.dart';
import 'package:libsy_app/books_data/greatexpectaiton.dart';
import 'package:libsy_app/books_data/greatgatsby.dart';
import 'package:libsy_app/books_data/gulliverstravel.dart';
import 'package:libsy_app/books_data/hamlet.dart';
import 'package:libsy_app/books_data/handan.dart';
import 'package:libsy_app/books_data/hardtimes.dart';
import 'package:libsy_app/books_data/hawthrone.dart';
import 'package:libsy_app/books_data/henryv.dart';
import 'package:libsy_app/books_data/historyengland.dart';
import 'package:libsy_app/books_data/historyengland2.dart';
import 'package:libsy_app/books_data/historyengland3.dart';
import 'package:libsy_app/books_data/historyengland4.dart';
import 'package:libsy_app/books_data/historyengland5.dart';
import 'package:libsy_app/books_data/historyengland6.dart';
import 'package:libsy_app/books_data/historymrpolly.dart';
import 'package:libsy_app/books_data/homagetocatalonia.dart';
import 'package:libsy_app/books_data/hospitalsketches.dart';
import 'package:libsy_app/books_data/huckberyfinn.dart';
import 'package:libsy_app/books_data/humanall.dart';
import 'package:libsy_app/books_data/hunger.dart';
import 'package:libsy_app/books_data/huntingsnark.dart';
import 'package:libsy_app/books_data/huzur.dart';
import 'package:libsy_app/books_data/ibnbattuta.dart';
import 'package:libsy_app/books_data/icimizdekiseytan.dart';
import 'package:libsy_app/books_data/idiot.dart';
import 'package:libsy_app/books_data/iffet.dart';
import 'package:libsy_app/books_data/iliad.dart';
import 'package:libsy_app/books_data/inferno.dart';
import 'package:libsy_app/books_data/innocents.dart';
import 'package:libsy_app/books_data/intentions.dart';
import 'package:libsy_app/books_data/inthecomet.dart';
import 'package:libsy_app/books_data/invisible.dart';
import 'package:libsy_app/books_data/istanbulicyuzu.dart';
import 'package:libsy_app/books_data/italian.dart';
import 'package:libsy_app/books_data/jackandjill.dart';
import 'package:libsy_app/books_data/josboys.dart';
import 'package:libsy_app/books_data/journalstella.dart';
import 'package:libsy_app/books_data/kalpagrisi.dart';
import 'package:libsy_app/books_data/kasagi.dart';
import 'package:libsy_app/books_data/kidnapped.dart';
import 'package:libsy_app/books_data/kinglear.dart';
import 'package:libsy_app/books_data/kingsolomon.dart';
import 'package:libsy_app/books_data/kipps.dart';
import 'package:libsy_app/books_data/kirikhayatlar.dart';
import 'package:libsy_app/books_data/kurkmantolu.dart';
import 'package:libsy_app/books_data/kuyucakli.dart';
import 'package:libsy_app/books_data/light.dart';
import 'package:libsy_app/books_data/littledorit.dart';
import 'package:libsy_app/books_data/littlemen.dart';
import 'package:libsy_app/books_data/littlewoman.dart';
import 'package:libsy_app/books_data/macbeth.dart';
import 'package:libsy_app/books_data/madame.dart';
import 'package:libsy_app/books_data/mahur.dart';
import 'package:libsy_app/books_data/mansfield.dart';
import 'package:libsy_app/books_data/marieroget.dart';
import 'package:libsy_app/books_data/marko.dart';
import 'package:libsy_app/books_data/martin.dart';
import 'package:libsy_app/books_data/masterofworld.dart';
import 'package:libsy_app/books_data/medari.dart';
import 'package:libsy_app/books_data/meditations.dart';
import 'package:libsy_app/books_data/memleket.dart';
import 'package:libsy_app/books_data/merchant.dart';
import 'package:libsy_app/books_data/metamorphosis.dart';
import 'package:libsy_app/books_data/metres.dart';
import 'package:libsy_app/books_data/micromeas.dart';
import 'package:libsy_app/books_data/middlemarch.dart';
import 'package:libsy_app/books_data/midsummer.dart';
import 'package:libsy_app/books_data/miserables.dart';
import 'package:libsy_app/books_data/mississippi.dart';
import 'package:libsy_app/books_data/mobydick.dart';
import 'package:libsy_app/books_data/moonofisrael.dart';
import 'package:libsy_app/books_data/morsalkimli.dart';
import 'package:libsy_app/books_data/mrbritling.dart';
import 'package:libsy_app/books_data/mrlewisham.dart';
import 'package:libsy_app/books_data/mrsdalloway.dart';
import 'package:libsy_app/books_data/murderlinks.dart';
import 'package:libsy_app/books_data/murebbiye.dart';
import 'package:libsy_app/books_data/mysteriousisland.dart';
import 'package:libsy_app/books_data/mysteryedwin.dart';
import 'package:libsy_app/books_data/nadalilly.dart';
import 'package:libsy_app/books_data/naturalselection.dart';
import 'package:libsy_app/books_data/newarabian.dart';
import 'package:libsy_app/books_data/newlife.dart';
import 'package:libsy_app/books_data/newmachiavelli.dart';
import 'package:libsy_app/books_data/nicholas.dart';
import 'package:libsy_app/books_data/ninetythree.dart';
import 'package:libsy_app/books_data/notessonbrother.dart';
import 'package:libsy_app/books_data/notesunderground.dart';
import 'package:libsy_app/books_data/notredame.dart';
import 'package:libsy_app/books_data/nowcantold.dart';
import 'package:libsy_app/books_data/olivertwist.dart';
import 'package:libsy_app/books_data/orwell.dart';
import 'package:libsy_app/books_data/othello.dart';
import 'package:libsy_app/books_data/ourmutual.dart';
import 'package:libsy_app/books_data/ourwithspain.dart';
import 'package:libsy_app/books_data/oylehikaye.dart';
import 'package:libsy_app/books_data/penalcolony.dart';
import 'package:libsy_app/books_data/peterpan.dart';
import 'package:libsy_app/books_data/peterpankinsgton.dart';
import 'package:libsy_app/books_data/pickwick.dart';
import 'package:libsy_app/books_data/poemswilliam.dart';
import 'package:libsy_app/books_data/princeotto.dart';
import 'package:libsy_app/books_data/princepauper.dart';
import 'package:libsy_app/books_data/protagoras.dart';
import 'package:libsy_app/books_data/purereason.dart';
import 'package:libsy_app/books_data/redblack.dart';
import 'package:libsy_app/books_data/researchmagnificent.dart';
import 'package:libsy_app/books_data/resurrection.dart';
import 'package:libsy_app/books_data/rhyme.dart';
import 'package:libsy_app/books_data/robinson.dart';
import 'package:libsy_app/books_data/roderic.dart';
import 'package:libsy_app/books_data/romeo.dart';
import 'package:libsy_app/books_data/romola.dart';
import 'package:libsy_app/books_data/roseinbloom.dart';
import 'package:libsy_app/books_data/ruhadam.dart';
import 'package:libsy_app/books_data/saatleriayarlama.dart';
import 'package:libsy_app/books_data/salamboo.dart';
import 'package:libsy_app/books_data/sawyerabroad.dart';
import 'package:libsy_app/books_data/sawyerdetective.dart';
import 'package:libsy_app/books_data/sealady.dart';
import 'package:libsy_app/books_data/secretadversay.dart';
import 'package:libsy_app/books_data/sensesensblity.dart';
import 'package:libsy_app/books_data/sevdasokagi.dart';
import 'package:libsy_app/books_data/sheandallan.dart';
import 'package:libsy_app/books_data/sideparadise.dart';
import 'package:libsy_app/books_data/silasmarner.dart';
import 'package:libsy_app/books_data/sinekli.dart';
import 'package:libsy_app/books_data/sipsevdi.dart';
import 'package:libsy_app/books_data/sleeperawakes.dart';
import 'package:libsy_app/books_data/slyvie.dart';
import 'package:libsy_app/books_data/songs.dart';
import 'package:libsy_app/books_data/soulnation.dart';
import 'package:libsy_app/books_data/spakezarathustra.dart';
import 'package:libsy_app/books_data/stives.dart';
import 'package:libsy_app/books_data/sunset.dart';
import 'package:libsy_app/books_data/taletwocities.dart';
import 'package:libsy_app/books_data/tangledtale.dart';
import 'package:libsy_app/books_data/tatarcik.dart';
import 'package:libsy_app/books_data/tempest.dart';
import 'package:libsy_app/books_data/theprince.dart';
import 'package:libsy_app/books_data/thomasjefferson.dart';
import 'package:libsy_app/books_data/timemachine.dart';
import 'package:libsy_app/books_data/tonobungay.dart';
import 'package:libsy_app/books_data/treatisehuman.dart';
import 'package:libsy_app/books_data/trial.dart';
import 'package:libsy_app/books_data/turkates.dart';
import 'package:libsy_app/books_data/twentythousand.dart';
import 'package:libsy_app/books_data/twilightsidols.dart';
import 'package:libsy_app/books_data/underfire.dart';
import 'package:libsy_app/books_data/undersentence.dart';
import 'package:libsy_app/books_data/vicarwakefield.dart';
import 'package:libsy_app/books_data/visitthreefonts.dart';
import 'package:libsy_app/books_data/vitalproblemmarried.dart';
import 'package:libsy_app/books_data/voyagebeagle.dart';
import 'package:libsy_app/books_data/voyageout.dart';
import 'package:libsy_app/books_data/vurunkahpeye.dart';
import 'package:libsy_app/books_data/wallstreet.dart';
import 'package:libsy_app/books_data/wanders.dart';
import 'package:libsy_app/books_data/warair.dart';
import 'package:libsy_app/books_data/wareastjapan.dart';
import 'package:libsy_app/books_data/warworlds.dart';
import 'package:libsy_app/books_data/wheelschance.dart';
import 'package:libsy_app/books_data/whitebird.dart';
import 'package:libsy_app/books_data/whitecompany.dart';
import 'package:libsy_app/books_data/whitenights.dart';
import 'package:libsy_app/books_data/wilheimmeister.dart';
import 'package:libsy_app/books_data/wonderfulvisit.dart';
import 'package:libsy_app/books_data/worldset.dart';
import 'package:libsy_app/books_data/wutheringheights.dart';
import 'package:libsy_app/books_data/yasadigimgibi.dart';
import 'package:libsy_app/books_data/yenidunya.dart';
import 'package:libsy_app/books_data/yezidinkizi.dart';
import 'package:libsy_app/books_data/youngwerther.dart';
import 'package:libsy_app/books_data/zadigorbook.dart';

class MyListPage extends StatefulWidget {
  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  void openMatchingPage(String imageName) {
    Widget? matchingPage = findMatchingPage(imageName);
    if (matchingPage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => matchingPage,
        ),
      );
    } else {
      // Eşleşen sayfa bulunamadığında yapılacak işlemler
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Eşleşen sayfa bulunamadı!'),
          backgroundColor: Colors.grey[900],
        ),
      );
    }
  }

  Widget? findMatchingPage(String imageName) {
    switch (imageName) {
      case 'A Christmas Carol.jpg':
        return AChristmasCarol();
      case '2 Poems.jpg':
        return poemstwo();
      case '11 Intentions.jpg':
        return intentions();
      case 'A Connecticut Yankee in King Arthurs Court.jpg':
        return aconnecticut();
      case 'A London Life.jpg':
        return alondon();
      case 'A Modern Utopia.jpg':
        return amodernutopia();
      case 'a modest proposal.jpg':
        return amodestproposal();
      case 'a plug year.jpg':
        return ajournal();
      case 'A Short History of the World.jpg':
        return ashorthistory();
      case 'a tale of two cities.jpg':
        return taletwocities();
      case 'A Tangled Tale.jpg':
        return tangledtale();
      case 'a treatise of human nature.jpg':
        return treatisehuman();
      case 'a vısıt to three fonts.jpg':
        return visitthreefonts();
      case 'a vital problem of married.jpg':
        return vitalproblemmarried();
      case 'adventures in journalism.jpg':
        return adventuresjournalism();
      case 'Adventures of Huckleberry Finn.jpg':
        return huckberyfinn();
      case 'alemdagda bir yilan.jpg':
        return alemdag();
      case 'Alices Adventures in Wonderland.jpg':
        return alicesadventures();
      case 'america.jpg':
        return amerika();
      case 'An Elegy on the Glory of her Sex.jpg':
        return anelegysex();
      case 'an enquiry concerning human understanding.jpg':
        return anenquiryunderstanding();
      case 'an enquiry concerning the principles of morals.jpg':
        return anenquiryprinciples();
      case 'animal farm.jpg':
        return animalfarm();
      case 'Ann Veronica.jpg':
        return annveronica();
      case 'anna karenina.jpg':
        return annakarenina();
      case 'Anticipations.jpg':
        return anticipations();
      case 'Around the World in 80 Days.jpg':
        return arounddays();
      case 'art of war.jpg':
        return artofwar();
      case 'ask batagi.jpg':
        return askbatagi();
      case 'aski memnu.jpg':
        return askimemnu();
      case 'atesten gomlek.jpg':
        return atestengomlek();
      case 'ay pesinde.jpg':
        return aypesinde();
      case 'aydakı kadın.jpg':
        return aydakikadin();
      case 'ayesha the return of she.jpg':
        return aeysha();
      case 'balkan harbi.jpg':
        return balkanharbi();
      case 'barnaby rudge.jpg':
        return barnabyrudge();
      case 'bealby.jpg':
        return bealby();
      case 'Benjamin Franklin.jpg':
        return franklin();
      case 'bes sehir.jpg':
        return bessehir();
      case 'beyond good and evil.jpg':
        return beyondgood();
      case 'bleak house.jpg':
        return bleakhouse();
      case 'boon.jpg':
        return boon();
      case 'bozkurtlar diriliyor.jpg':
        return bozkurtlardiriliyor();
      case 'bozkurtlar olumu.jpg':
        return bozkurtlaroluyor();
      case 'bugunun saraylisi.jpg':
        return bugununsaraylisi();
      case 'butun oykuler.jpg':
        return butunoykuler1();
      case 'cadi.jpg':
        return cadi();
      case 'cakicinin ilk kursunu.jpg':
        return cakici();
      case 'candide.jpg':
        return candide();
      case 'capitale de la douleur.jpg':
        return capitale();
      case 'classic for chilldren.jpg':
        return classicforchilld();
      case 'cleopatra.jpg':
        return cleopatra();
      case 'Confidence.jpg':
        return confidence();
      case 'daniel deronda.jpg':
        return danielderonda();
      case 'david copperfield.jpg':
        return davidcopperfield();
      case 'Death in Venice.jpg':
        return deathinvenice();
      case 'Der Zuberberg.jpg':
        return derzuberberg();
      case 'dialogues concerning natural religion.jpg':
        return dialoguesconcerning();
      case 'dirilen iskelet.jpg':
        return dirileniskelet();
      case 'divine comedy.jpg':
        return divinecomedy();
      case 'dombey and son.jpg':
        return dombeyandson();
      case 'don quixote.jpg':
        return donquixote();
      case 'Dorothy amd the Wizard Oz.jpg':
        return dorothywizardoz();
      case 'Edinburg.jpg':
        return edinburg();
      case 'eight cousins.jpg':
        return eightcousins();
      case 'emma.jpg':
        return emma();
      case 'fair margaret.jpg':
        return fairmargaret();
      case 'faust 1.jpg':
        return faust1();
      case 'faust 2.jpg':
        return faust2();
      case 'First and Last Things.jpg':
        return firstlastthings();
      case 'Fundamental Principles of the Metaphysic of Morals.jpg':
        return fundamentalprinciples();
      case 'God the Invisible King.jpg':
        return godinvisibleking();
      case 'great expectations.jpg':
        return greatexpectation();
      case 'Gullivers travel.jpg':
        return gulliverstravel();
      case 'hamlet.jpg':
        return hamlet();
      case 'handan.jpg':
        return handan();
      case 'hard times.jpg':
        return hardtimes();
      case 'Hawthorne.jpg':
        return hawthrone();
      case 'henry v.jpg':
        return henryv();
      case 'homage to catalonia.jpg':
        return homagetocatalonia();
      case 'hospital sketches.jpg':
        return hospitalsketches();
      case 'Humman, All Too Human.jpg':
        return humanall();
      case 'hunger.jpg':
        return hunger();
      case 'huzur.jpg':
        return huzur();
      case 'ibni batuta.jpg':
        return ibnbattuta();
      case 'icimizde ki seytan.jpg':
        return icimizdekiseytan();
      case 'iffet.jpg':
        return iffet();
      case 'iliad.jpg':
        return iliad();
      case 'In the Days of the Comet.jpg':
        return inthecomet();
      case 'in the penal colony.jpg':
        return penalcolony();
      case 'istanbulun ic yuzu.jpg':
        return istanbulicyuzu();
      case 'Italian Hours.jpg':
        return italian();
      case 'jack and jill.jpg':
        return jackandjill();
      case 'jos boys.jpg':
        return josboys();
      case 'julius-caesar.jpg':
        return ceaser();
      case 'kalp agrisi.jpg':
        return kalpagrisi();
      case 'kasagi.jpg':
        return kasagi();
      case 'Kidnapped.jpg':
        return kidnapped();
      case 'kinglear.jpg':
        return kinglear();
      case 'kipps.jpg':
        return kipps();
      case 'kirik hayatlar.jpg':
        return kirikhayatlar();
      case 'kurk mantolu madonna.jpg':
        return kurkmantolu();
      case 'kuyucakli yusuf.jpg':
        return kuyucakli();
      case 'Les Miserables.jpg':
        return miserables();
      case 'Life on the Mississippi.jpg':
        return mississipi();
      case 'little dorrit.jpg':
        return littledorit();
      case 'little men.jpg':
        return littlemen();
      case 'little woman.jpg':
        return littlewoman();
      case 'Love and Mr Lewisham.jpg':
        return mrlewisham();
      case 'macbeth.jpg':
        return macbeth();
      case 'madame bovary.jpg':
        return madame();
      case 'MAHUR BESTE.jpg':
        return mahur();
      case 'mansfield park.jpg':
        return mansfield();
      case 'markopasa ve yazilari.jpg':
        return marko();
      case 'martin chuzzlewit.jpg':
        return martin();
      case 'medari maiset motoru.jpg':
        return medari();
      case 'meditations.jpg':
        return meditations();
      case 'memleket hikayeleri.jpg':
        return memleket();
      case 'merchant-of-venice.jpg':
        return merchant();
      case 'metamorphosis.jpg':
        return metamorphosis();
      case 'metres.jpg':
        return metres();
      case 'micromeas.jpg':
        return micromeas();
      case 'Middlemarch.jpg':
        return middlemarch();
      case 'midsummernight.jpg':
        return midsummer();
      case 'moby dick.jpg':
        return mobydick();
      case 'moon of israel.jpg':
        return moonofisrael();
      case 'mor salkimli ev.jpg':
        return morsalkimli();
      case 'Mr.Britling Sees It Through.jpg':
        return mrbritling();
      case 'mrs dalloway in bond street.jpg':
        return mrsdalloway();
      case 'murebbiye.jpg':
        return murebbiye();
      case 'nada the lily.jpg':
        return nadalily();
      case 'natural selection.jpg':
        return naturalselection();
      case 'New Arabian.jpg':
        return newarabian();
      case 'new life.jpg':
        return newlife();
      case 'nicholas nickleby.jpg':
        return nicholas();
      case 'Ninety Three.jpg':
        return ninetythree();
      case 'notes from the underground.jpg':
        return notesunderground();
      case 'Notes of a Son and Brother.jpg':
        return notessonbrother();
      case 'Notre Dame de Paris.jpg':
        return notredame();
      case 'now it can be told.jpg':
        return nowcantold();
      case 'oliver twist.jpg':
        return olivertwist();
      case 'orwell.jpg':
        return orwell();
      case 'othello.jpg':
        return othello();
      case 'our mutual friend.jpg':
        return ourmutual();
      case 'our with spain for cuba freedom.jpg':
        return ourwithspain();
      case 'oyle bir hikaye.jpg':
        return oylehikaye();
      case 'peter pan.jpg':
        return peterpan();
      case 'peter pan in kensington gardens.jpg':
        return peterpankinsgton();
      case 'pickwick club.jpg':
        return pickwick();
      case 'poems of william blake.jpg':
        return poemswilliam();
      case 'Prince Otto, a Romance.jpg':
        return princeotto();
      case 'Protagoras.jpg':
        return protagoras();
      case 'resurrection.jpg':
        return resurrection();
      case 'Ryhme And Reason.jpg':
        return rhyme();
      case 'robinson crouse.jpg':
        return robinson();
      case 'Roderick Hudson.jpg':
        return roderic();
      case 'romeo-and-juliet.jpg':
        return romeo();
      case 'romola.jpg':
        return romola();
      case 'rose in bloom.jpg':
        return roseinbloom();
      case 'ruh adam.jpg':
        return ruhadam();
      case 'saatlerı ayarlama enstıtusu.jpg':
        return saatleriayarlama();
      case 'salommbo.jpg':
        return salamboo();
      case 'sense and sensibility.jpg':
        return sensesensblity();
      case 'sevda sokagi komedyasi.jpg':
        return sevdasokagi();
      case 'seyehatname.jpg':
        return evliyacelebicilt1();
      case 'she and allan.jpg':
        return sheandallan();
      case 'sherlock holmes.jpg':
        return adventruressherlock();
      case 'silas marner.jpg':
        return silasmarner();
      case 'simdi sevisme vakti.jpg':
        return sinekli();
      case 'sipsevdi.jpg':
        return sipsevdi();
      case 'songs of innocence.jpg':
        return songs();
      case 'St. Ives.jpg':
        return stives();
      case 'Sylvie and Bruno.jpg':
        return slyvie();
      case 'tatarcik.jpg':
        return tatarcik();
      case 'tempest.jpg':
        return tempest();
      case 'The Adventures of Tom Sawyer.jpg':
        return adventurestomsawyer();
      case 'The Ambassadors.jpg':
        return ambassadors();
      case 'the american.jpg':
        return american();
      case 'The Antichrist.jpg':
        return antichrist();
      case 'the beautiful and damned.jpg':
        return beautifuldamned();
      case 'The Black Arrow. A Tale Of Two Roses.jpg':
        return blackarrow();
      case 'the bostanians.jpg':
        return bostonians();
      case 'the brothers karamazoc.jpg':
        return brotherskaramazov();
      case 'The Burning Secret.jpg':
        return burningsecret();
      case 'The Chartreuse of Parma.jpg':
        return chartreuseparma();
      case 'the confidence.jpg':
        return confidence();
      case 'The Cossacks.jpg':
        return cossacks();
      case 'the crime and punishment.jpg':
        return crimepunishment();
      case 'The Crime of the Congo.jpg':
        return crimecongo();
      case 'The Critique of Pure Reason.jpg':
        return purereason();
      case 'the desert village.jpg':
        return desertvillage();
      case 'The Door in the village.jpg':
        return doowall();
      case 'The Exemplary Novels of Cervantes.jpg':
        return exemplary();
      case 'The First Men In The Moon.jpg':
        return firstmen();
      case 'The Food of the Gods.jpg':
        return foodgods();
      case 'The Fur Country.jpg':
        return furcountry();
      case 'the gambler.jpg':
        return gambler();
      case 'the genealogy of morals.jpg':
        return genealogymorals();
      case 'the gold bug.jpg':
        return goldbug();
      case 'the golden bowl.jpg':
        return goldenbowl();
      case 'The great boer war.jpg':
        return greatboerwar();
      case 'the great gatsby.jpg':
        return greatgatsby();
      case 'the history of england i.jpg':
        return historyengland();
      case 'the history of england ii.jpg':
        return historyengland2();
      case 'the history of england iii.jpg':
        return historyengland3();
      case 'the history of england iv.jpg':
        return historyengland4();
      case 'the history of england v.jpg':
        return historyengland5();
      case 'the history of england vi.jpg':
        return historyengland6();
      case 'The History Of Mr. Polly.jpg':
        return historymrpolly();
      case 'The Hunting of the Snark.jpg':
        return huntingsnark();
      case 'the idiot.jpg':
        return idiot();
      case 'the inferno.dart':
        return inferno();
      case 'The Innocents Abroad, travel.jpg':
        return innocents();
      case 'The Invisible Man.jpg':
        return invisible();
      case 'The Island of Dr. Moreau.jpg':
        return drmoreu();
      case 'the journal stella.jpg':
        return journalstella();
      case 'the king solomon.jpg':
        return kingsolomon();
      case 'the light':
        return light();
      case 'The Man in the Brown Suits.jpg':
        return brownsuit();
      case 'The Master of the World.jpg':
        return masterofworld();
      case 'The Murder on the links.jpg':
        return murderlinks();
      case 'The Mysterious Island.jpg':
        return mysteriousisland();
      case 'the mystery marie roget.jpg':
        return marieroget();
      case 'the mystery of edwin drood.jpg':
        return mysteryedwin();
      case 'the mystery of the blue train.jpg':
        return bluetrain();
      case 'The New Machiavelli.jpg':
        return newmachiavelli();
      case 'the portrait of dorian gray.jpg':
        return doriangray();
      case 'The Prince and the Pauper.jpg':
        return princepauper();
      case 'the prince.jpg':
        return prince();
      case 'The Red and The Black.jpg.jpg':
        return redblack();
      case 'The Research Magnificent.jpg':
        return researchmagnificent();
      case 'The Sea Lady.jpg':
        return sealady();
      case 'The Secret Adversary.jpg':
        return secretadversary();
      case 'The sleeper awakes.jpg':
        return sleeperawakes();
      case 'the soul of a nation.jpg':
        return soulnation();
      case 'The Thomas Jefferson writes.jpg':
        return thomasjefferson();
      case 'The Time Machine.jpg':
        return timemachine();
      case 'the trial.jpg':
        return trial();
      case 'The Twilight of the Idols.jpg':
        return twilightidols();
      case 'the voyage of the beagle.jpg':
        return voyagebeagle();
      case 'the voyage out.jpg':
        return voyageout();
      case 'The War in the Air.jpg':
        return warair();
      case 'The war in the east japan.jpg':
        return wareastjapan();
      case 'the war of the worlds.jpg':
        return warworlds();
      case 'The Wheels of Chance.jpg':
        return wheelschance();
      case 'the whıte company.jpg':
        return whitecompany();
      case 'the white nights.jpg':
        return whitenights();
      case 'The wizard of wall street and his wealth.jpg':
        return wallstreet();
      case 'The Wonderful Visit.jpg':
        return wonderfulvisit();
      case 'The World Set Free.jpg':
        return worldset();
      case 'the wuthering heights.jpg':
        return wutheringheights();
      case 'the-sorrows-of-young-werther.jpg':
        return youngwerther();
      case 'this side of paradise.jpg':
        return sideparadise();
      case 'Three Sunsets and Other Poems.jpg':
        return sunset();
      case 'thus spake zarathustra.jpg':
        return spakezarathustra();
      case 'Tom Sawyer Abroad.jpg':
        return sawyerabroad();
      case 'Tom Sawyer, Detective.jpg':
        return sawyerdetecetive();
      case 'Tono-Bungay.jpg':
        return tonobungay();
      case 'turkun atesle imtihani.jpg':
        return turkates();
      case 'Twenty Thousand Leagues Under the Sea.jpg':
        return twentythousand();
      case 'under fire.jpg':
        return underfire();
      case 'Under Sentence of Death.jpg':
        return undersentence();
      case 'Vicar of Wakefield.jpg':
        return vicarwakefield();
      case 'vurun kahpeye.jpg':
        return vurunkahpeye();
      case 'wanders.jpg':
        return wanders();
      case 'white bird.jpg':
        return whitebird();
      case 'Wilhelm Meister.jpg':
        return wilheimmeister();
      case 'yasadigim gibi.jpg':
        return yasadigimgibi();
      case 'yeni dunya.jpg':
        return yenidunya();
      case 'yezidin kizi.jpg':
        return yezidinkizi();
      case 'zadig.jpg':
        return zadigorbook();

      // Diğer eşleşen sayfaları burada ekleyin
    }
    return null;
  }

  List<String> images = [];
  late Map<String, Map<String, String>> bookData;

  @override
  void initState() {
    super.initState();
    loadImages();
    loadBookData();
  }

  void loadImages() async {
    List<String> imagePaths = await DatabaseHelper.getImages();
    setState(() {
      images = imagePaths;
    });
  }

  void loadBookData() {
    // BookDataPage sayfasından verileri al
    bookData = BookDataPage().bookData;
  }

  void addListButtonOnPressed(String imagePath, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedImages = prefs.getStringList('savedImages');
    if (savedImages == null) {
      savedImages = [];
    }
    savedImages.add(imagePath);
    await prefs.setStringList('savedImages', savedImages);

    // Ekran bildirimi göster
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Resim listeye eklendi'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'My List',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 1.0),
              Color.fromRGBO(69, 60, 60, 1.0),
            ],
          )),
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              String imagePath = images[index];
              String title = bookData[imagePath]!['title'] ?? 'Unknown Title';
              String author =
                  bookData[imagePath]!['author'] ?? 'Unknown Author';
              return Card(
                color: Colors.black54,
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: Image.asset(images[index]),
                  title: Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ), // Kitap başlığını buraya ekleyin
                  subtitle: Text(author), // Yazar adını buraya ekleyin
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800], // Koyu gri renk
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Radius 10
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Now Read',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
