import 'package:flutter/material.dart';
import 'package:photo_ai/generated/index.dart';
import 'package:photo_ai/packages/index.dart';

import '../../generated/assets.dart';

class ToastMessage extends StatefulWidget {
  final String type;
  final String message;
  final Function callback;

  const ToastMessage({super.key, required this.type, required this.message, required this.callback});

  @override
  State<ToastMessage> createState() => _ToastMessageState();
}

class _ToastMessageState extends State<ToastMessage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Curve cho animation
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Container(
            width: 350,
            constraints: const BoxConstraints(
              minHeight: 100,
              maxHeight: 120,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: _getContent(widget.type)?["backgr_color"],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _buildPositionedImage(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _buildMessage()
                    ),
                  ],
                ),
                _buildIconButton()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPositionedImage() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(26.0),
          ),
          image: DecorationImage(
            image: AssetImage(_getContent(widget.type)?['image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_getContent(widget.type)?['text']}!',
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            context.height6X,
            Text(
              widget.message,
              maxLines: 3,
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 15,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                widget.callback();
              },
              icon: const Icon(
                Icons.close,
                size: 28,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic>? _getContent(String type) {
    return {
      'Successfully': {
        "text": context.loc.successfully,
        "icon": Icons.check_sharp,
        "image": Assets.colorGreen,
        "backgr_color": const Color(0xFF4EC33D).withOpacity(0.9),
        "icon_color": const Color(0xFF2C7721).withOpacity(0.8),
      },
      'Error': {
        "text": context.loc.error,
        "icon": Icons.close_sharp,
        "image": Assets.colorRed,
        "backgr_color": const Color(0xFFF64B3C).withOpacity(0.9),
        "icon_color": const Color(0xFFC81912).withOpacity(0.8),
      },
      'Normal': {
        "text": context.loc.normal,
        "icon": Icons.notifications,
        "image": Assets.colorBlue,
        "backgr_color": const Color(0xFF56B6E4).withOpacity(1),
        "icon_color": const Color(0xFF1474BC).withOpacity(0.8),
      },
      'Warning': {
        "text": context.loc.warning,
        "icon": Icons.announcement_sharp,
        "image": Assets.colorBlue,
        "backgr_color": const Color(0xFF56B6E4).withOpacity(1),
        "icon_color": const Color(0xFF1474BC).withOpacity(0.8),
      },
    }[type];
  }
}
