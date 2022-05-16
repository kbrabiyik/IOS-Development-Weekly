//  AnasayfaRouter.swift
//  KisilerUygulamasi
//  Created by KUBRANIN MACİ on 1.05.2022.

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        // view yetkilendirme
        ref.anasayfaPresenterNesnesi = presenter
        
        //presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        
        //ınteractor
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
