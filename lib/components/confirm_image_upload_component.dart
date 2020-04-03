import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/painting.dart';
import 'package:prm_project/models/task.dart';
import 'package:prm_project/models/user.dart';

class ConfirmImageUploadComponent extends StatefulWidget {
  final String location;
  final Task _task;

  @override
  ConfirmImageUploadComponent(this.location, this._task);

  _ConfirmImageUploadComponentState createState() =>
      _ConfirmImageUploadComponentState();
}

class _ConfirmImageUploadComponentState
    extends State<ConfirmImageUploadComponent> {
  var _image, _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 0, 10.0, 10.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _image == null
                  ? RaisedButton(
                      child: Text('Upload Confirmation',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => chooseFile(),
                      color: Colors.purple,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0))
                  : Container(),
              _image != null
                  ? RaisedButton(
                      child: Text('Update',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => chooseFile(),
                      color: Colors.purple,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0))
                  : Container(),
              _image != null
                  ? RaisedButton(
                      child: Text('Delete',
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
    uploadFile(widget.location);
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
        widget._task.imageUrl = _uploadedFileURL;
      });
    });
  }

  Future deleteFile() async {
    setState(() {
      _image = null;
    });
  }
}
