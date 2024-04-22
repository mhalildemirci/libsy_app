import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class dialoguesconcerning extends StatefulWidget {
  const dialoguesconcerning({Key? key}) : super(key: key);

  @override
  State<dialoguesconcerning> createState() => _dialoguesconcerningState();
}

class _dialoguesconcerningState extends State<dialoguesconcerning> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/dialogues concerning/page (1).png',
    'books/dialogues concerning/page (2).png',
    'books/dialogues concerning/page (3).png',
    'books/dialogues concerning/page (4).png',
    'books/dialogues concerning/page (5).png',
    'books/dialogues concerning/page (6).png',
    'books/dialogues concerning/page (7).png',
    'books/dialogues concerning/page (8).png',
    'books/dialogues concerning/page (9).png',
    'books/dialogues concerning/page (10).png',
    'books/dialogues concerning/page (11).png',
    'books/dialogues concerning/page (12).png',
    'books/dialogues concerning/page (13).png',
    'books/dialogues concerning/page (14).png',
    'books/dialogues concerning/page (15).png',
    'books/dialogues concerning/page (16).png',
    'books/dialogues concerning/page (17).png',
    'books/dialogues concerning/page (18).png',
    'books/dialogues concerning/page (19).png',
    'books/dialogues concerning/page (20).png',
    'books/dialogues concerning/page (21).png',
    'books/dialogues concerning/page (22).png',
    'books/dialogues concerning/page (23).png',
    'books/dialogues concerning/page (24).png',
    'books/dialogues concerning/page (25).png',
    'books/dialogues concerning/page (26).png',
    'books/dialogues concerning/page (27).png',
    'books/dialogues concerning/page (28).png',
    'books/dialogues concerning/page (29).png',
    'books/dialogues concerning/page (30).png',
    'books/dialogues concerning/page (31).png',
    'books/dialogues concerning/page (32).png',
    'books/dialogues concerning/page (33).png',
    'books/dialogues concerning/page (34).png',
    'books/dialogues concerning/page (35).png',
    'books/dialogues concerning/page (36).png',
    'books/dialogues concerning/page (37).png',
    'books/dialogues concerning/page (38).png',
    'books/dialogues concerning/page (39).png',
    'books/dialogues concerning/page (40).png',
    'books/dialogues concerning/page (41).png',
    'books/dialogues concerning/page (42).png',
    'books/dialogues concerning/page (43).png',
    'books/dialogues concerning/page (44).png',
    'books/dialogues concerning/page (45).png',
    'books/dialogues concerning/page (46).png',
    'books/dialogues concerning/page (47).png',
    'books/dialogues concerning/page (48).png',
    'books/dialogues concerning/page (49).png',
    'books/dialogues concerning/page (50).png',
    'books/dialogues concerning/page (51).png',
    'books/dialogues concerning/page (52).png',
    'books/dialogues concerning/page (53).png',
    'books/dialogues concerning/page (54).png',
    'books/dialogues concerning/page (55).png',
    'books/dialogues concerning/page (56).png',
    'books/dialogues concerning/page (57).png',
    'books/dialogues concerning/page (58).png',
    'books/dialogues concerning/page (59).png',
    'books/dialogues concerning/page (60).png',
    'books/dialogues concerning/page (61).png',
    'books/dialogues concerning/page (62).png',
    'books/dialogues concerning/page (63).png',
    'books/dialogues concerning/page (64).png',
    'books/dialogues concerning/page (65).png',
    'books/dialogues concerning/page (66).png',
    'books/dialogues concerning/page (67).png',
    'books/dialogues concerning/page (68).png',
    'books/dialogues concerning/page (69).png',
    'books/dialogues concerning/page (70).png',
    'books/dialogues concerning/page (71).png',
    'books/dialogues concerning/page (72).png',
    'books/dialogues concerning/page (73).png',
    'books/dialogues concerning/page (74).png',
    'books/dialogues concerning/page (75).png',
    'books/dialogues concerning/page (76).png',
    'books/dialogues concerning/page (77).png',
    'books/dialogues concerning/page (78).png',
    'books/dialogues concerning/page (79).png',
    'books/dialogues concerning/page (80).png',
    'books/dialogues concerning/page (81).png',
    'books/dialogues concerning/page (82).png',
    'books/dialogues concerning/page (83).png',
    'books/dialogues concerning/page (84).png',
    'books/dialogues concerning/page (85).png',
    'books/dialogues concerning/page (86).png',
    'books/dialogues concerning/page (87).png',
    'books/dialogues concerning/page (88).png',
    'books/dialogues concerning/page (89).png',
    'books/dialogues concerning/page (90).png',
    'books/dialogues concerning/page (91).png',
    'books/dialogues concerning/page (92).png',

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
