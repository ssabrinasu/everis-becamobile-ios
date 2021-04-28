//
//  FilmesAPI.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 27/04/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

class FilmesAPI: NSObject {

    let urlString = "https://api.themoviedb.org/3/trending/movie/week?api_key=96dd278d45abf85bc179831d48f22e83&language=pt-BR"
    
    func makeRequest() -> [Result] {
        let resultFail: [Result]? = nil
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                let decoder = JSONDecoder()
                if let retornoFilmes = try? decoder.decode(Filmes.self, from: data) {
                    let result = retornoFilmes.results
                   print("Sucesso na requisicao")
                   return result
                } else {print("Erro em decodificar os dados com codable")}
            } else { print("Erro em Data")}
        } else { print("Erro na url")}
        return resultFail!
     }

}
