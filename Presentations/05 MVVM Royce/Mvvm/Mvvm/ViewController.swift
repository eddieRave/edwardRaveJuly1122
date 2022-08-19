
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var avatarViewModel: AvatarViewModel = AvatarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCellView()
        avatarViewModel.fetchData{
            self.collectionView.reloadData()
        }
    }
    
    func configureCellView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        avatarViewModel.numCharacters
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let avm = avatarViewModel.getCellVM(indexPath)
        cell.configure(vm: avm)
        return cell
    }
    
}
