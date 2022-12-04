
class Api {
  /// Base API Endpoint
  static const _baseServer = "https://newsapi.org/v2";

  /// * -------------------
  ///  * News Endpoint
  ///  * ------------------
  ///  * In this field will exists
  ///  * some route about news
  /// */
  String getHeadlinesNews = "$_baseServer/top-headlines";
  String getNews = "$_baseServer/everything";

  /// * -------------------
  ///  * Source Endpoint
  ///  * ------------------
  ///  * In this field will exists
  ///  * some route about source
  /// */
  String getSources = "$_baseServer/top-headlines/sources";
}