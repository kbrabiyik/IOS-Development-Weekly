//
//  KisiKayitProtocols.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 30.04.2022.
//

import Foundation

protocol ViewToPresenterKisiKayitProtocol {
    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol? {get set}
    func ekle(kisi_ad:String,kisi_tel:String) // simetri olucak aşağıdakinin
    
}

protocol PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad:String,kisi_tel:String)
    
}

protocol PresenterToRouterKisiKayitProtocol {
    static func createModule(ref:KisiKayitVC)
}

