import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_portfolio/data/skill_tools.dart';
import 'package:web_portfolio/models/tools.dart';

import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class Frameworks_section extends StatefulWidget {
  const Frameworks_section({super.key});

  @override
  State<Frameworks_section> createState() => _Frameworks_sectionState();
}

class _Frameworks_sectionState extends State<Frameworks_section> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  bool _isOverflowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOverflow());
    _scrollController.addListener(_checkOverflow);
    _startAutoScroll();
  }

  void _checkOverflow() {
    if (!_scrollController.hasClients) return;
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    final hasOverflow = maxScrollExtent > 0;
    if (hasOverflow != _isOverflowing) {
      setState(() {
        _isOverflowing = hasOverflow;
      });
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!_scrollController.hasClients || !_isOverflowing) return;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final current = _scrollController.offset;
      final next = current + 120;

      _scrollController.animateTo(
        next >= maxScroll ? 0 : next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  void _scrollLeft() {
    final current = _scrollController.offset;
    final next = current - 120;
    _scrollController.animateTo(
      next <= 0 ? 0 : next,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  void _scrollRight() {
    final current = _scrollController.offset;
    final max = _scrollController.position.maxScrollExtent;
    final next = current + 120;
    _scrollController.animateTo(
      next >= max ? max : next,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.removeListener(_checkOverflow);
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }
    
   Widget _buildUi(double _width) {
    return  Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints( 
        maxWidth: _width,
        minWidth: _width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
             Text(
                        "Frameworks & Tools",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                       SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Technologies I use regularly to build powerful, modern applications.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
            SizedBox(
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: tools.length,
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    itemBuilder: (context, index) {
                      final tool = tools[index];
                      return Padding(
                        padding: EdgeInsets.only(right: _width>500?40:20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          
                          children: [
                            Image.asset(tool.iconPath, height: 60, width:_width>900? 60:_width>600?30:30),
                            const SizedBox(height: 6),
                            Text(tool.name, style: TextStyle(fontSize: _width>700? 14:12, color: Colors.white)),
                          ],
                        ),
                      );
                    },
                  ),
                  // Left Arrow
                  if (_isOverflowing)
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 20),
                      onPressed: _scrollLeft,
                    ),
                  ),
                  // Right Arrow
                  if (_isOverflowing)
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      onPressed: _scrollRight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
