import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/ui/screens/request_item_detail_screen.dart';
import 'package:tr_app/ui/widgets/shared/preview_camera_image_widget.dart';

class RequestSearchingWidget extends HookConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final pluProvider = StateProvider<int>((ref) => 0);

  RequestSearchingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pluController = useTextEditingController();

    final searchIcon = useState(Icons.barcode_reader);

    useEffect(() {
      void listener() {
        searchIcon.value = pluController.text.isEmpty
            ? Icons.barcode_reader
            : Icons.search_outlined;
        // if (pluController.text.isEmpty) {
        //   formKey.currentState!.validate();
        // }
        // debugPrint('pluController : ${pluController.text}');
      }

      pluController.addListener(listener);
      return () {
        // dispose listerner and controller when widget dispose
        pluController.removeListener(listener);
        pluController.dispose();
      };
    }, [pluController]);

    void search() {
      if (formKey.currentState!.validate()) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(imagesProvider.notifier).state.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RequestItemDetailPage(
                  productCode: '1235018',
                  supplierCode: 'AXX5512',
                  supplierName: 'Supplier Bob',
                  imageUrl:
                      'https://p16-oec-va.ibyteimg.com/tos-maliva-i-o3syd03w52-us/9bbaac7890de422e91e02540f0b353a3~tplv-o3syd03w52-origin-jpeg.jpeg?from=520841845'),
            ),
          );
        });
      }
    }

    void barcodeScanner() {
      // TODO : open barcode scanner
    }

    return Container(
      color: Colors.white,
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: TextFormField(
            controller: pluController,
            decoration: InputDecoration(
              hintText: 'Enter PLU',
              suffixIcon: IconButton(
                icon: Icon(searchIcon.value),
                onPressed:
                    pluController.text.isNotEmpty ? search : barcodeScanner,
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            validator: (value) => value!.isEmpty ? 'plu is required' : null,
          ),
        ),
      ),
    );
  }
}
