//
//  HomeFilmesCollectionViewCell.swift
//  AppFilmes
//
//  Created by Tabata Sabrina Sutili on 28/03/21.
//  Copyright © 2021 Tabata Sabrina Sutili. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeFilmesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemPoster: UIImageView!
    @IBOutlet weak var tituloDoFilme: UILabel!
    @IBOutlet weak var popularidadeDoFilme: UILabel!
    
//
//    func setup(_ filme:Filme) {
//        guard let imagemUrl = URL(string: filme.backdropPath) else { return }
//        imagemPoster.af_setImage(withURL: imagemUrl)
//    }
}
