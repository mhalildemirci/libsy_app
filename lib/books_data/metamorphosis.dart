import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class metamorphosis extends StatefulWidget {
  const metamorphosis({Key? key}) : super(key: key);

  @override
  State<metamorphosis> createState() => _metamorphosisState();
}

class _metamorphosisState extends State<metamorphosis> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/metamorphosis/page (1).png',
    'books/metamorphosis/page (2).png',
    'books/metamorphosis/page (3).png',
    'books/metamorphosis/page (4).png',
    'books/metamorphosis/page (5).png',
    'books/metamorphosis/page (6).png',
    'books/metamorphosis/page (7).png',
    'books/metamorphosis/page (8).png',
    'books/metamorphosis/page (9).png',
    'books/metamorphosis/page (10).png',
    'books/metamorphosis/page (11).png',
    'books/metamorphosis/page (12).png',
    'books/metamorphosis/page (13).png',
    'books/metamorphosis/page (14).png',
    'books/metamorphosis/page (15).png',
    'books/metamorphosis/page (16).png',
    'books/metamorphosis/page (17).png',
    'books/metamorphosis/page (18).png',
    'books/metamorphosis/page (19).png',
    'books/metamorphosis/page (20).png',
    'books/metamorphosis/page (21).png',
    'books/metamorphosis/page (22).png',
    'books/metamorphosis/page (23).png',
    'books/metamorphosis/page (24).png',
    'books/metamorphosis/page (25).png',
    'books/metamorphosis/page (26).png',
    'books/metamorphosis/page (27).png',
    'books/metamorphosis/page (28).png',
    'books/metamorphosis/page (29).png',
    'books/metamorphosis/page (30).png',
    'books/metamorphosis/page (31).png',
    'books/metamorphosis/page (32).png',
    'books/metamorphosis/page (33).png',
    'books/metamorphosis/page (34).png',
    'books/metamorphosis/page (35).png',
    'books/metamorphosis/page (36).png',
    'books/metamorphosis/page (37).png',
    'books/metamorphosis/page (38).png',
    'books/metamorphosis/page (39).png',

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
