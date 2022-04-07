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

// Fonksiyonlar

class fonksiyonlar{
    // Geri Dönüş değeri olmayan ( VOID )
    func selamla(){
        let sonuc = " Merhaba Ahmet "
        print(sonuc)
    }
    // Geri Dönüş değeri olan ( RETURN )
    func selamla1() -> String {
        let sonuc = " Merhaba Ahmet "
        return sonuc
    }
    // en çok kullanılan
    func selamla2(isim:String) {
        let sonuc = "Merhaba \(isim)"
        print(sonuc)
    }
    
    func toplama(sayi1:Int,sayi2:Int) -> Int {
        let toplam = sayi1 + sayi2
        return toplam
    }
    
    // Aynı fonksyionu kullanabilme same variable name OVERLOADING
    func carpma(sayi1:Int,sayi2:Int){
        print("Çarpma : \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Double,sayi2:Double){
        print("Çarpma : \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Int,sayi2:Int, isim:String){
        print("Çarpma : \(sayi1 * sayi2) - işlemi yapan : \(isim)")
    }
    
    
}

let f = fonksiyonlar()

f.selamla()

let gelenSonuc = f.selamla1()
print("Gelen Sonuç : \(gelenSonuc)")

f.selamla2(isim: "Zeynep")

let gelenToplam = f.toplama(sayi1: 10, sayi2: 20)
print("Gelen Toplam : \(gelenToplam)")


f.carpma(sayi1: 5, sayi2: 3, isim: "Beyza")

// STATIC
// Değişken ve metotlara sınıf ile erişim sağlar

class ASinifi{
    static var x = 10
   // var x = 10
    static func metod(){
    // func metod(){
        // print("Metod çalıştı")
    // }
        print("Metod çalıştı")
    }
   
// }
}
//let a = ASinifi()
//print(a.x)
print(ASinifi.x) // ASinifi.x static IP,URL gibi değişkenler tutuluyor genelde
//a.metod()
ASinifi.metod()


class BSinifi{
    var x = 10
    
    func metod(){
        print("Metod çalıştı")
    }
}

let b = BSinifi() // Sanal Nesne BSinifi()

print(BSinifi().x)
BSinifi().metod()

// ENUMERATION

enum KonserveBoyut{
    case kucuk
    case orta
    case buyuk
}

func ucretHesapla(boyut:KonserveBoyut,adet:Int){
    switch boyut{
    case .kucuk:
        print("Fiyat : \(adet * 10) ₺")
    case .orta:
        print("Fiyat : \(adet * 20) ₺")
    case .buyuk:
        print("Fiyat : \(adet * 30) ₺")
    }
}

ucretHesapla(boyut: .orta, adet: 23)


// Composition

class Kategoriler {
    var kategori_id:Int?
    var kategori_ad:String?
    
    init(kategori_id:Int,kategori_ad:String){
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

class Yonetmenler {
    var yonetmen_id:Int?
    var yonetmen_ad:String?
    
    init(yonetmen_id:Int,yonetmen_ad:String){
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

class Filmler {
    var film_id:Int?
    var film_ad:String?
    var film_yil:Int?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    init(film_id:Int,film_ad:String,film_yil:Int,kategori:Kategoriler,yonetmen:Yonetmenler){
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.yonetmen = yonetmen
    }
}

let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Bilim Kurgu")

let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Nolan")

let f1 = Filmler(film_id: 1, film_ad: "Interstellar", film_yil: 2019, kategori: k2, yonetmen: y2)

print("film id   : \(f1.film_id!)")
print("film adı  : \(f1.film_ad!)")
print("film yılı : \(f1.film_yil!)")
print("Kategori : \(f1.kategori!.kategori_ad!)")
print("Yönetmen : \(f1.yonetmen!.yonetmen_ad!)")








































