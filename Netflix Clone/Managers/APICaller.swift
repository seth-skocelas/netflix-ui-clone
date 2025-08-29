//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Seth Skocelas on 8/29/25.
//

import Foundation

struct Constants {
    
    static let API_KEY = "9d9a74a76f025ccf500d7eafb02dc8b3"
    static let baseURL = "https://api.themoviedb.org/3"
    
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))   

                
                
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
        
    }
}
