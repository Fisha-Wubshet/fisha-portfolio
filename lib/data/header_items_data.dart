
import 'package:web_portfolio/models/header_item.dart';
import 'package:web_portfolio/utils/scroll_helper.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: "Home", onTap: () => scrollTo(homeKey)),
  HeaderItem(title: "Projects", onTap: () => scrollTo(projectKey)),
  HeaderItem(title: "Experience", onTap: () => scrollTo(experienceKey)),
  HeaderItem(title: "Skill", onTap: () => scrollTo(skillKey)),
  HeaderItem(title: "Contact", onTap: () => scrollTo(contactKey)),
  HeaderItem(title: "Download CV", onTap: () => scrollTo(hireMeKey), isButton: true),
];
