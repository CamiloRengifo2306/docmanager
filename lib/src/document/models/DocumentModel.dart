import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:docmanager/src/document/entities/DocumentDTO.dart';
import 'package:docmanager/src/utils/structure_html.dart';

class DocumentModel extends ChangeNotifier {
  
  static const JSON_PATH = 'assets/data/pages.json';
  
  String _html = '';
  int currentIndex = 0;
  List<DocumentDTO> documents = new List();

  DocumentModel(){
    loadModalDocuments();
  }

  String get htmlText => _html;

  /// Load the initial data from data store.
  void loadModalDocuments() async {

    final jsonString = await _getJsonFileToString();    
    Map parsedJson = jsonDecode( jsonString );
    List parsed = parsedJson['documents'];
    documents = parsed.map(
      ( json ) => new DocumentDTO.fromJson( json )
    ).toList();

    getCurrentDocument();
  }

  /// Return the data string from a local file.
  Future<String> _getJsonFileToString() async {
    return await rootBundle.loadString( JSON_PATH );
  }

  /// Update the current Html to show.
  void _updateHtmlSelected() {
    _html = htmlHead + documents[ currentIndex ].rbf + htmlFoot;
  }
  
  /// Return the initial document to show.
  void getCurrentDocument() {
    if( documents != null && documents.length >= 0 ){
      _updateHtmlSelected();
    }
  }

  /// Button action to go next page.
  void onNextDocument() {
    if( currentIndex == documents.length -1 ){
      return;
    }
    currentIndex = currentIndex + 1;
    _updateHtmlSelected();
    notifyListeners();
  }

  /// Button action to go previous page.
  void onPreviusDocument() {
    if( currentIndex == 0 ){
      return;
    }
    currentIndex = currentIndex - 1;
    notifyListeners();
  }

  /// Button action to go more previous page.
  void onReDocument() {
    if( currentIndex == 0 ){
      return;
    }
    currentIndex = currentIndex - 5;
    if( currentIndex < 0){
      currentIndex = 0;
    }
    _updateHtmlSelected();
    notifyListeners();
  }

  /// Button action to go more next page.
  void onAvDocument() {
    if( currentIndex == documents.length ){
      return;
    }
    currentIndex = currentIndex + 5;
    if( currentIndex > documents.length - 1){
      currentIndex = documents.length - 1;
    }
    _updateHtmlSelected();
    notifyListeners();
  }
}