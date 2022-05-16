//
//  KisiKayitVC.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 17.04.2022.
//

import UIKit

class KisiKayitVC: UIViewController {
    
    @IBOutlet weak var tfKisiTel: UITextField!
    
    @IBOutlet weak var tfKisiAd: UITextField!
    
    var kisiKayitPresenterNesnesi : ViewToPresenterKisiKayitProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KisiKayitRouter.createModule(ref: self)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text{
            kisiKayitPresenterNesnesi?.ekle(kisi_ad: ka, kisi_tel: kt)

        }
        
    }
    
   
}
