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
    
    var albums: [Album] = [] {
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
            self.albums = albums
        }
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as? AlbumCell) else {
            #warning("Problem #2 - Memory Leak:")
//                - TableView holds strong references to cell
//                - Cell holds strong reference back to TableView
//                - Neither can be remove from memory even when the ViewController is gone
//                - Make one reference `weak` or `unowned`
            return UITableViewCell()
        }
        let album = albums[indexPath.row]
        cell.tableViewMoreInfoDelegate = tableView
        cell.configure(album: album)
        
        return cell
    }
    
    
}
extension UITableView: TableViewMoreInfoDelegate {
    #warning("Add data from delegate here? (Problem #2)")
}
