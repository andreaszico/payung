import 'package:flutter/material.dart';
import 'package:payung_pribadi/components/icons/icon_with_banner.dart';
import 'package:payung_pribadi/core/model/menu.dart';

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  bool expanded = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
    if (currentSize >= 0.3) {
      setState(() {
        expanded = true;
      });
    } else {
      setState(() {
        expanded = false;
      });
    }
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _anchor() => _animateSheet(sheet.snapSizes!.last);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) {
    _controller.animateTo(
      size,
      duration: const Duration(milliseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      key: _sheet,
      initialChildSize: 0.1,
      maxChildSize: 0.3,
      minChildSize: 0,
      expand: true,
      snap: true,
      snapSizes: const [
        0.1,
        0.3,
      ],
      controller: _controller,
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
              )
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -15,
                child: GestureDetector(
                  onTap: () {
                    expanded ? _hide() : _expand();
                  },
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: Icon(expanded
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up_sharp),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.5,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final menu = menuButtomNavigation[index];

                          return GestureDetector(
                            child: Column(
                              children: [
                                IconWithBanner(
                                  icon: Icon(
                                    menu.icon,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const SizedBox(height: 5),
                                Text(
                                  menu.label,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                        childCount: menuButtomNavigation.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
