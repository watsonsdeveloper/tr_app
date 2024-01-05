import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/providers/tester_listing_providers.dart';
import 'package:tr_app/utils/constants.dart';

class TesterListingMenuWidget extends HookConsumerWidget {
  const TesterListingMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    const itemWidth = 80.00;

    StatusState activeStatus = ref.watch(activeStatusProvider);

    useEffect(() {
      void listener() {
        final scrollPosition = scrollController.position.pixels;

        final activeIndex = (scrollPosition / itemWidth).round();
        if (activeIndex >= 0 && activeIndex < StatusState.values.length) {
          activeStatus = StatusState.values.elementAt(activeIndex);
        }

        ref.read(activeStatusProvider.notifier).state = activeStatus;
      }

      scrollController.addListener(listener);

      return () {
        scrollController.removeListener(listener);
        scrollController.dispose();
      };
    }, [scrollController]);

    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        // controller: scrollController,
        // physics:
        //     const NeverScrollableScrollPhysics(), // Disable scrolling in ListView
        shrinkWrap: true, // Fit ListView to its children
        scrollDirection: Axis.horizontal,
        itemCount: StatusState.values.length,
        itemBuilder: (context, index) {
          String statusText = StatusState.values.elementAt(index).name;
          statusText = statusText[0].toUpperCase() + statusText.substring(1);
          bool isActive = activeStatus == StatusState.values.elementAt(index);
          return InkWell(
            onTap: () {
              // Scroll to the selected category
              ref.read(activeStatusProvider.notifier).state =
                  StatusState.values.elementAt(index);
              // final scrollPosition = index * itemWidth - itemWidth / 2;
              // debugPrint('scrollPosition : $scrollPosition');
              // scrollController.animateTo(
              //   scrollPosition,
              //   duration: const Duration(milliseconds: 300),
              //   curve: Curves.easeInOut,
              // );
              debugPrint('status : ${StatusState.values.elementAt(index)}');
            },
            child: Ink(
              color: Colors.blue,
              child: Container(
                decoration: BoxDecoration(
                  border: isActive
                      ? Border(
                          bottom: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 3.0,
                          ),
                        )
                      : null,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                width: itemWidth,
                child: Center(
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: isActive
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
