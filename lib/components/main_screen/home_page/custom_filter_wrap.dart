import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomWrap extends StatefulWidget {
  const CustomWrap({
    super.key,
    required this.selectedIndex,
    required this.item,
    required this.indexKey,
    required this.onSelected,
  });
  final List<String> item;
  final int selectedIndex;
  final String indexKey;
  final Function(String value) onSelected;

  @override
  State<CustomWrap> createState() => _CustomWrapState();
}

class _CustomWrapState extends State<CustomWrap> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(widget.item.length, (index) {
        final isSelected = selectedIndex == index;

        final contentStyle = TextStyle(
          fontSize: 15,
          color: isSelected ? AppColors().white : AppColors().primary100,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        );

        final contentDecoration = BoxDecoration(
          color: isSelected ? AppColors().primary100 : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isSelected
              ? null
              : Border.all(color: AppColors().primary100, width: 1),
        );

        final starIcon = SvgPicture.asset(
          'assets/icons/bold_icons/star-bold.svg',
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(
            isSelected ? AppColors().white : AppColors().primary80,
            BlendMode.srcIn,
          ),
        );

        return GestureDetector(
          onTap: () async {
            final saveIndex = await SharedPreferences.getInstance();
            await saveIndex.setInt(widget.indexKey, index);
            setState(() {
              selectedIndex = index;
              widget.onSelected(widget.item[index]);
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 10, bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: contentDecoration,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.item[index], style: contentStyle),
                if (widget.item[index].trim() == '5' ||
                    widget.item[index].trim() == '4' ||
                    widget.item[index].trim() == '3' ||
                    widget.item[index].trim() == '2' ||
                    widget.item[index].trim() == '1')
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: starIcon,
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
