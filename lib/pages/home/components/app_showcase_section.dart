import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/data/app_data.dart';
import 'package:web_portfolio/models/apps.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';
class AppShowcaseSection extends StatelessWidget {
  const AppShowcaseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: appList
          .asMap()
          .entries
          .map((entry) => _buildAppBlock(context, entry.value, entry.key))
          .toList(),
    );
  }

  Widget _buildAppBlock(BuildContext context, App app, int index) {
    return ScreenHelper(
      desktop: _buildContent(app, kDesktopMaxWidth, index, 'desktop'),
      tablet: _buildContent(app, kTabletMaxWidth, index,'tablet'),
      mobile: _buildContent(app, getMobileMaxWidth(context), index, 'mobile'),
    );
  }

 Widget _buildContent(App app, double width, int index, String screen) {
  return Center(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 720;

        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width, minWidth: width),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Flex(
              direction: isWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isWide
                  ? [
                      // Desktop layout: alternate image/text based on index
                      if (index % 2 == 0)
                        ...[
                          _buildImage(app.imagePath, constraints),
                          const SizedBox(width: 20),
                          Expanded(child: _buildTextBlock(app, screen)),
                        ]
                      else
                        ...[
                          Expanded(child: _buildTextBlock(app, screen)),
                          const SizedBox(width: 20),
                          _buildImage(app.imagePath, constraints),
                        ]
                    ]
                  : [
                      // Mobile layout: always text top, image bottom
                      _buildTextBlock(app, screen),
                      const SizedBox(height: 20),
                      _buildImage(app.imagePath, constraints),
                    ],
            ),
          ),
        );
      },
    ),
  );
}



  Widget _buildImage(String path, BoxConstraints constraints) {
    return Expanded(
      flex: constraints.maxWidth > 720 ? 1 : 0,
      child: Row(
        children: [
          Image.asset(
            path,
            width: constraints.maxWidth > 800 ? 300 : 250,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildTextBlock(App app, String screen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        
        Text(
          app.title,
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 35.0,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 10.0),
         Text(
          app.subtitle,
          style: GoogleFonts.oswald(
            color: kCaptionColor,
            fontWeight: FontWeight.w900,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          app.description,
          style: const TextStyle(
            color: kCaptionColor,
            fontSize: 15.0,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 25.0),
        Row(
          children: [
            screen=='mobile'?
            _buildMobileButton( app.link):
            _buildPrimaryButton("EXPLORE MORE", app.link),
            
            // const SizedBox(width: 10),
            // _buildSecondaryButton("NEXT APP"),
          ],
        )
      ],
    );
  }

  Widget _buildPrimaryButton(String label, String link) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        height: 48.0,
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: TextButton(
          onPressed: () async {
                final Uri url = Uri.parse(link);
                if (!await launchUrl(
                url,
                webOnlyWindowName: '_blank', // opens in new tab
                )) {
                throw 'Could not launch $url';
               }
          },
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
Widget _buildMobileButton( String link) {
    return   GestureDetector(
                  onTap: () async {
                final Uri url = Uri.parse(link);
                if (!await launchUrl(
                url,
                webOnlyWindowName: '_blank', // opens in new tab
                )) {
                throw 'Could not launch $url';
               }
          
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "EXPLORE MORE",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
  }
  // Widget _buildSecondaryButton(String label) {
  //   return MouseRegion(
  //     cursor: SystemMouseCursors.click,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8.0),
  //         border: Border.all(color: kPrimaryColor),
  //       ),
  //       height: 48.0,
  //       padding: const EdgeInsets.symmetric(horizontal: 28.0),
  //       child: TextButton(
  //         onPressed: () {},
  //         child: Center(
  //           child: Text(
  //             label,
  //             style: const TextStyle(
  //               color: kPrimaryColor,
  //               fontSize: 13.0,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
