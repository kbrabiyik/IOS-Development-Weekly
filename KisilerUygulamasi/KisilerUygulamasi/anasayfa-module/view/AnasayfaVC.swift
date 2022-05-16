//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by KUBRANIN MACİ on 17.04.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var kisilerTableView: UITableView!
    
    @IBOutlet weak var searhBar: UISearchBar!
    
    var kisilerListe = [Kisiler]()
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searhBar.delegate = self // çokomelli yetkilendirme
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        veritabaniKopyala()
        AnasayfaRouter.createModule(ref: self)
        anasayfaPresenterNesnesi?.kisileriYukle()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.kisileriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetayVC
                gidilecekVC.kisi = kisi
            }
        }
    }
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "Rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("Rehber.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var")
        }else{
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path) //çokomelli
            }catch{}
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func viewaVeriGonder(kisilerListesi: Array<Kisiler>) {
        self.kisilerListe = kisilerListesi
        self.kisilerTableView.reloadData()
    }
}
extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.Ara(aramaKelimesi: searchText)
    }
}
extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre", for: indexPath) as! TableViewHucre
        hucre.kisiBilgiLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        // leading sol trailing sağ
        return hucre
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            (action,view,void) in
            let kisi = self.kisilerListe[indexPath.row]
            print("\(kisi.kisi_ad!) silindi")
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.anasayfaPresenterNesnesi?.Sil(kisi_id: kisi.kisi_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListe[indexPath.row]
        //print("\(kisi.kisi_ad!) seçildi")
        performSegue(withIdentifier: "toDetay", sender: kisi) //temel tasarım
        tableView.deselectRow(at: indexPath, animated: true)
    }
}










