
import 'package:kabarpagi/core/models/filter/filter_base_model.dart';

class FilterNewsModel extends FilterBaseModel {
  String? country;
  String? language;
  String? q;
  String? sortBy;
  int? pageSize;
  String? sources;
  FilterNewsModel({
    this.country,
    this.language,
    this.q,
    this.sortBy,
    this.pageSize,
    this.sources
  });
  
  @override
  Map<String, dynamic> toJson() {
    var param = baseJson();
    if (country != null) param['country'] = country;
    if (language != null) param['language'] = language;
    if (q != null) param['q'] = q;
    if (sortBy != null) param['sortBy'] = sortBy;
    if (pageSize != null) param['pageSize'] = pageSize;
    if (sources != null) param['sources'] = sources;
    return param;
  }
}
