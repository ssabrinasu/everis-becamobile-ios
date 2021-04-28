//
//  DetalhesViewController.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 31/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//
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

    var filmeSelecionado: Result?
    
    //MARK: FUNCOES
    override func viewDidLoad() {
        super.viewDidLoad()
        povoandoATela()
    }
    
    
    func povoandoATela() {
        guard let resultadoSelecionado = filmeSelecionado else {return}
        let model = modelDetalhes(result: resultadoSelecionado)
        tituloDetalhes.text = model.titulo
        dataDeLancamento.text = model.data
        notaDetalhe.text = model.nota
        sinopseDetalhes.text = model.sinopse

        let imagem = model.imagem
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(imagem )") {
            imagemDetalhes.af_setImage(withURL: url)
        }
    }
}
