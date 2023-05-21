//
//  ViewControllerNewNote.swift
//  Notes App
//
//  Created by Fırat İlhan on 21.05.2023.
//

import UIKit

class ViewControllerNewNote: UIViewController {
    let context = appDelegate.persistentContainer.viewContext

    
    @IBOutlet weak var new_note_title: UITextField!
    @IBOutlet weak var new_note_subtitle: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveNote(_ sender: Any) {
        
        if new_note_title != nil, new_note_subtitle != nil {
            let note = NotesDatabase(context: context)
            note.note_title = new_note_title.text
            note.note_subtitle = new_note_subtitle.text

            appDelegate.saveContext()
            print("success")
            alert(title: "SUCCESS", message: "New Note Saved")
            new_note_title.text = ""
            new_note_subtitle.text = ""
        } else {
            print("error")
        }
        
        	
      
    }
    
    
    func alert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
