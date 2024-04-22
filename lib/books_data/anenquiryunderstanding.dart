import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final _controller = GlobalKey<PageFlipWidgetState>();

class anenquiryunderstanding extends StatefulWidget {
  const anenquiryunderstanding({Key? key}) : super(key: key);

  @override
  State<anenquiryunderstanding> createState() => _anenquiryunderstandingState();
}

class _anenquiryunderstandingState extends State<anenquiryunderstanding> {
  final _controller = GlobalKey<PageFlipWidgetState>();

  // sharedPreferences to store lastLeftOverPage Index
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // last left over page index
  int lastLeftOverPageIndex = 0;

  // SharedPreference key to retrieve the  value of lastLeftOverPageIndex
  String lastLeftOverPageNoPrefKey = "_lastLeftOverPageNoPrefKey";

  final List<String> imagesPath = [
    'books/an enquiry understanding/page (1).png',
    'books/an enquiry understanding/page (2).png',
    'books/an enquiry understanding/page (3).png',
    'books/an enquiry understanding/page (4).png',
    'books/an enquiry understanding/page (5).png',
    'books/an enquiry understanding/page (6).png',
    'books/an enquiry understanding/page (7).png',
    'books/an enquiry understanding/page (8).png',
    'books/an enquiry understanding/page (9).png',
    'books/an enquiry understanding/page (10).png',
    'books/an enquiry understanding/page (11).png',
    'books/an enquiry understanding/page (12).png',
    'books/an enquiry understanding/page (13).png',
    'books/an enquiry understanding/page (14).png',
    'books/an enquiry understanding/page (15).png',
    'books/an enquiry understanding/page (16).png',
    'books/an enquiry understanding/page (17).png',
    'books/an enquiry understanding/page (18).png',
    'books/an enquiry understanding/page (19).png',
    'books/an enquiry understanding/page (20).png',
    'books/an enquiry understanding/page (21).png',
    'books/an enquiry understanding/page (22).png',
    'books/an enquiry understanding/page (23).png',
    'books/an enquiry understanding/page (24).png',
    'books/an enquiry understanding/page (25).png',
    'books/an enquiry understanding/page (26).png',
    'books/an enquiry understanding/page (27).png',
    'books/an enquiry understanding/page (28).png',
    'books/an enquiry understanding/page (29).png',
    'books/an enquiry understanding/page (30).png',
    'books/an enquiry understanding/page (31).png',
    'books/an enquiry understanding/page (32).png',
    'books/an enquiry understanding/page (33).png',
    'books/an enquiry understanding/page (34).png',
    'books/an enquiry understanding/page (35).png',
    'books/an enquiry understanding/page (36).png',
    'books/an enquiry understanding/page (37).png',
    'books/an enquiry understanding/page (38).png',
    'books/an enquiry understanding/page (39).png',
    'books/an enquiry understanding/page (40).png',
    'books/an enquiry understanding/page (41).png',
    'books/an enquiry understanding/page (42).png',
    'books/an enquiry understanding/page (43).png',
    'books/an enquiry understanding/page (44).png',
    'books/an enquiry understanding/page (45).png',
    'books/an enquiry understanding/page (46).png',
    'books/an enquiry understanding/page (47).png',
    'books/an enquiry understanding/page (48).png',
    'books/an enquiry understanding/page (49).png',
    'books/an enquiry understanding/page (50).png',
    'books/an enquiry understanding/page (51).png',
    'books/an enquiry understanding/page (52).png',
    'books/an enquiry understanding/page (53).png',
    'books/an enquiry understanding/page (54).png',
    'books/an enquiry understanding/page (55).png',
    'books/an enquiry understanding/page (56).png',
    'books/an enquiry understanding/page (57).png',
    'books/an enquiry understanding/page (58).png',
    'books/an enquiry understanding/page (59).png',
    'books/an enquiry understanding/page (60).png',
    'books/an enquiry understanding/page (61).png',
    'books/an enquiry understanding/page (62).png',
    'books/an enquiry understanding/page (63).png',
    'books/an enquiry understanding/page (64).png',
    'books/an enquiry understanding/page (65).png',
    'books/an enquiry understanding/page (66).png',
    'books/an enquiry understanding/page (67).png',
    'books/an enquiry understanding/page (68).png',
    'books/an enquiry understanding/page (69).png',
    'books/an enquiry understanding/page (70).png',
    'books/an enquiry understanding/page (71).png',
    'books/an enquiry understanding/page (72).png',
    'books/an enquiry understanding/page (73).png',
    'books/an enquiry understanding/page (74).png',
    'books/an enquiry understanding/page (75).png',
    'books/an enquiry understanding/page (76).png',
    'books/an enquiry understanding/page (77).png',
    'books/an enquiry understanding/page (78).png',
    'books/an enquiry understanding/page (79).png',
    'books/an enquiry understanding/page (80).png',
    'books/an enquiry understanding/page (81).png',
    'books/an enquiry understanding/page (82).png',
    'books/an enquiry understanding/page (83).png',
    'books/an enquiry understanding/page (84).png',
    'books/an enquiry understanding/page (85).png',
    'books/an enquiry understanding/page (86).png',
    'books/an enquiry understanding/page (87).png',
    'books/an enquiry understanding/page (88).png',
    'books/an enquiry understanding/page (89).png',
    'books/an enquiry understanding/page (90).png',
    'books/an enquiry understanding/page (91).png',
    'books/an enquiry understanding/page (92).png',
    'books/an enquiry understanding/page (93).png',
    'books/an enquiry understanding/page (94).png',
    'books/an enquiry understanding/page (95).png',
    'books/an enquiry understanding/page (96).png',
    'books/an enquiry understanding/page (97).png',
    'books/an enquiry understanding/page (98).png',
    'books/an enquiry understanding/page (99).png',
    'books/an enquiry understanding/page (100).png',
    'books/an enquiry understanding/page (101).png',
    'books/an enquiry understanding/page (102).png',
    'books/an enquiry understanding/page (103).png',
    'books/an enquiry understanding/page (104).png',
    'books/an enquiry understanding/page (105).png',
    'books/an enquiry understanding/page (106).png',
    'books/an enquiry understanding/page (107).png',
    'books/an enquiry understanding/page (108).png',
    'books/an enquiry understanding/page (109).png',
    'books/an enquiry understanding/page (110).png',
    'books/an enquiry understanding/page (111).png',
    'books/an enquiry understanding/page (112).png',
    'books/an enquiry understanding/page (113).png',
    'books/an enquiry understanding/page (114).png',
    'books/an enquiry understanding/page (115).png',
    'books/an enquiry understanding/page (116).png',
    'books/an enquiry understanding/page (117).png',
    'books/an enquiry understanding/page (118).png',
    'books/an enquiry understanding/page (119).png',
    'books/an enquiry understanding/page (120).png',
    'books/an enquiry understanding/page (121).png',
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
