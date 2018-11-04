
//  AddItemsVC.swift
//  MyStoreApp
//
//  Created by Islam Gharib on 10/20/18.
//  Copyright © 2018 Gharib. All rights reserved.
//

import UIKit
import  CoreData
class AddItemsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var addItemTF: UITextField!
    @IBOutlet weak var storesPickerView: UIPickerView!
    var listOfStores = [StoreType]()
    @IBOutlet weak var imageSelectedIV: UIImageView!
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadStores()
        storesPickerView.dataSource = self
        storesPickerView.delegate = self
        // initialize imagePicker
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listOfStores.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = listOfStores[row]
        return store.store_name
    }

    @IBAction func selectPicBtn(_ sender: Any) {
        // TODO:- select image from your phone
        present(imagePicker, animated: true, completion: nil) // when selecting the image the next func will fired to display the image inside IV
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageSelectedIV.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveItemBtn(_ sender: Any) {
        let newItem = Items(context: context)
        
        newItem.item_name = addItemTF.text
        newItem.data_add = NSDate() as Date
        newItem.image = imageSelectedIV.image
        newItem.toStoreType = listOfStores[storesPickerView.selectedRow(inComponent: 0)]
        
        do {
            appDelegate.saveContext()
            addItemTF.text = ""
        } catch{
            print("Can't save item")
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // load stores from store type entity
    func loadStores(){
        let fetchRequest:NSFetchRequest<StoreType> = StoreType.fetchRequest()
        do {
            listOfStores = try context.fetch(fetchRequest)
        } catch{
            print("Can't load stores")
        }
    }
}
