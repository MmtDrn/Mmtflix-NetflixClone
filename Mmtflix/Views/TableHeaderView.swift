import UIKit

class TableHeaderView: UIView {
    
    public var movie:Movie?
    
    private let headerImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Mmtflix")
        
        return imageView
    }()
    
    private func addGradient() {
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(headerImageView)
        addGradient()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(movie:Movie) {
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")") {
        
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let data = data {
                        self.headerImageView.image = UIImage(data: data)!
                    }
                }
            }
        }
    }

}
