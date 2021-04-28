//
//  modelDetalhes.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 23/04/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import Foundation

 struct modelDetalhes{
    
     var titulo:String
     var data:String
     var nota:String
     var imagem:String
     var sinopse:String
 
    init(result: Result) {
        self.titulo = result.title
        self.data = result.releaseDate
        self.nota = String(result.voteAverage)
        self.imagem = result.backdropPath
        self.sinopse = result.overview
        
    }
}

