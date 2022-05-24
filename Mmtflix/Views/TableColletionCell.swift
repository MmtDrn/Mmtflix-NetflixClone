import UIKit

class TableColletionCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePoster: UIImageView!
    
    
    func setImage(poster_path:String) {
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)") {
        
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let data = data {
                        self.imagePoster.image = UIImage(data: data)!
                    }
                }
            }
        }
    }
    
}
