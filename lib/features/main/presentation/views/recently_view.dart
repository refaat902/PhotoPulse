import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photopulse/core/widgets/texts/section_title_text.dart';

class RecentlyView extends StatelessWidget {
  const RecentlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(children: [SectionTitleText(text: 'Recently')]),
    );
  }
}
