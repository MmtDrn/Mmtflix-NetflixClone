import Foundation

class Detail {
    var title:String?
    var overview:String?
    var vote_avarage:String?
    var release_date:String?
    var videoID:String?
    
    init() {
    }
    
    init(title:String,overview:String,vote_avarage:String,release_date:String,videoID:String) {
        self.title = title
        self.overview = overview
        self.vote_avarage = vote_avarage
        self.release_date = release_date
        self.videoID = videoID
    }
}
