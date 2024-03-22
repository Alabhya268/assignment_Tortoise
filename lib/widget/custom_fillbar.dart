import 'package:assignment/utils/app_extensions.dart';
import 'package:flutter/material.dart';

class CustomFillBar extends StatefulWidget {
  final double fillPercentage;
  final Color fillColor;
  final Color backgroundColor;
  final double width;
  final double minBarWidth;
  final double height;
  final double borderRadius;
  final bool isDragable;
  final Function(double fillPercentage)? callbackAction;

  const CustomFillBar({
    super.key,
    this.fillPercentage = 0.5,
    this.fillColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.width = 200,
    this.minBarWidth = 0,
    this.borderRadius = 0,
    this.height = 20,
    this.isDragable = false,
    this.callbackAction,
  });

  @override
  State<CustomFillBar> createState() => _CustomFillBarState();
}

class _CustomFillBarState extends State<CustomFillBar> {
  double _fillPercentage = 0;

  @override
  void initState() {
    super.initState();
    _fillPercentage = widget.fillPercentage / 100;
  }

  void _updateFill(double xPosition, double containerWidth) {
    setState(() {
      _fillPercentage = (xPosition / containerWidth).clamp(0.0, 1.0);
      if (widget.callbackAction != null) {
        widget.callbackAction!(_fillPercentage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (widget.isDragable) {
          RenderBox? box = context.findRenderObject() as RenderBox?;
          if (box != null) {
            Offset localPosition = box.globalToLocal(details.globalPosition);
            double xPosition = localPosition.dx < widget.minBarWidth
                ? widget.minBarWidth
                : localPosition.dx;
            double containerWidth = box.size.width;
            _updateFill(xPosition, containerWidth);
          }
        }
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Stack(
          children: [
            Container(
              width: widget.width * _fillPercentage,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.fillColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: SizedBox(
                width: double.maxFinite,
                child: Row(
                  children: [
                    const Spacer(),
                    if (widget.minBarWidth >= 15)
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: double.maxFinite,
                        width: 5,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffD2D2D2),
                              Color(0xffFFFFFF),
                              Color(0xffFFFFFF),
                              Color(0xffD2D2D2),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              color: context.constantUi.colorBlack
                                  .withOpacity(0.25),
                            ),
                            BoxShadow(
                              offset: const Offset(-2, 0),
                              color: context.constantUi.colorBlack
                                  .withOpacity(0.22),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Custom Fill Bar')),
      body: Center(
        child: CustomFillBar(
          fillPercentage: 0.7,
          fillColor: Colors.green,
          backgroundColor: Colors.grey.shade300,
          width: 300,
        ),
      ),
    ),
  ));
}
