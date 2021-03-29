//
//  ViewController.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 26/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import Alamofire
import AlamofireImage

//MARK: Class

class ViewController: UIViewController, UICollectionViewDataSource {
    //MARK: IBOutlet
    
    @IBOutlet weak var colecaoDeFilmes: UICollectionView!
    
    var listaDeFilmes:[[Filme]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoDeFilmes.dataSource = self
        //makeRequest()
    }
    
    func makeRequest(_ completion:@escaping(_ listaDeFilmes: Array<Filmes>) -> Void) {
        Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=62ba84de75827479b761f04766259232&language=pt-BR", method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                
                if let resposta = response.result.value as? Dictionary<String, Any>
                {
                    guard let dicDeFilmes = resposta["results"] as? Array<Dictionary<String, Any>>
                        else { return }
                    print(dicDeFilmes)
                    //completion(dicDeFilmes)
                }
                break
            case .failure:
                print(response.error!)
                break
          }
       }
    }
    
    //MARK: collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeFilmesCollectionViewCell
        
        //let filmeAtual = listaFilmes[indexPath.item]
        

        //celulaFilme.imagemPoster.image =
        celulaFilme.tituloDoFilme.text = "aaaaaaaaaaaaaaaaaaaaaaa"
        celulaFilme.popularidadeDoFilme.text = "80"
        
        
        return celulaFilme
    }
    
  
}



