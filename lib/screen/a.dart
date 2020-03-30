import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:image_pickers/CropConfig.dart';
import 'package:image_pickers/Media.dart';
import 'package:image_pickers/UIConfig.dart';
import 'package:learnflutter/service/userInfoService.dart';

class MyHomePage extends StatefulWidget {
  String imageFile;
  UserInfo userInfo;
  MyHomePage({this.imageFile,this.userInfo});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;

  String _retrieveDataError;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    try {
      _imageFile = await ImagePicker.pickImage(source: source);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
    }
  }

  List<Media> _listImagePaths = List();

  String dataImagePath = "";
  GalleryMode _galleryMode = GalleryMode.image;

//  Future<void> selectImages() async {
//
//      _galleryMode = GalleryMode.image;
//      _listImagePaths = await ImagePickers.pickerPaths(
//        galleryMode: _galleryMode,
//        selectCount: 8,
//        showCamera: true,
//        cropConfig :CropConfig(enableCrop: true,height: 1,width: 1),
//        compressSize: 500,
//        uiConfig: UIConfig(uiThemeColor:Theme.of(context).primaryColor),
//      );
//      _listImagePaths.forEach((media){
//        print(media.path.toString());
//      });
//      setState(() {
//
//      });
//
//  }
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(35.0)),
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo),
                      title: new Text('Set New Avatar From Gallery'),
                      onTap: () {
                        _onImageButtonPressed(ImageSource.gallery,
                            context: context);
                        Navigator.pop(context);
                        //selectImages();
                      }),
                  new ListTile(
                      leading: new Icon(Icons.photo),
                      title: new Text('Take Picture'),
                      onTap: () {
                        _onImageButtonPressed(ImageSource.camera,
                            context: context);
                      }),
                  new ListTile(
                    leading: new Icon(Icons.save_alt),
                    title: new Text('Save Current Picture'),
                    onTap: () {
                      ImagePickers.saveImageToGallery(
                          _imageFile == null ? widget.imageFile : _imageFile);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void save() {
    showModalBottomSheet(
        context: context,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(35.0)),
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.save_alt),
                    title: new Text('Save Current Picture'),
                    onTap: () {
                      ImagePickers.saveImageToGallery(
                          _imageFile == null ? widget.imageFile : _imageFile);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Widget _previewImage() {
    final Text retrieveError = _getRetrieveErrorWidget();

    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 1.0,),
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Image.file(
                      _imageFile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(

                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)),
                  child: CircleAvatar(
                    radius: 150.0,
                    foregroundColor: Colors.white,
                    //backgroundImage: Image.file(_imageFile).image,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async{
              await widget.userInfo.setUserAvatar(_imageFile);
              Navigator.of(context).pop();
              },
              child: Container(

                width: MediaQuery.of(context).size.width,

                alignment: Alignment.center,
                height: 50.0,
                color: Theme.of(context).primaryColor,
                child: Text("Use This Picture As Avatar",style: TextStyle(
                    fontWeight: FontWeight.w700,color: Colors.white,fontSize: 23.0
                ),),
              ),
            ),
          ],
        ),
      );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return GestureDetector(
        onLongPress: () {
          save();
        },
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.8,
              child: Image(
                image: NetworkImage(widget.imageFile),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: CircleAvatar(
                radius: 150.0,
                backgroundImage: NetworkImage(widget.imageFile),
              ),
            )
          ],
        ),
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      isVideo = false;
      setState(() {
        _imageFile = response.file;
      });
    } else {
      _retrieveDataError = response.exception.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Avatar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              _settingModalBottomSheet(context);
            },
          )
        ],
      ),
      body:
//      SingleChildScrollView(
//
//          physics: BouncingScrollPhysics(),
//          child: Column(
//              children: <Widget>[
//                RaisedButton(
//                  child: Text('a'),
//                  onPressed: (){selectImages();},
//                ),
//          GridView.builder(
//          physics: NeverScrollableScrollPhysics(),
//          itemCount: _listImagePaths == null ? 0 : _listImagePaths.length,
//          shrinkWrap: true,
//          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//              crossAxisCount: 3,
//              mainAxisSpacing: 20.0,
//              crossAxisSpacing: 10.0,
//              childAspectRatio: 1.0),
//          itemBuilder: (BuildContext context, int index) {
//            return GestureDetector(
//              onTap: (){
////                        ImagePickers.previewImage(_listImagePaths[index].path);
//
////                      List<String> paths = [];
////                        _listImagePaths.forEach((media){
////                          paths.add(media.path);
////                        });
////
////                        ImagePickers.previewImages(paths,index);
//
//                ImagePickers.previewImagesByMedia(_listImagePaths,index);
//              },
//              child: Image.file(
//                File(
//                  _listImagePaths[index].path,
//                ),
//                fit: BoxFit.cover,
//              ),
//            );
//          }),]))
//
//

          Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xffdefcfc),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Platform.isAndroid
                  ? FutureBuilder<void>(
                      future: retrieveLostData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<void> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return CircleAvatar(
                              backgroundImage: AssetImage('assets/male1.jpg'),
                            );
                          case ConnectionState.done:
                            return _previewImage();
                          default:
                            if (snapshot.hasError) {
                              return Text(
                                'Pick image/video error: ${snapshot.error}}',
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return const Text(
                                'You have not yet picked an image.',
                                textAlign: TextAlign.center,
                              );
                            }
                        }
                      },
                    )
                  : (_previewImage())
            ],
          ),
        ),
      ),
    );
  }

  Text _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }
}

typedef void OnPickImageCallback(
    double maxWidth, double maxHeight, int quality);
