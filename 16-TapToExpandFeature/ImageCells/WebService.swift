//
//  WebService.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

let musicStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"

class ImageCache {
    static let shared = ImageCache()
    private init() {}
    
    var cache = NSCache<NSString, UIImage>()
    
    func getAlbums(completion: @escaping ([Album]) -> Void) {
        guard let url = URL(string: musicStr) else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            
            guard
                let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            do {
                let feed = try JSONDecoder().decode(Feed.self, from: data)
                let albums = feed.feed.results 
                completion(albums)
                for album in albums {
                    self.getImage(imageUrl: album.imageUrl, completion: {_ in })
                }
            } catch {
                // decoding error
                print("parsing error")
                print(error)
            }
            
        }.resume()
        
    }
    
    func getImage(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: imageUrl) else {
            print("invalid url")
            return
        }
        if let image = cache.object(forKey: imageUrl as NSString) {
            print("getting image from cache")
            completion(image)
            return
        }
            
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            
            guard
                let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            if let image = UIImage(data: data) {
                print("fetching image from url")
                self.cache.setObject(image, forKey: imageUrl as NSString)
                completion(image)
            } else {
                completion(nil)
            }

        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            task.resume()
        }
        
    }
}
