import 'package:dio/dio.dart';
import 'package:tr_app/data/models/tr_model.dart';
import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/domain/services/tr_service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/dio_extension.dart';

class TrServiceImpl implements TrService {
  late Dio _dio;

  TrServiceImpl() {
    _dio = Dio();
    DioExtension.configure(_dio);
  }

  // static Future<List<Tr>> getTrs() async {

  //   final response = await http.get(Uri.parse('http://localhost:3000/trs'));
  //   if (response.statusCode == 200) {
  //     List<Tr> trs = [];
  //     for (var tr in jsonDecode(response.body)) {
  //       trs.add(Tr.fromJson(tr));
  //     }
  //     return trs;
  //   } else {
  //     throw Exception('Failed to load trs');
  //   }
  // }

  @override
  Future<bool> remove(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Tr> get(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Tr>> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Tr> getFilter(String storeId, String pluOrBarcode) async {
    try {
      Dio dio = Dio();
      DioExtension.configure(dio);

      // Map<String, dynamic> queryParameters = {
      //   "pluOrBarcode": pluOrBarcode,
      // };

      Response<dynamic> response =
          await dio.get('/mobileApi/searchProduct/$pluOrBarcode');

      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          Tr tr = TrModel.fromJson(response.data["data"]).toTr();
          return tr;
        } else {
          throw Exception(response.data["errorMessage"]);
        }
      }
      return throw Exception(response.data);
    } catch (e) {
      return throw Exception(e.toString());
    }
  }

  @override
  Future<List<Tr>> getAllFilter(String storeId, Brand brand, TrStatus? trStatus,
      String? pluOrBarcode) async {
    try {
      Map<String, dynamic> queryParameters = {
        "storeId": storeId,
        "brand": brand,
        "status": trStatus!.index,
      };

      if (pluOrBarcode != null) {
        queryParameters["pluOrBarcode"] = pluOrBarcode;
      }

      Response<dynamic> response = await _dio.get(
        '/mobileApi/trList',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        List<Tr> trList = [];

        for (var trModelJson in response.data["data"]) {
          var trModel = TrModel.fromJson(trModelJson);
          trList.add(trModel.toTr());
        }

        return trList;
      }
      return throw Exception(response.data);
    } catch (e) {
      return throw Exception(e.toString());
    }
  }

  @override
  Future<Tr> add(Tr t) {
    throw UnimplementedError();
  }

  @override
  Future<Tr> modify(Tr t) {
    throw UnimplementedError();
  }
}
