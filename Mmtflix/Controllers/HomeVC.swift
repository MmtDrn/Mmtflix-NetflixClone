import UIKit

enum Sections: Int {
    case NowPlaying = 0
    case TrendingMovies = 1
    case TopRated = 2
}

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var headerView: TableHeaderView?
    
    var nowPlayingMovies = [Movie]()
    var trendingMovies = [Movie]()
    var popularMovie = [Movie]()
    var detailMovie = Movie()
    
    private var randomTreendingMovie:Movie?
    
    let sectionTitle = ["Now Playing","Trending Movies","Top Rated"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        headerView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        tableView.tableHeaderView = headerView
        
        navigationController?.navigationBar.tintColor = .systemBackground
        title = "MMTFLİX"
        
        getData()
        configHeader()
    }
    
    func getData () {
        
        GetData.getNowPlayingMovies { movies in
            self.nowPlayingMovies = movies!
        }
        GetData.getTrendingMovies { movies in
            self.trendingMovies = movies!
        }
        GetData.getTopRatedMovies { movies in
            self.popularMovie = movies!
        }
    }
    
    private func configHeader() {
        
        self.randomTreendingMovie = trendingMovies.randomElement()
        headerView?.config(movie: randomTreendingMovie!)
    }
    
}

extension HomeVC:UITableViewDelegate,UITableViewDataSource, PHomeTableviewCell {
    
    func detailConfig(_ cell: HomeTableviewCell, movie: Movie) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
        vc.movie = movie
        present(vc, animated: true)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! HomeTableviewCell
        
        switch indexPath.section {
            
        case Sections.NowPlaying.rawValue:
            cell.configure(movies: nowPlayingMovies)
        case Sections.TrendingMovies.rawValue:
            cell.configure(movies: trendingMovies)
        case Sections.TopRated.rawValue:
            cell.configure(movies: popularMovie)
        default:
            break
        }
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        header.textLabel?.textColor = .label
    }
    
}
