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
    
    @IBOutlet weak var searchController: UISearchBar!
    
    @IBOutlet weak var colecaoDeFilmes: UICollectionView!
    
    var results: [Result] = []
    
    let requisicao = FilmesAPI().makeRequest()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        results = requisicao
        
        colecaoDeFilmes.dataSource = self
        colecaoDeFilmes.delegate = self
        
        searchController.delegate = self
        
        
        let textFieldInsideSearchBar = searchController.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
    }
}

//MARK: SEARCH BAR

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var resultFilter: [Result] = []
        
        if searchText == "" {
            results = requisicao
        } else {
            for items in results {
                if items.title.lowercased().contains(searchText.lowercased()){
                    resultFilter.append(items)
                    results = resultFilter
                    print(items.title)
                    }
                }
        }
        print(searchText)
        colecaoDeFilmes.reloadData()
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
