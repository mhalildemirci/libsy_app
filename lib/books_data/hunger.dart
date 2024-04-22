import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class hunger extends StatefulWidget {
  const hunger({Key? key}) : super(key: key);

  @override
  State<hunger> createState() => _hungerState();
}

class _hungerState extends State<hunger> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/hunger/page (1).png',
    'books/hunger/page (2).png',
    'books/hunger/page (3).png',
    'books/hunger/page (4).png',
    'books/hunger/page (5).png',
    'books/hunger/page (6).png',
    'books/hunger/page (7).png',
    'books/hunger/page (8).png',
    'books/hunger/page (9).png',
    'books/hunger/page (10).png',
    'books/hunger/page (11).png',
    'books/hunger/page (12).png',
    'books/hunger/page (13).png',
    'books/hunger/page (14).png',
    'books/hunger/page (15).png',
    'books/hunger/page (16).png',
    'books/hunger/page (17).png',
    'books/hunger/page (18).png',
    'books/hunger/page (19).png',
    'books/hunger/page (20).png',
    'books/hunger/page (21).png',
    'books/hunger/page (22).png',
    'books/hunger/page (23).png',
    'books/hunger/page (24).png',
    'books/hunger/page (25).png',
    'books/hunger/page (26).png',
    'books/hunger/page (27).png',
    'books/hunger/page (28).png',
    'books/hunger/page (29).png',
    'books/hunger/page (30).png',
    'books/hunger/page (31).png',
    'books/hunger/page (32).png',
    'books/hunger/page (33).png',
    'books/hunger/page (34).png',
    'books/hunger/page (35).png',
    'books/hunger/page (36).png',
    'books/hunger/page (37).png',
    'books/hunger/page (38).png',
    'books/hunger/page (39).png',
    'books/hunger/page (40).png',
    'books/hunger/page (41).png',
    'books/hunger/page (42).png',
    'books/hunger/page (43).png',
    'books/hunger/page (44).png',
    'books/hunger/page (45).png',
    'books/hunger/page (46).png',
    'books/hunger/page (47).png',
    'books/hunger/page (48).png',
    'books/hunger/page (49).png',
    'books/hunger/page (50).png',
    'books/hunger/page (51).png',
    'books/hunger/page (52).png',
    'books/hunger/page (53).png',
    'books/hunger/page (54).png',
    'books/hunger/page (55).png',
    'books/hunger/page (56).png',
    'books/hunger/page (57).png',
    'books/hunger/page (58).png',
    'books/hunger/page (59).png',
    'books/hunger/page (60).png',
    'books/hunger/page (61).png',
    'books/hunger/page (62).png',
    'books/hunger/page (63).png',
    'books/hunger/page (64).png',
    'books/hunger/page (65).png',
    'books/hunger/page (66).png',
    'books/hunger/page (67).png',
    'books/hunger/page (68).png',
    'books/hunger/page (69).png',
    'books/hunger/page (70).png',
    'books/hunger/page (71).png',
    'books/hunger/page (72).png',
    'books/hunger/page (73).png',
    'books/hunger/page (74).png',
    'books/hunger/page (75).png',
    'books/hunger/page (76).png',
    'books/hunger/page (77).png',
    'books/hunger/page (78).png',
    'books/hunger/page (79).png',
    'books/hunger/page (80).png',
    'books/hunger/page (81).png',
    'books/hunger/page (82).png',
    'books/hunger/page (83).png',
    'books/hunger/page (84).png',
    'books/hunger/page (85).png',
    'books/hunger/page (86).png',
    'books/hunger/page (87).png',
    'books/hunger/page (88).png',
    'books/hunger/page (89).png',
    'books/hunger/page (90).png',
    'books/hunger/page (91).png',
    'books/hunger/page (92).png',
    'books/hunger/page (93).png',
    'books/hunger/page (94).png',
    'books/hunger/page (95).png',
    'books/hunger/page (96).png',
    'books/hunger/page (97).png',
    'books/hunger/page (98).png',
    'books/hunger/page (99).png',
    'books/hunger/page (100).png',
    'books/hunger/page (101).png',
    'books/hunger/page (102).png',
    'books/hunger/page (103).png',
    'books/hunger/page (104).png',
    'books/hunger/page (105).png',
    'books/hunger/page (106).png',
    'books/hunger/page (107).png',
    'books/hunger/page (108).png',
    'books/hunger/page (109).png',
    'books/hunger/page (110).png',
    'books/hunger/page (111).png',
    'books/hunger/page (112).png',
    'books/hunger/page (113).png',
    'books/hunger/page (114).png',
    'books/hunger/page (115).png',
    'books/hunger/page (116).png',
    'books/hunger/page (117).png',
    'books/hunger/page (118).png',
    'books/hunger/page (119).png',
    'books/hunger/page (120).png',
    'books/hunger/page (121).png',
    'books/hunger/page (122).png',
    'books/hunger/page (123).png',
    'books/hunger/page (124).png',
    'books/hunger/page (125).png',
    'books/hunger/page (126).png',
    'books/hunger/page (127).png',
    'books/hunger/page (128).png',
    'books/hunger/page (129).png',
    'books/hunger/page (130).png',
    'books/hunger/page (131).png',
    'books/hunger/page (132).png',
    'books/hunger/page (133).png',
    'books/hunger/page (134).png',
    'books/hunger/page (135).png',
    'books/hunger/page (136).png',
    'books/hunger/page (137).png',
    'books/hunger/page (138).png',
    'books/hunger/page (139).png',
    'books/hunger/page (140).png',
    'books/hunger/page (141).png',
    'books/hunger/page (142).png',
    'books/hunger/page (143).png',
    'books/hunger/page (144).png',
    'books/hunger/page (145).png',
    'books/hunger/page (146).png',
    'books/hunger/page (147).png',
    'books/hunger/page (148).png',
    'books/hunger/page (149).png',
    'books/hunger/page (150).png',
    'books/hunger/page (151).png',
    'books/hunger/page (152).png',

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
