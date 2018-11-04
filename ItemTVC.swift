//
//  ItemTVC.swift
//  MyStoreApp
//
//  Created by Islam Gharib on 10/21/18.
//  Copyright © 2018 Gharib. All rights reserved.
//

import UIKit

class ItemTVC: UITableViewCell {

    @IBOutlet weak var storeNameLB: UILabel!
    @IBOutlet weak var dateAddLB: UILabel!
    @IBOutlet weak var itemImageIV: UIImageView!
    @IBOutlet weak var itemNameLB: UILabel!
    
    func setItem(item:Items){
        itemNameLB.text = item.item_name
        itemImageIV.image = item.image as? UIImage
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM-dd-yyyy HH:mm"
        let now = dateFormat.string(from: item.data_add as! Date)
        dateAddLB.text = now
        
        storeNameLB.text = item.toStoreType?.store_name
    }
}
