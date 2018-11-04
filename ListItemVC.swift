//
//  ListItemVC.swift
//  MyStoreApp
//
//  Created by Islam Gharib on 10/21/18.
//  Copyright © 2018 Gharib. All rights reserved.
//

import UIKit
import CoreData
class ListItemVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var itemTableView: UITableView!
    var listItems = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.dataSource = self
        itemTableView.delegate = self
        loadItems()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItemTVC = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTVC
        
        cell.setItem(item: listItems[indexPath.row])
        return cell
    }
    
    func loadItems(){
        let fetchRequest:NSFetchRequest<Items> = Items.fetchRequest()
        
        do {
            listItems = try context.fetch(fetchRequest)
            itemTableView.reloadData()
        } catch{
            print("Can't load Items")
        }
    }
}
