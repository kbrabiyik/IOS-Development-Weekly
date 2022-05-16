//
//  KisiKayitRouter.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 30.04.2022.
//

import Foundation
class KisiKayitRouter : PresenterToRouterKisiKayitProtocol {
    static func createModule(ref: KisiKayitVC) {
        ref.kisiKayitPresenterNesnesi = KisiKayitPresenter()
        ref.kisiKayitPresenterNesnesi?.kisiKayitInteractor = KisiKayitInteractor()
    
    }
    
}
