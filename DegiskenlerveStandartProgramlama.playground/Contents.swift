import UIKit

var ogrenciAdi = "Ahmet"
var ogrenciYasi = 23
var ogrenciBoy = 1.78
var ogrenciBasHarf = "A"
var ogrenciDevamlılık = true

/* print(ogrenciAdi,ogrenciYasi)
 print(ogrenciBoy)
 print(ogrenciDevamlılık) */

var urun_id : Int = 3416
var urun_ad : String = "Kol saati"
var urun_adet :  Int = 100
var urun_fiyat : Double = 149.99
var urun_tedarikcisi : String = "Rolex"

print("Ürün id : \(urun_id)")
print("Ürün adı : \(urun_ad)")
print("Ürün adedi : \(urun_adet)")

var i = 42
var d = 56.78

print(i)
print(d)

var sonuc1 = Double(i)
var sonuc2 = Int(d)

print(sonuc1)
print(sonuc2)


// SAYISALDAN METİNE ÇEVİRME

var sonuc3 = String(i)// "42"
var sonucc4 = String(d)//"56.78"
var sonuc5 = "Kimyasal oran : \(d)"


// METİNDEN SAYISALA

var yazi = "500t"
if let sonuc6 = Int(yazi) {
    print(sonuc6)
}else{
    print("Girilen veri hatalı")
    
}


// TUPLES

var kisi = ("Ahmet","Aksoy")
var ad = kisi.0
var soyad = kisi.1
print(ad)
print(soyad)

//KARŞILAŞTIRMA OPERATÖRLERİ

var x1 = 60
var x2 = 500

var y1 = 70
var y2 = 80

print(x1 == x2)
print(x1 != x2)
print(x1 > x2)
print(x1 >= x2)
print(x1 <= x2)
print(x1 < x2)

print(x1 > x2 || y1 > y2) // OR
print(x1 > x2 && y1 > y2) // AND


// IF KULLANIMI

var yas = 17
var isim = "Ayse"

if yas >= 18 {
    print("Reşitsiniz")
}else{
    print("Reşit Değilsiniz")
}
 
// Optional - Nullable - Null safety (Çokomelli)
//null = nil

var x = "Meerhaba"


// Boş değer oluşturma (değişkene başlangıçta değer atamak istemiyorum)
var str:String? = nil //yöntem 1
var str1:String? //tercih edilen

str1 = "hello"

if str1 != nil {
    print(str1!) // ! işareti ile optional unwrapping
}else{
    print("str1 nil değer içeriyor")
}

// Optional binding

if let temp = str1 { // let tanımlama tempin sonradan değişebilirliğini kısıtlıyor btw
    print(temp)
}else{
    print("str nil değer içeriyor")
}


if var temp2 = str1 {
    temp2 = "Hello World"
    print(temp2)
}else{
    print("str nil değer içeriyor")
}














