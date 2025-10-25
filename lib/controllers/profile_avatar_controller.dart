import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatarController {
  String? _avatarPath;

  String? get avatarPath => _avatarPath;

  Future<void> saveAvatar(String path) async {
    final savePath = await SharedPreferences.getInstance();
    await savePath.setString("avatar_path", path);
  }

  Future<void> loadAvatar() async {
    final loader = await SharedPreferences.getInstance();
    _avatarPath = loader.getString("avatar_path");
  }

  Future<void> removeAvatar() async {
    _avatarPath = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("avatar_path");
  }

  Future<void> pickImage(source) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(
          ratioX: 1,
          ratioY: 1,
        ), // квадрат для аватарки
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Avatar',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: false,
            lockAspectRatio: true,
          ),
          IOSUiSettings(title: 'Crop Avatar', aspectRatioLockEnabled: true),
        ],
      );

      if (croppedFile != null) {
        await saveAvatar(croppedFile.path);
        _avatarPath = croppedFile.path;
      }
    }
  }

  Future<void> openCamera() async {
    await pickImage(ImageSource.camera);
  }

  Future<void> openGallery() async {
    await pickImage(ImageSource.gallery);
  }

  final _decoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );

  void showAvatarOptions(BuildContext context, void Function() refreshState) {
    showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.22,
        minChildSize: 0.1,
        builder: (context, ScrollController scrollController) {
          return SingleChildScrollView(
            child: Container(
              decoration: _decoration,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.camera),
                      title: Text("Take a Photo"),
                      onTap: () async {
                        Navigator.pop(context);
                        await openCamera();
                        refreshState();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.photo),
                      title: Text("Choose from Gallery"),
                      onTap: () async {
                        Navigator.pop(context);
                        await openGallery();
                        refreshState();
                      },
                    ),
                    if (_avatarPath != null) ...[
                      ListTile(
                        leading: Icon(Icons.delete),
                        title: Text("Remove Avatar"),
                        onTap: () async {
                          Navigator.pop(context);
                          await removeAvatar();
                          refreshState();
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
