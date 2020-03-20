import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_html_view/flutter_native_html_view.dart';
import 'package:docmanager/src/utils/strings_app.dart';
import 'package:docmanager/src/utils/colors_app.dart';
import 'package:docmanager/src/utils/locations.dart';
import 'package:docmanager/src/document/models/DocumentModel.dart';

class SearchWebView extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {

    final widthPage = MediaQuery.of( context ).size.width;
    final heightPage = MediaQuery.of( context ).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorsApp.secondaryColor
        ),
        elevation: 0.0
      ),
      drawer: _getDrawerMenu( context ),
      body: Column(
          children: <Widget>[
            _getSearchMenu( widthPage, heightPage, context ),
            _HtmlView(),
          ]
      ),
      bottomNavigationBar: Container(
        height: heightPage * 0.06,
        padding: EdgeInsets.symmetric( vertical: 0.1 ),
        child : _getBottomAppBar()
      )
    );
  }

  /// Setup the drawer and options menu.
  Widget _getDrawerMenu( BuildContext context ) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorsApp.primaryColor
              ),
              child: Text(
                StringsApp.app_name,
                style: TextStyle(
                  color: ColorsApp.secondaryColor,
                  fontSize: 24
                ),
              ),
            ),
            ListTile(
              leading : Icon( Icons.person_pin ),
              title : Text( StringsApp.login_app_bar ),
              onTap: () => Navigator.pushNamed( context, Location.login )
            ),
            ListTile( 
              leading : Icon( Icons.search ), 
              title : Text( StringsApp.search_app_bar ),
              onTap: () => Navigator.pushNamed( context, Location.web )
            ),
            ListTile(
              leading : Icon( Icons.person_add ),
              title : Text( StringsApp.register_app_bar ),
              onTap: () => Navigator.pushNamed( context, Location.register )
            ),
            ListTile(
              leading: Icon( Icons.settings ),
              title: Text( StringsApp.search_settings ),
            )
          ],
        ),
      );
  }

  /// Return the widgets to search funciontality.
  Widget _getSearchMenu( double width, double height, BuildContext context ) {
    return Container(
            width: width * 1.0,
            height: height * 0.20,
            decoration: BoxDecoration(
              color: ColorsApp.primaryColor
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text( 
                            'Idioma',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorsApp.secondaryColor
                            )
                          ),
                          SizedBox( height: height * 0.01 ),
                          _getDropdown(
                            <String>[ 'Ingles','Español','Aleman' ],
                            'Español',
                            height * 0.20
                          )
                        ]
                      ),
                    ),
                    SizedBox( width: width * 0.06 ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text( 
                            StringsApp.search_two_drop,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorsApp.secondaryColor
                            )
                          ),
                          SizedBox( height: height * 0.01 ),
                          _getDropdown(
                            <String>[ '12','13','14' ],
                            '14',
                            height * 0.10
                          )
                        ]
                      ),
                    ),
                    SizedBox( width : width * 0.10 )
                  ],
                ),
                SizedBox( height: height * 0.025 ),
                _getSearchBar( width, height, context )
              ],
            ),
          );
  }

  /// Return Dropdown widget with data list.
  Widget _getDropdown( List<String> list, String value, double height ) {
    return Container(
      height: 30.0,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular( 6.0 )
      ),
      padding: EdgeInsets.only( 
        left: 15.0,
        right: 1.0
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        style : TextStyle(
          fontSize: 12.0,
          color: Colors.black
        ),
        underline: Container(
          color : Colors.white
        ),
        icon : Icon( Icons.arrow_drop_down ),
        items : list
        .map<DropdownMenuItem<String>>( ( String value ) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text( value ),
          );
        }).toList(),
        onChanged: ( String newValue ) {},
      )
    );
  }

  /// Return the search bar as widget.
  Widget _getSearchBar( double width, double height, BuildContext context ) {
    return Container(
        width: width * 0.8,
        height: height * 0.06,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular( 6.0 )
        ),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: StringsApp.search_label_bar,
            prefixIcon: IconButton(
              icon : Icon( Icons.search ),
              onPressed: () {},
            ),
            hintStyle: TextStyle(
              fontSize: 14
            ),
            suffixIcon: IconButton(
              icon : Icon( Icons.settings ),
              onPressed: () {
                _showFiltersBy( context, width, height );
              },
            ),
            // labelText: StringsApp.search_label_bar,
          ),
        ),
    );
  }

  /// Return options to show in dialog.
  Future _showFiltersBy( BuildContext context, double width, double height ) async{
    return await showDialog(
      context : context,
      child : SimpleDialog(
        title : Text( StringsApp.search_title_dialog ),
        titlePadding: EdgeInsets.only( left: width * 0.09, top: height * 0.04 ),
        shape : RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(8.0) )
        ),
        children : <Widget>[
          Divider(),
          _addDialogOption( 'Contenido', true ),
          _addDialogOption( 'Materia', false ),
          _addDialogOption( 'Legislacion', true ),
          _addDialogOption( 'Jurisprudencia', false ),
          _addDialogOption( 'Nacional', false ),
          _addDialogOption( 'Departamental', false ),
        ]
      )
    );
  }

  /// Customize the Dialog option with data.
  Widget _addDialogOption( String text, bool value ) {
    return RadioListTile(
        title : Text( text ),
        value : value == true ? value : false,
        onChanged: ( bool value ) {},
        groupValue : value == false ? true : true,
      
    );
  }

  /// Return the BottomAppBar with optons.
  Widget _getBottomAppBar() {
    return BottomAppBar(
        color : ColorsApp.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _FirstRowBottom(),
            _getSecondRowBottom()
          ],
        )
      );
  }

  /// Return the second row of icons to show in bottomAppBar.
  Widget _getSecondRowBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          color : ColorsApp.secondaryColor,
          icon : Icon( Icons.share ),
          onPressed: () {},
        ),
        IconButton(
          color : ColorsApp.secondaryColor,
          icon : Icon( Icons.star_border ),
          onPressed: () {},
        ),
        IconButton(
          color : ColorsApp.secondaryColor,
          icon : Icon( Icons.arrow_downward ),
          onPressed: () {},
        )
      ],
    );
  }
}

