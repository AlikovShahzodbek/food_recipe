import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/Theme/text_filed_theme.dart';

class AddRecipeYoutubeVideo extends StatefulWidget {
  const AddRecipeYoutubeVideo({super.key, required this.onSelectedVideo});
  final Function(String url) onSelectedVideo;

  @override
  State<AddRecipeYoutubeVideo> createState() => _AddRecipeYoutubeVideoState();
}

class _AddRecipeYoutubeVideoState extends State<AddRecipeYoutubeVideo> {
  final borderOPtions = RectDottedBorderOptions(
    color: AppColors().grey3,
    strokeWidth: 2,
    dashPattern: [6, 4],
  );

  String? _youtubeUrl;

  void _enterYoutubeLink() async {
    final controller = TextEditingController(text: _youtubeUrl ?? '');

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter YouTube Link'),
        content: TextField(
          controller: controller,
          decoration: TextFiledTheme().textFiledTheme.copyWith(
            hintText: 'https://youtube.com/...',
            hintStyle: TextStyle(color: AppColors().grey3),
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors().warning1),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: AppColors().white)),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors().primary100),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            onPressed: () {
              final input = controller.text.trim();
              Navigator.pop(context, input);
            },
            child: Text('Save', style: TextStyle(color: AppColors().white)),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _youtubeUrl = result;
      });
      widget.onSelectedVideo(_youtubeUrl!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => _enterYoutubeLink(),
        child: DottedBorder(
          options: borderOPtions,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: _youtubeUrl == null
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.play_circle_outlined,
                          size: 50,
                          color: AppColors().grey3,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Insert a link to the video",
                          style: TextStyle(
                            color: AppColors().grey3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.ondemand_video,
                          size: 50,
                          color: AppColors().primary100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Video added",
                          style: TextStyle(
                            color: AppColors().primary100,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
