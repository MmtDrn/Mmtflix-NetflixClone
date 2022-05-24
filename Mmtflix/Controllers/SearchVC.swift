import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    var movies = [Movie]()
    
    private let searchController:UISearchController = {
        
        let controller = UISearchController(searchResultsController: SearchResultVC())
        controller.searchBar.placeholder = "Search for a Movie"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        GetData.getTopSearchMovies { movies in
            self.movies = movies!
        }
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        navigationItem.searchController = searchController
        navigationController?.navigationBar.tintColor = .label
        
        searchController.searchResultsUpdater = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        if segue.identifier == "fromSearch" {
            let vc = segue.destination as! DetailVC
            vc.movie = movies[indeks!]
        }
    }
}

extension SearchVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topsearchCell", for: indexPath) as! TopSearchCell
        
        let movie = movies[indexPath.row]
        cell.config(model: Model(poster_path: movie.poster_path!, title: movie.title!))
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "fromSearch", sender: indexPath.row)
    }
}

extension SearchVC: UISearchResultsUpdating,PSearchResultVC {

    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        
        guard let query = searchBar.text,
            !query.trimmingCharacters(in: .whitespaces).isEmpty,
            query.trimmingCharacters(in: .whitespaces).count >= 3,
            let resultController = searchController.searchResultsController as? SearchResultVC else { return }
        resultController.delegate = self
        
        GetData.getSearchMovies(query: query) { movies in
            DispatchQueue.main.async {
                resultController.movies = movies!
                resultController.searchCollectionView.reloadData()
            }
        }
    }
    
    func detailConfig(movie: Movie) {
        
        DispatchQueue.main.async {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailVC
            vc.movie = movie
            self.present(vc, animated: true)
        }
    }
    
}
