import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class trial extends StatefulWidget {
  const trial({Key? key}) : super(key: key);

  @override
  State<trial> createState() => _trialState();
}

class _trialState extends State<trial> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/the trial/page (1).png',
    'books/the trial/page (2).png',
    'books/the trial/page (3).png',
    'books/the trial/page (4).png',
    'books/the trial/page (5).png',
    'books/the trial/page (6).png',
    'books/the trial/page (7).png',
    'books/the trial/page (8).png',
    'books/the trial/page (9).png',
    'books/the trial/page (10).png',
    'books/the trial/page (11).png',
    'books/the trial/page (12).png',
    'books/the trial/page (13).png',
    'books/the trial/page (14).png',
    'books/the trial/page (15).png',
    'books/the trial/page (16).png',
    'books/the trial/page (17).png',
    'books/the trial/page (18).png',
    'books/the trial/page (19).png',
    'books/the trial/page (20).png',
    'books/the trial/page (21).png',
    'books/the trial/page (22).png',
    'books/the trial/page (23).png',
    'books/the trial/page (24).png',
    'books/the trial/page (25).png',
    'books/the trial/page (26).png',
    'books/the trial/page (27).png',
    'books/the trial/page (28).png',
    'books/the trial/page (29).png',
    'books/the trial/page (30).png',
    'books/the trial/page (31).png',
    'books/the trial/page (32).png',
    'books/the trial/page (33).png',
    'books/the trial/page (34).png',
    'books/the trial/page (35).png',
    'books/the trial/page (36).png',
    'books/the trial/page (37).png',
    'books/the trial/page (38).png',
    'books/the trial/page (39).png',
    'books/the trial/page (40).png',
    'books/the trial/page (41).png',
    'books/the trial/page (42).png',
    'books/the trial/page (43).png',
    'books/the trial/page (44).png',
    'books/the trial/page (45).png',
    'books/the trial/page (46).png',
    'books/the trial/page (47).png',
    'books/the trial/page (48).png',
    'books/the trial/page (49).png',
    'books/the trial/page (50).png',
    'books/the trial/page (51).png',
    'books/the trial/page (52).png',
    'books/the trial/page (53).png',
    'books/the trial/page (54).png',
    'books/the trial/page (55).png',
    'books/the trial/page (56).png',
    'books/the trial/page (57).png',
    'books/the trial/page (58).png',
    'books/the trial/page (59).png',
    'books/the trial/page (60).png',
    'books/the trial/page (61).png',
    'books/the trial/page (62).png',
    'books/the trial/page (63).png',
    'books/the trial/page (64).png',
    'books/the trial/page (65).png',
    'books/the trial/page (66).png',
    'books/the trial/page (67).png',
    'books/the trial/page (68).png',
    'books/the trial/page (69).png',
    'books/the trial/page (70).png',
    'books/the trial/page (71).png',
    'books/the trial/page (72).png',
    'books/the trial/page (73).png',
    'books/the trial/page (74).png',
    'books/the trial/page (75).png',
    'books/the trial/page (76).png',
    'books/the trial/page (77).png',
    'books/the trial/page (78).png',
    'books/the trial/page (79).png',
    'books/the trial/page (80).png',
    'books/the trial/page (81).png',
    'books/the trial/page (82).png',
    'books/the trial/page (83).png',
    'books/the trial/page (84).png',
    'books/the trial/page (85).png',
    'books/the trial/page (86).png',
    'books/the trial/page (87).png',
    'books/the trial/page (88).png',
    'books/the trial/page (89).png',
    'books/the trial/page (90).png',
    'books/the trial/page (91).png',
    'books/the trial/page (92).png',
    'books/the trial/page (93).png',
    'books/the trial/page (94).png',
    'books/the trial/page (95).png',
    'books/the trial/page (96).png',
    'books/the trial/page (97).png',
    'books/the trial/page (98).png',
    'books/the trial/page (99).png',
    'books/the trial/page (100).png',
    'books/the trial/page (101).png',
    'books/the trial/page (102).png',
    'books/the trial/page (103).png',
    'books/the trial/page (104).png',
    'books/the trial/page (105).png',
    'books/the trial/page (106).png',
    'books/the trial/page (107).png',
    'books/the trial/page (108).png',
    'books/the trial/page (109).png',
    'books/the trial/page (110).png',
    'books/the trial/page (111).png',
    'books/the trial/page (112).png',
    'books/the trial/page (113).png',
    'books/the trial/page (114).png',
    'books/the trial/page (115).png',
    'books/the trial/page (116).png',
    'books/the trial/page (117).png',
    'books/the trial/page (118).png',
    'books/the trial/page (119).png',
    'books/the trial/page (120).png',
    'books/the trial/page (121).png',
    'books/the trial/page (122).png',
    'books/the trial/page (123).png',
    'books/the trial/page (124).png',
    'books/the trial/page (125).png',
    'books/the trial/page (126).png',
    'books/the trial/page (127).png',
    'books/the trial/page (128).png',
    'books/the trial/page (129).png',
    'books/the trial/page (130).png',
    'books/the trial/page (131).png',
    'books/the trial/page (132).png',
    'books/the trial/page (133).png',
    'books/the trial/page (134).png',
    'books/the trial/page (135).png',
    'books/the trial/page (136).png',
    'books/the trial/page (137).png',
    'books/the trial/page (138).png',
    'books/the trial/page (139).png',
    'books/the trial/page (140).png',
    'books/the trial/page (141).png',
    'books/the trial/page (142).png',
    'books/the trial/page (143).png',
    'books/the trial/page (144).png',
    'books/the trial/page (145).png',
    'books/the trial/page (146).png',
    'books/the trial/page (147).png',
    'books/the trial/page (148).png',
    'books/the trial/page (149).png',
    'books/the trial/page (150).png',
    'books/the trial/page (151).png',
    'books/the trial/page (152).png',
    'books/the trial/page (153).png',
    'books/the trial/page (154).png',
    'books/the trial/page (155).png',
    'books/the trial/page (156).png',
    'books/the trial/page (157).png',
    'books/the trial/page (158).png',
    'books/the trial/page (159).png',
    'books/the trial/page (160).png',
    'books/the trial/page (161).png',
    'books/the trial/page (162).png',
    'books/the trial/page (163).png',
    'books/the trial/page (164).png',
    'books/the trial/page (165).png',
    'books/the trial/page (166).png',
    'books/the trial/page (167).png',
    'books/the trial/page (168).png',
    'books/the trial/page (169).png',
    'books/the trial/page (170).png',
    'books/the trial/page (171).png',
    'books/the trial/page (172).png',
    'books/the trial/page (173).png',
    'books/the trial/page (174).png',
    'books/the trial/page (175).png',
    'books/the trial/page (176).png',
    'books/the trial/page (177).png',
    'books/the trial/page (178).png',
    'books/the trial/page (179).png',
    'books/the trial/page (180).png',
    'books/the trial/page (181).png',

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
