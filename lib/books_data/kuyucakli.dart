import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kuyucakli extends StatefulWidget {
  const kuyucakli({Key? key}) : super(key: key);

  @override
  State<kuyucakli> createState() => _kuyucakliState();
}

class _kuyucakliState extends State<kuyucakli> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/kuyucakli/page (1).png',
    'books/kuyucakli/page (2).png',
    'books/kuyucakli/page (3).png',
    'books/kuyucakli/page (4).png',
    'books/kuyucakli/page (5).png',
    'books/kuyucakli/page (6).png',
    'books/kuyucakli/page (7).png',
    'books/kuyucakli/page (8).png',
    'books/kuyucakli/page (9).png',
    'books/kuyucakli/page (10).png',
    'books/kuyucakli/page (11).png',
    'books/kuyucakli/page (12).png',
    'books/kuyucakli/page (13).png',
    'books/kuyucakli/page (14).png',
    'books/kuyucakli/page (15).png',
    'books/kuyucakli/page (16).png',
    'books/kuyucakli/page (17).png',
    'books/kuyucakli/page (18).png',
    'books/kuyucakli/page (19).png',
    'books/kuyucakli/page (20).png',
    'books/kuyucakli/page (21).png',
    'books/kuyucakli/page (22).png',
    'books/kuyucakli/page (23).png',
    'books/kuyucakli/page (24).png',
    'books/kuyucakli/page (25).png',
    'books/kuyucakli/page (26).png',
    'books/kuyucakli/page (27).png',
    'books/kuyucakli/page (28).png',
    'books/kuyucakli/page (29).png',
    'books/kuyucakli/page (30).png',
    'books/kuyucakli/page (31).png',
    'books/kuyucakli/page (32).png',
    'books/kuyucakli/page (33).png',
    'books/kuyucakli/page (34).png',
    'books/kuyucakli/page (35).png',
    'books/kuyucakli/page (36).png',
    'books/kuyucakli/page (37).png',
    'books/kuyucakli/page (38).png',
    'books/kuyucakli/page (39).png',
    'books/kuyucakli/page (40).png',
    'books/kuyucakli/page (41).png',
    'books/kuyucakli/page (42).png',
    'books/kuyucakli/page (43).png',
    'books/kuyucakli/page (44).png',
    'books/kuyucakli/page (45).png',
    'books/kuyucakli/page (46).png',
    'books/kuyucakli/page (47).png',
    'books/kuyucakli/page (48).png',
    'books/kuyucakli/page (49).png',
    'books/kuyucakli/page (50).png',
    'books/kuyucakli/page (51).png',
    'books/kuyucakli/page (52).png',
    'books/kuyucakli/page (53).png',
    'books/kuyucakli/page (54).png',
    'books/kuyucakli/page (55).png',
    'books/kuyucakli/page (56).png',
    'books/kuyucakli/page (57).png',
    'books/kuyucakli/page (58).png',
    'books/kuyucakli/page (59).png',
    'books/kuyucakli/page (60).png',
    'books/kuyucakli/page (61).png',
    'books/kuyucakli/page (62).png',
    'books/kuyucakli/page (63).png',
    'books/kuyucakli/page (64).png',
    'books/kuyucakli/page (65).png',
    'books/kuyucakli/page (66).png',
    'books/kuyucakli/page (67).png',
    'books/kuyucakli/page (68).png',
    'books/kuyucakli/page (69).png',
    'books/kuyucakli/page (70).png',
    'books/kuyucakli/page (71).png',
    'books/kuyucakli/page (72).png',
    'books/kuyucakli/page (73).png',
    'books/kuyucakli/page (74).png',
    'books/kuyucakli/page (75).png',
    'books/kuyucakli/page (76).png',
    'books/kuyucakli/page (77).png',
    'books/kuyucakli/page (78).png',
    'books/kuyucakli/page (79).png',
    'books/kuyucakli/page (80).png',
    'books/kuyucakli/page (81).png',
    'books/kuyucakli/page (82).png',
    'books/kuyucakli/page (83).png',
    'books/kuyucakli/page (84).png',
    'books/kuyucakli/page (85).png',
    'books/kuyucakli/page (86).png',
    'books/kuyucakli/page (87).png',
    'books/kuyucakli/page (88).png',
    'books/kuyucakli/page (89).png',
    'books/kuyucakli/page (90).png',
    'books/kuyucakli/page (91).png',
    'books/kuyucakli/page (92).png',
    'books/kuyucakli/page (93).png',
    'books/kuyucakli/page (94).png',
    'books/kuyucakli/page (95).png',
    'books/kuyucakli/page (96).png',
    'books/kuyucakli/page (97).png',
    'books/kuyucakli/page (98).png',
    'books/kuyucakli/page (99).png',
    'books/kuyucakli/page (100).png',
    'books/kuyucakli/page (101).png',
    'books/kuyucakli/page (102).png',
    'books/kuyucakli/page (103).png',
    'books/kuyucakli/page (104).png',
    'books/kuyucakli/page (105).png',
    'books/kuyucakli/page (106).png',
    'books/kuyucakli/page (107).png',
    'books/kuyucakli/page (108).png',
    'books/kuyucakli/page (109).png',
    'books/kuyucakli/page (110).png',
    'books/kuyucakli/page (111).png',
    'books/kuyucakli/page (112).png',
    'books/kuyucakli/page (113).png',
    'books/kuyucakli/page (114).png',
    'books/kuyucakli/page (115).png',
    'books/kuyucakli/page (116).png',
    'books/kuyucakli/page (117).png',
    'books/kuyucakli/page (118).png',
    'books/kuyucakli/page (119).png',
    'books/kuyucakli/page (120).png',
    'books/kuyucakli/page (121).png',
    'books/kuyucakli/page (122).png',
    'books/kuyucakli/page (123).png',
    'books/kuyucakli/page (124).png',
    'books/kuyucakli/page (125).png',
    'books/kuyucakli/page (126).png',
    'books/kuyucakli/page (127).png',
    'books/kuyucakli/page (128).png',
    'books/kuyucakli/page (129).png',
    'books/kuyucakli/page (130).png',
    'books/kuyucakli/page (131).png',
    'books/kuyucakli/page (132).png',
    'books/kuyucakli/page (133).png',
    'books/kuyucakli/page (134).png',
    'books/kuyucakli/page (135).png',
    'books/kuyucakli/page (136).png',
    'books/kuyucakli/page (137).png',
    'books/kuyucakli/page (138).png',
    'books/kuyucakli/page (139).png',
    'books/kuyucakli/page (140).png',
    'books/kuyucakli/page (141).png',
    'books/kuyucakli/page (142).png',
    'books/kuyucakli/page (143).png',
    'books/kuyucakli/page (144).png',
    'books/kuyucakli/page (145).png',
    'books/kuyucakli/page (146).png',
    'books/kuyucakli/page (147).png',
    'books/kuyucakli/page (148).png',
    'books/kuyucakli/page (149).png',
    'books/kuyucakli/page (150).png',
    'books/kuyucakli/page (151).png',
    'books/kuyucakli/page (152).png',
    'books/kuyucakli/page (153).png',
    'books/kuyucakli/page (154).png',
    'books/kuyucakli/page (155).png',
    'books/kuyucakli/page (156).png',
    'books/kuyucakli/page (157).png',
    'books/kuyucakli/page (158).png',
    'books/kuyucakli/page (159).png',
    'books/kuyucakli/page (160).png',
    'books/kuyucakli/page (161).png',
    'books/kuyucakli/page (162).png',
    'books/kuyucakli/page (163).png',
    'books/kuyucakli/page (164).png',
    'books/kuyucakli/page (165).png',
    'books/kuyucakli/page (166).png',
    'books/kuyucakli/page (167).png',
    'books/kuyucakli/page (168).png',
    'books/kuyucakli/page (169).png',
    'books/kuyucakli/page (170).png',
    'books/kuyucakli/page (171).png',
    'books/kuyucakli/page (172).png',
    'books/kuyucakli/page (173).png',
    'books/kuyucakli/page (174).png',

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
