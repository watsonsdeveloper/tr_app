import 'package:flutter/material.dart';
import 'package:tr_app/ui/themes/input_theme.dart';
import 'package:tr_app/ui/widgets/tester_request_detail_widgets/tester_used_bottom_sheet_widget.dart';

class RequestItemDetailPage extends StatelessWidget {
  final String productCode;
  final String supplierCode;
  final String supplierName;
  final String imageUrl;

  const RequestItemDetailPage({
    Key? key,
    required this.productCode,
    required this.supplierCode,
    required this.supplierName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Image.network(
                  imageUrl,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 48),
                BuildItemDetailRow(label: 'Product Code', value: productCode),
                const SizedBoxHeight(),
                BuildItemDetailRow(label: 'Supplier Code', value: supplierCode),
                const SizedBoxHeight(),
                BuildItemDetailRow(label: 'Supplier Name', value: supplierName),
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
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

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
