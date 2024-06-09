import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/firebase_api.dart';
import 'package:hayat/controller/network_controller.dart';
import 'package:hayat/data/models/response/ads_response.dart';
import 'package:hayat/data/models/response/all_plants_response.dart';
import 'package:hayat/data/models/response/contact_us_response.dart';
import 'package:hayat/data/models/response/delete_account_reason_response.dart';
import 'package:hayat/data/models/response/gallery_response.dart';
import 'package:hayat/data/models/response/login_response.dart';
import 'package:hayat/data/models/response/pages_content_response.dart';
import 'package:hayat/data/models/response/sponsers_response.dart';
import 'package:hayat/data/models/response/team_members_response.dart';
import 'package:hayat/data/models/response/trips_response.dart';
import 'package:hayat/data/repository/ad_repo.dart';
import 'package:hayat/data/repository/auth_repo.dart';
import 'package:hayat/data/repository/gallery_repo.dart';
import 'package:hayat/data/repository/page_content_repo.dart';
import 'package:hayat/data/repository/plants_repo.dart';
import 'package:hayat/data/repository/trips_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class InitController extends GetxController {
  LoginResponse? userData = LoginResponse();
  PageRepo pageRepo = PageRepo();
  PlantsRepo plantsRepo = PlantsRepo();
  AuthRepo authRepo = AuthRepo();
  GalleryRpeo galleryRpeo = GalleryRpeo();
  PagesContentResponse pages = PagesContentResponse();
  GalleryResponse images = GalleryResponse();
  ContactUsResponse details = ContactUsResponse();
  TeamMembersResponse teamMembers = TeamMembersResponse();
  SponsersResponse sponsers = SponsersResponse();
  TripsResponse trips = TripsResponse();
  TripsRepo tripsRepo = TripsRepo();
  AllPlantsResponse plantsByLetter = AllPlantsResponse();
  AdsResponse ads = AdsResponse();
  RxBool isAdsReady = false.obs;
  AdRepo adRepo = AdRepo();
  RxBool isTripsReady = false.obs;
  RxBool isGalleryReady = false.obs;
  RxBool isAuthenticated = false.obs;
  bool isConnected = false;
  final NetworkController _networkController = Get.put(NetworkController());

  final String? ff = FirebaseApi.fcmToken;

  tripsReady() {
    isTripsReady.toggle();
    update();
  }

  GalleryReady() {
    isGalleryReady.toggle();
    update();
  }

  getAdsRequest() {
    adRepo.getAds().then((value) {
      if (value.message == 'all ads') {
        ads = AdsResponse.fromJson(value.data);
        isAdsReady.toggle();
        update();
        print(' isAdsReady.value');
        print(isAdsReady.value);
      }
    });
  }

  DeleteAccountReasonResponse reasons = DeleteAccountReasonResponse();

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: mediumText,
        timeInSecForIosWeb: 50);
  }

  getPagesContentRequest() {
    pageRepo.getPagesContent().then((value) {
      print(value.status);
      if (value.status == 200) {
        pages = PagesContentResponse.fromJson(value.data);
      }
    });
  }

  getGalleryImagesRequest() {
    print('object');
    galleryRpeo.getGalleryImages('1').then((value) {
      if (value.status == 200) {
        print('gallery');
        GalleryReady();
        images = GalleryResponse.fromJson(value.data);
      }
    });
  }

  getContactUsRequest() {
    pageRepo.getContactUsDetails().then((value) {
      if (value.status == 200) {
        details = ContactUsResponse.fromJson(value.data);
      }
    });
  }

  getTeamMembersRequest(String id) async {
    pageRepo.getTeamMembers(id).then((value) {
      if (value.status == 200) {
        teamMembers = TeamMembersResponse.fromJson(value.data);
      }
    });
  }

  getSponsersRequest() async {
    pageRepo.getSponsers('1').then((value) {
      if (value.status == 200) {
        sponsers = SponsersResponse.fromJson(value.data);
      }
    });
  }

  getAllTrips() {
    tripsRepo.getAllTrips('1').then((value) {
      if (value.status == 200) {
        tripsReady();
        print('all trips');
        trips = TripsResponse.fromJson(value.data);
      }
    });
  }

  getInitialData() async {
    if (await _networkController.get().checkConnectivity() ==
            ConnectivityResult.wifi ||
        await _networkController.get().checkConnectivity() ==
            ConnectivityResult.mobile) {
      getGalleryImagesRequest();
      getPagesContentRequest();
      getContactUsRequest();
      getSponsersRequest();
      getTeamMembersRequest('1');
      getAllTrips();
      getAdsRequest();
      userData = await AppStorage.getUserInfoFromSharedPreferences();
    } else {
      validation('Please check your internet connection', red);
    }
  }

  FirebaseApi firebaseApi = FirebaseApi();

  updateToken() async {
    if (await AppStorage.getAuthState()) {
      String fcmToken = await firebaseApi.getFCMToken();
      authRepo.updateToken(fcmToken, userData!.token!).then((value) {
        print("value.status");
        print(value.status);
      });
    }
  }

  updateUserInfo(String fullName, String mobileNumber) {
    userData!.user!.fullName = fullName;
    userData!.user!.mobileNumber = mobileNumber;
    update();
  }

  @override
  void onInit() async {
    getInitialData();
    print(await AppStorage.getToken());
    updateToken();

    super.onInit();
  }
}
