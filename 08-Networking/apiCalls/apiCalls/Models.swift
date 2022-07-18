//
//  Models.swift
//  apiCalls
//
//  Created by Rave Bizz on 4/28/22.
//

import Foundation

struct Joke: Decodable {
    let value: String?
}
/*
 {
    "categories":[],
    "created_at":"2020-01-05 13:42:30.177068",
    "icon_url":"https://assets.chucknorris.host/img/avatar/chuck-norris.png",
    "id":"-vZWD2GgTjaf1PO7F2kgng",
    "updated_at":"2020-01-05 13:42:30.177068",
    "url":"https://api.chucknorris.io/jokes/-vZWD2GgTjaf1PO7F2kgng",
    "value":"Chuck Norris doesn't drink water he drinks sulfuric acid with a hint of lemon"
 }
 */

struct Drinks: Decodable {
    let drinks: [Drink]
    struct Drink: Decodable {
        let strDrink: String?
    }
}
/*
 {
   "drinks": [
     {
       "strDrink": "3-Mile Long Island Iced Tea",
       "strDrinkThumb": "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg",
       "idDrink": "15300"
     },
 }
 */

struct Episode: Decodable {
    let name: String?
}
/*
 [
   {
     "id": 40646,
     "url": "https://www.tvmaze.com/episodes/40646/friends-1x01-the-one-where-monica-gets-a-roommate",
     "name": "The One Where Monica Gets a Roommate",
     "season": 1,
     "number": 1,
     "type": "regular",
     "airdate": "1994-09-22",
     "airtime": "20:00",
     "airstamp": "1994-09-23T00:00:00+00:00",
     "runtime": 30,
     "rating": {
       "average": 8.4
     },
     "image": {
       "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/229/572688.jpg",
       "original": "https://static.tvmaze.com/uploads/images/original_untouched/229/572688.jpg"
     },
     "summary": "<p>Monica's old friend Rachel moves in with her after leaving her fiancé.</p>",
     "_links": {
       "self": {
         "href": "https://api.tvmaze.com/episodes/40646"
       }
     }
   },
 ]
 */

struct Music: Decodable {
    let feed: Feed
    struct Feed: Decodable {
        let results: [Result]
        struct Result: Decodable {
            let artistName: String
        }
    }
}
/*
 {
   "feed": {
     "title": "Top Albums",
     "id": "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json",
     "author": {
       "name": "Apple",
       "url": "https://www.apple.com/"
     },
     "links": [
       {
         "self": "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
       }
     ],
     "copyright": "Copyright © 2022 Apple Inc. All rights reserved.",
     "country": "us",
     "icon": "https://www.apple.com/favicon.ico",
     "updated": "Mon, 18 Jul 2022 16:45:33 +0000",
     "results": [
       {
         "artistName": "Bad Bunny",
         "id": "1622045624",
         "name": "Un Verano Sin Ti",
         "releaseDate": "2022-05-06",
         "kind": "albums",
         "artistId": "1126808565",
         "artistUrl": "https://music.apple.com/us/artist/bad-bunny/1126808565",
         "contentAdvisoryRating": "Explict",
         "artworkUrl100": "https://is5-ssl.mzstatic.com/image/thumb/Music112/v4/3e/04/eb/3e04ebf6-370f-f59d-ec84-2c2643db92f1/196626945068.jpg/100x100bb.jpg",
         "genres": [
           {
             "genreId": "12",
             "name": "Latin",
             "url": "https://itunes.apple.com/us/genre/id12"
           },
           {
             "genreId": "34",
             "name": "Music",
             "url": "https://itunes.apple.com/us/genre/id34"
           }
         ],
         "url": "https://music.apple.com/us/album/un-verano-sin-ti/1622045624"
       },
    ]
 }
 */

