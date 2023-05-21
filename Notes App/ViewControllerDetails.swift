//
//  ViewControllerDetails.swift
//  Notes App
//
//  Created by Fırat İlhan on 21.05.2023.
//

import UIKit

class ViewControllerDetails: UIViewController {

    @IBOutlet weak var note_title: UILabel!
    @IBOutlet weak var note_subtitle: UILabel!
    
    var note:NotesDatabase?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        if let n = note {
            note_title.text = n.note_title
            note_subtitle.text = n.note_subtitle
            
        }
        
    }
    

  


}
