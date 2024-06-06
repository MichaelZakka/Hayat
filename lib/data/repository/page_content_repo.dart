import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';

class PageRepo {
  MyHttpClient http = MyHttpClient();

  getPagesContent() async {
    return await http.getRequest(GET_PAGES, {}, {'Accept':'application/json'});
  }


  getContactUsDetails()async{
    return await http.getRequest(CONTACT_US,{},{'Accept':'application/json'});
  }


  getTeamMembers(String id)async{
    return await http.getRequest('$TEAM_MEMBERS?page=$id',{},{'Accept':'application/json'});
  }

  getSponsers(String id)async{
    return await http.getRequest('$SPONSERS?page=$id',{},{'Accept':'application/json'});
  }
}
