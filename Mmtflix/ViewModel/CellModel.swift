import Foundation

class Model {
    
    var poster_path:String?
    var title:String?
    
    init() {
    }
    
    init(poster_path:String, title:String) {
        self.poster_path = poster_path
        self.title = title
    }
}
