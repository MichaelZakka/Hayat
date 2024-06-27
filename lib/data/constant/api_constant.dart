//endpoints

const String baseUrl = 'https://hayat.vcardtest.com/public';

const String LOGIN = '$baseUrl/api/login';
const String SIGN_UP = '$baseUrl/api/signup';
const String LOG_OUT = '$baseUrl/api/logout';
const String UPDATE_TOKEN = '$baseUrl/api/user/update-token';
const String UPDATE_USER = '$baseUrl/api/user/update-account';
const String APPLE_SIGNUP = '$baseUrl/api/apple-login';
const String DELETE_ACCOUNT = '$baseUrl/api/user/delete-account';
const String GOOGLE_SIGNUP = '$baseUrl/api/google-login';


const String ADD_QUESTION = '$baseUrl/api/questions';
const String MY_QUETIONS = '$baseUrl/api/user/questions';
const String GET_ALL_POSTS = '$baseUrl/api/posts?filter[status]=published';
const String ADD_POST = '$baseUrl/api/posts';
const String MY_POSTS = '$baseUrl/api/user/feeds';

const String WEATEHR =
    'https://api.weatherapi.com/v1/current.json?q=Kuwait&key=e568851ac9344e65b48101430242003';

const String GET_ALL_COLORS = '$baseUrl/api/colors';
const String GET_ALL_PLANTS = '$baseUrl/api/plants';

const String GET_PAGES = '$baseUrl/api/content';
const String GALLERY_IMAGES = '$baseUrl/api/gallery/images';
const String CONTACT_US = '$baseUrl/api/contact-us';
const String TEAM_MEMBERS = '$baseUrl/api/team-members';
const String SPONSERS = '$baseUrl/api/sponsors';
const String ALL_TRIPS = '$baseUrl/api/trips';

const String GET_ADS = '$baseUrl/api/ads';
const String REASONS ='$baseUrl/api/user/delete-account/reasons';
