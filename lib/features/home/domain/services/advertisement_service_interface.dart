import 'package:eliyah_express/common/enums/data_source_enum.dart';
import 'package:eliyah_express/features/home/domain/models/advertisement_model.dart';

abstract class AdvertisementServiceInterface {
  Future<List<AdvertisementModel>?> getAdvertisementList(DataSourceEnum source);
}