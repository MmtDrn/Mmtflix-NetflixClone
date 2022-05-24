import Foundation

class YoutubeModell:Codable {
    
    var kind:String?
    var etag:String?
    var id:id?
    
    init() {
    }
    
    init(kind:String, etag:String, id:id) {
        self.kind = kind
        self.etag = etag
        self.id = id
    }
}

class id:Codable {
    
    var kind:String?
    var videoId:String?
    
    init() {
    }
    
    init(kind:String,videoID:String) {
        self.kind = kind
        self.videoId = videoID
    }
}
