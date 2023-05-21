//
//  ViewController.swift
//  Notes App
//
//  Created by Fırat İlhan on 21.05.2023.
//

import UIKit
import CoreData


let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    
    let context = appDelegate.persistentContainer.viewContext


    @IBOutlet weak var tableView: UITableView!
    
    var notesList = [NotesDatabase]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
      

        

    }
    override func viewWillAppear(_ animated: Bool) {
        
        allNotes()
        tableView.reloadData()
        
        }
    
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
       
        if segue.identifier == "toDetails" {
            let destination = segue.destination as! ViewControllerDetails
            destination.note = notesList[indeks!]
            
        }
    }

    func allNotes() {
        notesList.removeAll(keepingCapacity: false)
        
        

        
        do {
            notesList = try context.fetch(NotesDatabase.fetchRequest())
        } catch {
            print(error)
        }
    }

}


extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = note.note_title
        cell.detailTextLabel?.text = note.note_subtitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetails", sender: indexPath.row)
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete", handler: {
            (action:UITableViewRowAction, indexPath:IndexPath) -> Void in
            
            print("delete clicked \(self.notesList[indexPath.row])")
            let note = self.notesList[indexPath.row]
            self.context.delete(note)
            appDelegate.saveContext()
            
           
            self.tableView.reloadData()
        })
        
     
        return [delete]
    }
    
    
    
    
    
}
