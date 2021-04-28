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

class ViewController: UIViewController {

    //MARK: LIFE CYCLE
    
    @IBOutlet weak var colecaoDeFilmes: UICollectionView!
    
    var results = FilmesAPI().makeRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoDeFilmes.delegate = self
        colecaoDeFilmes.dataSource = self
        print(results[0].title)
    }
    
}

//MARK: COLLECTION VIEW

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeFilmesCollectionViewCell
        let filmeAtual = results[indexPath.item]
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(filmeAtual.posterPath )") {
            celulaFilme.imagemPoster.af_setImage(withURL: url)
        }
        celulaFilme.tituloDoFilme.text = filmeAtual.title
        celulaFilme.notaDoFilme.text =  "\(filmeAtual.voteAverage )"
        
        //descartar depois
        let model = modelDetalhes(result: filmeAtual)
        print(model.titulo)
        
        return celulaFilme
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let filmeSelec = results[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetalhesViewController") as! DetalhesViewController
        controller.filmeSelecionado = filmeSelec
        self.present(controller, animated: true, completion: nil)
    }
    
}
