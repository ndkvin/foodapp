import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widget/small_text.dart';

class ExpandableText extends StatefulWidget {

  final String text;

  const ExpandableText({ Key? key, required this.text }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/2;

  @override
  void initState() {
    super.initState();

    if(widget.text.length>textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ? SmallText(text: firstHalf) : Column(
        children: [
          SmallText(
            text: hiddenText ? (firstHalf + '...') : (firstHalf+secondHalf),
            size: Dimensions.height16,
            color: AppColors.paraColor,
          ),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText = !hiddenText;
              });
            },
            child: Row(
              children: [
                hiddenText ? SmallText(
                  text: 'Show more',
                  size: Dimensions.height16,  
                  color: AppColors.mainColor
                ) : SmallText(
                  text: 'Show less',
                  size: Dimensions.height16,  
                  color: AppColors.mainColor,
                ),
                Icon(
                  hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                  color: AppColors.mainColor,
                  size: Dimensions.height16,  
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}