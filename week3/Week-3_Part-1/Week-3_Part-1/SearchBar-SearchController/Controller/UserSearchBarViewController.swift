
import UIKit

class UserSearchBarViewController: UIViewController {

    var users = [User]()
    var filteredUsers = [User]()
    var isFiltering: Bool = false
    var errorMsg : String = "No match !"
    var error : Bool = false
    var result: Bool = true
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let userURLString = "https://jsonplaceholder.typicode.com/users"
        guard let userURL = URL(string: userURLString) else { return }
        let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
        self.users = users!
        //let cooks = try? JSONDecoder().decode([Cook].self, from: Data(contentsOf: userURL))
        //tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension UserSearchBarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering {
            return filteredUsers.count
        } else if (result == false){
            return 1
        }else{
            return users.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        let cellErr = tableView.dequeueReusableCell(withIdentifier: "errCell")
        let user:User
        if isFiltering  {
            user = filteredUsers[indexPath.row]
            cell?.textLabel?.text = user.name
            cell?.detailTextLabel?.text = user.company.name
            print( "isfiltering",isFiltering)
            print( "isfiltering",result)
            
            if !result{
                cellErr?.textLabel?.text = "Error"
                print("olmasi gereken uer", isFiltering)
                print("olmasi gereken uer", result)
                return cellErr!
            }
            return cell!
        } else if !isFiltering {
            user = users[indexPath.row]
            cell?.textLabel?.text = user.name
            cell?.detailTextLabel?.text = user.company.name
            print("else",isFiltering)
            print("else",result)
            return cell!
        } else {
            print("bok", result)
            return cellErr!
        }
       
    }
    
    //MARK:  cell için custom bir cell tanımlayınız. Veri bulunamadığında ÖZEL bir mesaj gösteriniz.
    
}

extension UserSearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUsers = users.filter({ (user:User) -> Bool in
            return user.name.lowercased().contains(searchText.lowercased())
        })
        
        var temp = [Bool]()
        for user in users{
            temp.append(user.name.lowercased().contains(searchText.lowercased()))
            
        }
        
        let groundTruth = temp.map {(b: Bool) -> Bool in return b || b}
        
       
        result = temp.reduce(false, {$0 || $1})
        print(result)
        
        isFiltering = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isFiltering = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}


/*
 //
 //  UserSearchBarViewController.swift
 //  Week-3_Part-1
 //
 //  Created by Kerim Caglar on 1.05.2021.
 //

 import UIKit

 class UserSearchBarViewController: UIViewController {
     
     var users = [User]()
     var filteredUsers = [User]()
     var doesContain : Bool = true
     var isFiltering: Bool = true
     var errorMsg : String = "No match !"
     @IBOutlet weak var tableView: UITableView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         // Do any additional setup after loading the view.
         let userURLString = "https://jsonplaceholder.typicode.com/users"
         guard let userURL = URL(string: userURLString) else { return }
         let users = try? JSONDecoder().decode([User].self, from: Data(contentsOf: userURL))
         self.users = users!
         //let cooks = try? JSONDecoder().decode([Cook].self, from: Data(contentsOf: userURL))
         //tableView.delegate = self
         tableView.dataSource = self
         
         
     }
     
 }

 extension UserSearchBarViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         if isFiltering {
             print(doesContain)
             return filteredUsers.count
         } else if (doesContain == false){
             return 1
         }else{
             return users.count
             
         }
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
         let cellErr = tableView.dequeueReusableCell(withIdentifier: "errCell")
         let user:User
         if isFiltering {
             user = filteredUsers[indexPath.row]
             
         } else if !doesContain {
             
             return cellErr!
         }else {
             user = users[indexPath.row]
         }
         cell?.textLabel?.text = user.name
         cell?.detailTextLabel?.text = user.company.name
         cellErr?.textLabel?.text = errorMsg
         return cell!
     }
     
     
     
     //MARK:  cell için custom bir cell tanımlayınız. Veri bulunamadığında ÖZEL bir mesaj gösteriniz.
     
 }

 extension UserSearchBarViewController: UISearchBarDelegate {
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         filteredUsers = users.filter({ (user:User) -> Bool in
             return user.name.lowercased().contains(searchText.lowercased())
         })
     
         
         
         
         /*for user in users{
             if(!user.name.lowercased().contains(searchText.lowercased())){
                 print(user.name.lowercased().contains(searchText.lowercased()))
                 doesContain = true
             }
         }*/
         
         
         
         isFiltering = true
         tableView.reloadData()
     }
     
     func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         isFiltering = false
         searchBar.text = ""
         tableView.reloadData()
     }
     
 }
*/
