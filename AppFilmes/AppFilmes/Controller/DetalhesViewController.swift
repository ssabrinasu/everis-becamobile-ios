//
//  DetalhesViewController.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 31/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//
import UIKit
import Foundation
import CoreData
import Alamofire
import AlamofireImage


class DetalhesViewController: UIViewController {
    

    @IBOutlet weak var imagemDetalhes: UIImageView!
    @IBOutlet weak var tituloDetalhes: UILabel!
    @IBOutlet weak var dataDeLancamento: UILabel!
    @IBOutlet weak var notaDetalhe: UILabel!
    @IBOutlet weak var sinopseDetalhes: UILabel!
      
    @IBAction func botaoVoltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: VARIAVEIS
    let urlDetails = "https://api.themoviedb.org/3/movie/454626?api_key=62ba84de75827479b761f04766259232&language=pt-BR"
    
    var imagemD: String = ""
    var tituloD: String = ""
    var dataD: String = ""
    var notaD: String = ""
    var sinopseD: String = ""
    
    var resultadoDetalhes = [Detalhes]()
    
    //MARK: FUNCOES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRequestDetails()
   
        
        print(resultadoDetalhes)

    }
    
    
    func makeRequestDetails() {
        guard let url = URL(string: urlDetails) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let resultJson = try JSONDecoder().decode(Detalhes.self, from: data)
                self?.resultadoDetalhes = [resultJson]
//               DispatchQueue.main.async {
//                    self?.imagemD = resultJson.backdropPath
//                    self?.tituloD = resultJson.title
//                    self?.dataD = resultJson.releaseDate
//                   //self?.notaD = resultJson.voteAverage
//                    self?.sinopseD = resultJson.overview
//
//                }
                
            }
            catch {
                print(error)
                
            }
        }
        task.resume()
        
    }
    
    
    //MARK: TableView
    
}

