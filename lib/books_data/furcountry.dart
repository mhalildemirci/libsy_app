import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class furcountry extends StatefulWidget {
  const furcountry({Key? key}) : super(key: key);

  @override
  State<furcountry> createState() => _furcountryState();
}

class _furcountryState extends State<furcountry> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/fur country/page (1).png',
    'books/fur country/page (2).png',
    'books/fur country/page (3).png',
    'books/fur country/page (4).png',
    'books/fur country/page (5).png',
    'books/fur country/page (6).png',
    'books/fur country/page (7).png',
    'books/fur country/page (8).png',
    'books/fur country/page (9).png',
    'books/fur country/page (10).png',
    'books/fur country/page (11).png',
    'books/fur country/page (12).png',
    'books/fur country/page (13).png',
    'books/fur country/page (14).png',
    'books/fur country/page (15).png',
    'books/fur country/page (16).png',
    'books/fur country/page (17).png',
    'books/fur country/page (18).png',
    'books/fur country/page (19).png',
    'books/fur country/page (20).png',
    'books/fur country/page (21).png',
    'books/fur country/page (22).png',
    'books/fur country/page (23).png',
    'books/fur country/page (24).png',
    'books/fur country/page (25).png',
    'books/fur country/page (26).png',
    'books/fur country/page (27).png',
    'books/fur country/page (28).png',
    'books/fur country/page (29).png',
    'books/fur country/page (30).png',
    'books/fur country/page (31).png',
    'books/fur country/page (32).png',
    'books/fur country/page (33).png',
    'books/fur country/page (34).png',
    'books/fur country/page (35).png',
    'books/fur country/page (36).png',
    'books/fur country/page (37).png',
    'books/fur country/page (38).png',
    'books/fur country/page (39).png',
    'books/fur country/page (40).png',
    'books/fur country/page (41).png',
    'books/fur country/page (42).png',
    'books/fur country/page (43).png',
    'books/fur country/page (44).png',
    'books/fur country/page (45).png',
    'books/fur country/page (46).png',
    'books/fur country/page (47).png',
    'books/fur country/page (48).png',
    'books/fur country/page (49).png',
    'books/fur country/page (50).png',
    'books/fur country/page (51).png',
    'books/fur country/page (52).png',
    'books/fur country/page (53).png',
    'books/fur country/page (54).png',
    'books/fur country/page (55).png',
    'books/fur country/page (56).png',
    'books/fur country/page (57).png',
    'books/fur country/page (58).png',
    'books/fur country/page (59).png',
    'books/fur country/page (60).png',
    'books/fur country/page (61).png',
    'books/fur country/page (62).png',
    'books/fur country/page (63).png',
    'books/fur country/page (64).png',
    'books/fur country/page (65).png',
    'books/fur country/page (66).png',
    'books/fur country/page (67).png',
    'books/fur country/page (68).png',
    'books/fur country/page (69).png',
    'books/fur country/page (70).png',
    'books/fur country/page (71).png',
    'books/fur country/page (72).png',
    'books/fur country/page (73).png',
    'books/fur country/page (74).png',
    'books/fur country/page (75).png',
    'books/fur country/page (76).png',
    'books/fur country/page (77).png',
    'books/fur country/page (78).png',
    'books/fur country/page (79).png',
    'books/fur country/page (80).png',
    'books/fur country/page (81).png',
    'books/fur country/page (82).png',
    'books/fur country/page (83).png',
    'books/fur country/page (84).png',
    'books/fur country/page (85).png',
    'books/fur country/page (86).png',
    'books/fur country/page (87).png',
    'books/fur country/page (88).png',
    'books/fur country/page (89).png',
    'books/fur country/page (90).png',
    'books/fur country/page (91).png',
    'books/fur country/page (92).png',
    'books/fur country/page (93).png',
    'books/fur country/page (94).png',
    'books/fur country/page (95).png',
    'books/fur country/page (96).png',
    'books/fur country/page (97).png',
    'books/fur country/page (98).png',
    'books/fur country/page (99).png',
    'books/fur country/page (100).png',
    'books/fur country/page (101).png',
    'books/fur country/page (102).png',
    'books/fur country/page (103).png',
    'books/fur country/page (104).png',
    'books/fur country/page (105).png',
    'books/fur country/page (106).png',
    'books/fur country/page (107).png',
    'books/fur country/page (108).png',
    'books/fur country/page (109).png',
    'books/fur country/page (110).png',
    'books/fur country/page (111).png',
    'books/fur country/page (112).png',
    'books/fur country/page (113).png',
    'books/fur country/page (114).png',
    'books/fur country/page (115).png',
    'books/fur country/page (116).png',
    'books/fur country/page (117).png',
    'books/fur country/page (118).png',
    'books/fur country/page (119).png',
    'books/fur country/page (120).png',
    'books/fur country/page (121).png',
    'books/fur country/page (122).png',
    'books/fur country/page (123).png',
    'books/fur country/page (124).png',
    'books/fur country/page (125).png',
    'books/fur country/page (126).png',
    'books/fur country/page (127).png',
    'books/fur country/page (128).png',
    'books/fur country/page (129).png',
    'books/fur country/page (130).png',
    'books/fur country/page (131).png',
    'books/fur country/page (132).png',
    'books/fur country/page (133).png',
    'books/fur country/page (134).png',
    'books/fur country/page (135).png',
    'books/fur country/page (136).png',
    'books/fur country/page (137).png',
    'books/fur country/page (138).png',
    'books/fur country/page (139).png',
    'books/fur country/page (140).png',
    'books/fur country/page (141).png',
    'books/fur country/page (142).png',
    'books/fur country/page (143).png',
    'books/fur country/page (144).png',
    'books/fur country/page (145).png',
    'books/fur country/page (146).png',
    'books/fur country/page (147).png',
    'books/fur country/page (148).png',
    'books/fur country/page (149).png',
    'books/fur country/page (150).png',
    'books/fur country/page (151).png',
    'books/fur country/page (152).png',
    'books/fur country/page (153).png',
    'books/fur country/page (154).png',
    'books/fur country/page (155).png',
    'books/fur country/page (156).png',
    'books/fur country/page (157).png',
    'books/fur country/page (158).png',
    'books/fur country/page (159).png',
    'books/fur country/page (160).png',
    'books/fur country/page (161).png',
    'books/fur country/page (162).png',
    'books/fur country/page (163).png',
    'books/fur country/page (164).png',
    'books/fur country/page (165).png',
    'books/fur country/page (166).png',
    'books/fur country/page (167).png',
    'books/fur country/page (168).png',
    'books/fur country/page (169).png',
    'books/fur country/page (170).png',
    'books/fur country/page (171).png',
    'books/fur country/page (172).png',
    'books/fur country/page (173).png',

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
