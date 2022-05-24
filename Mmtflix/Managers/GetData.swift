import Foundation

class GetData {
    
    static func getTopRatedMovies(completion: @escaping ([Movie]?) -> ()) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=1f20fdcfe638d2b91331d9a63396677b")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
        let movie = try? JSONDecoder().decode(MovieResult.self, from: data)
            
            if let movie = movie {
                completion(movie.results)
            }
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    static func getTrendingMovies(completion: @escaping ([Movie]?) -> ()) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=1f20fdcfe638d2b91331d9a63396677b")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
        let movie = try? JSONDecoder().decode(MovieResult.self, from: data)
            
            if let movie = movie {
                completion(movie.results)
            }
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    static func getUpComingMovies(completion: @escaping ([Movie]?) -> ()) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=1f20fdcfe638d2b91331d9a63396677b")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
        let movie = try? JSONDecoder().decode(MovieResult.self, from: data)
            
            if let movie = movie {
                completion(movie.results)
            }
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    static func getNowPlayingMovies(completion: @escaping ([Movie]?) -> ()) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=1f20fdcfe638d2b91331d9a63396677b")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
        let movie = try? JSONDecoder().decode(MovieResult.self, from: data)
            
            if let movie = movie {
                completion(movie.results)
            }
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    static func getTopSearchMovies(completion: @escaping ([Movie]?) -> ()) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=1f20fdcfe638d2b91331d9a63396677b")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
        let movie = try? JSONDecoder().decode(MovieResult.self, from: data)
            
            if let movie = movie {
                completion(movie.results)
            }
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    static func getSearchMovies(query:String, completion: @escaping ([Movie]?) -> ()) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=1f20fdcfe638d2b91331d9a63396677b&query=\(query)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
        let movie = try? JSONDecoder().decode(MovieResult.self, from: data)
            
            if let movie = movie {
                completion(movie.results)
            }
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
    
    static func getYoutubeTrailer(query:String, completion: @escaping (YoutubeModell?) -> ()) {
        
        let semaphore = DispatchSemaphore (value: 0)
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        var request = URLRequest(url: URL(string: "https://youtube.googleapis.com/youtube/v3/search?q=\(query)&key=AIzaSyBFEpnU06parrYowOknlJ59d4qkWIKBEHk")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
          guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
          }
        let items = try? JSONDecoder().decode(YoutubeResult.self, from: data)
                
            if let items = items {
                if let item = items.items {
                    completion(item.first!)
                }
                //completion(items.items!.first!)
            }
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
    }
}
