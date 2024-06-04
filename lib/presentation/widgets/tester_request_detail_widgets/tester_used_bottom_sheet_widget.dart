import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/themes/input_theme.dart';
import 'package:tr_app/presentation/widgets/shared/preview_camera_image_widget.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

class TesterUsedButtonWidget extends StatelessWidget {
  const TesterUsedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showTesterUsedModalBottomSheet(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'Request',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void showTesterUsedModalBottomSheet(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  // final reasonStateProvider = Provider<Reason>((ref) => Reason.none);

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
          final reasonState = useState(Reason.none);
          final errorState = useState<String>('');
          // final images = ref.watch(uploadedImagesProvider);

          void submit() {
            // if (formKey.currentState!.validate()) {}
            // final FormState? form = formKey.currentState;
            // if (reasonState.value == Reason.none) {
            //   errorState.value = 'Please select item status.';
            // } else if (images.isEmpty) {
            //   errorState.value = 'Please take a picture.';
            // } else {
            //   errorState.value = '';
            //   if (form!.validate()) {}
            // }
          }

          return Theme(
            data: Theme.of(context).copyWith(
              splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            child: Form(
              key: formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: const Text(
                          'Reason Request',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        trailing: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ),
                      PreviewCameraImageWidget(
                          cartId: 0, setUploading: () => {}),
                      RadioListTile<Reason>(
                        title: Text(
                          'Depleted',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: reasonState.value == Reason.depleted
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        ),
                        value: Reason.depleted,
                        groupValue: reasonState.value,
                        onChanged: (Reason? value) {
                          reasonState.value = value!;
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                        selectedTileColor: Theme.of(context).primaryColor,
                      ),
                      RadioListTile<Reason>(
                        title: Text(
                          'Damaged',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: reasonState.value == Reason.damaged
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        ),
                        value: Reason.damaged,
                        groupValue: reasonState.value,
                        onChanged: (Reason? value) {
                          reasonState.value = value!;
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                        selectedTileColor: Theme.of(context).primaryColor,
                      ),
                      RadioListTile<Reason>(
                        title: Text(
                          'Missing',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: reasonState.value == Reason.missing
                                ? Theme.of(context).primaryColor
                                : Colors.black,
                          ),
                        ),
                        value: Reason.missing,
                        groupValue: reasonState.value,
                        onChanged: (Reason? value) {
                          reasonState.value = value!;
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                        selectedTileColor: Theme.of(context).primaryColor,
                      ),
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
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
