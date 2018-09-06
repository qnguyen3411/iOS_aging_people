//
//  ViewController.swift
//  aging_people
//
//  Created by Quang Nguyen on 9/6/18.
//  Copyright © 2018 Quang Nguyen. All rights reserved.
//

import UIKit
class Person {
  var name = ""
  var age: Int
  
  init(_ name:String) {
    self.name = name
    self.age = Int.random(in: 5...95)
  }
}
class ViewController: UIViewController {
  let people = [Person("George"), Person("Betty"), Person("Fran"),
                Person("Joe"), Person("Helda"), Person("Winifred"),
                Person("Zed"), Person("Sara"), Person("Jeffry"),
                Person("Abraham"), Person("Anna"), Person("Melinda")]
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    tableView.dataSource = self
  }

}

extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    print(cell.subviews)
    cell.textLabel?.text = people[indexPath.row].name
    cell.detailTextLabel?.text = "\(people[indexPath.row].age) years old"
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
    return people.count
  }

}
