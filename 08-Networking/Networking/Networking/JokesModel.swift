//
//  JokesModel.swift
//  Networking
//
//  Created by Rave Bizz on 7/18/22.
//

import Foundation

struct JokeModel: Decodable{
    let contents: Contents?
}

struct Jokes: Decodable{
    let joke: Joke?
}

struct Contents: Decodable{
    let jokes: [Jokes]?
}

struct Joke: Decodable{
    let text: String?
}

//<response>
//<success>
//<total>1</total>
//</success>
//<contents>
//<jokes>
//<description>Joke of the day </description>
//<language>en</language>
//<background/>
//<category>jod</category>
//<date>2022-07-18</date>
//<joke>
//<title>A bad mother</title>
//<lang>en</lang>
//<length>59</length>
//<clean>1</clean>
//<racial>0</racial>
//<date>2022-07-18</date>
//<id>9r_iViqB2a5KeDmB_WubMweF</id>
//<text>Anton, do you think I’m a bad mother? My name is Paul. </text>
//</joke>
//</jokes>
//<copyright>2019-20 https://jokes.one</copyright>
//</contents>
