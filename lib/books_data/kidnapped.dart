import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class kidnapped extends StatefulWidget {
  const kidnapped({Key? key}) : super(key: key);

  @override
  State<kidnapped> createState() => _kidnappedState();
}

class _kidnappedState extends State<kidnapped> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/kidnapped/page (1).png',
    'books/kidnapped/page (2).png',
    'books/kidnapped/page (3).png',
    'books/kidnapped/page (4).png',
    'books/kidnapped/page (5).png',
    'books/kidnapped/page (6).png',
    'books/kidnapped/page (7).png',
    'books/kidnapped/page (8).png',
    'books/kidnapped/page (9).png',
    'books/kidnapped/page (10).png',
    'books/kidnapped/page (11).png',
    'books/kidnapped/page (12).png',
    'books/kidnapped/page (13).png',
    'books/kidnapped/page (14).png',
    'books/kidnapped/page (15).png',
    'books/kidnapped/page (16).png',
    'books/kidnapped/page (17).png',
    'books/kidnapped/page (18).png',
    'books/kidnapped/page (19).png',
    'books/kidnapped/page (20).png',
    'books/kidnapped/page (21).png',
    'books/kidnapped/page (22).png',
    'books/kidnapped/page (23).png',
    'books/kidnapped/page (24).png',
    'books/kidnapped/page (25).png',
    'books/kidnapped/page (26).png',
    'books/kidnapped/page (27).png',
    'books/kidnapped/page (28).png',
    'books/kidnapped/page (29).png',
    'books/kidnapped/page (30).png',
    'books/kidnapped/page (31).png',
    'books/kidnapped/page (32).png',
    'books/kidnapped/page (33).png',
    'books/kidnapped/page (34).png',
    'books/kidnapped/page (35).png',
    'books/kidnapped/page (36).png',
    'books/kidnapped/page (37).png',
    'books/kidnapped/page (38).png',
    'books/kidnapped/page (39).png',
    'books/kidnapped/page (40).png',
    'books/kidnapped/page (41).png',
    'books/kidnapped/page (42).png',
    'books/kidnapped/page (43).png',
    'books/kidnapped/page (44).png',
    'books/kidnapped/page (45).png',
    'books/kidnapped/page (46).png',
    'books/kidnapped/page (47).png',
    'books/kidnapped/page (48).png',
    'books/kidnapped/page (49).png',
    'books/kidnapped/page (50).png',
    'books/kidnapped/page (51).png',
    'books/kidnapped/page (52).png',
    'books/kidnapped/page (53).png',
    'books/kidnapped/page (54).png',
    'books/kidnapped/page (55).png',
    'books/kidnapped/page (56).png',
    'books/kidnapped/page (57).png',
    'books/kidnapped/page (58).png',
    'books/kidnapped/page (59).png',
    'books/kidnapped/page (60).png',
    'books/kidnapped/page (61).png',
    'books/kidnapped/page (62).png',
    'books/kidnapped/page (63).png',
    'books/kidnapped/page (64).png',
    'books/kidnapped/page (65).png',
    'books/kidnapped/page (66).png',
    'books/kidnapped/page (67).png',
    'books/kidnapped/page (68).png',
    'books/kidnapped/page (69).png',
    'books/kidnapped/page (70).png',
    'books/kidnapped/page (71).png',
    'books/kidnapped/page (72).png',
    'books/kidnapped/page (73).png',
    'books/kidnapped/page (74).png',
    'books/kidnapped/page (75).png',
    'books/kidnapped/page (76).png',
    'books/kidnapped/page (77).png',
    'books/kidnapped/page (78).png',
    'books/kidnapped/page (79).png',
    'books/kidnapped/page (80).png',
    'books/kidnapped/page (81).png',
    'books/kidnapped/page (82).png',
    'books/kidnapped/page (83).png',
    'books/kidnapped/page (84).png',
    'books/kidnapped/page (85).png',
    'books/kidnapped/page (86).png',
    'books/kidnapped/page (87).png',
    'books/kidnapped/page (88).png',
    'books/kidnapped/page (89).png',
    'books/kidnapped/page (90).png',
    'books/kidnapped/page (91).png',
    'books/kidnapped/page (92).png',
    'books/kidnapped/page (93).png',
    'books/kidnapped/page (94).png',
    'books/kidnapped/page (95).png',
    'books/kidnapped/page (96).png',
    'books/kidnapped/page (97).png',
    'books/kidnapped/page (98).png',
    'books/kidnapped/page (99).png',
    'books/kidnapped/page (100).png',
    'books/kidnapped/page (101).png',
    'books/kidnapped/page (102).png',
    'books/kidnapped/page (103).png',
    'books/kidnapped/page (104).png',
    'books/kidnapped/page (105).png',
    'books/kidnapped/page (106).png',
    'books/kidnapped/page (107).png',
    'books/kidnapped/page (108).png',
    'books/kidnapped/page (109).png',
    'books/kidnapped/page (110).png',
    'books/kidnapped/page (111).png',
    'books/kidnapped/page (112).png',
    'books/kidnapped/page (113).png',
    'books/kidnapped/page (114).png',
    'books/kidnapped/page (115).png',
    'books/kidnapped/page (116).png',
    'books/kidnapped/page (117).png',
    'books/kidnapped/page (118).png',
    'books/kidnapped/page (119).png',
    'books/kidnapped/page (120).png',
    'books/kidnapped/page (121).png',
    'books/kidnapped/page (122).png',
    'books/kidnapped/page (123).png',
    'books/kidnapped/page (124).png',
    'books/kidnapped/page (125).png',
    'books/kidnapped/page (126).png',
    'books/kidnapped/page (127).png',
    'books/kidnapped/page (128).png',
    'books/kidnapped/page (129).png',
    'books/kidnapped/page (130).png',
    'books/kidnapped/page (131).png',
    'books/kidnapped/page (132).png',
    'books/kidnapped/page (133).png',
    'books/kidnapped/page (134).png',
    'books/kidnapped/page (135).png',
    'books/kidnapped/page (136).png',
    'books/kidnapped/page (137).png',
    'books/kidnapped/page (138).png',
    'books/kidnapped/page (139).png',
    'books/kidnapped/page (140).png',
    'books/kidnapped/page (141).png',
    'books/kidnapped/page (142).png',
    'books/kidnapped/page (143).png',
    'books/kidnapped/page (144).png',
    'books/kidnapped/page (145).png',
    'books/kidnapped/page (146).png',
    'books/kidnapped/page (147).png',
    'books/kidnapped/page (148).png',
    'books/kidnapped/page (149).png',
    'books/kidnapped/page (150).png',
    'books/kidnapped/page (151).png',
    'books/kidnapped/page (152).png',
    'books/kidnapped/page (153).png',
    'books/kidnapped/page (154).png',
    'books/kidnapped/page (155).png',
    'books/kidnapped/page (156).png',
    'books/kidnapped/page (157).png',
    'books/kidnapped/page (158).png',
    'books/kidnapped/page (159).png',
    'books/kidnapped/page (160).png',
    'books/kidnapped/page (161).png',
    'books/kidnapped/page (162).png',
    'books/kidnapped/page (163).png',

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
