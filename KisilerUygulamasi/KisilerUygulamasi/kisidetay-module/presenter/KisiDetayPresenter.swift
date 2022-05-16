//
//  KisiDetayPresenter.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 1.05.2022.
//

import Foundation

class KisiDetayPresenter: ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?
    
    func Guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        kisiDetayInteractor?.kisiGuncelle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
