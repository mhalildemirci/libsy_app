import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class aydakikadin extends StatefulWidget {
  const aydakikadin({Key? key}) : super(key: key);

  @override
  State<aydakikadin> createState() => _aydakikadinState();
}

class _aydakikadinState extends State<aydakikadin> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Aydaki Kadin/page (1).png',
    'books/Aydaki Kadin/page (2).png',
    'books/Aydaki Kadin/page (3).png',
    'books/Aydaki Kadin/page (4).png',
    'books/Aydaki Kadin/page (5).png',
    'books/Aydaki Kadin/page (6).png',
    'books/Aydaki Kadin/page (7).png',
    'books/Aydaki Kadin/page (8).png',
    'books/Aydaki Kadin/page (9).png',
    'books/Aydaki Kadin/page (10).png',
    'books/Aydaki Kadin/page (11).png',
    'books/Aydaki Kadin/page (12).png',
    'books/Aydaki Kadin/page (13).png',
    'books/Aydaki Kadin/page (14).png',
    'books/Aydaki Kadin/page (15).png',
    'books/Aydaki Kadin/page (16).png',
    'books/Aydaki Kadin/page (17).png',
    'books/Aydaki Kadin/page (18).png',
    'books/Aydaki Kadin/page (19).png',
    'books/Aydaki Kadin/page (20).png',
    'books/Aydaki Kadin/page (21).png',
    'books/Aydaki Kadin/page (22).png',
    'books/Aydaki Kadin/page (23).png',
    'books/Aydaki Kadin/page (24).png',
    'books/Aydaki Kadin/page (25).png',
    'books/Aydaki Kadin/page (26).png',
    'books/Aydaki Kadin/page (27).png',
    'books/Aydaki Kadin/page (28).png',
    'books/Aydaki Kadin/page (29).png',
    'books/Aydaki Kadin/page (30).png',
    'books/Aydaki Kadin/page (31).png',
    'books/Aydaki Kadin/page (32).png',
    'books/Aydaki Kadin/page (33).png',
    'books/Aydaki Kadin/page (34).png',
    'books/Aydaki Kadin/page (35).png',
    'books/Aydaki Kadin/page (36).png',
    'books/Aydaki Kadin/page (37).png',
    'books/Aydaki Kadin/page (38).png',
    'books/Aydaki Kadin/page (39).png',
    'books/Aydaki Kadin/page (40).png',
    'books/Aydaki Kadin/page (41).png',
    'books/Aydaki Kadin/page (42).png',
    'books/Aydaki Kadin/page (43).png',
    'books/Aydaki Kadin/page (44).png',
    'books/Aydaki Kadin/page (45).png',
    'books/Aydaki Kadin/page (46).png',
    'books/Aydaki Kadin/page (47).png',
    'books/Aydaki Kadin/page (48).png',
    'books/Aydaki Kadin/page (49).png',
    'books/Aydaki Kadin/page (50).png',
    'books/Aydaki Kadin/page (51).png',
    'books/Aydaki Kadin/page (52).png',
    'books/Aydaki Kadin/page (53).png',
    'books/Aydaki Kadin/page (54).png',
    'books/Aydaki Kadin/page (55).png',
    'books/Aydaki Kadin/page (56).png',
    'books/Aydaki Kadin/page (57).png',
    'books/Aydaki Kadin/page (58).png',
    'books/Aydaki Kadin/page (59).png',
    'books/Aydaki Kadin/page (60).png',
    'books/Aydaki Kadin/page (61).png',
    'books/Aydaki Kadin/page (62).png',
    'books/Aydaki Kadin/page (63).png',
    'books/Aydaki Kadin/page (64).png',
    'books/Aydaki Kadin/page (65).png',
    'books/Aydaki Kadin/page (66).png',
    'books/Aydaki Kadin/page (67).png',
    'books/Aydaki Kadin/page (68).png',
    'books/Aydaki Kadin/page (69).png',
    'books/Aydaki Kadin/page (70).png',
    'books/Aydaki Kadin/page (71).png',
    'books/Aydaki Kadin/page (72).png',
    'books/Aydaki Kadin/page (73).png',
    'books/Aydaki Kadin/page (74).png',
    'books/Aydaki Kadin/page (75).png',
    'books/Aydaki Kadin/page (76).png',
    'books/Aydaki Kadin/page (77).png',
    'books/Aydaki Kadin/page (78).png',
    'books/Aydaki Kadin/page (79).png',
    'books/Aydaki Kadin/page (80).png',
    'books/Aydaki Kadin/page (81).png',
    'books/Aydaki Kadin/page (82).png',
    'books/Aydaki Kadin/page (83).png',
    'books/Aydaki Kadin/page (84).png',
    'books/Aydaki Kadin/page (85).png',
    'books/Aydaki Kadin/page (86).png',
    'books/Aydaki Kadin/page (87).png',
    'books/Aydaki Kadin/page (88).png',
    'books/Aydaki Kadin/page (89).png',
    'books/Aydaki Kadin/page (90).png',
    'books/Aydaki Kadin/page (91).png',
    'books/Aydaki Kadin/page (92).png',
    'books/Aydaki Kadin/page (93).png',
    'books/Aydaki Kadin/page (94).png',
    'books/Aydaki Kadin/page (95).png',
    'books/Aydaki Kadin/page (96).png',
    'books/Aydaki Kadin/page (97).png',
    'books/Aydaki Kadin/page (98).png',
    'books/Aydaki Kadin/page (99).png',
    'books/Aydaki Kadin/page (100).png',
    'books/Aydaki Kadin/page (101).png',
    'books/Aydaki Kadin/page (102).png',
    'books/Aydaki Kadin/page (103).png',
    'books/Aydaki Kadin/page (104).png',
    'books/Aydaki Kadin/page (105).png',
    'books/Aydaki Kadin/page (106).png',
    'books/Aydaki Kadin/page (107).png',
    'books/Aydaki Kadin/page (108).png',
    'books/Aydaki Kadin/page (109).png',
    'books/Aydaki Kadin/page (110).png',
    'books/Aydaki Kadin/page (111).png',
    'books/Aydaki Kadin/page (112).png',
    'books/Aydaki Kadin/page (113).png',
    'books/Aydaki Kadin/page (114).png',
    'books/Aydaki Kadin/page (115).png',
    'books/Aydaki Kadin/page (116).png',
    'books/Aydaki Kadin/page (117).png',
    'books/Aydaki Kadin/page (118).png',
    'books/Aydaki Kadin/page (119).png',
    'books/Aydaki Kadin/page (120).png',
    'books/Aydaki Kadin/page (121).png',
    'books/Aydaki Kadin/page (122).png',
    'books/Aydaki Kadin/page (123).png',
    'books/Aydaki Kadin/page (124).png',
    'books/Aydaki Kadin/page (125).png',
    'books/Aydaki Kadin/page (126).png',
    'books/Aydaki Kadin/page (127).png',
    'books/Aydaki Kadin/page (128).png',
    'books/Aydaki Kadin/page (129).png',
    'books/Aydaki Kadin/page (130).png',
    'books/Aydaki Kadin/page (131).png',
    'books/Aydaki Kadin/page (132).png',
    'books/Aydaki Kadin/page (133).png',
    'books/Aydaki Kadin/page (134).png',
    'books/Aydaki Kadin/page (135).png',
    'books/Aydaki Kadin/page (136).png',
    'books/Aydaki Kadin/page (137).png',
    'books/Aydaki Kadin/page (138).png',
    'books/Aydaki Kadin/page (139).png',
    'books/Aydaki Kadin/page (140).png',
    'books/Aydaki Kadin/page (141).png',
    'books/Aydaki Kadin/page (142).png',
    'books/Aydaki Kadin/page (143).png',
    'books/Aydaki Kadin/page (144).png',
    'books/Aydaki Kadin/page (145).png',
    'books/Aydaki Kadin/page (146).png',
    'books/Aydaki Kadin/page (147).png',
    'books/Aydaki Kadin/page (148).png',
    'books/Aydaki Kadin/page (149).png',
    'books/Aydaki Kadin/page (150).png',
    'books/Aydaki Kadin/page (151).png',
    'books/Aydaki Kadin/page (152).png',
    'books/Aydaki Kadin/page (153).png',
    'books/Aydaki Kadin/page (154).png',
    'books/Aydaki Kadin/page (155).png',

    // Diğer sayfaları ekleyin
  ];

  late List<String> downloadUrls;

  @override
  void initState() {
    // Firebase'i başlat
    Firebase.initializeApp();

    // restore the previous lastLeftOverPageIndex;
    _restoreLeftOverPage();
    super.initState();
  }

  Future<void> _restoreLeftOverPage() async {
    SharedPreferences pref = await _prefs;
    lastLeftOverPageIndex =
        pref.getInt(lastLeftOverPageNoPrefKey)?.toInt() ?? 0;
    // navigate the book page index to lastLeftOverPageIndex
    _controller.currentState?.goToPage(lastLeftOverPageIndex);
  }

  Widget _buildDemoPage(String imagePath) {
    return FutureBuilder(
      future: _getImageUrl(imagePath),
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Error fetching image'));
        }
        return Scaffold(
          body: Center(
            child: Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Future<String?> _getImageUrl(String imagePath) async {
    try {
      final ref = firebase_storage.FirebaseStorage.instance.ref(imagePath);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error getting image URL for $imagePath: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipWidget(
        key: _controller,
        backgroundColor: Colors.white,
        initialIndex: lastLeftOverPageIndex,
        lastPage: Container(
            color: Colors.white, child: const Center(child: Text('The End!'))),
        children: [
          for (var imagePath in imagesPath) _buildDemoPage(imagePath),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.looks_one_outlined),
        onPressed: () {
          _controller.currentState?.goToPage(1);
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    // before disposing the widget save the current page no
    var currentPageNo = _controller.currentState?.pageNumber.toInt() ?? 0;
    saveLastLeftOverPagePref(currentPageNo);
  }

  Future<void> saveLastLeftOverPagePref(int lastPage) async {
    SharedPreferences pref = await _prefs;
    pref.setInt(lastLeftOverPageNoPrefKey, lastPage);
  }
}
