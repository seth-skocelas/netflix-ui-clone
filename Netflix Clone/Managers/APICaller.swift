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
    
    
    func getTrendingMovies(completion: @escaping(Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))   

                
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping(Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                //print(results)

                
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getUpcomingMovies(completion: @escaping(Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/movie/upcoming?api_key=\(Constants.API_KEY)") else { return }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                //print(results)

                
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getPopular(completion: @escaping(Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/movie/popular?api_key=\(Constants.API_KEY)") else { return }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                //print(results)

                
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getTopRated(completion: @escaping(Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/movie/top_rated?api_key=\(Constants.API_KEY)") else { return }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                //print(results)

                
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
}
