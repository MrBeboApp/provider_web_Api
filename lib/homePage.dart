
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_webapp/Api/tweetModel.dart';
import 'package:provider_webapp/Providers/TweetDetails.dart';
import 'package:provider_webapp/Providers/tweetsProvider.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 900,
            child: FutureBuilder(
              future: Provider.of<TweetsProvider>(context,listen: true).getTweetsApi(),
                builder: (context,snapchot){

                if(snapchot.data!=null){

                  List<TweetModel> tweets = snapchot.data;

                  return Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: tweets.length,
                        itemBuilder: (context,index){
                        print(tweets[index].liked);

                      return twwetCard(context,tweets[index]);
                    }),
                  );
                }

                return Container();

            }),
          )
        ],
      )
    );
  }

  Widget twwetCard( BuildContext context,TweetModel tweet){

    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TweetDetails(tweet,context)));
            },
              child: Image.network("http://192.168.1.9:1337"+ tweet.image)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(tweet.description,style: TextStyle(color: Colors.white),),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton.icon(onPressed: (){
            Provider.of<TweetsProvider>(context,listen: false).likeFunction(tweet.id.toString());
          }, icon: (tweet.liked=="0")?Icon(Icons.favorite,color: Colors.black,):Icon(Icons.favorite,color: Colors.redAccent,), label: Text(tweet.likes.toString() + " Likes")),


        ) ],
    );
          }
}
class TweetDetails extends StatelessWidget {
  TweetModel tweet;
  BuildContext contexts;

  TweetDetails(this.tweet,this.contexts);

  @override
  Widget build(contexts) {
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

          Consumer<TweetsProvider>(builder: (context,likes,child){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton.icon(onPressed: ()async{
                await likes.likeFunction(tweet.id.toString());
              }, icon: (tweet.liked=="0")?Icon(Icons.favorite,color: Colors.black,):Icon(Icons.favorite,color: Colors.redAccent,), label: Text(tweet.likes.toString() + " Likes")),


            );

          }), ],
      ),
    );
  }
}