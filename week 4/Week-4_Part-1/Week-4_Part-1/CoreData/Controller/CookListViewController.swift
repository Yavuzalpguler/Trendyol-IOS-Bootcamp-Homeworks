//
//  CookListViewController.swift
//  Week-4_Part-1
//
//  Created by Kerim Caglar on 8.05.2021.
//

import UIKit
import CoreData

class CookListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cookNames = [String]()
    var images = [Data]()
    var deleteCookCell: IndexPath? = nil
    
    var objects = [NSManagedObject]()
    
    //MARK: Resim datasını gösteren bir view ekleyiniz
    //MARK: Silme işlemini yapınız: Direk silme işlemi yapılmasın, bir alert ile kullanıcıya silmek istediğinize emin misin diye sorulsun. Core Data dan veriyi siliniz
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
        getImages()
    }
    
    private func getCooks() {
        cookNames.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "name") as? String else { return }
                    cookNames.append(name)
                    objects.append(result)
                }
                self.tableView.reloadData()
            } else {
                //TODO:
            }
        } catch {
            print("Error")
        }
    }
    
    
    private func getImages() {
        images.removeAll()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")

        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    guard let name = result.value(forKey: "image") as? Data else { return }
                    images.append(name)
                }
                self.tableView.reloadData()
            } else {
                //TODO:
            }
        } catch {
            print("Error")
        }

    }
    
    
    
    
    func confirmDelete (cook : String){
        let alert = UIAlertController(title: "Delete Cook", message: "Are you sure you want to permanently delete \(cook)?", preferredStyle: .alert)
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: handleDeleteCook)
        print(DeleteAction)
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelDeleteCook)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func handleDeleteCook(alertAction: UIAlertAction) -> Void{
        if let indexPath = deleteCookCell {
            tableView.beginUpdates()
            print(indexPath)
            cookNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            deleteCookCell = nil
            
            tableView.endUpdates()
        }
        
    }
    
    func cancelDeleteCook(alertActoin: UIAlertAction){
        deleteCookCell = nil
    }
    
}


extension CookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath)
        cell.textLabel?.text = cookNames[indexPath.row]
        cell.imageView?.image = UIImage( data: images[indexPath.row])
        return cell
    }
    
}

extension CookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        if editingStyle == .delete {
            deleteCookCell = indexPath
            let cookToDelete = cookNames[indexPath.row]
            print(objects[indexPath.row])
            confirmDelete(cook: cookToDelete)
            context.delete(objects[indexPath.row])
            do {
                try context.save()
            } catch  {
                print("Kaydedilemedi...")
            }
            
        }
    }
    
}
