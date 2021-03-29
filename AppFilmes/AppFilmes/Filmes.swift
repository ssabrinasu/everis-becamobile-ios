//
//  Filmes.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 29/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import Foundation
// MARK: - Filmes
struct Filmes: Codable {
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
    let video: Bool
    let voteAverage: Double
    let overview, releaseDate, title: String
    let adult: Bool
    let backdropPath: String
    let id: Int
    let genreIDS: [Int]
    let voteCount: Int
    let originalLanguage: OriginalLanguage
    let originalTitle, posterPath: String
    let popularity: Double
    let mediaType: MediaType
    
    enum CodingKeys: String, CodingKey {
        case video
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case title, adult
        case backdropPath = "backdrop_path"
        case id
        case genreIDS = "genre_ids"
        case voteCount = "vote_count"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case popularity
        case mediaType = "media_type"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}


enum OriginalLanguage: String, Codable {
    case en = "en"
    case ru = "ru"
}

struct FilmesViewModel {
    let title: String
    let voteAverage: Double
    let overview: String
    let id: Int
    let backdropPath: String
    let popularity:  Double
}

extension FilmesViewModel {
    init(results: Result) {
        self.title = results.title
        self.voteAverage = results.voteAverage
        self.overview = results.overview
        self.id = results.id
        self.backdropPath = results.backdropPath
        self.popularity = results.popularity
    }
    
}

