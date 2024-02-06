import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchWidget extends HookConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final Function(String?) search;

  SearchWidget({super.key, required this.search});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pluController = useTextEditingController();

    useEffect(() {
      void listener() {}

      pluController.addListener(listener);
      return () {
        // dispose listener and controller when widget disposes
        pluController.removeListener(listener);
        pluController.dispose();
      };
    }, [pluController]);

    void search() {
      if (formKey.currentState!.validate()) {
        if (pluController.text.isNotEmpty) {
          // ref.read(stateProvider.notifier).state = pluController.text;
          this.search(pluController.text);
        } else {
          this.search(null);
          // ref.read(stateProvider.notifier).state = null;
        }
      }
    }

    return Form(
      key: formKey,
      child: TextFormField(
        controller: pluController,
        decoration: InputDecoration(
          hintText: 'Search your request',
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: const Border(
                left: BorderSide.none,
                top: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
              onPressed: search,
            ),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        validator: (value) => value!.isEmpty ? 'plu is required' : null,
      ),
    );
  }
}
