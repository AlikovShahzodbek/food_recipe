class App {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  static const String categoryUrl = "${baseUrl}categories.php";
  static const String searchByName = "${baseUrl}search.php?s=";
  static const String mealId = "${baseUrl}lookup.php?i=";
  static const String randomMeal = "${baseUrl}random.php";
  static const filterByCotegory = "${baseUrl}filter.php?c=";
  static const String filterByArea = "${baseUrl}filter.php?a=";
  static const String filterByIngradiend = "${baseUrl}filter.php?i=";
  static const String listOfCotegorys = "${baseUrl}list.php?c=list";
  static const String listOfAreas = "${baseUrl}list.php?a=list";
  static const String listOfIngradients = "${baseUrl}list.php?i=list";
}
