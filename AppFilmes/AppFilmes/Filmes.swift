//
//  Filmes.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 29/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import UIKit

class Filmes: NSObject {
    
    let title: String
    let overview: String
    let id: Int
    let poster: String
    let popularity: Double
    
    init(_ title: String, _ overview: String, _ id: Int, poster: String, _ popularity: Double) {
     self.title = title
     self.overview = overview
     self.id = id
     self.poster = poster
     self.popularity = popularity
    }

}
