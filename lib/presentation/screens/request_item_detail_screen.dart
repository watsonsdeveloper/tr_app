import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/providers/product_provider.dart';
import 'package:tr_app/presentation/themes/input_theme.dart';
import 'package:tr_app/presentation/widgets/tester_request_detail_widgets/tester_used_bottom_sheet_widget.dart';

class RequestItemDetailPage extends HookConsumerWidget {
  const RequestItemDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var productWatcher = ref.watch(productSNProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBoxHeight(),
                productWatcher.product!.imageUrl == null
                    ? const Icon(
                        Icons.image_not_supported,
                        size: 150,
                      )
                    : Image.network(
                        productWatcher.product!.imageUrl!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                const SizedBox(height: 48),
                BuildItemDetailRow(
                    label: 'Product Code', value: productWatcher.product!.plu),
                const SizedBoxHeight(),
                BuildItemDetailRow(
                    label: 'Product Name',
                    value: productWatcher.product!.productName),
                const SizedBoxHeight(),
                BuildItemDetailRow(
                    label: 'Supplier Code',
                    value: productWatcher.product!.supplierCode),
                const SizedBoxHeight(),
                BuildItemDetailRow(
                    label: 'Supplier Name',
                    value: productWatcher.product!.supplierName),
                const SizedBoxHeight(),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: TesterUsedButtonWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildItemDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const BuildItemDetailRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '$label : ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black26,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
