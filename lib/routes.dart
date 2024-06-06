import 'package:get/get.dart';
import 'package:hayat/views/account_page/binding.dart';
import 'package:hayat/views/account_page/index.dart';
import 'package:hayat/views/ad_page/binding.dart';
import 'package:hayat/views/ad_page/index.dart';
import 'package:hayat/views/add_post_page/binding.dart';
import 'package:hayat/views/add_post_page/index.dart';
import 'package:hayat/views/add_question_page/binding.dart';
import 'package:hayat/views/add_question_page/index.dart';
import 'package:hayat/views/by_color_page/binding.dart';
import 'package:hayat/views/by_color_page/index.dart';
import 'package:hayat/views/by_letters_page/binding.dart';
import 'package:hayat/views/by_letters_page/index.dart';
import 'package:hayat/views/color_page/binding.dart';
import 'package:hayat/views/color_page/index.dart';
import 'package:hayat/views/contanct_us_page/binding.dart';
import 'package:hayat/views/contanct_us_page/index.dart';
import 'package:hayat/views/delete_account_page/binding.dart';
import 'package:hayat/views/delete_account_page/index.dart';
import 'package:hayat/views/delete_account_report_page/binding.dart';
import 'package:hayat/views/delete_account_report_page/index.dart';
import 'package:hayat/views/edit_account/binding.dart';
import 'package:hayat/views/edit_account/index.dart';
import 'package:hayat/views/feed_details_page/binding.dart';
import 'package:hayat/views/feed_details_page/index.dart';
import 'package:hayat/views/feeds_page/binding.dart';
import 'package:hayat/views/feeds_page/index.dart';
import 'package:hayat/views/filter_by_page/binding.dart';
import 'package:hayat/views/filter_by_page/index.dart';
import 'package:hayat/views/filter_page/binding.dart';
import 'package:hayat/views/filter_page/index.dart';
import 'package:hayat/views/forgot_password_page/binding.dart';
import 'package:hayat/views/forgot_password_page/index.dart';
import 'package:hayat/views/gallery_page/binding.dart';
import 'package:hayat/views/gallery_page/index.dart';
import 'package:hayat/views/hayat_page/binding.dart';
import 'package:hayat/views/hayat_page/index.dart';
import 'package:hayat/views/home_page/binding.dart';
import 'package:hayat/views/home_page/index.dart';
import 'package:hayat/views/introduction_page/binding.dart';
import 'package:hayat/views/introduction_page/index.dart';
import 'package:hayat/views/login_page/binding.dart';
import 'package:hayat/views/login_page/index.dart';
import 'package:hayat/views/main_page/binding.dart';
import 'package:hayat/views/main_page/index.dart';
import 'package:hayat/views/my_feeds_page/binding.dart';
import 'package:hayat/views/my_feeds_page/index.dart';
import 'package:hayat/views/my_questions_page/binding.dart';
import 'package:hayat/views/my_questions_page/index.dart';
import 'package:hayat/views/our_team_page/binding.dart';
import 'package:hayat/views/our_team_page/index.dart';
import 'package:hayat/views/plant_page/index.dart';
import 'package:hayat/views/platform_signup_page/binding.dart';
import 'package:hayat/views/platform_signup_page/index.dart';
import 'package:hayat/views/post_page/binding.dart';
import 'package:hayat/views/post_page/index.dart';
import 'package:hayat/views/post_report_page/binding.dart';
import 'package:hayat/views/post_report_page/index.dart';
import 'package:hayat/views/privacy_policies_page/binding.dart';
import 'package:hayat/views/privacy_policies_page/index.dart';
import 'package:hayat/views/question_details_page/binding.dart';
import 'package:hayat/views/question_details_page/index.dart';
import 'package:hayat/views/signup_page/binding.dart';
import 'package:hayat/views/signup_page/index.dart';
import 'package:hayat/views/splash/index.dart';
import 'package:hayat/views/sponsers_page/binding.dart';
import 'package:hayat/views/sponsers_page/index.dart';
import 'package:hayat/views/terms_conditions_page/binding.dart';
import 'package:hayat/views/terms_conditions_page/index.dart';
import 'package:hayat/views/trip_page/binding.dart';
import 'package:hayat/views/trip_page/index.dart';
import 'package:hayat/views/trips_page/binding.dart';
import 'package:hayat/views/trips_page/index.dart';
import 'package:hayat/views/weather_page/binding.dart';
import 'package:hayat/views/weather_page/index.dart';
import 'views/splash/binding.dart';

