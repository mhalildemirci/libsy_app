import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class atestengomlek extends StatefulWidget {
  const atestengomlek({Key? key}) : super(key: key);

  @override
  State<atestengomlek> createState() => _atestengomlekState();
}

class _atestengomlekState extends State<atestengomlek> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/atesten gomlek/page (1).png',
    'books/atesten gomlek/page (2).png',
    'books/atesten gomlek/page (3).png',
    'books/atesten gomlek/page (4).png',
    'books/atesten gomlek/page (5).png',
    'books/atesten gomlek/page (6).png',
    'books/atesten gomlek/page (7).png',
    'books/atesten gomlek/page (8).png',
    'books/atesten gomlek/page (9).png',
    'books/atesten gomlek/page (10).png',
    'books/atesten gomlek/page (11).png',
    'books/atesten gomlek/page (12).png',
    'books/atesten gomlek/page (13).png',
    'books/atesten gomlek/page (14).png',
    'books/atesten gomlek/page (15).png',
    'books/atesten gomlek/page (16).png',
    'books/atesten gomlek/page (17).png',
    'books/atesten gomlek/page (18).png',
    'books/atesten gomlek/page (19).png',
    'books/atesten gomlek/page (20).png',
    'books/atesten gomlek/page (21).png',
    'books/atesten gomlek/page (22).png',
    'books/atesten gomlek/page (23).png',
    'books/atesten gomlek/page (24).png',
    'books/atesten gomlek/page (25).png',
    'books/atesten gomlek/page (26).png',
    'books/atesten gomlek/page (27).png',
    'books/atesten gomlek/page (28).png',
    'books/atesten gomlek/page (29).png',
    'books/atesten gomlek/page (30).png',
    'books/atesten gomlek/page (31).png',
    'books/atesten gomlek/page (32).png',
    'books/atesten gomlek/page (33).png',
    'books/atesten gomlek/page (34).png',
    'books/atesten gomlek/page (35).png',
    'books/atesten gomlek/page (36).png',
    'books/atesten gomlek/page (37).png',
    'books/atesten gomlek/page (38).png',
    'books/atesten gomlek/page (39).png',
    'books/atesten gomlek/page (40).png',
    'books/atesten gomlek/page (41).png',
    'books/atesten gomlek/page (42).png',
    'books/atesten gomlek/page (43).png',
    'books/atesten gomlek/page (44).png',
    'books/atesten gomlek/page (45).png',
    'books/atesten gomlek/page (46).png',
    'books/atesten gomlek/page (47).png',
    'books/atesten gomlek/page (48).png',
    'books/atesten gomlek/page (49).png',
    'books/atesten gomlek/page (50).png',
    'books/atesten gomlek/page (51).png',
    'books/atesten gomlek/page (52).png',
    'books/atesten gomlek/page (53).png',
    'books/atesten gomlek/page (54).png',
    'books/atesten gomlek/page (55).png',
    'books/atesten gomlek/page (56).png',
    'books/atesten gomlek/page (57).png',
    'books/atesten gomlek/page (58).png',
    'books/atesten gomlek/page (59).png',
    'books/atesten gomlek/page (60).png',
    'books/atesten gomlek/page (61).png',
    'books/atesten gomlek/page (62).png',
    'books/atesten gomlek/page (63).png',
    'books/atesten gomlek/page (64).png',
    'books/atesten gomlek/page (65).png',
    'books/atesten gomlek/page (66).png',
    'books/atesten gomlek/page (67).png',
    'books/atesten gomlek/page (68).png',
    'books/atesten gomlek/page (69).png',
    'books/atesten gomlek/page (70).png',
    'books/atesten gomlek/page (71).png',
    'books/atesten gomlek/page (72).png',
    'books/atesten gomlek/page (73).png',
    'books/atesten gomlek/page (74).png',
    'books/atesten gomlek/page (75).png',
    'books/atesten gomlek/page (76).png',
    'books/atesten gomlek/page (77).png',
    'books/atesten gomlek/page (78).png',
    'books/atesten gomlek/page (79).png',
    'books/atesten gomlek/page (80).png',
    'books/atesten gomlek/page (81).png',
    'books/atesten gomlek/page (82).png',
    'books/atesten gomlek/page (83).png',
    'books/atesten gomlek/page (84).png',
    'books/atesten gomlek/page (85).png',
    'books/atesten gomlek/page (86).png',
    'books/atesten gomlek/page (87).png',
    'books/atesten gomlek/page (88).png',
    'books/atesten gomlek/page (89).png',
    'books/atesten gomlek/page (90).png',
    'books/atesten gomlek/page (91).png',
    'books/atesten gomlek/page (92).png',
    'books/atesten gomlek/page (93).png',
    'books/atesten gomlek/page (94).png',
    'books/atesten gomlek/page (95).png',
    'books/atesten gomlek/page (96).png',
    'books/atesten gomlek/page (97).png',
    'books/atesten gomlek/page (98).png',
    'books/atesten gomlek/page (99).png',
    'books/atesten gomlek/page (100).png',
    'books/atesten gomlek/page (101).png',
    'books/atesten gomlek/page (102).png',
    'books/atesten gomlek/page (103).png',
    'books/atesten gomlek/page (104).png',
    'books/atesten gomlek/page (105).png',
    'books/atesten gomlek/page (106).png',
    'books/atesten gomlek/page (107).png',
    'books/atesten gomlek/page (108).png',
    'books/atesten gomlek/page (109).png',
    'books/atesten gomlek/page (110).png',
    'books/atesten gomlek/page (111).png',
    'books/atesten gomlek/page (112).png',
    'books/atesten gomlek/page (113).png',
    'books/atesten gomlek/page (114).png',
    'books/atesten gomlek/page (115).png',
    'books/atesten gomlek/page (116).png',
    'books/atesten gomlek/page (117).png',
    'books/atesten gomlek/page (118).png',
    'books/atesten gomlek/page (119).png',
    'books/atesten gomlek/page (120).png',
    'books/atesten gomlek/page (121).png',
    'books/atesten gomlek/page (122).png',
    'books/atesten gomlek/page (123).png',
    'books/atesten gomlek/page (124).png',
    'books/atesten gomlek/page (125).png',
    'books/atesten gomlek/page (126).png',
    'books/atesten gomlek/page (127).png',
    'books/atesten gomlek/page (128).png',
    'books/atesten gomlek/page (129).png',
    'books/atesten gomlek/page (130).png',
    'books/atesten gomlek/page (131).png',
    'books/atesten gomlek/page (132).png',
    'books/atesten gomlek/page (133).png',
    'books/atesten gomlek/page (134).png',
    'books/atesten gomlek/page (135).png',
    'books/atesten gomlek/page (136).png',
    'books/atesten gomlek/page (137).png',
    'books/atesten gomlek/page (138).png',
    'books/atesten gomlek/page (139).png',
    'books/atesten gomlek/page (140).png',
    'books/atesten gomlek/page (141).png',
    'books/atesten gomlek/page (142).png',
    'books/atesten gomlek/page (143).png',
    'books/atesten gomlek/page (144).png',
    'books/atesten gomlek/page (145).png',
    'books/atesten gomlek/page (146).png',
    'books/atesten gomlek/page (147).png'

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
