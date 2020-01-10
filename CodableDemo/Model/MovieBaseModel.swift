
import Foundation
struct MovieBaseModel : Codable {
    let movie : [Movie]?
    let totalResults : String?
    let response : String?
    
    enum CodingKeys: String, CodingKey {
        
        case movie = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movie = try values.decodeIfPresent([Movie].self, forKey: .movie)
        totalResults = try values.decodeIfPresent(String.self, forKey: .totalResults)
        response = try values.decodeIfPresent(String.self, forKey: .response)
    }
    
}

struct Movie : Codable {
    let title : String?
    let year : String?
    let imdbID : String?
    let type : String?
    let poster : String?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        year = try values.decodeIfPresent(String.self, forKey: .year)
        imdbID = try values.decodeIfPresent(String.self, forKey: .imdbID)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        poster = try values.decodeIfPresent(String.self, forKey: .poster)
    }
    
}
