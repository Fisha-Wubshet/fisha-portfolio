import 'package:flutter/material.dart';
import 'package:web_portfolio/data/other_app_data.dart';
import 'package:web_portfolio/models/apps.dart';

class OtherAppSection extends StatefulWidget {
  const OtherAppSection({super.key});

  @override
  State<OtherAppSection> createState() => _OtherAppSectionState();
}

class _OtherAppSectionState extends State<OtherAppSection> {
  final ScrollController _scrollController = ScrollController();
  bool _canScrollLeft = false;
  bool _canScrollRight = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateArrowVisibility);

    // Ensures arrow visibility is correctly set after layout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateArrowVisibility();
    });
  }

  void _updateArrowVisibility() {
    if (!_scrollController.hasClients) return;

    final maxExtent = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;

    final canScroll = maxExtent > 0;

    setState(() {
      _canScrollLeft = canScroll && offset > 0;
      _canScrollRight = canScroll && offset < maxExtent;
    });
  }

  void _scrollBy(double offset) {
    _scrollController.animateTo(
      _scrollController.offset + offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      const double spacing = 24.0;
      const double minCards = 2;

      double cardWidth = (screenWidth - spacing * (minCards - 1)) / minCards;
      cardWidth = cardWidth.clamp(180, 300);
      double scale = cardWidth / 300;

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        alignment: Alignment.center,
        child: Stack(
          children: [
            // Scrollable row of cards
            Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: (cardWidth + spacing) * otherApplist.length,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: otherApplist
                          .map(
                            (app) => Padding(
                              padding: EdgeInsets.only(right: spacing),
                              child: _AppCard(
                                app: app,
                                width: cardWidth,
                                scale: scale,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),

            // Left Arrow
            if (_canScrollLeft)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => _scrollBy(-cardWidth * 1.2),
                  ),
                ),
              ),

            // Right Arrow
            if (_canScrollRight)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon:
                        const Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () => _scrollBy(cardWidth * 1.2),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget _AppCard({
    required App app,
    required double width,
    required double scale,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          Image.asset(
            app.imagePath,
            height: 150 * scale,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 16 * scale),
          Text(
            app.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20 * scale,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8 * scale),
          Text(
            app.subtitle,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14 * scale,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
