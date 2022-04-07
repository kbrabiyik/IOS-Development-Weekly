import UIKit

class Araba {
    var renk:String?
    var hiz:Int?
    var calisiyorMu:Bool?
    
    init() {
        print("Boş constructor çalıştı")
        
    } // nesne oluşturdu mu control için
    
    // SELF :Sınıfın kendşsşnş temsil eder
    // SUPER : üst sınıfı temsil eder
    
    init(renk:String,hiz:Int,calisiyorMu:Bool) {
        self.renk = renk // shadowing
        self.hiz = hiz
        self.calisiyorMu = calisiyorMu
        print("Dolu constructor çalıştı")
    }
    
    func calistir(){
        calisiyorMu = true // fonksiyon içerideki değeri değiştiriyor ***SIDE EFFECT***
        hiz = 5
    }
    
    func durdur(){
        calisiyorMu = false
        hiz = 0
    }
    
    func hizlan(kacKM:Int){
        hiz! += kacKM
        
    }
    
    func yavasla(kacKm:Int){
        hiz! -= kacKm
    }
    
    func BilgiAl() {
        print("**********************************")
        print("Renk                     :\(renk!)")
        print("Hız                      :\(hiz!)")
        print("Çalışıyor Mu             :\(calisiyorMu!)")
    }
}

let bmw = Araba(renk: "Mavi", hiz: 100, calisiyorMu: true)
// Değer atama
//bmw.renk = "Mavi"
//bmw.hiz = 100
//bmw.calisiyorMu = true

bmw.BilgiAl()
bmw.durdur()
bmw.BilgiAl()
bmw.calistir()
bmw.BilgiAl()
bmw.hizlan(kacKM: 100)
bmw.BilgiAl()
bmw.yavasla(kacKm: 50)
bmw.BilgiAl()

let sahin = Araba(renk: "Beyaz", hiz: 0, calisiyorMu: false)

sahin.calistir()
sahin.BilgiAl()





































