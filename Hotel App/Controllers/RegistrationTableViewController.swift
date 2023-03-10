//
//  RegistrationTableViewController.swift
//  Hotel App
//
//  Created by Tolga Sarikaya on 15.01.23.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

   
    // MARK: - Properties
    var registrations = [Registration]()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "background.png"))

        
    }

    // MARK: - Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return registrations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell")!
        let registration = registrations[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        cell.textLabel?.text = registration.fullName()
        
        let checkInString = dateFormatter.string(from: registration.checkInDate)
        let checkOutString = dateFormatter.string(from: registration.checkOutDate)
        let roomName = registration.roomType.name
        
        cell.detailTextLabel?.text = "\(checkInString) - \(checkOutString): \(roomName)"
        return cell
    }
    
    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let source = unwindSegue.source as? AddRegistrationTableViewController,
              let registration = source.registration else { return }
        
        registrations.append(registration)
        tableView.reloadData()
    }
    
    // Registered user deletion
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.registrations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
