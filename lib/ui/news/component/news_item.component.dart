import 'package:flutter/material.dart';
import 'package:newz_app/domain/news/entity/news.entity.dart';

class NewsItem extends StatelessWidget {
  final NewsEntity newsEntity;
  final VoidCallback? onTap;
  final String _urlDefault = "https://t3.ftcdn.net/jpg/03/07/93/88/360_F_307938835_NChzYE26DIyfzHdAdW722BTaOnjaHSqV.jpg";
  const NewsItem({Key? key, required this.newsEntity, this.onTap}) : super(key: key);

  _titleText(title){
    return Text(newsEntity.title.toString(), 
      maxLines: 2, 
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
      );
  }

  _descText(desc){
    if(desc != null){
      return Text(newsEntity.description.toString(), 
        maxLines: 4, 
        overflow: TextOverflow.ellipsis,
      );
    }
    return Container();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      _titleText(newsEntity.title),
                      SizedBox(height: 8),
                      _descText(newsEntity.description)
                    ],
                  ),
                ),
              ),
              Container(
                width: 64.0,
                height: 64.0,
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(8.0),
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: new NetworkImage(newsEntity.urlToImage != null ? newsEntity.urlToImage! : _urlDefault),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
