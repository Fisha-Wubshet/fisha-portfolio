import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/models/carousel_item_model.dart';
import 'package:web_portfolio/utils/constants.dart';
import 'package:web_portfolio/utils/scroll_helper.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Senior Mobile Developer",
            style: GoogleFonts.oswald(
              color: kPrimaryColor,
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "Fisha Wubshet\nGebregiorgis",
            style: GoogleFonts.oswald(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Flutter | iOS Native | Firebase",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 15.0,
              height: 1.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Wrap(
              children: [
                Text(
                  "Senior Mobile Developer with 6+ years of experience designing, developing, and shipping high-performing cross-platform apps with Flutter and native iOS. I specialize in secure payments, real-time features, offline-first architecture, push notifications, geolocation, and third-party API integrations — leading projects from concept to launch on the App Store and Google Play.",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 48.0,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              child: TextButton(
                onPressed: () {
                  scrollTo(contactKey);
                },
                child: Text(
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
   image: 
   SizedBox(
      height: 300,
      child: Image.asset(
        "assets/fisho.png",
        fit: BoxFit.contain,
      ),
    ), 
  ),
);
