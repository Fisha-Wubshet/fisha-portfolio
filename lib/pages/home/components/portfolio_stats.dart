import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/stat.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';

final List<Stat> stats = [
  Stat(count: "6+", text: "Years\nExperience"),
  Stat(count: "30+", text: "Apps\nShipped"),
  Stat(count: "15+", text: "Clients"),
  Stat(count: "2", text: "App Stores\nDeployed"),
];

class PortfolioStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Container(
      child:  ConstrainedBox(
      constraints: BoxConstraints( 
      maxWidth: width,
      minWidth: width,
      ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: stats.map((stat) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  // Just use the helper here really
                  width: ScreenHelper.isMobile(context)
                      ? constraint.maxWidth / 2.0 - 20
                      : (constraint.maxWidth / 4.0 - 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        stat.count,
                        style: GoogleFonts.oswald(
                          fontWeight: FontWeight.w700,
                          fontSize: 32.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        stat.text,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: kCaptionColor,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
