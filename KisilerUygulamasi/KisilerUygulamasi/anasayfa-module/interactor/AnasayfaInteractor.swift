//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//  Created by KUBRANIN MACİ on 1.05.2022.

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    let db:FMDatabase?
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("Rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
        
    }
    
    func tumKisilerAl() {
        db?.open()
        var liste = [Kisiler]()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while result.next() {
                let kisi = Kisiler(kisi_id: Int(result.string(forColumn: "kisi_id"))!, kisi_ad: result.string(forColumn: "kisi_ad")!, kisi_tel: result.string(forColumn: "kisi_tel")!)
                liste.append(kisi)
            }
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    func kisiAra(aramaKelimesi: String) {
        db?.open()
        var liste = [Kisiler]()
        do {
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%'", values: nil)
            while result.next() {
                let kisi = Kisiler(kisi_id: Int(result.string(forColumn: "kisi_id"))!, kisi_ad: result.string(forColumn: "kisi_ad")!, kisi_tel: result.string(forColumn: "kisi_tel")!)
                liste.append(kisi)
            }
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
       // print("Arama sonucu: \(aramaKelimesi)")
    }
    func kisiSil(kisi_id: Int) {
        //print("\(kisi_id) silindi")
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ? ", values: [kisi_id])
            tumKisilerAl() // sildikten sonra arayüzü güncelliyor
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
