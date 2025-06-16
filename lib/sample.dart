// import 'package:flutter/material.dart';

// void main() {
//   runApp(const PortfolioApp());
// }

// class PortfolioApp extends StatelessWidget {
//   const PortfolioApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fnote Portfolio',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color(0xFF0D1117),
//         textTheme: const TextTheme(
//           bodyMedium: TextStyle(color: Colors.white),
//         ),
//       ),
//       home: const PortfolioHome(),
//     );
//   }
// }

// class PortfolioHome extends StatelessWidget {
//   const PortfolioHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const NavigationBar(),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: const [
//                   HeroSection(),
//                   SizedBox(height: 40),
//                   MvpSection(),
//                   SizedBox(height: 40),
//                   TechnologiesSection(),
//                   SizedBox(height: 40),
//                   // Add other sections here like TestimonialsSection(), ContactSection(), etc.
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class NavigationBar extends StatelessWidget {
//   const NavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = MediaQuery.of(context).size.width < 800;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//       color: const Color(0xFF0D1117),
//       child: isMobile
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "<FM/>",
//                   style: TextStyle(
//                     color: Colors.orange,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Wrap(
//                   spacing: 12,
//                   runSpacing: 8,
//                   children: _navItems(),
//                 ),
//               ],
//             )
//           : Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "<FM/>",
//                   style: TextStyle(
//                     color: Colors.orange,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Row(children: _navItems()),
//               ],
//             ),
//     );
//   }

//   List<Widget> _navItems() {
//     return [
//       _navItem('Projects'),
//       _navItem('Technologies'),
//       _navItem('Tools'),
//       _navItem('Contact'),
//       const SizedBox(width: 10),
//       Icon(Icons.link, color: Colors.white),
//       const SizedBox(width: 10),
//       Icon(Icons.code, color: Colors.white),
//     ];
//   }

//   Widget _navItem(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 16, color: Colors.white),
//       ),
//     );
//   }
// }

// class HeroSection extends StatelessWidget {
//   const HeroSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 800;

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: isMobile
//             ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   _textContent(TextAlign.center),
//                   const SizedBox(height: 30),
//                   _avatar(),
//                 ],
//               )
//             : Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(child: _textContent(TextAlign.start)),
//                   const SizedBox(width: 40),
//                   _avatar(),
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget _textContent(TextAlign textAlign) {
//     return Column(
//       crossAxisAlignment: textAlign == TextAlign.center
//           ? CrossAxisAlignment.center
//           : CrossAxisAlignment.start,
//       children: [
//         ShaderMask(
//           shaderCallback: (Rect bounds) {
//             return const LinearGradient(
//               colors: [Colors.orange, Colors.red],
//             ).createShader(bounds);
//           },
//           child: const Text(
//             "Hello! I'm Fnote,",
//             style: TextStyle(
//               fontSize: 32,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//             textAlign: TextAlign.start,
//           ),
//         ),
//         const SizedBox(height: 16),
//         const Text(
//           "I rapidly turn ideas into fully functional ",
//           style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//         ),
//         ShaderMask(
//           shaderCallback: (Rect bounds) {
//             return const LinearGradient(
//               colors: [Colors.orange, Colors.red],
//             ).createShader(bounds);
//           },
//           child: const Text(
//             "MVPs.",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         const Text(
//           "I am a full-stack developer laser-focused on helping founders and teams like yours. I specialize in rapidly transforming concepts into high-quality, fully functional Minimum Viable Products (MVPs). You get speed, reliability, and clean, scalable code. An MVP ready to impress users and built for future growth.",
//           style: TextStyle(fontSize: 16),
//         ),
//         const SizedBox(height: 30),
//         ElevatedButton.icon(
//           onPressed: () {},
//           icon: const Icon(Icons.keyboard_arrow_down),
//           label: const Text("CHECKOUT MY WORK"),
//           style: ElevatedButton.styleFrom(
//             foregroundColor: Colors.orange,
//             backgroundColor: Colors.transparent,
//             side: const BorderSide(color: Colors.orange),
//             elevation: 0,
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           ),
//         )
//       ],
//     );
//   }

//   Widget _avatar() {
//     return CircleAvatar(
//       radius: 100,
//       backgroundColor: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(width: 5, color: Colors.orange),
//         ),
//         child: const CircleAvatar(
//           radius: 95,
//           backgroundImage: AssetImage('assets/fnote_avatar.png'),
//         ),
//       ),
//     );
//   }
// }



// class MvpSection extends StatelessWidget {
//   const MvpSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width > 800;

//     return Container(
//       color: const Color(0xFF0D1117),
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         children: [
//           const Text.rich(
//             TextSpan(
//               children: [
//                 TextSpan(
//                   text: "MVPs ",
//                   style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
//                 ),
//                 TextSpan(
//                   text: "I’ve Brought to Life",
//                   style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "From idea to working product! here's what I’ve shipped.",
//             style: TextStyle(color: Colors.grey),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 30),
//           GridView.count(
//             shrinkWrap: true,
//             crossAxisCount: isWide ? 3 : 1,
//             mainAxisSpacing: 20,
//             crossAxisSpacing: 20,
//             childAspectRatio: 0.75,
//             physics: const NeverScrollableScrollPhysics(),
//             children: const [
//               MvpCard(
//                 title: "EyitaHub",
//                 description:
//                     "An AI powered platform to collect and analyze customer feedback. EyitaHub helps businesses to understand their customers better and make data-driven decisions.",
//                 imagePath: "assets/eyita.png",
//                 techLogos: ["laravel.png", "vue.png", "mysql.png", "bootstrap.png", "vuetify.png"],
//               ),
//               MvpCard(
//                 title: "Buy2Go",
//                 description:
//                     "A large scale B2B e-commerce platform that supplies thousands of shops around Addis Ababa with products from different suppliers.",
//                 imagePath: "assets/buy2go.png",
//                 techLogos: ["laravel.png", "vue.png", "mysql.png", "bootstrap.png", "vuetify.png", "firebase.png"],
//               ),
//               MvpCard(
//                 title: "ByMe",
//                 description:
//                     "An on-demand delivery and multi-vendor marketplace platform. A comprehensive courier service that enables users to send and receive packages quickly and easily.",
//                 imagePath: "assets/byme.png",
//                 techLogos: ["laravel.png", "vue.png", "mysql.png", "bootstrap.png", "flutter.png", "firebase.png"],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MvpCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final String imagePath;
//   final List<String> techLogos;

//   const MvpCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.imagePath,
//     required this.techLogos,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0xFF161B22),
//         border: Border.all(color: Colors.orange),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(imagePath, fit: BoxFit.cover, height: 120),
//           const SizedBox(height: 10),
//           Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
//           const SizedBox(height: 8),
//           Text(description, style: const TextStyle(fontSize: 13, color: Colors.grey)),
//           const Spacer(),
//           Wrap(
//             spacing: 8,
//             children: techLogos.map((logo) => Image.asset("assets/$logo", height: 20)).toList(),
//           ),
//           const SizedBox(height: 10),
//           OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               side: const BorderSide(color: Colors.orange),
//               foregroundColor: Colors.orange,
//             ),
//             onPressed: () {},
//             child: const Text("LIVE PREVIEW"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TechnologiesSection extends StatelessWidget {
//   const TechnologiesSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width > 800;

//     final techs = [
//       {
//         "title": "Laravel",
//         "logo": "laravel.png",
//         "desc": "A robust PHP framework for backend with features like routing, auth, and Eloquent ORM.",
//       },
//       {
//         "title": "Vue.js",
//         "logo": "vue.png",
//         "desc": "Progressive JavaScript framework for building modern web interfaces.",
//       },
//       {
//         "title": "MySQL",
//         "logo": "mysql.png",
//         "desc": "Reliable open-source relational DB used with Laravel’s Eloquent ORM.",
//       },
//       {
//         "title": "Bootstrap",
//         "logo": "bootstrap.png",
//         "desc": "Widely-used CSS framework for responsive and mobile-first layouts.",
//       },
//       {
//         "title": "Vuetify",
//         "logo": "vuetify.png",
//         "desc": "Material Design framework for Vue.js with polished UI components.",
//       },
//       {
//         "title": "Firebase",
//         "logo": "firebase.png",
//         "desc": "Google's platform for real-time DB, hosting, and user authentication.",
//       },
//     ];

//     return Container(
//       color: const Color(0xFF0D1117),
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         children: [
//           const Text(
//             "Technologies",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Here is an overview of what I use to create scalable and efficient MVPs",
//             style: TextStyle(color: Colors.grey),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 30),
//           GridView.count(
//             shrinkWrap: true,
//             crossAxisCount: isWide ? 3 : 1,
//             mainAxisSpacing: 20,
//             crossAxisSpacing: 20,
//             childAspectRatio: 2.5,
//             physics: const NeverScrollableScrollPhysics(),
//             children: techs
//                 .map(
//                   (tech) => Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1C1F26),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     padding: const EdgeInsets.all(16),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Image.asset("assets/${tech['logo']}", height: 30),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 tech['title']!,
//                                 style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 tech['desc']!,
//                                 style: const TextStyle(fontSize: 13, color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
