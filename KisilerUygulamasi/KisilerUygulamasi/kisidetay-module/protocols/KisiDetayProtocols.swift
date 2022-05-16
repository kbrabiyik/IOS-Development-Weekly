//
//  KisiDetayProtocols.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 1.05.2022.
//

import Foundation

protocol  ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor:PresenterToInteractorKisiDetayProtocol? {get set}
    
    func Guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String)
    
}

protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String)
    
}

protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref:KisiDetayVC)
}
