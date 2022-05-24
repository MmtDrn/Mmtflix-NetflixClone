import UIKit

class UpcomingVC: UIViewController {
    
    @IBOutlet weak var upcomingTableView: UITableView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upcomingTableView.delegate = self
        upcomingTableView.dataSource = self
        
        GetData.getUpComingMovies { movies in
            self.movies = movies!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        if segue.identifier == "fromUpcoming" {
            let vc = segue.destination as! DetailVC
            vc.movie = movies[indeks!]
        }
    }
}

extension UpcomingVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "upcomingCell", for: indexPath) as! UpcomingTableViewCell
        
        cell.config(model: Model(poster_path: movie.poster_path!, title: movie.original_title!))
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "fromUpcoming", sender: indexPath.row)
    }
}
