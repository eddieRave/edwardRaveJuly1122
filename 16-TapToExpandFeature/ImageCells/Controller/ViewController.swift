//
//  ViewController.swift
//  ImageCells
//
//  Created by Rave Bizz on 5/3/22.
//

import UIKit

var count = 0

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // Pass in array of ViewModel instead of Album,
        // the ViewModel will initilize an Album
    var albumsArray: [AlbumData] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "AlbumCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AlbumCell")
        tableView.dataSource = self
        getData()
    }

    deinit {
        print("Music list VC deinit")
    }
    
    func getData() {
        ImageCache.shared.getAlbums { albums in
            // Unable to assign it like this:
//            self.albumsArray = albums
            // I get the following error: Cannot assign value of type '[Album]' to type '[AlbumData]'
            
            // Use .map to transform each albums type and create a new array
            self.albumsArray = albums.map { album in
                AlbumData(albumInit: album)
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albumsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as? AlbumCell) else {
            return UITableViewCell()
        }
        let album = albumsArray[indexPath.row]
        cell.tableViewMoreInfoDelegate = tableView
        cell.configure(album: album)
        return cell
    }
}

extension UITableView: TableViewMoreInfoDelegate {
    // Should this be empty?
}
