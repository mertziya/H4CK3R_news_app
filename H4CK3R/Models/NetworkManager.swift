import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let e = error {
                    print(e)
                }else{
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do{
                            let results = try decoder.decode(Results.self , from: safeData)
                            
                            DispatchQueue.main.async {
                                self.posts = results.hits // the required data comes from networking
                            }
                            
                        } catch {
                            print(error)
                        }
                        
                        
                    }else{ print("error while fetching data")}
                }
            }
            task.resume()
            
        }else{ print("network error") }
    }
}