abstract class AppRouting {
  static List<GetPage> routes() => [
        GetPage(
          name: Pages.splash.value,
          page: () => SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Pages.mainPage.value,
          page: () => MainPage(),
          binding: MainPageBinding(),
        ),
        GetPage(
          name: Pages.loginPage.value,
          page: () => LoginPage(),
          binding: LoginBindind(),
        ),
        GetPage(
          name: Pages.adPage.value,
          page: () => AdPage(),
          binding: AdBinding(),
        ),
        GetPage(
          name: Pages.signupPage.value,
          page: () => SignupPage(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: Pages.forgotpasswordPage.value,
          page: () => ForgotpasswordPage(),
          binding: ForgotpasswordBinding(),
        ),
        GetPage(
          name: Pages.platformsignup.value,
          page: () => PlatformSignupPage(),
          binding: PlatformSignupBinding(),
        ),
        GetPage(
          name: Pages.homePage.value,
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Pages.filterPage.value,
          page: () => FilterPage(),
          binding: FilterBinding(),
        ),
        GetPage(
          name: Pages.bycolorPage.value,
          page: () => ByColorPage(),
          binding: ByColorBindind(),
        ),
        GetPage(
          name: Pages.colorPage.value,
          page: () => ColorPage(),
          binding: ColorBinding(),
        ),
        GetPage(
          name: Pages.introductionPage.value,
          page: () => IntroductionPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: Pages.filterbyPage.value,
          page: () => FilterByPage(),
          binding: FilterByBinding(),
        ),
        GetPage(
          name: Pages.plantPage.value,
          page: () => PlantPage(),
          binding: FilterByBinding(),
        ),
        GetPage(
          name: Pages.bylettersPage.value,
          page: () => ByLettersPage(),
          binding: BylettersBinding(),
        ),
        GetPage(
          name: Pages.feedsPage.value,
          page: () => FeedsPage(),
          binding: FeedsBinding(),
        ),
        GetPage(
          name: Pages.postPage.value,
          page: () => PostPage(),
          binding: PostBinding(),
        ),
        GetPage(
          name: Pages.postreportPage.value,
          page: () => PostReportPage(),
          binding: PostReportBinding(),
        ),
        GetPage(
          name: Pages.addpostPage.value,
          page: () => AddPostPage(),
          binding: AddPostBinding(),
        ),
        GetPage(
          name: Pages.hayatPage.value,
          page: () => HayatPage(),
          binding: HayatBinding(),
        ),
        GetPage(
          name: Pages.ourteamPage.value,
          page: () => OurTeamPage(),
          binding: OurTeamBinding(),
        ),
        GetPage(
          name: Pages.galleryPage.value,
          page: () => GalleryPage(),
          binding: GalleryBinding(),
        ),
        GetPage(
            name: Pages.tripsPage.value,
            page: () => TripsPage(),
            binding: TripsBinding()),
        GetPage(
            name: Pages.tripPage.value,
            page: () => TripPage(),
            binding: TripBinding()),
        GetPage(
            name: Pages.sponsersPage.value,
            page: () => SponsersPage(),
            binding: SponsersBinding()),
        GetPage(
            name: Pages.contactusPage.value,
            page: () => ContactUsPage(),
            binding: ContactUsBinding()),
        GetPage(
            name: Pages.weatherPage.value,
            page: () => WeatherPage(),
            binding: WeatherBinding()),
        GetPage(
            name: Pages.accountPage.value,
            page: () => AccountPage(),
            binding: AccountBinding()),
        GetPage(
            name: Pages.editaccountPage.value,
            page: () => EditAccountPage(),
            binding: EditAccountBinding()),
        GetPage(
            name: Pages.deleteaccountPage.value,
            page: () => DeleteAccountPage(),
            binding: DeleteAccountBinding()),
        GetPage(
            name: Pages.myquestionsPage.value,
            page: () => MyQuestionsPage(),
            binding: MyQuestionsBinding()),
        GetPage(
            name: Pages.questiondetailsPage.value,
            page: () => QuestionDetailsPage(),
            binding: QuestionDetailsBinding()),
        GetPage(
            name: Pages.myfeedsPage.value,
            page: () => MyFeedsPage(),
            binding: MyFeedsBinding()),
        GetPage(
            name: Pages.addquestionPage.value,
            page: () => AddQuestionPage(),
            binding: AddQuestionBinding()),
        GetPage(
            name: Pages.feeddetailsPage.value,
            page: () => FeedDetailsPage(),
            binding: FeedDetailsBinding()),
        GetPage(
            name: Pages.termsconditionsPage.value,
            page: () => TermsConditionsPage(),
            binding: TermsConditionsBinding()),
        GetPage(
            name: Pages.privacypoliciesPage.value,
            page: () => PrivacyPoliciesPage(),
            binding: PrivacyPoliciesBinding()),
        GetPage(
          name: Pages.deleteaccountreportPage.value,
          page: () => DeleteAccountReportPage(),
          binding: DeleteAccountReportBinding(),
        )
      ];
}

enum Pages {
  splash,
  mainPage,
  loginPage,
  adPage,
  signupPage,
  forgotpasswordPage,
  platformsignup,
  homePage,
  filterPage,
  bycolorPage,
  colorPage,
  introductionPage,
  filterbyPage,
  plantPage,
  bylettersPage,
  feedsPage,
  postPage,
  postreportPage,
  addpostPage,
  hayatPage,
  ourteamPage,
  galleryPage,
  tripsPage,
  tripPage,
  sponsersPage,
  contactusPage,
  weatherPage,
  accountPage,
  editaccountPage,
  deleteaccountPage,
  deleteaccountreportPage,
  myquestionsPage,
  questiondetailsPage,
  myfeedsPage,
  addquestionPage,
  feeddetailsPage,
  termsconditionsPage,
  privacypoliciesPage,
}

extension PagesExtension on Pages {
  String get value {
    switch (this) {
      case Pages.splash:
        return '/splashPage';
      case Pages.mainPage:
        return '/mainPage';
      case Pages.loginPage:
        return '/loginPage';
      case Pages.adPage:
        return '/adPage';
      case Pages.signupPage:
        return '/signupPage';
      case Pages.forgotpasswordPage:
        return '/forgotpasswordPage';
      case Pages.platformsignup:
        return '/platformsignupPage';
      case Pages.homePage:
        return '/homePage';
      case Pages.filterPage:
        return '/filterPage';
      case Pages.bycolorPage:
        return '/bycolorPage';
      case Pages.colorPage:
        return '/colorPage';
      case Pages.introductionPage:
        return '/introductionPage';
      case Pages.filterbyPage:
        return '/filterbyPage';
      case Pages.plantPage:
        return '/plantPage';
      case Pages.bylettersPage:
        return '/bylettersPage';
      case Pages.feedsPage:
        return '/feedsPage';
      case Pages.postPage:
        return '/postPage';
      case Pages.postreportPage:
        return '/postreportPage';
      case Pages.addpostPage:
        return '/addpostPage';
      case Pages.hayatPage:
        return '/hayatPage';
      case Pages.ourteamPage:
        return '/ourteamPage';
      case Pages.galleryPage:
        return '/galleryPage';
      case Pages.tripsPage:
        return '/tripsPage';
      case Pages.tripPage:
        return '/tripPage';
      case Pages.sponsersPage:
        return '/sponsersPage';
      case Pages.contactusPage:
        return '/contactusPage';
      case Pages.weatherPage:
        return '/weatherPage';
      case Pages.accountPage:
        return '/accountPage';
      case Pages.editaccountPage:
        return '/editaccountPage';
      case Pages.deleteaccountPage:
        return '/deleteaccountPage';
      case Pages.myquestionsPage:
        return '/myquestionsPage';
      case Pages.questiondetailsPage:
        return '/questiondetailsPage';
      case Pages.myfeedsPage:
        return '/myfeedsPage';
      case Pages.addquestionPage:
        return '/addquestionPage';
      case Pages.feeddetailsPage:
        return '/feeddetailsPage';
      case Pages.termsconditionsPage:
        return '/termsconditionsPage';
      case Pages.privacypoliciesPage:
        return '/privacypoliciesPage';
        case Pages.deleteaccountreportPage:
        return '/deleteaccountreportPage';
      default:
        throw 'unnamed route';
    }
  }
}

abstract class Navigation {
  static Pages? getPage(String route) {
    switch (route) {
      case '/mainPage':
        return Pages.mainPage;
      case '/splashPage':
        return Pages.splash;
      case '/loginPage':
        return Pages.loginPage;
      case '/adPage':
        return Pages.adPage;
      case '/signupPage':
        return Pages.signupPage;
      case '/forgotpasswordPage':
        return Pages.forgotpasswordPage;
      case '/platformsignupPage':
        return Pages.platformsignup;
      case '/homePage':
        return Pages.homePage;
      case '/filterPage':
        return Pages.filterPage;
      case '/bycolorPage':
        return Pages.bycolorPage;
      case '/colorPage':
        return Pages.colorPage;
      case '/introductionPage':
        return Pages.introductionPage;
      case '/filterbyPage':
        return Pages.filterbyPage;
      case '/plantPage':
        return Pages.plantPage;
      case '/bylettersPage':
        return Pages.bylettersPage;
      case '/postPage':
        return Pages.postPage;
      case '/postreportPage':
        return Pages.postreportPage;
      case '/feedsPage':
        return Pages.feedsPage;
      case '/addpostPage':
        return Pages.addpostPage;
      case '/hayatPage':
        return Pages.hayatPage;
      case '/ourteamPage':
        return Pages.ourteamPage;
      case '/galleryPage':
        return Pages.galleryPage;
      case '/tripsPage':
        return Pages.tripsPage;
      case '/tripPage':
        return Pages.tripPage;
      case '/sponsersPage':
        return Pages.sponsersPage;
      case '/contactusPage':
        return Pages.contactusPage;
      case '/weatherPage':
        return Pages.weatherPage;
      case '/accountPage':
        return Pages.accountPage;
      case '/editaccountPage':
        return Pages.editaccountPage;
      case '/deleteaccountPage':
        return Pages.deleteaccountPage;
      case '/myquestionsPage':
        return Pages.myquestionsPage;
      case '/questiondetailsPage':
        return Pages.questiondetailsPage;
      case '/myfeedsPage':
        return Pages.myfeedsPage;
      case '/addquestionPage':
        return Pages.addquestionPage;
      case '/feeddetailsPage':
        return Pages.feeddetailsPage;
      case '/termsconditionsPage':
        return Pages.termsconditionsPage;
      case '/privacypoliciesPage':
        return Pages.privacypoliciesPage;
        case '/deleteaccountreportPage':
        return Pages.deleteaccountreportPage;

      default:
        return null;
    }
  }
}
