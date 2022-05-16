//
//  ViewController.swift
//  JSONPARSEKullanimi
//
//  Created by KUBRANIN MACİ on 7.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parseIslemi()
        
    }
    func parseIslemi() { //istek at içeriği al
        let url = URL(string: "http://kasimadalan.pe.hu/filmler/tum_filmler.php")!
        URLSession.shared.dataTask(with: url) { data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            do{
                let cevap = try JSONDecoder().decode(FilmlerResponse.self, from: data!)
                if let basarili = cevap.success {
                    print("Success : \(basarili)")
                    print("*************************")
                }
                if let filmler = cevap.filmler {
                    for f in filmler {
                        print("**********************")
                        print("Film id : \(f.film_id!)")
                        print("Film ad : \(f.film_ad!)")
                        print("Film yılı : \(f.film_yil!)")
                        print("Film resim : \(f.film_resim!)")
                        print("Film kategori : \(f.kategori!.kategori_ad!)")
                        print("Film yönetmen : \(f.yonetmen!.yonetmen_ad!)")
                        
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }


}

