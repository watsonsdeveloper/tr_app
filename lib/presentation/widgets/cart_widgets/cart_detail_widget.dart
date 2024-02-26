import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/presentation/providers/upload_image_provider.dart';
import 'package:tr_app/presentation/themes/input_theme.dart';
import 'package:tr_app/presentation/view_models/cart_detail_view_model.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/view_models/upload_image_view_model.dart';
import 'package:tr_app/presentation/widgets/shared/preview_camera_image_widget.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

void showCartDetail(BuildContext context, Cart cart, int index) {
  final formKey = GlobalKey<FormState>();
  // useEffect(() {
  //   void listener() {

  //   }

  //   images.addListener(listener);
  //   return () {
  //     images.removeListener(listener);
  //   };
  // }, [images]);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return HookConsumer(
        builder: (context, ref, child) {
          // final Reason reasonState = ref.watch(reasonStateProvider);
          // final justificationController = useTextEditingController();
          // final uploadedImages = ref.watch(uploadImageProvider);
          // final cartDetail = ref.watch(cartDetailNotifierProvider).cart;
          // final uploadedImages = useState<List<UploadedImage>>(cartDetail.cart!.uploadedImages ?? []);

          // final uploadImageUseCase = ref.read(uploadImageUseCaseProvider);
          // uploadImageUseCase.getUploadedImages(cart.storeId.toString(), cart.trCartId!)

          // final uploadedImages =
          //     useState<List<UploadedImage>>(cart.uploadedImages ?? []);
          final justification = useState(cart.justification);
          final selectedReason = useState(cart.reason ?? Reason.none);
          final errorState = useState<String>('');

          // useEffect(() {
          //   ref
          //       .read(uploadImageUseCaseProvider)
          //       .getUploadedImages(cart.storeId.toString(), cart.trCartId!);
          // }, [cart.trCartId]);

          Future<void> submit() async {
            if (formKey.currentState!.validate()) {
              final FormState? form = formKey.currentState;
              if (selectedReason.value == Reason.none) {
                errorState.value = 'Please select item status.';
                return;
              } else if (selectedReason.value != Reason.missing &&
                  selectedReason.value != Reason.newListing) {
                if (cart.uploadedImages != null &&
                    cart.uploadedImages!.isEmpty) {
                  errorState.value = 'Please take a picture.';
                  return;
                }
              }

              errorState.value = '';
              if (form!.validate()) {
                final updatedCart = await ref
                    .read(cartDetailNotifierProvider.notifier)
                    .updateCartRequirement(cart.trCartId!, selectedReason.value,
                        justification.value);
                if (updatedCart != null && updatedCart!.errorMessage != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(updatedCart.errorMessage!),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                } else {
                  cart = cart.copyWith(
                    reason: selectedReason.value,
                    justification: justification.value,
                  );
                  await ref
                      .read(cartNotifierProvider.notifier)
                      .updateState(index, cart);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Success message'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.pop(context);
                  });
                }
              }
            }
          }

          return Theme(
            data: Theme.of(context).copyWith(
              splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
              dialogBackgroundColor: Colors.transparent,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  title: const Text(
                    'Reason Request',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Form(
                      key: formKey,
                      child:
                          // ref.watch(cartDetailFutureProvider).when(
                          //       data: (data) =>
                          Column(
                        mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          cart.requireJustify != null && cart.requireJustify!
                              ? Text(
                                  'Justification : ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor),
                                )
                              : const SizedBox.shrink(),
                          cart.requireJustify != null && cart.requireJustify!
                              ? TextFormField(
                                  // controller: justificationController,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  maxLength: 250,
                                  maxLines: 3,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter justification.';
                                    }
                                    justification.value = value;
                                    return null;
                                  },
                                  initialValue: justification.value,
                                )
                              : const SizedBox.shrink(),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 16),
                          //   child: Divider(
                          //     height: 1,
                          //     color: Colors.grey.shade300,
                          //   ),
                          // ),
                          Text(
                            'Reason : ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          RadioListTile<Reason>(
                            dense: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            title: Text(
                              'New Listing',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: selectedReason.value == Reason.newListing
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                            value: Reason.newListing,
                            groupValue: selectedReason.value,
                            onChanged: (Reason? value) {
                              selectedReason.value = value!;
                            },
                            controlAffinity: ListTileControlAffinity.trailing,
                            selectedTileColor: Theme.of(context).primaryColor,
                          ),
                          RadioListTile<Reason>(
                            dense: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            title: Text(
                              'Depleted',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: selectedReason.value == Reason.depleted
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                            value: Reason.depleted,
                            groupValue: selectedReason.value,
                            onChanged: (Reason? value) {
                              selectedReason.value = value!;
                            },
                            controlAffinity: ListTileControlAffinity.trailing,
                            selectedTileColor: Theme.of(context).primaryColor,
                          ),
                          RadioListTile<Reason>(
                            dense: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            title: Text(
                              'Damaged',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: selectedReason.value == Reason.damaged
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                            value: Reason.damaged,
                            groupValue: selectedReason.value,
                            onChanged: (Reason? value) {
                              selectedReason.value = value!;
                            },
                            controlAffinity: ListTileControlAffinity.trailing,
                            selectedTileColor: Theme.of(context).primaryColor,
                          ),
                          RadioListTile<Reason>(
                            dense: false,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 8),
                            title: Text(
                              'Missing',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                                color: selectedReason.value == Reason.missing
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                            value: Reason.missing,
                            groupValue: selectedReason.value,
                            onChanged: (Reason? value) {
                              selectedReason.value = value!;
                            },
                            controlAffinity: ListTileControlAffinity.trailing,
                            selectedTileColor: Theme.of(context).primaryColor,
                          ),
                          selectedReason.value != Reason.none &&
                                  selectedReason.value != Reason.missing &&
                                  selectedReason.value != Reason.newListing
                              ? PreviewCameraImageWidget(cartId: cart.trCartId!)
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: submit,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor),
                                ),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          if (errorState.value.isNotEmpty)
                            Text(
                              errorState.value,
                              style: const TextStyle(color: Colors.red),
                            ),
                          const SizedBoxHeight(),
                        ],
                      ),
                      // loading: () => const Center(
                      //   child: CircularProgressIndicator(),
                      // ),
                      // error: (error, stackTrace) => Center(
                      //   child: Text(
                      //     error.toString().replaceAll('Exception: ', ''),
                      //     style: const TextStyle(color: Colors.red),
                      //   ),
                      // ),
                      // ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
