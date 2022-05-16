//  AnasayfaProtocols.swift
//  KisilerUygulamasi
//  Created by KUBRANIN MACİ on 1.05.2022.
//

import Foundation

//Ana protocoller
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    func kisileriYukle()
    func Ara(aramaKelimesi:String)
    func Sil(kisi_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    func tumKisilerAl()
    func kisiAra(aramaKelimesi:String)
    func kisiSil(kisi_id:Int)
}

//Taşıyıcı protocoller

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(kisilerListesi:Array<Kisiler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func viewaVeriGonder(kisilerListesi:Array<Kisiler>)
}

//Router Protocoller

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}
