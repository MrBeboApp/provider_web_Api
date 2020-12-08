import 'package:dio/dio.dart';
import 'package:provider_webapp/Api/tweetModel.dart';
import 'package:http/http.dart' as http;



String url = "http://192.168.1.8:1337/tweets";
String LIKES_URL = "http://192.168.1.8:1337/likes/";


var header = {"Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNjA2NzU2NDkzLCJleHAiOjE2MDkzNDg0OTN9.oHP7IyItLd5nzSCsEiQiupix7pUfO2iPZEmVsHFMaBw"};


Future <List<TweetModel>> getTweetsApi() async {

    Response response = await Dio().get(url);


    if(response.statusCode == 200){
      List <TweetModel> tweets = [];

      for(var tweet in response.data){

        tweets.add(TweetModel.fromJson(tweet));

    }

      return tweets;
    }
    else{
      print(response.statusMessage);
    }


}


Future likeFunction(String twwetId) async {

  http.Response response = await http.post(LIKES_URL ,headers: header,body: {
    "tweet":twwetId
  });

  switch(response.statusCode){
    case 200:
      {
        print("You like this tweet");
        //ids.add(widget.tweet.id);

        http.Response response = await http.put(url+twwetId ,headers: header,body: {
          "liked":1.toString()
        });
        break;

      }

    case 420:
      {
        String tweetId = twwetId;
        http.Response response = await http.delete(LIKES_URL + tweetId ,headers: header);


        if(response.statusCode==200){

          http.Response response = await http.put(url+twwetId  ,headers: header,body: {
            "liked":0.toString()
          });
        }




        //ids.remove(widget.tweet.id);
        break;

      }

    default:{
    }
  }

}
