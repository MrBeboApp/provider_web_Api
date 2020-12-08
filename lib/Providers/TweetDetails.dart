import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_webapp/Api/tweetModel.dart';
import 'package:provider_webapp/Providers/tweetsProvider.dart';

class TweetDetails extends StatelessWidget {
  TweetModel tweet;

  TweetDetails(this.tweet);

  @override
  Widget build(BuildContext context) {
    return Consumer<TweetsProvider>(builder: (context,likesFn,child){
      return Scaffold(
        appBar: AppBar(),
        body: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network("http://192.168.1.9:1337"+ tweet.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(tweet.description,style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(onPressed: ()async{
                await likesFn.likeFunction(tweet.id.toString());
                likesFn.getTweetsApi();
              }, icon: (tweet.liked=="0")?Icon(Icons.favorite,color: Colors.black,):Icon(Icons.favorite,color: Colors.redAccent,), label: Text(tweet.likes.toString() + " Likes")),

            ), ],
        ),
      );
    });
  }
}
