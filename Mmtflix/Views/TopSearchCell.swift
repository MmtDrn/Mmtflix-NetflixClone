import UIKit

class TopSearchCell: UITableViewCell {

    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func buttunPlay(_ sender: Any) {
    }
    
}

extension TopSearchCell {
    
    func config(model:Model) {
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.poster_path!)") {
        
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let data = data {
                        self.imagePoster.image = UIImage(data: data)!
                    }
                }
            }
        }
        
        self.labelTitle.text = model.title!
    }
}
