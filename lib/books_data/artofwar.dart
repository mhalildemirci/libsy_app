import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class artofwar extends StatefulWidget {
  const artofwar({Key? key}) : super(key: key);

  @override
  State<artofwar> createState() => _artofwarState();
}

class _artofwarState extends State<artofwar> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/Art of War/page (1).png',
    'books/Art of War/page (2).png',
    'books/Art of War/page (3).png',
    'books/Art of War/page (4).png',
    'books/Art of War/page (5).png',
    'books/Art of War/page (6).png',
    'books/Art of War/page (7).png',
    'books/Art of War/page (8).png',
    'books/Art of War/page (9).png',
    'books/Art of War/page (10).png',
    'books/Art of War/page (11).png',
    'books/Art of War/page (12).png',
    'books/Art of War/page (13).png',
    'books/Art of War/page (14).png',
    'books/Art of War/page (15).png',
    'books/Art of War/page (16).png',
    'books/Art of War/page (17).png',
    'books/Art of War/page (18).png',
    'books/Art of War/page (19).png',
    'books/Art of War/page (20).png',
    'books/Art of War/page (21).png',
    'books/Art of War/page (22).png',
    'books/Art of War/page (23).png',
    'books/Art of War/page (24).png',
    'books/Art of War/page (25).png',
    'books/Art of War/page (26).png',
    'books/Art of War/page (27).png',
    'books/Art of War/page (28).png',
    'books/Art of War/page (29).png',
    'books/Art of War/page (30).png',
    'books/Art of War/page (31).png',
    'books/Art of War/page (32).png',
    'books/Art of War/page (33).png',
    'books/Art of War/page (34).png',
    'books/Art of War/page (35).png',
    'books/Art of War/page (36).png',
    'books/Art of War/page (37).png',
    'books/Art of War/page (38).png',
    'books/Art of War/page (39).png',
    'books/Art of War/page (40).png',
    'books/Art of War/page (41).png',
    'books/Art of War/page (42).png',
    'books/Art of War/page (43).png',
    'books/Art of War/page (44).png',
    'books/Art of War/page (45).png',
    'books/Art of War/page (46).png',
    'books/Art of War/page (47).png',
    'books/Art of War/page (48).png',
    'books/Art of War/page (49).png',
    'books/Art of War/page (50).png',
    'books/Art of War/page (51).png',
    'books/Art of War/page (52).png',
    'books/Art of War/page (53).png',
    'books/Art of War/page (54).png',
    'books/Art of War/page (55).png',
    'books/Art of War/page (56).png',
    'books/Art of War/page (57).png',
    'books/Art of War/page (58).png',
    'books/Art of War/page (59).png',
    'books/Art of War/page (60).png',
    'books/Art of War/page (61).png',
    'books/Art of War/page (62).png',
    'books/Art of War/page (63).png',
    'books/Art of War/page (64).png',
    'books/Art of War/page (65).png',
    'books/Art of War/page (66).png',
    'books/Art of War/page (67).png',
    'books/Art of War/page (68).png',
    'books/Art of War/page (69).png',
    'books/Art of War/page (70).png',
    'books/Art of War/page (71).png',
    'books/Art of War/page (72).png',
    'books/Art of War/page (73).png',
    'books/Art of War/page (74).png',
    'books/Art of War/page (75).png',
    'books/Art of War/page (76).png',
    'books/Art of War/page (77).png',
    'books/Art of War/page (78).png',
    'books/Art of War/page (79).png',
    'books/Art of War/page (80).png',
    'books/Art of War/page (81).png',
    'books/Art of War/page (82).png',
    'books/Art of War/page (83).png',
    'books/Art of War/page (84).png',
    'books/Art of War/page (85).png',
    'books/Art of War/page (86).png',
    'books/Art of War/page (87).png',
    'books/Art of War/page (88).png',
    'books/Art of War/page (89).png',
    'books/Art of War/page (90).png',
    'books/Art of War/page (91).png',
    'books/Art of War/page (92).png',
    'books/Art of War/page (93).png',
    'books/Art of War/page (94).png',
    'books/Art of War/page (95).png',
    'books/Art of War/page (96).png',
    'books/Art of War/page (97).png',
    'books/Art of War/page (98).png',
    'books/Art of War/page (99).png',
    'books/Art of War/page (100).png',
    'books/Art of War/page (101).png',
    'books/Art of War/page (102).png',
    'books/Art of War/page (103).png',
    'books/Art of War/page (104).png',
    'books/Art of War/page (105).png',
    'books/Art of War/page (106).png',
    'books/Art of War/page (107).png',
    'books/Art of War/page (108).png',
    'books/Art of War/page (109).png',
    'books/Art of War/page (110).png',
    'books/Art of War/page (111).png',
    'books/Art of War/page (112).png',
    'books/Art of War/page (113).png',
    'books/Art of War/page (114).png',
    'books/Art of War/page (115).png',
    'books/Art of War/page (116).png',
    'books/Art of War/page (117).png',
    'books/Art of War/page (118).png',
    'books/Art of War/page (119).png',
    'books/Art of War/page (120).png',
    'books/Art of War/page (121).png',
    'books/Art of War/page (122).png',
    'books/Art of War/page (123).png',
    'books/Art of War/page (124).png',
    'books/Art of War/page (125).png',
    'books/Art of War/page (126).png',
    'books/Art of War/page (127).png',
    'books/Art of War/page (128).png',
    'books/Art of War/page (129).png',
    'books/Art of War/page (130).png',
    'books/Art of War/page (131).png',
    'books/Art of War/page (132).png',
    'books/Art of War/page (133).png',
    'books/Art of War/page (134).png',
    'books/Art of War/page (135).png',
    'books/Art of War/page (136).png',
    'books/Art of War/page (137).png',
    'books/Art of War/page (138).png',
    'books/Art of War/page (139).png',
    'books/Art of War/page (140).png',
    'books/Art of War/page (141).png',
    'books/Art of War/page (142).png',
    'books/Art of War/page (143).png',
    'books/Art of War/page (144).png',
    'books/Art of War/page (145).png',
    'books/Art of War/page (146).png',
    'books/Art of War/page (147).png',
    'books/Art of War/page (148).png',
    'books/Art of War/page (149).png',
    'books/Art of War/page (150).png',
    'books/Art of War/page (151).png',
    'books/Art of War/page (152).png',
    'books/Art of War/page (153).png',
    'books/Art of War/page (154).png',
    'books/Art of War/page (155).png',
    'books/Art of War/page (156).png',
    'books/Art of War/page (157).png',
    'books/Art of War/page (158).png',
    'books/Art of War/page (159).png',
    'books/Art of War/page (160).png',
    'books/Art of War/page (161).png',
    'books/Art of War/page (162).png',
    'books/Art of War/page (163).png',
    'books/Art of War/page (164).png',
    'books/Art of War/page (165).png',

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
