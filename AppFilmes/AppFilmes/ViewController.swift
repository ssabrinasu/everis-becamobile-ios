//
//  ViewController.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 29/03/21.
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
    
    //let filmeAtual:Array<Filme> = resposta.result.value!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoDeFilmes.dataSource = self
        makeRequest()
    }
    
    func makeRequest() {
        guard let path = Bundle.main.path(forResource: "movie", ofType: "json") else { return }
        
        let url = URL(fileURLWithPath: path)
        
        var result: Result?
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Result.self, from: jsonData)
            if let result = result {
                print(result)
                
            }
        } catch {
            print("ERRO: \(error)")
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
        celulaFilme.tituloDoFilme.text = "Liga da Justiça de Zack Snyder"
        celulaFilme.popularidadeDoFilme.text = "8.3"
        
        
        return celulaFilme
    }
    
    
}


