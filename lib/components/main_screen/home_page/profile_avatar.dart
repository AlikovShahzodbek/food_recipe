import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practick_project/controllers/profile_avatar_controller.dart';
import 'package:practick_project/Theme/colors.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  final ProfileAvatarController controller = ProfileAvatarController();

  @override
  void initState() {
    super.initState();
    controller.loadAvatar().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColors().grey4,
    );
    return GestureDetector(
      onTap: () => controller.showAvatarOptions(context, () => setState(() {})),
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 50,
        height: 50,
        decoration: decoration,
        child: controller.avatarPath == null || controller.avatarPath!.isEmpty
            ? Center(
                child: SvgPicture.asset(
                  "assets/icons/bold_icons/profile-bold.svg",
                ),
              )
            : Image.file(File(controller.avatarPath!), fit: BoxFit.cover),
      ),
    );
  }
}
