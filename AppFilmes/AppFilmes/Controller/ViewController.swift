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

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
//MARK: VARIAVEIS
    
    let urlString = "https://api.themoviedb.org/3/trending/movie/week?api_key=62ba84de75827479b761f04766259232&language=pt-BR"
    
    var results: [Result] = []
    
    

    
//MARK: OUTLET
    
    @IBOutlet weak var colecaoDeFilmes: UICollectionView!
    
//MARK: FUNCOES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoDeFilmes.delegate = self
        colecaoDeFilmes.dataSource = self
        self.makeRequest()
    }
    
    
    
    func makeRequest() {
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let resultJson = try JSONDecoder().decode(Filmes.self, from: data)
                DispatchQueue.main.async {
                    self?.results = resultJson.results
                    self?.colecaoDeFilmes.reloadData()
                }
                
            }
            catch {
                print(error)
            }
       }
        task.resume()
       
    }
        
//MARK: COLLECTION VIEW
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeFilmesCollectionViewCell
        
        let filmeAtual = results[indexPath.item]
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(filmeAtual.posterPath ?? "a" )") {
           celulaFilme.imagemPoster.af_setImage(withURL: url)
        }
        celulaFilme.tituloDoFilme.text = filmeAtual.title
        celulaFilme.notaDoFilme.text =  "\(filmeAtual.voteAverage ?? 0)"
        
        return celulaFilme
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let filmeSelec = results[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesId") as! DetalhesViewController
        controller.filmeSelecionado = [filmeSelec]
       
        
        let titulo = filmeSelec.title
        let sinopse = filmeSelec.overview
        let data = filmeSelec.releaseDate
        let nota = filmeSelec.voteAverage
        let imagem = filmeSelec.backdropPath
        
        controller.titulo = titulo
        controller.data = data
        controller.sinopse = sinopse
        controller.imagem = imagem
        controller.nota = nota
        
        
         self.present(controller, animated: true, completion: nil)
    }
    
    
  }