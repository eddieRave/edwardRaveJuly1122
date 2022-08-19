import Foundation
class AvatarViewModel{

    var cellViewModels = [CellViewModel]()
    var numCharacters: Int {
        cellViewModels.count
    }
    
    func fetchData(completion: @escaping () -> Void) {
       
        Networking.shared.getAvatars { (avatarCharacters: [AvatarCharacterModel]) in
            for avatar in avatarCharacters {
                self.cellViewModels.append(CellViewModel(character: avatar))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func getCellVM(_ indexPath: IndexPath) -> CellViewModel {
        cellViewModels[indexPath.row]
    }
    
}
    



