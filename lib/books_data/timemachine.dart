import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class timemachine extends StatefulWidget {
  const timemachine({Key? key}) : super(key: key);

  @override
  State<timemachine> createState() => _timemachineState();
}

class _timemachineState extends State<timemachine> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/time machine/page (1).png',
    'books/time machine/page (2).png',
    'books/time machine/page (3).png',
    'books/time machine/page (4).png',
    'books/time machine/page (5).png',
    'books/time machine/page (6).png',
    'books/time machine/page (7).png',
    'books/time machine/page (8).png',
    'books/time machine/page (9).png',
    'books/time machine/page (10).png',
    'books/time machine/page (11).png',
    'books/time machine/page (12).png',
    'books/time machine/page (13).png',
    'books/time machine/page (14).png',
    'books/time machine/page (15).png',
    'books/time machine/page (16).png',
    'books/time machine/page (17).png',
    'books/time machine/page (18).png',
    'books/time machine/page (19).png',
    'books/time machine/page (20).png',
    'books/time machine/page (21).png',
    'books/time machine/page (22).png',
    'books/time machine/page (23).png',
    'books/time machine/page (24).png',
    'books/time machine/page (25).png',
    'books/time machine/page (26).png',
    'books/time machine/page (27).png',
    'books/time machine/page (28).png',
    'books/time machine/page (29).png',
    'books/time machine/page (30).png',
    'books/time machine/page (31).png',
    'books/time machine/page (32).png',
    'books/time machine/page (33).png',
    'books/time machine/page (34).png',
    'books/time machine/page (35).png',
    'books/time machine/page (36).png',
    'books/time machine/page (37).png',
    'books/time machine/page (38).png',
    'books/time machine/page (39).png',
    'books/time machine/page (40).png',
    'books/time machine/page (41).png',
    'books/time machine/page (42).png',
    'books/time machine/page (43).png',
    'books/time machine/page (44).png',
    'books/time machine/page (45).png',
    'books/time machine/page (46).png',
    'books/time machine/page (47).png',
    'books/time machine/page (48).png',
    'books/time machine/page (49).png',
    'books/time machine/page (50).png',
    'books/time machine/page (51).png',
    'books/time machine/page (52).png',
    'books/time machine/page (53).png',
    'books/time machine/page (54).png',
    'books/time machine/page (55).png',
    'books/time machine/page (56).png',
    'books/time machine/page (57).png',
    'books/time machine/page (58).png',
    'books/time machine/page (59).png',
    'books/time machine/page (60).png',
    'books/time machine/page (61).png',
    'books/time machine/page (62).png',
    'books/time machine/page (63).png',
    'books/time machine/page (64).png',
    'books/time machine/page (65).png',

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
