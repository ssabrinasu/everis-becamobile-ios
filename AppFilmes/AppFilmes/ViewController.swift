//
//  ViewController.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 26/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

// MARK: - Welcome
struct Welcome: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool?
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview, posterPath: String
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let popularity: Double
    let mediaType: MediaType
    let originCountry: [String]?
    let firstAirDate, name, originalName: String?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
        case mediaType = "media_type"
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case name
        case originalName = "original_name"
    }
    
}
enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
}


//MARK: Class

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequest()
    }
    
    private func makeRequest() {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/all/week?api_key=62ba84de75827479b761f04766259232&language=pt-BR") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let infoFilmes = try JSONDecoder().decode(Welcome.self, from: data)
                print("INFOS: \(infoFilmes)")
                //self.tituloFilme.text = infoFilmes
                //self.imagemPoster.image = imagemDoAluno
            } catch let error {
                print("ERROO: \(error)")
            }
            
        }
        task.resume()
        
    }
    
    
}

