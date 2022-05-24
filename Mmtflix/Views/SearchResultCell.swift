import UIKit

class SearchResultCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
        
    private let imagePoster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imagePoster)
            
    }
        
    required init?(coder: NSCoder) {
        fatalError()
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        imagePoster.frame = contentView.bounds
    }
}

extension SearchResultCell {
    
    func config(poster_path:String) {
        
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
