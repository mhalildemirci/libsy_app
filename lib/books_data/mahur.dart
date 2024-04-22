import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mahur extends StatefulWidget {
  const mahur({Key? key}) : super(key: key);

  @override
  State<mahur> createState() => _mahurState();
}

class _mahurState extends State<mahur> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mahur/page (1).png',
    'books/mahur/page (2).png',
    'books/mahur/page (3).png',
    'books/mahur/page (4).png',
    'books/mahur/page (5).png',
    'books/mahur/page (6).png',
    'books/mahur/page (7).png',
    'books/mahur/page (8).png',
    'books/mahur/page (9).png',
    'books/mahur/page (10).png',
    'books/mahur/page (11).png',
    'books/mahur/page (12).png',
    'books/mahur/page (13).png',
    'books/mahur/page (14).png',
    'books/mahur/page (15).png',
    'books/mahur/page (16).png',
    'books/mahur/page (17).png',
    'books/mahur/page (18).png',
    'books/mahur/page (19).png',
    'books/mahur/page (20).png',
    'books/mahur/page (21).png',
    'books/mahur/page (22).png',
    'books/mahur/page (23).png',
    'books/mahur/page (24).png',
    'books/mahur/page (25).png',
    'books/mahur/page (26).png',
    'books/mahur/page (27).png',
    'books/mahur/page (28).png',
    'books/mahur/page (29).png',
    'books/mahur/page (30).png',
    'books/mahur/page (31).png',
    'books/mahur/page (32).png',
    'books/mahur/page (33).png',
    'books/mahur/page (34).png',
    'books/mahur/page (35).png',
    'books/mahur/page (36).png',
    'books/mahur/page (37).png',
    'books/mahur/page (38).png',
    'books/mahur/page (39).png',
    'books/mahur/page (40).png',
    'books/mahur/page (41).png',
    'books/mahur/page (42).png',
    'books/mahur/page (43).png',
    'books/mahur/page (44).png',
    'books/mahur/page (45).png',
    'books/mahur/page (46).png',
    'books/mahur/page (47).png',
    'books/mahur/page (48).png',
    'books/mahur/page (49).png',
    'books/mahur/page (50).png',
    'books/mahur/page (51).png',
    'books/mahur/page (52).png',
    'books/mahur/page (53).png',
    'books/mahur/page (54).png',
    'books/mahur/page (55).png',
    'books/mahur/page (56).png',
    'books/mahur/page (57).png',
    'books/mahur/page (58).png',
    'books/mahur/page (59).png',
    'books/mahur/page (60).png',
    'books/mahur/page (61).png',
    'books/mahur/page (62).png',
    'books/mahur/page (63).png',
    'books/mahur/page (64).png',
    'books/mahur/page (65).png',
    'books/mahur/page (66).png',
    'books/mahur/page (67).png',
    'books/mahur/page (68).png',
    'books/mahur/page (69).png',
    'books/mahur/page (70).png',
    'books/mahur/page (71).png',
    'books/mahur/page (72).png',
    'books/mahur/page (73).png',
    'books/mahur/page (74).png',
    'books/mahur/page (75).png',
    'books/mahur/page (76).png',
    'books/mahur/page (77).png',
    'books/mahur/page (78).png',
    'books/mahur/page (79).png',
    'books/mahur/page (80).png',
    'books/mahur/page (81).png',
    'books/mahur/page (82).png',
    'books/mahur/page (83).png',
    'books/mahur/page (84).png',
    'books/mahur/page (85).png',
    'books/mahur/page (86).png',
    'books/mahur/page (87).png',
    'books/mahur/page (88).png',
    'books/mahur/page (89).png',
    'books/mahur/page (90).png',
    'books/mahur/page (91).png',
    'books/mahur/page (92).png',
    'books/mahur/page (93).png',
    'books/mahur/page (94).png',
    'books/mahur/page (95).png',
    'books/mahur/page (96).png',
    'books/mahur/page (97).png',
    'books/mahur/page (98).png',
    'books/mahur/page (99).png',
    'books/mahur/page (100).png',
    'books/mahur/page (101).png',
    'books/mahur/page (102).png',
    'books/mahur/page (103).png',
    'books/mahur/page (104).png',
    'books/mahur/page (105).png',
    'books/mahur/page (106).png',
    'books/mahur/page (107).png',
    'books/mahur/page (108).png',
    'books/mahur/page (109).png',
    'books/mahur/page (110).png',
    'books/mahur/page (111).png',
    'books/mahur/page (112).png',
    'books/mahur/page (113).png',
    'books/mahur/page (114).png',
    'books/mahur/page (115).png',
    'books/mahur/page (116).png',
    'books/mahur/page (117).png',
    'books/mahur/page (118).png',
    'books/mahur/page (119).png',
    'books/mahur/page (120).png',
    'books/mahur/page (121).png',
    'books/mahur/page (122).png',
    'books/mahur/page (123).png',
    'books/mahur/page (124).png',
    'books/mahur/page (125).png',
    'books/mahur/page (126).png',
    'books/mahur/page (127).png',
    'books/mahur/page (128).png',
    'books/mahur/page (129).png',
    'books/mahur/page (130).png',
    'books/mahur/page (131).png',
    'books/mahur/page (132).png',
    'books/mahur/page (133).png',
    'books/mahur/page (134).png',
    'books/mahur/page (135).png',
    'books/mahur/page (136).png',
    'books/mahur/page (137).png',
    'books/mahur/page (138).png',
    'books/mahur/page (139).png',
    'books/mahur/page (140).png',
    'books/mahur/page (141).png',
    'books/mahur/page (142).png',
    'books/mahur/page (143).png',
    'books/mahur/page (144).png',
    'books/mahur/page (145).png',
    'books/mahur/page (146).png',
    'books/mahur/page (147).png',
    'books/mahur/page (148).png',
    'books/mahur/page (149).png',
    'books/mahur/page (150).png',
    'books/mahur/page (151).png',
    'books/mahur/page (152).png',
    'books/mahur/page (153).png',
    'books/mahur/page (154).png',
    'books/mahur/page (155).png',
    'books/mahur/page (156).png',
    'books/mahur/page (157).png',
    'books/mahur/page (158).png',
    'books/mahur/page (159).png',
    'books/mahur/page (160).png',
    'books/mahur/page (161).png',
    'books/mahur/page (162).png',
    'books/mahur/page (163).png',
    'books/mahur/page (164).png',
    'books/mahur/page (165).png',
    'books/mahur/page (166).png',
    'books/mahur/page (167).png',
    'books/mahur/page (168).png',
    'books/mahur/page (169).png',
    'books/mahur/page (170).png',
    'books/mahur/page (171).png',
    'books/mahur/page (172).png',
    'books/mahur/page (173).png',
    'books/mahur/page (174).png',
    'books/mahur/page (175).png',
    'books/mahur/page (176).png',
    'books/mahur/page (177).png',
    'books/mahur/page (178).png',
    'books/mahur/page (179).png',
    'books/mahur/page (180).png',
    'books/mahur/page (181).png',
    'books/mahur/page (182).png',
    'books/mahur/page (183).png',
    'books/mahur/page (184).png',
    'books/mahur/page (185).png',
    'books/mahur/page (186).png',
    'books/mahur/page (187).png',
    'books/mahur/page (188).png',

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
