import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class mrlewisham extends StatefulWidget {
  const mrlewisham({Key? key}) : super(key: key);

  @override
  State<mrlewisham> createState() => _mrlewishamState();
}

class _mrlewishamState extends State<mrlewisham> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/mr lewisham/page (1).png',
    'books/mr lewisham/page (2).png',
    'books/mr lewisham/page (3).png',
    'books/mr lewisham/page (4).png',
    'books/mr lewisham/page (5).png',
    'books/mr lewisham/page (6).png',
    'books/mr lewisham/page (7).png',
    'books/mr lewisham/page (8).png',
    'books/mr lewisham/page (9).png',
    'books/mr lewisham/page (10).png',
    'books/mr lewisham/page (11).png',
    'books/mr lewisham/page (12).png',
    'books/mr lewisham/page (13).png',
    'books/mr lewisham/page (14).png',
    'books/mr lewisham/page (15).png',
    'books/mr lewisham/page (16).png',
    'books/mr lewisham/page (17).png',
    'books/mr lewisham/page (18).png',
    'books/mr lewisham/page (19).png',
    'books/mr lewisham/page (20).png',
    'books/mr lewisham/page (21).png',
    'books/mr lewisham/page (22).png',
    'books/mr lewisham/page (23).png',
    'books/mr lewisham/page (24).png',
    'books/mr lewisham/page (25).png',
    'books/mr lewisham/page (26).png',
    'books/mr lewisham/page (27).png',
    'books/mr lewisham/page (28).png',
    'books/mr lewisham/page (29).png',
    'books/mr lewisham/page (30).png',
    'books/mr lewisham/page (31).png',
    'books/mr lewisham/page (32).png',
    'books/mr lewisham/page (33).png',
    'books/mr lewisham/page (34).png',
    'books/mr lewisham/page (35).png',
    'books/mr lewisham/page (36).png',
    'books/mr lewisham/page (37).png',
    'books/mr lewisham/page (38).png',
    'books/mr lewisham/page (39).png',
    'books/mr lewisham/page (40).png',
    'books/mr lewisham/page (41).png',
    'books/mr lewisham/page (42).png',
    'books/mr lewisham/page (43).png',
    'books/mr lewisham/page (44).png',
    'books/mr lewisham/page (45).png',
    'books/mr lewisham/page (46).png',
    'books/mr lewisham/page (47).png',
    'books/mr lewisham/page (48).png',
    'books/mr lewisham/page (49).png',
    'books/mr lewisham/page (50).png',
    'books/mr lewisham/page (51).png',
    'books/mr lewisham/page (52).png',
    'books/mr lewisham/page (53).png',
    'books/mr lewisham/page (54).png',
    'books/mr lewisham/page (55).png',
    'books/mr lewisham/page (56).png',
    'books/mr lewisham/page (57).png',
    'books/mr lewisham/page (58).png',
    'books/mr lewisham/page (59).png',
    'books/mr lewisham/page (60).png',
    'books/mr lewisham/page (61).png',
    'books/mr lewisham/page (62).png',
    'books/mr lewisham/page (63).png',
    'books/mr lewisham/page (64).png',
    'books/mr lewisham/page (65).png',
    'books/mr lewisham/page (66).png',
    'books/mr lewisham/page (67).png',
    'books/mr lewisham/page (68).png',
    'books/mr lewisham/page (69).png',
    'books/mr lewisham/page (70).png',
    'books/mr lewisham/page (71).png',
    'books/mr lewisham/page (72).png',
    'books/mr lewisham/page (73).png',
    'books/mr lewisham/page (74).png',
    'books/mr lewisham/page (75).png',
    'books/mr lewisham/page (76).png',
    'books/mr lewisham/page (77).png',
    'books/mr lewisham/page (78).png',
    'books/mr lewisham/page (79).png',
    'books/mr lewisham/page (80).png',
    'books/mr lewisham/page (81).png',
    'books/mr lewisham/page (82).png',
    'books/mr lewisham/page (83).png',
    'books/mr lewisham/page (84).png',
    'books/mr lewisham/page (85).png',
    'books/mr lewisham/page (86).png',
    'books/mr lewisham/page (87).png',
    'books/mr lewisham/page (88).png',
    'books/mr lewisham/page (89).png',
    'books/mr lewisham/page (90).png',
    'books/mr lewisham/page (91).png',
    'books/mr lewisham/page (92).png',
    'books/mr lewisham/page (93).png',
    'books/mr lewisham/page (94).png',
    'books/mr lewisham/page (95).png',
    'books/mr lewisham/page (96).png',
    'books/mr lewisham/page (97).png',
    'books/mr lewisham/page (98).png',
    'books/mr lewisham/page (99).png',
    'books/mr lewisham/page (100).png',
    'books/mr lewisham/page (101).png',
    'books/mr lewisham/page (102).png',
    'books/mr lewisham/page (103).png',
    'books/mr lewisham/page (104).png',
    'books/mr lewisham/page (105).png',
    'books/mr lewisham/page (106).png',
    'books/mr lewisham/page (107).png',
    'books/mr lewisham/page (108).png',
    'books/mr lewisham/page (109).png',
    'books/mr lewisham/page (110).png',
    'books/mr lewisham/page (111).png',
    'books/mr lewisham/page (112).png',
    'books/mr lewisham/page (113).png',
    'books/mr lewisham/page (114).png',
    'books/mr lewisham/page (115).png',
    'books/mr lewisham/page (116).png',
    'books/mr lewisham/page (117).png',
    'books/mr lewisham/page (118).png',
    'books/mr lewisham/page (119).png',
    'books/mr lewisham/page (120).png',
    'books/mr lewisham/page (121).png',
    'books/mr lewisham/page (122).png',
    'books/mr lewisham/page (123).png',
    'books/mr lewisham/page (124).png',
    'books/mr lewisham/page (125).png',
    'books/mr lewisham/page (126).png',
    'books/mr lewisham/page (127).png',
    'books/mr lewisham/page (128).png',
    'books/mr lewisham/page (129).png',
    'books/mr lewisham/page (130).png',
    'books/mr lewisham/page (131).png',
    'books/mr lewisham/page (132).png',
    'books/mr lewisham/page (133).png',
    'books/mr lewisham/page (134).png',
    'books/mr lewisham/page (135).png',
    'books/mr lewisham/page (136).png',
    'books/mr lewisham/page (137).png',
    'books/mr lewisham/page (138).png',
    'books/mr lewisham/page (139).png',
    'books/mr lewisham/page (140).png',

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
