import UIKit
import WebKit

class DetailVC: UIViewController {
    
    var movie:Movie?
    var youtubeModel:YoutubeModell?
    var trailerID:String?

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var voteAvarageLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            GetData.getYoutubeTrailer(query: movie.original_title! + "official trailer") { result in
                self.trailerID = result!.id!.videoId!
            }
            
            self.configure(model: Detail(title: movie.original_title!, overview: movie.overview!, vote_avarage: movie.vote_average!.debugDescription, release_date: movie.release_date!, videoID: trailerID!))
        }
    }
}

extension DetailVC {

    func configure(model:Detail) {
        self.titleLabel.text = model.title ?? "unkown"
        self.overviewLabel.text = model.overview ?? "unkown"
        self.voteAvarageLabel.text = "\(model.vote_avarage ?? "unkown")/10"
        self.releaseDateLabel.text = model.release_date ?? "unkown"
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.videoID ?? "")") else { return }
        webView.load(URLRequest(url: url))
    }
}
