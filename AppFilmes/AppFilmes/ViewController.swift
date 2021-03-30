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
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    //MARK: IBOutlet
    
    @IBOutlet weak var colecaoDeFilmes: UICollectionView!
    
    //let filmeAtual:Array<Filme> = resposta.result.value!
    
    var result: Filmes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoDeFilmes.delegate = self
        colecaoDeFilmes.dataSource = self
        
        makeRequest()
    }
    
    func makeRequest() {
        guard let path = Bundle.main.path(
            forResource: "movie",
            ofType: "json")
        else { return }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            result = try JSONDecoder().decode(Filmes.self, from: jsonData)
        } catch {
            print("ERRO: \(error)")
        }
    }
    
    //MARK: collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeFilmesCollectionViewCell
        
        let filmeAtual = result?.results[indexPath.item]
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(filmeAtual?.posterPath ?? "a" )") {
            celulaFilme.imagemPoster.af_setImage(withURL: url)
        }
        celulaFilme.tituloDoFilme.text = filmeAtual?.title
        celulaFilme.popularidadeDoFilme.text =  "\(filmeAtual?.voteAverage ?? 0)"
        
        return celulaFilme
    }
}


