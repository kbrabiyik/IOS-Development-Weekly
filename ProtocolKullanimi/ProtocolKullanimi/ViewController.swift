//
//  ViewController.swift
//  ProtocolKullanimi
//
//  Created by KUBRANIN MACİ on 30.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelSonuc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonGecisYap(_ sender: Any) {
        performSegue(withIdentifier: "toDetay", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let gidilecekVC = segue.destination as! DetayVC
            gidilecekVC.delegate = self
        }
    }
}

extension ViewController : DetayVCToViewController {
    
    func veriGonder(mesaj: String) {
        LabelSonuc.text = mesaj
    }
}
