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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoDeFilmes.dataSource = self
        makeRequest()
    }
    
    func makeRequest() {
        Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=62ba84de75827479b761f04766259232&language=pt-BR", method: .get).responseJSON { (resposta) in
            switch resposta.result {
            case .success:
                print(resposta.result.value!)
                break
            case .failure:
                print(resposta.error!)
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
        
        //let filmeAtual
        
        celulaFilme.popularidadeDoFilme.text = "80"
        
        
        return celulaFilme
    }
    
  
}



