

import SwiftUI


struct Result : Codable {
    let results: [User] // array
}
struct User: Codable {
    // var id: Id
    let name: Name // Obj
    let email: String
    let cell: String
    let location: Location // Obj
    let picture: Picture // Obj
}

struct Id: Codable {
    var value: String!
}

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}
struct Location: Codable {
    let street: Street // Obj
    let city: String
    let state: String
    let country: String
}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Picture: Codable {
    let large: String
}

class Api {
    
    
    func getData(completion: @escaping ([User]) -> ()) { // Solo retornar el Arrelo
        
        guard let url = URL(string: "https://randomuser.me/api/?results=10") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode(Result.self, from: data!)
            //print(posts.results)
            
            // async
            DispatchQueue.main.async {
                completion(posts.results) //return data[]
            }
            
            
        }
        .resume()
        
        
    }
}
