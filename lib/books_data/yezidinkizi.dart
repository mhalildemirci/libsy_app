import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class yezidinkizi extends StatefulWidget {
  const yezidinkizi({Key? key}) : super(key: key);

  @override
  State<yezidinkizi> createState() => _yezidinkiziState();
}

class _yezidinkiziState extends State<yezidinkizi> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/yezidin kizi/page (1).png',
    'books/yezidin kizi/page (2).png',
    'books/yezidin kizi/page (3).png',
    'books/yezidin kizi/page (4).png',
    'books/yezidin kizi/page (5).png',
    'books/yezidin kizi/page (6).png',
    'books/yezidin kizi/page (7).png',
    'books/yezidin kizi/page (8).png',
    'books/yezidin kizi/page (9).png',
    'books/yezidin kizi/page (10).png',
    'books/yezidin kizi/page (11).png',
    'books/yezidin kizi/page (12).png',
    'books/yezidin kizi/page (13).png',
    'books/yezidin kizi/page (14).png',
    'books/yezidin kizi/page (15).png',
    'books/yezidin kizi/page (16).png',
    'books/yezidin kizi/page (17).png',
    'books/yezidin kizi/page (18).png',
    'books/yezidin kizi/page (19).png',
    'books/yezidin kizi/page (20).png',
    'books/yezidin kizi/page (21).png',
    'books/yezidin kizi/page (22).png',
    'books/yezidin kizi/page (23).png',
    'books/yezidin kizi/page (24).png',
    'books/yezidin kizi/page (25).png',
    'books/yezidin kizi/page (26).png',
    'books/yezidin kizi/page (27).png',
    'books/yezidin kizi/page (28).png',
    'books/yezidin kizi/page (29).png',
    'books/yezidin kizi/page (30).png',
    'books/yezidin kizi/page (31).png',
    'books/yezidin kizi/page (32).png',
    'books/yezidin kizi/page (33).png',
    'books/yezidin kizi/page (34).png',
    'books/yezidin kizi/page (35).png',
    'books/yezidin kizi/page (36).png',
    'books/yezidin kizi/page (37).png',
    'books/yezidin kizi/page (38).png',
    'books/yezidin kizi/page (39).png',
    'books/yezidin kizi/page (40).png',
    'books/yezidin kizi/page (41).png',
    'books/yezidin kizi/page (42).png',
    'books/yezidin kizi/page (43).png',
    'books/yezidin kizi/page (44).png',
    'books/yezidin kizi/page (45).png',
    'books/yezidin kizi/page (46).png',
    'books/yezidin kizi/page (47).png',
    'books/yezidin kizi/page (48).png',
    'books/yezidin kizi/page (49).png',
    'books/yezidin kizi/page (50).png',
    'books/yezidin kizi/page (51).png',
    'books/yezidin kizi/page (52).png',
    'books/yezidin kizi/page (53).png',
    'books/yezidin kizi/page (54).png',
    'books/yezidin kizi/page (55).png',
    'books/yezidin kizi/page (56).png',
    'books/yezidin kizi/page (57).png',
    'books/yezidin kizi/page (58).png',
    'books/yezidin kizi/page (59).png',
    'books/yezidin kizi/page (60).png',
    'books/yezidin kizi/page (61).png',
    'books/yezidin kizi/page (62).png',
    'books/yezidin kizi/page (63).png',
    'books/yezidin kizi/page (64).png',
    'books/yezidin kizi/page (65).png',
    'books/yezidin kizi/page (66).png',
    'books/yezidin kizi/page (67).png',
    'books/yezidin kizi/page (68).png',
    'books/yezidin kizi/page (69).png',
    'books/yezidin kizi/page (70).png',
    'books/yezidin kizi/page (71).png',
    'books/yezidin kizi/page (72).png',
    'books/yezidin kizi/page (73).png',
    'books/yezidin kizi/page (74).png',
    'books/yezidin kizi/page (75).png',
    'books/yezidin kizi/page (76).png',
    'books/yezidin kizi/page (77).png',
    'books/yezidin kizi/page (78).png',
    'books/yezidin kizi/page (79).png',
    'books/yezidin kizi/page (80).png',
    'books/yezidin kizi/page (81).png',
    'books/yezidin kizi/page (82).png',
    'books/yezidin kizi/page (83).png',
    'books/yezidin kizi/page (84).png',
    'books/yezidin kizi/page (85).png',
    'books/yezidin kizi/page (86).png',
    'books/yezidin kizi/page (87).png',
    'books/yezidin kizi/page (88).png',
    'books/yezidin kizi/page (89).png',
    'books/yezidin kizi/page (90).png',
    'books/yezidin kizi/page (91).png',
    'books/yezidin kizi/page (92).png',
    'books/yezidin kizi/page (93).png',
    'books/yezidin kizi/page (94).png',
    'books/yezidin kizi/page (95).png',
    'books/yezidin kizi/page (96).png',
    'books/yezidin kizi/page (97).png',
    'books/yezidin kizi/page (98).png',
    'books/yezidin kizi/page (99).png',
    'books/yezidin kizi/page (100).png',
    'books/yezidin kizi/page (101).png',
    'books/yezidin kizi/page (102).png',
    'books/yezidin kizi/page (103).png',
    'books/yezidin kizi/page (104).png',
    'books/yezidin kizi/page (105).png',
    'books/yezidin kizi/page (106).png',
    'books/yezidin kizi/page (107).png',
    'books/yezidin kizi/page (108).png',
    'books/yezidin kizi/page (109).png',
    'books/yezidin kizi/page (110).png',
    'books/yezidin kizi/page (111).png',
    'books/yezidin kizi/page (112).png',
    'books/yezidin kizi/page (113).png',
    'books/yezidin kizi/page (114).png',
    'books/yezidin kizi/page (115).png',
    'books/yezidin kizi/page (116).png',
    'books/yezidin kizi/page (117).png',
    'books/yezidin kizi/page (118).png',
    'books/yezidin kizi/page (119).png',
    'books/yezidin kizi/page (120).png',
    'books/yezidin kizi/page (121).png',
    'books/yezidin kizi/page (122).png',
    'books/yezidin kizi/page (123).png',
    'books/yezidin kizi/page (124).png',
    'books/yezidin kizi/page (125).png',
    'books/yezidin kizi/page (126).png',
    'books/yezidin kizi/page (127).png',
    'books/yezidin kizi/page (128).png',
    'books/yezidin kizi/page (129).png',
    'books/yezidin kizi/page (130).png',
    'books/yezidin kizi/page (131).png',
    'books/yezidin kizi/page (132).png',
    'books/yezidin kizi/page (133).png',
    'books/yezidin kizi/page (134).png',
    'books/yezidin kizi/page (135).png',
    'books/yezidin kizi/page (136).png',
    'books/yezidin kizi/page (137).png',
    'books/yezidin kizi/page (138).png',
    'books/yezidin kizi/page (139).png',
    'books/yezidin kizi/page (140).png',
    'books/yezidin kizi/page (141).png',
    'books/yezidin kizi/page (142).png',
    'books/yezidin kizi/page (143).png',
    'books/yezidin kizi/page (144).png',
    'books/yezidin kizi/page (145).png',
    'books/yezidin kizi/page (146).png',
    'books/yezidin kizi/page (147).png',
    'books/yezidin kizi/page (148).png',
    'books/yezidin kizi/page (149).png',
    'books/yezidin kizi/page (150).png',
    'books/yezidin kizi/page (151).png',

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
