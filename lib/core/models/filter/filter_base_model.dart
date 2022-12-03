

abstract class FilterBaseModel {
  int? page;
  int? perPage;

  Map<String,dynamic> toJson();
  Map<String, dynamic> baseJson() {
    var param = <String, dynamic>{};
    
    if (perPage != null) {
      param['per_page'] = perPage;
    }
    if (page != null) {
      param['page'] = page;
    }
    return param;
  }
}