import 'package:prm_project/models/post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/painting.dart';
import 'package:prm_project/models/user.dart';

class ImageUploadComponent extends StatefulWidget {
  final String location;
  final User _user;

  @override
  ImageUploadComponent(this.location, this._user);

  _ImageUploadComponentState createState() => _ImageUploadComponentState();
}

class _ImageUploadComponentState extends State<ImageUploadComponent> {
  var _image, _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _image == null
                  ? RaisedButton(
                      child: Text('Upload Avatar',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => chooseFile(),
                      color: Colors.purple,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0))
                  : Container(),
              _image != null
                  ? RaisedButton(
                      child: Text('Update Avatar',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => chooseFile(),
                      color: Colors.purple,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0))
                  : Container(),
              _image != null
                  ? RaisedButton(
                      child: Text(' Delete Avatar ',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => deleteFile(),
                      color: Colors.purple,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0))
                  : Container(),
            ],
          ),
          _image != null
              ? Image.asset(
                  _image.path,
                  height: 200,
                  width: 280,
                )
              : Container(),
        ],
      ),
    );
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
    });
  }

  Future uploadFile(String location) async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child(location + '/${Path.basename(_image.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        widget._user.avatar = _uploadedFileURL;
      });
    });
  }

  Future deleteFile() async {
    setState(() {
      _image = null;
    });
  }
}
