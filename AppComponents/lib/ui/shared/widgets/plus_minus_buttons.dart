import 'package:flutter/material.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';

class PlusMinusButtons extends StatelessWidget {
  const PlusMinusButtons(
      {Key? key,
      required this.onMinusTap,
      required this.positionWithCount,
      required this.onPlusTap})
      : super(key: key);

  final Function() onMinusTap;

  final PositionWithCount positionWithCount;

  final Function() onPlusTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 38,
          height: 38,
          child: MaterialButton(
            color: AppColors.mainBackground,
            padding: const EdgeInsets.all(8.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () => onMinusTap(),
            child: Image.asset(
              AppIcons.minus,
              width: 30,
              height: 30,
              color: Colors.orange,
            ),
          ),
        ),
        10.sbWidth,
        Text(
          '${positionWithCount.count}',
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        10.sbWidth,
        SizedBox(
          width: 38,
          height: 38,
          child: MaterialButton(
            color: AppColors.mainBackground,
            elevation: 0,
            padding: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () => onPlusTap(),
            child: Image.asset(
              AppIcons.plus,
              width: 30,
              height: 30,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
