import 'package:eliyah_express/interfaces/repository_interface.dart';
import 'package:eliyah_express/util/html_type.dart';

abstract class HtmlRepositoryInterface extends RepositoryInterface {
  Future<dynamic> getHtmlText(HtmlType htmlType);
}