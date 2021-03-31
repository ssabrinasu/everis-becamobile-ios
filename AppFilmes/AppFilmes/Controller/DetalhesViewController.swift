//
//  DetalhesViewController.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 31/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//
import UIKit
import Foundation
import Alamofire
import AlamofireImage


class DetalhesViewController: UIViewController {
    
    //MARK: OUTLETS

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
    
    var filmeSelecionado: [Result] = []
    
    
    var titulo:String? = nil
    var data:String? = nil
    var nota:Double? = nil
    var imagem:String? = nil
    var sinopse:String? = nil
    
    //MARK: FUNCOES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(titulo)
        
        tituloDetalhes.text = titulo
        dataDeLancamento.text = "Lançado: \(data ?? "a")"
        notaDetalhe.text = "\(nota ?? 0)"
        sinopseDetalhes.text = sinopse
        
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(imagem ?? "a" )") {
            imagemDetalhes.af_setImage(withURL: url)
        }
        
    }
    
}
