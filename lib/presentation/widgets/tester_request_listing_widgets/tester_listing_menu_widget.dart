import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/providers/tr_list_provider.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

class TesterListingMenuWidget extends HookConsumerWidget {
  const TesterListingMenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    const itemWidth = 80.00;

    TrStatus activeStatus = ref.watch(trListActiveStatusProvider);
    String? searchPlu = ref.watch(trListSearchProvider);
    Brand selectedBrand = ref.watch(
        userNotifierProvider.select((state) => state.user!.selectedBrand));

    useEffect(() {
      void listener() {
        final scrollPosition = scrollController.position.pixels;

        final activeIndex = (scrollPosition / itemWidth).round();
        if (activeIndex >= 0 && activeIndex < TrStatus.values.length) {
          activeStatus = TrStatus.values.elementAt(activeIndex);
        }

        // ref.read(activeStatusProvider.notifier).state = activeStatus;
        // ref.read(trListSNP.notifier).getTrs(activeStatus);
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
        itemCount: TrStatus.values.length,
        itemBuilder: (context, index) {
          String statusText = TrStatus.values.elementAt(index).name;
          statusText = statusText[0].toUpperCase() + statusText.substring(1);
          bool isActive = activeStatus == TrStatus.values.elementAt(index);
          return InkWell(
            onTap: () {
              // Scroll to the selected category
              ref.read(trListActiveStatusProvider.notifier).state =
                  TrStatus.values.elementAt(index);
              ref.read(trListSNP.notifier).getTrs(
                  selectedBrand, TrStatus.values.elementAt(index), searchPlu);
              // final scrollPosition = index * itemWidth - itemWidth / 2;
              // debugPrint('scrollPosition : $scrollPosition');
              // scrollController.animateTo(
              //   scrollPosition,
              //   duration: const Duration(milliseconds: 300),
              //   curve: Curves.easeInOut,
              // );
              debugPrint('status : ${TrStatus.values.elementAt(index)}');
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
