import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class cossacks extends StatefulWidget {
  const cossacks({Key? key}) : super(key: key);

  @override
  State<cossacks> createState() => _cossacksState();
}

class _cossacksState extends State<cossacks> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/cossacks/page (1).png',
    'books/cossacks/page (2).png',
    'books/cossacks/page (3).png',
    'books/cossacks/page (4).png',
    'books/cossacks/page (5).png',
    'books/cossacks/page (6).png',
    'books/cossacks/page (7).png',
    'books/cossacks/page (8).png',
    'books/cossacks/page (9).png',
    'books/cossacks/page (10).png',
    'books/cossacks/page (11).png',
    'books/cossacks/page (12).png',
    'books/cossacks/page (13).png',
    'books/cossacks/page (14).png',
    'books/cossacks/page (15).png',
    'books/cossacks/page (16).png',
    'books/cossacks/page (17).png',
    'books/cossacks/page (18).png',
    'books/cossacks/page (19).png',
    'books/cossacks/page (20).png',
    'books/cossacks/page (21).png',
    'books/cossacks/page (22).png',
    'books/cossacks/page (23).png',
    'books/cossacks/page (24).png',
    'books/cossacks/page (25).png',
    'books/cossacks/page (26).png',
    'books/cossacks/page (27).png',
    'books/cossacks/page (28).png',
    'books/cossacks/page (29).png',
    'books/cossacks/page (30).png',
    'books/cossacks/page (31).png',
    'books/cossacks/page (32).png',
    'books/cossacks/page (33).png',
    'books/cossacks/page (34).png',
    'books/cossacks/page (35).png',
    'books/cossacks/page (36).png',
    'books/cossacks/page (37).png',
    'books/cossacks/page (38).png',
    'books/cossacks/page (39).png',
    'books/cossacks/page (40).png',
    'books/cossacks/page (41).png',
    'books/cossacks/page (42).png',
    'books/cossacks/page (43).png',
    'books/cossacks/page (44).png',
    'books/cossacks/page (45).png',
    'books/cossacks/page (46).png',
    'books/cossacks/page (47).png',
    'books/cossacks/page (48).png',
    'books/cossacks/page (49).png',
    'books/cossacks/page (50).png',
    'books/cossacks/page (51).png',
    'books/cossacks/page (52).png',
    'books/cossacks/page (53).png',
    'books/cossacks/page (54).png',
    'books/cossacks/page (55).png',
    'books/cossacks/page (56).png',
    'books/cossacks/page (57).png',
    'books/cossacks/page (58).png',
    'books/cossacks/page (59).png',
    'books/cossacks/page (60).png',
    'books/cossacks/page (61).png',
    'books/cossacks/page (62).png',
    'books/cossacks/page (63).png',
    'books/cossacks/page (64).png',
    'books/cossacks/page (65).png',
    'books/cossacks/page (66).png',
    'books/cossacks/page (67).png',
    'books/cossacks/page (68).png',
    'books/cossacks/page (69).png',
    'books/cossacks/page (70).png',
    'books/cossacks/page (71).png',
    'books/cossacks/page (72).png',
    'books/cossacks/page (73).png',
    'books/cossacks/page (74).png',
    'books/cossacks/page (75).png',
    'books/cossacks/page (76).png',
    'books/cossacks/page (77).png',
    'books/cossacks/page (78).png',
    'books/cossacks/page (79).png',
    'books/cossacks/page (80).png',
    'books/cossacks/page (81).png',
    'books/cossacks/page (82).png',
    'books/cossacks/page (83).png',
    'books/cossacks/page (84).png',
    'books/cossacks/page (85).png',
    'books/cossacks/page (86).png',
    'books/cossacks/page (87).png',
    'books/cossacks/page (88).png',
    'books/cossacks/page (89).png',
    'books/cossacks/page (90).png',
    'books/cossacks/page (91).png',
    'books/cossacks/page (92).png',
    'books/cossacks/page (93).png',
    'books/cossacks/page (94).png',
    'books/cossacks/page (95).png',
    'books/cossacks/page (96).png',
    'books/cossacks/page (97).png',
    'books/cossacks/page (98).png',
    'books/cossacks/page (99).png',
    'books/cossacks/page (100).png',
    'books/cossacks/page (101).png',
    'books/cossacks/page (102).png',
    'books/cossacks/page (103).png',
    'books/cossacks/page (104).png',
    'books/cossacks/page (105).png',
    'books/cossacks/page (106).png',
    'books/cossacks/page (107).png',
    'books/cossacks/page (108).png',
    'books/cossacks/page (109).png',
    'books/cossacks/page (110).png',
    'books/cossacks/page (111).png',
    'books/cossacks/page (112).png',
    'books/cossacks/page (113).png',
    'books/cossacks/page (114).png',
    'books/cossacks/page (115).png',
    'books/cossacks/page (116).png',
    'books/cossacks/page (117).png',
    'books/cossacks/page (118).png',
    'books/cossacks/page (119).png',
    'books/cossacks/page (120).png',
    'books/cossacks/page (121).png',
    'books/cossacks/page (122).png',
    'books/cossacks/page (123).png',
    'books/cossacks/page (124).png',
    'books/cossacks/page (125).png',
    'books/cossacks/page (126).png',
    'books/cossacks/page (127).png',
    'books/cossacks/page (128).png',
    'books/cossacks/page (129).png',
    'books/cossacks/page (130).png',
    'books/cossacks/page (131).png',
    'books/cossacks/page (132).png',
    'books/cossacks/page (133).png',
    'books/cossacks/page (134).png',
    'books/cossacks/page (135).png',
    'books/cossacks/page (136).png',
    'books/cossacks/page (137).png',
    'books/cossacks/page (138).png',
    'books/cossacks/page (139).png',
    'books/cossacks/page (140).png',
    'books/cossacks/page (141).png',
    'books/cossacks/page (142).png',
    'books/cossacks/page (143).png',
    'books/cossacks/page (144).png',
    'books/cossacks/page (145).png',
    'books/cossacks/page (146).png',
    'books/cossacks/page (147).png',
    'books/cossacks/page (148).png',
    'books/cossacks/page (149).png',
    'books/cossacks/page (150).png',
    'books/cossacks/page (151).png',
    'books/cossacks/page (152).png',
    'books/cossacks/page (153).png',
    'books/cossacks/page (154).png',
    'books/cossacks/page (155).png',
    'books/cossacks/page (156).png',
    'books/cossacks/page (157).png',
    'books/cossacks/page (158).png',
    'books/cossacks/page (159).png',
    'books/cossacks/page (160).png',
    'books/cossacks/page (161).png',
    'books/cossacks/page (162).png',
    'books/cossacks/page (163).png',
    'books/cossacks/page (164).png',
    'books/cossacks/page (165).png',
    'books/cossacks/page (166).png',
    'books/cossacks/page (167).png',

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
