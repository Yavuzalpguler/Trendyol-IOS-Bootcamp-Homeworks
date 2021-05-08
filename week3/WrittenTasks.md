### Frame vs bounds
Frame de bounds döndükleri CGRect’in X-Y pozisyonları ve genişlik yükselik değerlerini içerirler. Bir View’ın boundları kapladığı alanın koordinatlarını belirtir, frame ise View’ın parent komponentinin kapladığı alanın koordinatlarını belirtir.

### UIViewController lifecycles

UIViewControllerın yaşam döngüsün metodları şu şekilde:

* ViewDidLoad: Çağırıldığında 1 defa çalışan ve sayfa ilk yüklendiğinde çalışan metod.

* ViewWillAppear: Ekran yüklenmeden önce çalışan metod.

* ViewDidAppear: View her görünür olduğunda tekrar çağırılır, ViewDidLoad’dan farkı ise aynı sayfada birden fazla kez çağırılabilmesidir.

* ViewWillDisappear: ViewViewAppear’ın tam tersi gibidir. Herhangi bir view herhangi şekilde görünmez yapılmadan hemen önce çalışan metod. 

* ViewDidDisappear: Bir view kaybolduktan sonra çalışan metod. View kaybolduğunda arka planda çalışmasını istemediğimiz işlemleri terminate etmek için kullanılır. 

### Static keyword

Static keyword: Bir class’ın içinde static bir değişken tanımladığımızda, bu değişken class’ın tüm instanceları tarafından erişilebilir olur. 

#### *Example

class Car {
static var brand = “BMW”

var model: String
}
let car1 = Car(model: “X3”)
print(car1.brand) // Butun instancelar tarafından erişilebilir bir değer olacak. 
