import Foundation

class Movie:Codable {
    var backdrop_path:String?
    var id:Int?
    var original_language:String?
    var original_title:String?
    var overview:String?
    var poster_path:String?
    var release_date:String?
    var title:String?
    var vote_average:Double?
    
    init() {
    }
    
    init(backdrop_path:String,id:Int,original_language:String,original_title:String,overview:String,poster_path:String,release_date:String,title:String,vote_average:Double) {
        
        self.backdrop_path = backdrop_path
        self.id = id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.vote_average = vote_average
    }
}
