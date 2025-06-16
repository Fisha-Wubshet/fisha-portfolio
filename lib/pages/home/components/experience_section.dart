import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/data/experience_data.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';



class ExperienceSection extends StatelessWidget {
   const ExperienceSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }



  Widget _buildUi(double width) {
    return Container(
      alignment: Alignment.center,
      child:ConstrainedBox(
      constraints: BoxConstraints( 
      maxWidth: width,
      minWidth: width,
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Experience",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 600.0),
                  child: Text(
                    "Senior Mobile Developer with 6+ years of experience building high-performance cross-platform apps using Flutter and native tech.",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
  builder: (context, constraints) {
    return Container(
      child: Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        children: experienceList.map(
          (experience) => Container(
            width: constraints.maxWidth < 600
                ? constraints.maxWidth
                : constraints.maxWidth / 2.0 - 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.period,
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  experience.description,
                  maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kCaptionColor,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20.0),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.company,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        experience.role,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ).toList(),
      ),
    );
  },
)
          ],
        ),
      ),
    );
  }
}
