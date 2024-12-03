import 'package:template/model/body/language_model.dart';
import 'package:template/utill/images.dart';

class AppConstants {
  //static const String baseurlImages = 'https://drgreen.wabcgroup.com';
  //static const String baseurlImages = 'https://greenhelthyapi.sacoigroup.com';
  static const String baseurlImages = 'https://192.168.0.33:6701';
  static const String baseurlTrainingVideo = 'https://192.168.0.33:6701';

 static const String baseurl = 'https://192.168.0.33:6701/api';
//static const String baseurl = 'https://greenhelthyapi.sacoigroup.com/api';
 // static const String baseurl = 'http://drgreen-api.runasp.net/api';
  static const String mapKey = 'AIzaSyBAmjYd922M3FRSi1RCVycPY33GCz1rjeY';
  static const String appName = 'Doctor Green';
  static const String arabic = 'Arabic';
  static const String english = 'English';
  static const String saveLanguage = 'SaveLanguage';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String signSuccess = 'signSuccess';
  static const String sendSuccess = 'sendSuccess';
  static const String findLanguage = 'find_language';
  static const String chooseLanguage = 'choose_language';
  static const String sendFailure = 'sendFailure';
  static const String unauthorized = 'unauthorized';
  static const String notFoundUrl = 'notFoundUrl';
  static const String notHasAuthorized = 'notHasAuthorized';
  static const String signError = 'signError';
  static const String serverFailure = 'serverFailure';
  static const String saveLocation = 'saveLocation';
  static const String userPlanIdWithPlan = 'userPlanIdWithPlan';
  static const String id = 'id';
  static const String userPlanId = 'userPlanId';
  static const String planId = 'planId';

  // Shared Key
  static const String theme = 'theme';
  static const String userId = 'UserId';
  static const String token = 'multivendor_token';
  static const String clientId = 'clientId';
  static const String havePlan = 'havePlan';
  static const String getPlan = 'getPlan';
  static const String expireOn = 'expireOn';
  static const String email = 'email';
  static const String name = 'name';
  static const String phoneNumber = 'phoneNumber';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String cratePlanDate = 'cratePlanDate';
  static const String selected = 'selected';
  static const String chosenId = 'chosenId';
  static const String customId = 'customId';
  static const String oldPassword = 'oldPassword';
  static const String commentId = 'commentId';
  static const String customerStatus = 'customerStatus';


  //genderIds
  static const int maleId = 10;
  static const int femaleId = 20;

  //fitnessLevelIds
  static const int extractiveId = 10;
  static const int veryActiveId = 20;
  static const int activeId = 30;
  static const int lowActiveId = 40;
  static const int secondaryId = 50;
  static const int leanAndToned = 10;
  static const int muscularId = 20;

//customersIds
  static const String activeCustomersId = '10';
  static const String blockedCustomersId = '20';
  static const String passiveCustomersId = '30';

  //mealsIds
  static const String breakfastId = '10';
  static const String lunchId = '20';
  static const String dinnerId = '30';
  static const String otherId = '100';

//pathImages
  static const String mealImages = '/MealDrGreenMedia/';
  static const String productImages = '/ProductImages/';
  static const String packagesImages = '/PackageImages/';
  static const String adsImages = '/AdsImages/';
  static const String PlansImages = '/PlansImages/';
  static const String mealsImages = '/FoodsImages/';
  static const String trainingProgramImages = '/TrainingProgramImages/';
  static const String trainingProgramDrGreenMedia = '/TrainingProgramDrGreenMedia/';

// endPoint
  static const String register = '/Auth/RegisterCustomerMobileApp';
  static const String login = '/Auth/login';

  //static const String resetCode = '/Auth/SendResetCode';

  static const String forgetPassword = '/Auth/ForgetPasswordSendCodeByEmail';
  static const String resetPasswordCode = '/Auth/ResetPasswordCode';
  static const String changePassword = '/Auth/changepasswordWithCode';
  static const String getAllAds = '/Ads/GetAllAds';
  static const String createPlan = '/Plan/CreatePlan/';
  static const String getAllRecommendedMeals = '/RecommendedMeal/GetAllRecommendedMeals';
  static const String getCustomerCalories = '/UsersApp/GetCustomer/';

  static const String getAllProduct = '/Product/GetAllProducts';
  static const String getAlltraining = '/TrainingProgram/GetAllTrainingVideoes';
  static const String getAllReviews = '/ReviewSection/GetAllReviewes';
  static const String addNewOrder = '/Order/AddNewOrder';
  static const String togglePackage = '/Package/TogglePackageInFavorite/';
  static const String addProductToCartItem = '/Product/AddProductToCart';



