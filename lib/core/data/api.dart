
class Api {
  /// Base API Endpoint
  static const _baseServer = "https://newsapi.org/v2";

  /// * -------------------
  ///  * Headline News Endpoint
  ///  * ------------------
  ///  * In this field will exists
  ///  * some route about headlines
  /// */
  String getHeadlinesNews = "$_baseServer/top-headlines";
  String getNews = "$_baseServer/everything";
}