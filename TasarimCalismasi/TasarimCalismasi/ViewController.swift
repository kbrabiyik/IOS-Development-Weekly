//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by KUBRANIN MACİ on 10.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let pacificolabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
         
    
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Pizza"
        
        let appearance = UINavigationBarAppearance()
        // arka plan rengi için bir kodlama
        appearance.backgroundColor = UIColor(named: "anarenk")
        
        //Başlık rengi
        appearance.titleTextAttributes = [.foregroundColor : UIColor(named: "yaziRenk1")!]
        
        //Status bar
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }


}

