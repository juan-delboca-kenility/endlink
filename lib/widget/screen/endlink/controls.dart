import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomVideoPlayerControls extends StatefulHookWidget {
  final bool visible;
  final bool playing;
  final Function()? onPlayPressed;
  final int position;
  final int duration;
  final Future<void> Function(int position)? seek;
  final EdgeInsets? margin;
  final Function()? onSeekStart;
  final Function()? onSeekEnd;

  const CustomVideoPlayerControls({
    Key? key,
    this.playing = false,
    this.onPlayPressed,
    this.position = 0,
    this.duration = 0,
    this.seek,
    this.margin,
    this.visible = true,
    this.onSeekStart,
    this.onSeekEnd,
  }) : super(key: key);

  @override
  State<CustomVideoPlayerControls> createState() => _CustomVideoPlayerControlsState();
}

class _CustomVideoPlayerControlsState extends State<CustomVideoPlayerControls> {
  bool _dragging = false;
  int _pos = 0;
  bool _wasPlaying = false;

  _dragStart(DragStartDetails details, BoxConstraints constraints) {
    setState(() {
      _wasPlaying = widget.playing;
      _pos = widget.position;
      _dragging = true;
    });

    if (widget.playing) {
      widget.onPlayPressed?.call();
    }

    widget.onSeekStart?.call();
  }

  _dragUpdate(DragUpdateDetails details, BoxConstraints constraints) {
    final percentage = details.delta.dx / constraints.maxWidth;
    final position = ((percentage * widget.duration).floor() + _pos).clamp(0, widget.duration);

    setState(() {
      _pos = position;
    });

    widget.seek?.call(_pos);
  }

  _dragEnd(DragEndDetails details, BoxConstraints constraints) async {
    await widget.seek?.call(_pos);

    setState(() {
      _dragging = false;
      _pos = 0;
    });

    if (_wasPlaying) {
      widget.onPlayPressed?.call();
    }

    widget.onSeekEnd?.call();
  }

  _seekRewind(int seconds) {
    final d = Duration(milliseconds: widget.position) + Duration(seconds: seconds);
    widget.seek?.call(d.inMilliseconds.clamp(0, widget.duration));
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.grey.shade800;

    return Container(
        padding: widget.margin,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.0),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5.0, left: 5.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return GestureDetector(
                          onHorizontalDragStart: (e) => _dragStart(e, constraints),
                          onHorizontalDragUpdate: (e) => _dragUpdate(e, constraints),
                          onHorizontalDragEnd: (e) => _dragEnd(e, constraints),
                          child: SizedBox(
                            height: 10.0,
                            width: double.infinity,
                            child: CustomPaint(
                              painter: _Painter(
                                position: _dragging ? _pos : widget.position,
                                duration: widget.duration,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Text(
                //   "$position/$duration",
                //   style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white),
                // ),
                const SizedBox(width: 8.0),
              ],
            ),
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  final int position;
  final int duration;

  _Painter({
    required this.position,
    required this.duration,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final ballSize = size.shortestSide;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          ballSize * 0.5,
          0.0,
          size.width - ballSize,
          size.height,
        ),
        Radius.circular(size.shortestSide),
      ),
      Paint()..color = Colors.white.withOpacity(0.2),
    );

    final p = (position / duration).clamp(0.0, 1.0);
    canvas.drawCircle(
      Offset(
        (p * (size.width - ballSize)) + (ballSize * 0.5),
        ballSize * 0.5,
      ),
      size.shortestSide / 2,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    if (oldDelegate.position != position) return true;
    if (oldDelegate.duration != duration) return true;
    return false;
  }
}
