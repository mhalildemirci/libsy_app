import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class memoirs extends StatefulWidget {
  const memoirs({Key? key}) : super(key: key);

  @override
  State<memoirs> createState() => _memoirsState();
}

class _memoirsState extends State<memoirs> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/memoirs/page (1).png',
    'books/memoirs/page (2).png',
    'books/memoirs/page (3).png',
    'books/memoirs/page (4).png',
    'books/memoirs/page (5).png',
    'books/memoirs/page (6).png',
    'books/memoirs/page (7).png',
    'books/memoirs/page (8).png',
    'books/memoirs/page (9).png',
    'books/memoirs/page (10).png',
    'books/memoirs/page (11).png',
    'books/memoirs/page (12).png',
    'books/memoirs/page (13).png',
    'books/memoirs/page (14).png',
    'books/memoirs/page (15).png',
    'books/memoirs/page (16).png',
    'books/memoirs/page (17).png',
    'books/memoirs/page (18).png',
    'books/memoirs/page (19).png',
    'books/memoirs/page (20).png',
    'books/memoirs/page (21).png',
    'books/memoirs/page (22).png',
    'books/memoirs/page (23).png',
    'books/memoirs/page (24).png',
    'books/memoirs/page (25).png',
    'books/memoirs/page (26).png',
    'books/memoirs/page (27).png',
    'books/memoirs/page (28).png',
    'books/memoirs/page (29).png',
    'books/memoirs/page (30).png',
    'books/memoirs/page (31).png',
    'books/memoirs/page (32).png',
    'books/memoirs/page (33).png',
    'books/memoirs/page (34).png',
    'books/memoirs/page (35).png',
    'books/memoirs/page (36).png',
    'books/memoirs/page (37).png',
    'books/memoirs/page (38).png',
    'books/memoirs/page (39).png',
    'books/memoirs/page (40).png',
    'books/memoirs/page (41).png',
    'books/memoirs/page (42).png',
    'books/memoirs/page (43).png',
    'books/memoirs/page (44).png',
    'books/memoirs/page (45).png',
    'books/memoirs/page (46).png',
    'books/memoirs/page (47).png',
    'books/memoirs/page (48).png',
    'books/memoirs/page (49).png',
    'books/memoirs/page (50).png',
    'books/memoirs/page (51).png',
    'books/memoirs/page (52).png',
    'books/memoirs/page (53).png',
    'books/memoirs/page (54).png',
    'books/memoirs/page (55).png',
    'books/memoirs/page (56).png',
    'books/memoirs/page (57).png',
    'books/memoirs/page (58).png',
    'books/memoirs/page (59).png',
    'books/memoirs/page (60).png',
    'books/memoirs/page (61).png',
    'books/memoirs/page (62).png',
    'books/memoirs/page (63).png',
    'books/memoirs/page (64).png',
    'books/memoirs/page (65).png',
    'books/memoirs/page (66).png',
    'books/memoirs/page (67).png',
    'books/memoirs/page (68).png',
    'books/memoirs/page (69).png',
    'books/memoirs/page (70).png',
    'books/memoirs/page (71).png',
    'books/memoirs/page (72).png',
    'books/memoirs/page (73).png',
    'books/memoirs/page (74).png',
    'books/memoirs/page (75).png',
    'books/memoirs/page (76).png',
    'books/memoirs/page (77).png',
    'books/memoirs/page (78).png',
    'books/memoirs/page (79).png',
    'books/memoirs/page (80).png',
    'books/memoirs/page (81).png',
    'books/memoirs/page (82).png',
    'books/memoirs/page (83).png',
    'books/memoirs/page (84).png',
    'books/memoirs/page (85).png',
    'books/memoirs/page (86).png',
    'books/memoirs/page (87).png',
    'books/memoirs/page (88).png',
    'books/memoirs/page (89).png',
    'books/memoirs/page (90).png',
    'books/memoirs/page (91).png',
    'books/memoirs/page (92).png',
    'books/memoirs/page (93).png',
    'books/memoirs/page (94).png',
    'books/memoirs/page (95).png',
    'books/memoirs/page (96).png',
    'books/memoirs/page (97).png',
    'books/memoirs/page (98).png',
    'books/memoirs/page (99).png',
    'books/memoirs/page (100).png',
    'books/memoirs/page (101).png',
    'books/memoirs/page (102).png',
    'books/memoirs/page (103).png',
    'books/memoirs/page (104).png',
    'books/memoirs/page (105).png',
    'books/memoirs/page (106).png',
    'books/memoirs/page (107).png',
    'books/memoirs/page (108).png',
    'books/memoirs/page (109).png',
    'books/memoirs/page (110).png',
    'books/memoirs/page (111).png',
    'books/memoirs/page (112).png',
    'books/memoirs/page (113).png',
    'books/memoirs/page (114).png',
    'books/memoirs/page (115).png',
    'books/memoirs/page (116).png',
    'books/memoirs/page (117).png',
    'books/memoirs/page (118).png',
    'books/memoirs/page (119).png',
    'books/memoirs/page (120).png',
    'books/memoirs/page (121).png',
    'books/memoirs/page (122).png',
    'books/memoirs/page (123).png',
    'books/memoirs/page (124).png',
    'books/memoirs/page (125).png',
    'books/memoirs/page (126).png',
    'books/memoirs/page (127).png',
    'books/memoirs/page (128).png',
    'books/memoirs/page (129).png',
    'books/memoirs/page (130).png',
    'books/memoirs/page (131).png',
    'books/memoirs/page (132).png',
    'books/memoirs/page (133).png',
    'books/memoirs/page (134).png',
    'books/memoirs/page (135).png',
    'books/memoirs/page (136).png',
    'books/memoirs/page (137).png',
    'books/memoirs/page (138).png',
    'books/memoirs/page (139).png',
    'books/memoirs/page (140).png',
    'books/memoirs/page (141).png',
    'books/memoirs/page (142).png',
    'books/memoirs/page (143).png',
    'books/memoirs/page (144).png',
    'books/memoirs/page (145).png',
    'books/memoirs/page (146).png',
    'books/memoirs/page (147).png',
    'books/memoirs/page (148).png',
    'books/memoirs/page (149).png',
    'books/memoirs/page (150).png',
    'books/memoirs/page (151).png',
    'books/memoirs/page (152).png',
    'books/memoirs/page (153).png',
    'books/memoirs/page (154).png',
    'books/memoirs/page (155).png',
    'books/memoirs/page (156).png',
    'books/memoirs/page (157).png',
    'books/memoirs/page (158).png',
    'books/memoirs/page (159).png',
    'books/memoirs/page (160).png',
    'books/memoirs/page (161).png',
    'books/memoirs/page (162).png',

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
