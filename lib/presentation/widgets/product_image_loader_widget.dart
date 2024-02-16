import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/providers/product_image_provider.dart';
import 'package:tr_app/presentation/widgets/shared/skeleton_loading_widgets/view_loading.dart';

class ProductImageLoader extends ConsumerWidget {
  final String plu;

  const ProductImageLoader(this.plu, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(productImageFutureProvider(plu)).when(
          data: (productImageUrl) => Image.network(
            productImageUrl,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const Icon(Icons.error, color: Colors.red, size: 52);
            },
          ),
          loading: () => const Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: ViewLoading(width: 120, height: 120),
            ),
          ),
          error: (error, stackTrace) =>
              const Icon(Icons.error, color: Colors.red, size: 52),
        );
  }
}
