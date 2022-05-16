//
//  DetayVC.swift
//  ProtocolKullanimi
//
//  Created by KUBRANIN MACİ on 30.04.2022.
//

import UIKit

class DetayVC: UIViewController {

    @IBOutlet weak var textFieldGirdi: UITextField!
    
    var delegate: DetayVCToViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGonder(_ sender: Any) {
        if let mesaj = textFieldGirdi.text {
            delegate?.veriGonder(mesaj: mesaj)
        }
    }
    
   
}
