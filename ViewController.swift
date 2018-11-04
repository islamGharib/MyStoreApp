//
//  ViewController.swift
//  MyStoreApp
//
//  Created by Islam Gharib on 10/19/18.
//  Copyright © 2018 Gharib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storeNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addStoreSaveBtn(_ sender: Any) {
        let newStore = StoreType(context: context)
        
        newStore.store_name = storeNameTF.text
        
        do {
            appDelegate.saveContext()
            storeNameTF.text = ""
        }catch{
            print("Can't save record")
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

