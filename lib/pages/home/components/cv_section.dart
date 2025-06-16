import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:web_portfolio/models/development_process.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/screen_helper.dart';
import 'package:web/web.dart' as web;
final List<DevelopmentProcesses> developmentProcesses = [
  DevelopmentProcesses(
    title: "DESIGN",
    imagePath: "assets/design.png",
    subtitle:
        "I design intuitive, responsive, and visually polished interfaces using Flutter, focusing on smooth user experiences across platforms. I apply clean architecture principles and scalable project structures to ensure maintainability and efficiency.",
  ),
  DevelopmentProcesses(
    title: "Development",
    imagePath: "assets/develop.png",
    subtitle:
        "I develop robust cross-platform applications using Flutter and Dart, integrating REST APIs, Firebase, and local storage solutions. I implement effective state management (Provider, Bloc, Riverpod) and follow best practices for performance, testing, and code quality.",
  ),
  DevelopmentProcesses(
    title: "Deployment & Maintenance",
    imagePath: "assets/promote.png",
    subtitle:
        "I manage end-to-end deployment, including CI/CD pipelines and publishing to app stores. Post-launch, I monitor app performance and stability using tools like Firebase Crashlytics, ensuring smooth updates and ongoing maintenance.",
  ),
];

class CvSection extends StatelessWidget {
 const CvSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(BuildContext context, double width) {
    // we need the context to get maxWidth before the constraints below
    return Container(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints( maxWidth: width,
        minWidth: width,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BETTER DESIGN,\nBETTER EXPERIENCES",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    height: 1.8,
                    fontSize: 18.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     final anchor = web.HTMLAnchorElement()
          ..href = 'Fisha_Resume.pdf'
          ..download = 'Fisha_Resume.pdf'
          ..style.display = 'none';

        web.document.body!.append(anchor);
        anchor.click();
        anchor.remove();
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "DOWNLOAD CV",
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              child: LayoutBuilder(
                builder: (_context, constraints) {
                  return ResponsiveGridView.builder(
                    padding: EdgeInsets.all(0.0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    alignment: Alignment.topCenter,
                    gridDelegate: ResponsiveGridDelegate(
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 42.0,
                      maxCrossAxisExtent: ScreenHelper.isTablet(context) 
                          ?    constraints.maxWidth / 2.0:
                              ScreenHelper.isMobile(context)
                          ? constraints.maxWidth / 1.0
                          : 330.0,
                      // Hack to adjust child height
                      childAspectRatio: ScreenHelper.isDesktop(context)
                          ? 1:
                          ScreenHelper.isTablet(context) ?
                          MediaQuery.of(context).size.aspectRatio * 1.3
                          : MediaQuery.of(context).size.aspectRatio * 3.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return  Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    developmentProcesses[index].imagePath,
                                    width: 40.0,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                 Text(
                                      developmentProcesses[index].title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  
                                ],
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                developmentProcesses[index].subtitle,
                                style: TextStyle(
                                  color: kCaptionColor,
                                  height: 1.5,
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        
                      );
                    },
                    itemCount: developmentProcesses.length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
