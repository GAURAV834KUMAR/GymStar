import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Playing = prefs.getBool('ff_Playing') ?? _Playing;
    });
    _safeInit(() {
      _Gender = prefs.getString('ff_Gender') ?? _Gender;
    });
    _safeInit(() {
      _clicked = prefs.getBool('ff_clicked') ?? _clicked;
    });
    _safeInit(() {
      _friends = prefs.getBool('ff_friends') ?? _friends;
    });
    _safeInit(() {
      _Storyuid = prefs
              .getStringList('ff_Storyuid')
              ?.map((path) => path.ref)
              .toList() ??
          _Storyuid;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showCommentField = false;
  bool get showCommentField => _showCommentField;
  set showCommentField(bool value) {
    _showCommentField = value;
  }

  List<DocumentReference> _emptyList = [];
  List<DocumentReference> get emptyList => _emptyList;
  set emptyList(List<DocumentReference> value) {
    _emptyList = value;
  }

  void addToEmptyList(DocumentReference value) {
    _emptyList.add(value);
  }

  void removeFromEmptyList(DocumentReference value) {
    _emptyList.remove(value);
  }

  void removeAtIndexFromEmptyList(int index) {
    _emptyList.removeAt(index);
  }

  void updateEmptyListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _emptyList[index] = updateFn(_emptyList[index]);
  }

  void insertAtIndexInEmptyList(int index, DocumentReference value) {
    _emptyList.insert(index, value);
  }

  String _uploadPhoto = '';
  String get uploadPhoto => _uploadPhoto;
  set uploadPhoto(String value) {
    _uploadPhoto = value;
  }

  String _calltoactiontext = '';
  String get calltoactiontext => _calltoactiontext;
  set calltoactiontext(String value) {
    _calltoactiontext = value;
  }

  String _calltoactionurl = '';
  String get calltoactionurl => _calltoactionurl;
  set calltoactionurl(String value) {
    _calltoactionurl = value;
  }

  bool _calltoactionenabled = false;
  bool get calltoactionenabled => _calltoactionenabled;
  set calltoactionenabled(bool value) {
    _calltoactionenabled = value;
  }

  String _location = '';
  String get location => _location;
  set location(String value) {
    _location = value;
  }

  String _signupEmail = '';
  String get signupEmail => _signupEmail;
  set signupEmail(String value) {
    _signupEmail = value;
  }

  String _signupName = '';
  String get signupName => _signupName;
  set signupName(String value) {
    _signupName = value;
  }

  String _signupPassword = '';
  String get signupPassword => _signupPassword;
  set signupPassword(String value) {
    _signupPassword = value;
  }

  DateTime? _signupBirthday = DateTime.fromMillisecondsSinceEpoch(946746000000);
  DateTime? get signupBirthday => _signupBirthday;
  set signupBirthday(DateTime? value) {
    _signupBirthday = value;
  }

  String _signupUsername = '';
  String get signupUsername => _signupUsername;
  set signupUsername(String value) {
    _signupUsername = value;
  }

  List<DocumentReference> _taggedUsers = [];
  List<DocumentReference> get taggedUsers => _taggedUsers;
  set taggedUsers(List<DocumentReference> value) {
    _taggedUsers = value;
  }

  void addToTaggedUsers(DocumentReference value) {
    _taggedUsers.add(value);
  }

  void removeFromTaggedUsers(DocumentReference value) {
    _taggedUsers.remove(value);
  }

  void removeAtIndexFromTaggedUsers(int index) {
    _taggedUsers.removeAt(index);
  }

  void updateTaggedUsersAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _taggedUsers[index] = updateFn(_taggedUsers[index]);
  }

  void insertAtIndexInTaggedUsers(int index, DocumentReference value) {
    _taggedUsers.insert(index, value);
  }

  bool _showRecentSearch = true;
  bool get showRecentSearch => _showRecentSearch;
  set showRecentSearch(bool value) {
    _showRecentSearch = value;
  }

  String _imageLabels = '';
  String get imageLabels => _imageLabels;
  set imageLabels(String value) {
    _imageLabels = value;
  }

  String _currentSearch = '';
  String get currentSearch => _currentSearch;
  set currentSearch(String value) {
    _currentSearch = value;
  }

  bool _imageSearchDummyToggle = false;
  bool get imageSearchDummyToggle => _imageSearchDummyToggle;
  set imageSearchDummyToggle(bool value) {
    _imageSearchDummyToggle = value;
  }

  String _tempProfilePic = '';
  String get tempProfilePic => _tempProfilePic;
  set tempProfilePic(String value) {
    _tempProfilePic = value;
  }

  List<DocumentReference> _tempUserList = [];
  List<DocumentReference> get tempUserList => _tempUserList;
  set tempUserList(List<DocumentReference> value) {
    _tempUserList = value;
  }

  void addToTempUserList(DocumentReference value) {
    _tempUserList.add(value);
  }

  void removeFromTempUserList(DocumentReference value) {
    _tempUserList.remove(value);
  }

  void removeAtIndexFromTempUserList(int index) {
    _tempUserList.removeAt(index);
  }

  void updateTempUserListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _tempUserList[index] = updateFn(_tempUserList[index]);
  }

  void insertAtIndexInTempUserList(int index, DocumentReference value) {
    _tempUserList.insert(index, value);
  }

  DocumentReference? _tempUserRecord;
  DocumentReference? get tempUserRecord => _tempUserRecord;
  set tempUserRecord(DocumentReference? value) {
    _tempUserRecord = value;
  }

  bool _Playing = true;
  bool get Playing => _Playing;
  set Playing(bool value) {
    _Playing = value;
    prefs.setBool('ff_Playing', value);
  }

  String _Gender = 'Male';
  String get Gender => _Gender;
  set Gender(String value) {
    _Gender = value;
    prefs.setString('ff_Gender', value);
  }

  bool _clicked = true;
  bool get clicked => _clicked;
  set clicked(bool value) {
    _clicked = value;
    prefs.setBool('ff_clicked', value);
  }

  bool _friends = false;
  bool get friends => _friends;
  set friends(bool value) {
    _friends = value;
    prefs.setBool('ff_friends', value);
  }

  List<DocumentReference> _Storyuid = [
    FirebaseFirestore.instance.doc('/users/T2FJdNDugYWfWe61MxEjOoUcK1o1'),
    FirebaseFirestore.instance.doc('/users/YxopFJajqKVwvqX0QguIsCnVy1g2'),
    FirebaseFirestore.instance.doc('/users/KuBy0hBG3pNNp5md4ZvcDuYxSLC2'),
    FirebaseFirestore.instance.doc('/users/h4xVyAtmRmS0BQswbCWnlxJRpzZ2')
  ];
  List<DocumentReference> get Storyuid => _Storyuid;
  set Storyuid(List<DocumentReference> value) {
    _Storyuid = value;
    prefs.setStringList('ff_Storyuid', value.map((x) => x.path).toList());
  }

  void addToStoryuid(DocumentReference value) {
    _Storyuid.add(value);
    prefs.setStringList('ff_Storyuid', _Storyuid.map((x) => x.path).toList());
  }

  void removeFromStoryuid(DocumentReference value) {
    _Storyuid.remove(value);
    prefs.setStringList('ff_Storyuid', _Storyuid.map((x) => x.path).toList());
  }

  void removeAtIndexFromStoryuid(int index) {
    _Storyuid.removeAt(index);
    prefs.setStringList('ff_Storyuid', _Storyuid.map((x) => x.path).toList());
  }

  void updateStoryuidAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _Storyuid[index] = updateFn(_Storyuid[index]);
    prefs.setStringList('ff_Storyuid', _Storyuid.map((x) => x.path).toList());
  }

  void insertAtIndexInStoryuid(int index, DocumentReference value) {
    _Storyuid.insert(index, value);
    prefs.setStringList('ff_Storyuid', _Storyuid.map((x) => x.path).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
