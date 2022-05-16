//
//  Protocols.swift
//  ViperKullanimi
//
//  Created by KUBRANIN MACİ on 30.04.2022.
//

import Foundation
// View -> Presenter -> Interactor

//main protocols
protocol ViewToPresenterProtocol {
    var interactor:PresenterToInteractorProtocol? {get set}
    var view:PresenterToViewProtocol? {get set}
    func toplamaYap(sayi1:String,sayi2:String)
    func carpmaYap(sayi1:String,sayi2:String)
        
}

protocol PresenterToInteractorProtocol {
    var presenter:InteractorToPresenterProtocol? {get set}
    func topla(sayi1:String,sayi2:String)
    func carp(sayi1:String,sayi2:String)
    
}

//taşıyıcı protokoller
protocol InteractorToPresenterProtocol {
    func presenteraVeriGonder(sonuc:String)
    
    
}

protocol PresenterToViewProtocol {
    func vieweVeriGonder(sonuc:String)
    
}

//Router Protocol

protocol PresenterToRouterProtocol {
    static func createModule(ref:ViewController)
}
