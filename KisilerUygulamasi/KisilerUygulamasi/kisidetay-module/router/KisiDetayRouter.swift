//
//  KisiDetayRouter.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 1.05.2022.
//

import Foundation

class KisiDetayRouter : PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: KisiDetayVC) {
        ref.kisiDetayPresenterNesnesi = KisiDetayPresenter()
        ref.kisiDetayPresenterNesnesi?.kisiDetayInteractor = KisiDetayInteractor() 
    }
    
}
