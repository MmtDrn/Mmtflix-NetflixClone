import UIKit

protocol PHomeTableviewCell {
    func detailConfig(_ cell:HomeTableviewCell, movie:Movie)
}

class HomeTableviewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var movies = [Movie]()
    
    var delegate:PHomeTableviewCell?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        itemSize()
        
    }

    func itemSize(){
        collectionView.frame = contentView.bounds
        let design:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        design.itemSize = CGSize(width: 140, height: 180)
        design.scrollDirection = .horizontal
        design.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.collectionViewLayout = design
    }
    
    public func configure (movies:[Movie]) {
        self.movies = movies
    }
}
extension HomeTableviewCell: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let movie = movies[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! TableColletionCell
        
        cell.setImage(poster_path: movie.poster_path!)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie = movies[indexPath.row]
        self.delegate?.detailConfig(self, movie: movie)
    }
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {

        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: nil)
        return config
    }
}
