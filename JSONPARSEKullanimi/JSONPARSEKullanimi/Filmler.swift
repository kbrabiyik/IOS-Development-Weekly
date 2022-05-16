//
//  Filmler.swift
//  JSONPARSEKullanimi
//
//  Created by KUBRANIN MACİ on 7.05.2022.
//

import Foundation

class Filmler : Codable {
    var film_id:String?
    var film_ad:String?
    var film_yil:String?
    var film_resim:String?
    var kategori:Kategoriler? //composition
    var yonetmen:Yonetmenler?
    
}