/// Return the html viewer to show data.
class _HtmlView extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return Consumer<DocumentModel>(
        builder: ( context, document, child){
          return Expanded( 
            child: FlutterNativeHtmlView( 
              htmlData: '${document.htmlText}',
              onLinkTap: (String url) {},
              onError: (String message) {
                print('Error FlutterNativeHtml: $message');
              }
            )
          );
        }
    );
  }
}

/// Return first row of icons to show in bottomAppBar.
class _FirstRowBottom extends StatelessWidget {
  
  @override
  Widget build( BuildContext context ) {
    var documentProvider = Provider.of<DocumentModel>( context );

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            color : ColorsApp.secondaryColor,
            icon : Icon( Icons.first_page ),
            onPressed : () => documentProvider.onReDocument()
          ),
          IconButton(
            color : ColorsApp.secondaryColor,
            icon: Icon( Icons.chevron_left ),
            onPressed: () => documentProvider.onPreviusDocument()
          ),
          Text(
              '${documentProvider.currentIndex + 1}/${documentProvider.documents.length}',
              style: TextStyle(
                color: ColorsApp.secondaryColor
              )
          ),
          IconButton(
            color: ColorsApp.secondaryColor,
            icon : Icon( Icons.chevron_right ),
            onPressed: () => documentProvider.onNextDocument()
          ),
          IconButton(
            color : ColorsApp.secondaryColor,
            icon : Icon( Icons.last_page ),
            onPressed: () => documentProvider.onAvDocument()
          )
        ],
      );
  }
}