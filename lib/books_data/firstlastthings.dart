import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class firstlastthings extends StatefulWidget {
  const firstlastthings({Key? key}) : super(key: key);

  @override
  State<firstlastthings> createState() => _firstlastthingsState();
}

class _firstlastthingsState extends State<firstlastthings> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/First Last Things/page (1).png',
    'books/First Last Things/page (2).png',
    'books/First Last Things/page (3).png',
    'books/First Last Things/page (4).png',
    'books/First Last Things/page (5).png',
    'books/First Last Things/page (6).png',
    'books/First Last Things/page (7).png',
    'books/First Last Things/page (8).png',
    'books/First Last Things/page (9).png',
    'books/First Last Things/page (10).png',
    'books/First Last Things/page (11).png',
    'books/First Last Things/page (12).png',
    'books/First Last Things/page (13).png',
    'books/First Last Things/page (14).png',
    'books/First Last Things/page (15).png',
    'books/First Last Things/page (16).png',
    'books/First Last Things/page (17).png',
    'books/First Last Things/page (18).png',
    'books/First Last Things/page (19).png',
    'books/First Last Things/page (20).png',
    'books/First Last Things/page (21).png',
    'books/First Last Things/page (22).png',
    'books/First Last Things/page (23).png',
    'books/First Last Things/page (24).png',
    'books/First Last Things/page (25).png',
    'books/First Last Things/page (26).png',
    'books/First Last Things/page (27).png',
    'books/First Last Things/page (28).png',
    'books/First Last Things/page (29).png',
    'books/First Last Things/page (30).png',
    'books/First Last Things/page (31).png',
    'books/First Last Things/page (32).png',
    'books/First Last Things/page (33).png',
    'books/First Last Things/page (34).png',
    'books/First Last Things/page (35).png',
    'books/First Last Things/page (36).png',
    'books/First Last Things/page (37).png',
    'books/First Last Things/page (38).png',
    'books/First Last Things/page (39).png',
    'books/First Last Things/page (40).png',
    'books/First Last Things/page (41).png',
    'books/First Last Things/page (42).png',
    'books/First Last Things/page (43).png',
    'books/First Last Things/page (44).png',
    'books/First Last Things/page (45).png',
    'books/First Last Things/page (46).png',
    'books/First Last Things/page (47).png',
    'books/First Last Things/page (48).png',
    'books/First Last Things/page (49).png',
    'books/First Last Things/page (50).png',
    'books/First Last Things/page (51).png',
    'books/First Last Things/page (52).png',
    'books/First Last Things/page (53).png',
    'books/First Last Things/page (54).png',
    'books/First Last Things/page (55).png',
    'books/First Last Things/page (56).png',
    'books/First Last Things/page (57).png',
    'books/First Last Things/page (58).png',
    'books/First Last Things/page (59).png',
    'books/First Last Things/page (60).png',
    'books/First Last Things/page (61).png',
    'books/First Last Things/page (62).png',
    'books/First Last Things/page (63).png',
    'books/First Last Things/page (64).png',
    'books/First Last Things/page (65).png',
    'books/First Last Things/page (66).png',
    'books/First Last Things/page (67).png',
    'books/First Last Things/page (68).png',
    'books/First Last Things/page (69).png',
    'books/First Last Things/page (70).png',
    'books/First Last Things/page (71).png',
    'books/First Last Things/page (72).png',
    'books/First Last Things/page (73).png',
    'books/First Last Things/page (74).png',
    'books/First Last Things/page (75).png',
    'books/First Last Things/page (76).png',
    'books/First Last Things/page (77).png',
    'books/First Last Things/page (78).png',
    'books/First Last Things/page (79).png',
    'books/First Last Things/page (80).png',
    'books/First Last Things/page (81).png',
    'books/First Last Things/page (82).png',
    'books/First Last Things/page (83).png',
    'books/First Last Things/page (84).png',
    'books/First Last Things/page (85).png',
    'books/First Last Things/page (86).png',
    'books/First Last Things/page (87).png',
    'books/First Last Things/page (88).png',
    'books/First Last Things/page (89).png',
    'books/First Last Things/page (90).png',
    'books/First Last Things/page (91).png',
    'books/First Last Things/page (92).png',
    'books/First Last Things/page (93).png',
    'books/First Last Things/page (94).png',
    'books/First Last Things/page (95).png',
    'books/First Last Things/page (96).png',
    'books/First Last Things/page (97).png',
    'books/First Last Things/page (98).png',
    'books/First Last Things/page (99).png',
    'books/First Last Things/page (100).png',
    'books/First Last Things/page (101).png',
    'books/First Last Things/page (102).png',
    'books/First Last Things/page (103).png',
    'books/First Last Things/page (104).png',
    'books/First Last Things/page (105).png',
    'books/First Last Things/page (106).png',
    'books/First Last Things/page (107).png',
    'books/First Last Things/page (108).png',
    'books/First Last Things/page (109).png',
    'books/First Last Things/page (110).png',
    'books/First Last Things/page (111).png',
    'books/First Last Things/page (112).png',
    'books/First Last Things/page (113).png',
    'books/First Last Things/page (114).png',
    'books/First Last Things/page (115).png',
    'books/First Last Things/page (116).png',
    'books/First Last Things/page (117).png',
    'books/First Last Things/page (118).png',
    'books/First Last Things/page (119).png',
    'books/First Last Things/page (120).png',
    'books/First Last Things/page (121).png',
    'books/First Last Things/page (122).png',
    'books/First Last Things/page (123).png',
    'books/First Last Things/page (124).png',
    'books/First Last Things/page (125).png',
    'books/First Last Things/page (126).png',
    'books/First Last Things/page (127).png',
    'books/First Last Things/page (128).png',
    'books/First Last Things/page (129).png',
    'books/First Last Things/page (130).png',
    'books/First Last Things/page (131).png',
    'books/First Last Things/page (132).png',
    'books/First Last Things/page (133).png',
    'books/First Last Things/page (134).png',
    'books/First Last Things/page (135).png',
    'books/First Last Things/page (136).png',
    'books/First Last Things/page (137).png',
    'books/First Last Things/page (138).png',
    'books/First Last Things/page (139).png',
    'books/First Last Things/page (140).png',
    'books/First Last Things/page (141).png',
    'books/First Last Things/page (142).png',
    'books/First Last Things/page (143).png',
    'books/First Last Things/page (144).png',
    'books/First Last Things/page (145).png',
    'books/First Last Things/page (146).png',
    'books/First Last Things/page (147).png',
    'books/First Last Things/page (148).png',
    'books/First Last Things/page (149).png',
    'books/First Last Things/page (150).png',
    'books/First Last Things/page (151).png',
    'books/First Last Things/page (152).png',
    'books/First Last Things/page (153).png',
    'books/First Last Things/page (154).png',
    'books/First Last Things/page (155).png',
    'books/First Last Things/page (156).png',
    'books/First Last Things/page (157).png',
    'books/First Last Things/page (158).png',
    'books/First Last Things/page (159).png',
    'books/First Last Things/page (160).png',
    'books/First Last Things/page (161).png',
    'books/First Last Things/page (162).png',
    'books/First Last Things/page (163).png',
    'books/First Last Things/page (164).png',
    'books/First Last Things/page (165).png',
    'books/First Last Things/page (166).png',
    'books/First Last Things/page (167).png',
    'books/First Last Things/page (168).png',
    'books/First Last Things/page (169).png',
    'books/First Last Things/page (170).png',
    'books/First Last Things/page (171).png',
    'books/First Last Things/page (172).png',
    'books/First Last Things/page (173).png',
    'books/First Last Things/page (174).png',

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
