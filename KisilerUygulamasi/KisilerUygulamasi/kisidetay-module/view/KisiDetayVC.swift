//
//  KisiDetayVC.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 17.04.2022.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet weak var tf_kisiAd: UITextField!
    @IBOutlet weak var tf_kisiTel: UITextField!
    
    var kisi:Kisiler?
    var kisiDetayPresenterNesnesi:ViewToPresenterKisiDetayProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            tf_kisiAd.text = k.kisi_ad
            tf_kisiTel.text = k.kisi_tel
            
        }
        KisiDetayRouter.createModule(ref: self)
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tf_kisiAd.text,let kt = tf_kisiTel.text , let k = kisi {
            kisiDetayPresenterNesnesi?.Guncelle(kisi_id: k.kisi_id!, kisi_ad: ka, kisi_tel: kt)
        }
    }
    
}
