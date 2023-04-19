//
//  ViewController.swift
//  ApiNew
//
//  Created by R93 on 02/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    //var arrUsers: [Dictionary<String, AnyObject>] = []
    var arrUsers: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //        getUsersUsingJSONDecoder()
        setUp()
    }
    private func setUp() {
//        usersTableView.dataSource = self
//        usersTableView.delegate = self
        getSingleUserDetails()
    }
    
     //2
//     private func getUsers() {
//         guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
//         var request = URLRequest(url: url)
//         request.httpMethod = "GET"
//         request.httpBody = nil
//         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//         URLSession.shared.dataTask(with: request) { data, response, error in
//             guard let apiData = data else { return }
//             do {
//                 let users = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
//                 //self.arrUsers = json
//                 self.arrUsers = []
//                 for i in 0..<users.count {
//                     let user: User = try User(from: users[i] as! Decoder)
//                     self.arrUsers.append(user)
//                 }
//                 DispatchQueue.main.async {
//                     self.usersTableView.reloadData()
//                 }
//             } catch  {
//                 print(error.localizedDescription)
//             }
//         }
//         .resume() 
//     }

     //3
 //    private func getUsers() {
 //        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
 //        var request = URLRequest(url: url)
 //        request.httpMethod = "GET"
 //        request.httpBody = nil
 //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 //        URLSession.shared.dataTask(with: request) { data, response, error in
 //            guard let apiData = data else { return }
 //            do {
 //                let users = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
 //                //self.arrUsers = json
 //                self.arrUsers = users.map { User(from: $0 as! Decoder) }
 //
 //                DispatchQueue.main.async {
 //                    self.usersTableView.reloadData()
 //                }
 //            } catch  {
 //                print(error.localizedDescription)
 //            }
 //        }
 //        .resume()
 //    }
 //
     private func getSingleUserDetails() {
         guard let url = URL(string: "https://gorest.co.in/public/v2/users/563") else { return }
         var request = URLRequest(url: url)
         request.httpMethod = "GET"
         request.httpBody = nil
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         URLSession.shared.dataTask(with: request) { data, response, error in
             guard let apiData = data else { return }
             do {
                 let userDetailsDictionary = try JSONSerialization.jsonObject(with: apiData) as! Dictionary<String, AnyObject>
                 var user = try User(from: userDetailsDictionary as! Decoder)
                 //nameLabel.text = user.name

             } catch  {
                 print(error.localizedDescription)
             }
         }
         .resume()
     }
     
 //    private func getSingleUserDetailsUsingJSONDecoder() {
 //        guard let url = URL(string: "https://gorest.co.in/public/v2/users/563") else { return }
 //        var request = URLRequest(url: url)
 //        request.httpMethod = "GET"
 //        request.httpBody = nil
 //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 //        URLSession.shared.dataTask(with: request) { data, response, error in
 //            guard let apiData = data else { return }
 //            do {
 //                let user = try JSONDecoder().decode(User.self, from: apiData)
 //                print(user.name)
 //            } catch  {
 //                print(error.localizedDescription)
 //            }
 //        }
 //        .resume()
 //    }
 //    private func getUsersUsingJSONDecoder() {
 //        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
 //        var request = URLRequest(url: url)
 //        request.httpMethod = "GET"
 //        request.httpBody = nil
 //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
 //        URLSession.shared.dataTask(with: request) { data, response, error in
 //            guard let apiData = data else { return }
 //            do {
 //                self.arrUsers = try JSONDecoder().decode([User].self, from: apiData)
 //                DispatchQueue.main.async {
 //                    self.usersTableView.reloadData()
 //                }
 //            } catch  {
 //                print(error.localizedDescription)
 //            }
 //        }
 //        .resume()
 //    }
 //
 //
 }

 extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return arrUsers.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell: UITableViewCell = UITableViewCell()
         //let rowDictionary = arrUsers[indexPath.row]
         let user = arrUsers[indexPath.row]
         cell.textLabel?.numberOfLines = 0
         //cell.textLabel?.text = rowDictionary["name"] as! String
         //cell.textLabel?.text = "\(rowDictionary["name"] as! String)\n\(rowDictionary["email"] as! String)"
         cell.textLabel?.text = "\(user.name)\n\(user.email)"
         return cell
     }
 }


 //class User {
 //    var id: Int
 //    var name: String
 //    var email: String
 //    var gender: String
 //    var status: String
 //
 //
 //    init(id: String, name: String, email: String, gender: String, status: String) {
 //          self.id = id
 //    }
 //
 //    init(userDetails: Dictionary<String, AnyObject>) {
 //        id = userDetails["id"] as! Int
 //        name = userDetails["name"] as! String
 //        email = userDetails["email"] as! String
 //        gender = userDetails["gender"] as! String
 //        status = userDetails["status"] as! String
 //    }
 //}


 struct User: Decodable {
     var id: Int
     var name: String
     var email: String
     var gender: String
     var status: String
 }


