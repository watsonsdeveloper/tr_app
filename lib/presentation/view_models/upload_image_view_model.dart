import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/use_cases/upload_image_use_case.dart';
import 'package:tr_app/presentation/providers/upload_image_provider.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/error_handler.dart';

final uploadImageNotifierProvider =
    StateNotifierProvider<UploadImageNotifer, UploadImageState>((ref) {
  final user = ref.watch(userNotifierProvider).user;
  final uploadImageUseCase = ref.read(uploadImageUseCaseProvider);
  return UploadImageNotifer(user!, uploadImageUseCase);
});

class UploadImageState {
  final bool isLoading;
  final String? errorMessage;
  final List<UploadedImage>? uploadedImages;
  final int? cartId;

  UploadImageState(
      {this.isLoading = false,
      this.errorMessage,
      this.uploadedImages,
      this.cartId});

  UploadImageState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<UploadedImage>? uploadedImages,
    int? cartId,
  }) {
    return UploadImageState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      uploadedImages: uploadedImages ?? this.uploadedImages,
      cartId: cartId ?? this.cartId,
    );
  }
}

class UploadImageNotifer extends StateNotifier<UploadImageState> {
  final User _user;
  final UploadImageUseCase _uploadImageUseCase;

  UploadImageNotifer(this._user, this._uploadImageUseCase)
      : super(UploadImageState());

  void updateState() {
    state = state.copyWith(isLoading: true);
  }

  Future<List<UploadedImage>> getUploadedImages(int cartId) async {
    try {
      // TODO : check if uploadedImageList is exist in state then get from state instead of get from API network.
      final uploadedImagesIds =
          await _uploadImageUseCase.getUploadedImages(_user.storeId, cartId);
      return uploadedImagesIds;
    } catch (e) {
      state = state.copyWith(
          errorMessage: ErrorHandler.handleErrorMessage(e), isLoading: false);
      return [];
    }
  }

  Future<bool> removeUploadedImage(int cartId, int uploadedImageId) async {
    try {
      final isSuccess = await _uploadImageUseCase.removeUploadedImage(
          _user!.storeId, cartId, uploadedImageId);
      if (isSuccess) {
        state = state.copyWith(isLoading: false);
      }
      return isSuccess;
    } catch (e) {
      state = state.copyWith(
          errorMessage: ErrorHandler.handleErrorMessage(e), isLoading: false);
      return false;
    }
  }

  Future<UploadedImage?> uploadImage(int cartId, String base64Image) async {
    try {
      final uploadedImage = await _uploadImageUseCase.uploadImage(
          _user.storeId, cartId, base64Image);
      state = state.copyWith(isLoading: false);
      return uploadedImage;
    } catch (e) {
      state = state.copyWith(
          errorMessage: ErrorHandler.handleErrorMessage(e), isLoading: false);
      return null;
    }
  }
}