  //Packages
 static const String getAllPackages = '/Package/GetAllPackages';
 static const String togglePackageInFavourite = '/Package/TogglePackageInFavorite';
 static const String getUserFavouritePackage = '/Package/GetUserFavoritePackage';
 static const String addPackageToCart = '/Package/AddPackageToCart';
 static const String deletePackageToCart = '/Package/DeletePackageFromCart/';
 static const String getPackageById = '/Package/GetPackageById/';



 static const String getUserFavoriteProducts =
      '/Product/GetUserFavoriteProducts';
  static const String getAllUserCartItems = '/Product/GetUserCartProducts';
  static const String getPlanByCustomerId = '/Plan/GetPlanByCustomerId/';
  static const String getProductByCategoryId =
      '/Product/GetProductByCategoryId/';
  static const String getProductById = '/Product/GetProductById/';
  static const String getAllCategories = '/Category/GetAllCategories';
  static const String getAddressForCustomer = '/Address/GetAddressForCustomer';
  static const String deleteAddress = '/Address/DeleteAddress/';
  static const String listUserPlans = '/UserPlan/ListUserPlans';
  static const String getUserPlanDetails = '/UserPlan/GetUserPlanDetails';
  static const String userPlanRecommendationsAndGoals =
      '/UserPlan/UserPlanRecommendationsAndGoals';
  static const String userPlanRecommendedMealsAndFoods =
      '/UserPlan/UserPlanRecommendedMealsAndFoods';

  static const String userPlanRecommendedProducts = '/UserPlan/UserPlanRecommendedProducts';

  static const String getAllCategoryWithProducts = '/Category/GetAllCategoryWithProducts/';
  static const String gettoggleProductInFavorite = '/Product/ToggleProductInFavorite';

  // static const String getToggleProductSaveForLater = '/Product/ToggleProductSaveForLater';
  static const String getOrderById = '/Order/GetOrderById/';
  static const String deleteItemFromCart =
      '/Product/DeleteProductFromCartByProductId/';
  static const String deleteItemFromFavorite = '/Product/DeleteFavoriteItem/';

  //address
  static const String getAddressByCustomerId =
      '/Address/GetAddressByCustomerId/';
  static const String addNewAddress = '/Address/AddNewAddress';
  static const String deleteByCartId = '/Product/DeleteProductFromCart/';

  //Order
  static const String orderesforTheUser = '/Order/GetMyOrders';
 // static const String orderesforTheUser = '/Order/GetOrderesforTheUser';

  //trainingVideos
  static const String trainingVideos = '/UserPlan/UserPlanRecommendedTrainingVideos';

  //trainingVideosPost
  static const String postTrainingVideos = '/UserPlan/LogUserPlanTrainingVideos';

  //Post
  static const String userDailyWeight = '/UserPlan/LogUserDailyWeight';

  //chat
  static const String userPlanCommentsWithReplies = '/UserPlan/UserPlanCommentsWithReplies';
  static const String logUserComment = '/UserPlan/LogOrEditUserComment';
  static const String logUserReplies = '/UserPlan/LogOrEditUserReply';

//userPlan
  static const String addUserBodyDetails = '/UserPlan/AddUserBodyDetails';

  static const String logUserPlanLogs = '/UserPlan/LogUserPlanProducts';
  static const String logUserMealsAndFoodsLogs = '/UserPlan/LogUserPlanMealsAndFoods';
  static const String logUserPlansGoals = '/UserPlan/LogUserPlanGoals';
  static const String requestNewPlan = '/UserPlan/RequestPlan';

  static const String getBestSellers = '/Product/GetBestSellersProduct/';
  // static const String postRecommendationMeals = '/UserPlan/UserPlanRecommendedMealsAndFoods';
  static const String userWeightHistory = '/UserPlan/UserWeightHistory';
  static const String getUserBodyDetails = '/UserPlan/GetUserBodyDetails/';
  static const String changepassword = '/Auth/changepassword';
  //static const String getAllPackages = '/Package/GetAllPackages';


 static const String userPlanMeals = '/UserPlan/GetAllFoodsForPlanMeal';
 static const String userPlanProducts = '/UserPlan/GetAllProductsForPlanMeal';



 static const String allProductForPlan = '/UserPlan/GetAllProductsForPlan';
 static const String listProductForPlan = '/UserPlan/ListProductsForPlanMeal';

 static const String getAllUserFavorits = '/Order/GetAllUserFavorits/';
 static const String deleteItemFromFavorites = '/Product/DeleteFavoriteItem/';

 // static const String getlogsProduct = '/UserPlan/UserPlanRecommendedProducts';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.unitedKingdom,
        languageName: AppConstants.english,
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.arabic,
        languageName: AppConstants.arabic,
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
