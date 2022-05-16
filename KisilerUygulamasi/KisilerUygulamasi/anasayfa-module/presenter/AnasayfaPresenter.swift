//  AnasayfaPresenter.swift
//  KisilerUygulamasi
//  Created by KUBRANIN MACİ on 1.05.2022.

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func kisileriYukle() {
        anasayfaInteractor?.tumKisilerAl()
    }
    
    func Ara(aramaKelimesi: String) {
        anasayfaInteractor?.kisiAra(aramaKelimesi: aramaKelimesi)
    }
    
    func Sil(kisi_id: Int) {
        anasayfaInteractor?.kisiSil(kisi_id: kisi_id)
    }
}

extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi: Array<Kisiler>) {
        anasayfaView?.viewaVeriGonder(kisilerListesi: kisilerListesi)
    }
}
