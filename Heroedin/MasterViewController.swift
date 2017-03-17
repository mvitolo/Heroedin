//
//  MasterViewController.swift
//  Heroedin
//
//  Created by teo on 10/03/2017.
//  Copyright © 2017 teo. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Hero]()
    var json : JSON? = nil


    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        MarvelHelper.sharedInstance.getCarachters(offset:0, handler: {response in
            let json = JSON(response.result.value!)["data"]["results"]
            self.addElementsToObjects(json: json)
            
            self.tableView.reloadData()
        })
    }
    
    func addElementsToObjects(json: JSON){
        for element:JSON in json.array! {
            let hero = Hero()
            hero.id = element["id"].intValue
            hero.name = element["name"].string
            hero.imageString =  element["thumbnail"]["path"].string! + "." + element["thumbnail"] ["extension"].string!
            self.objects.append(hero)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! NSDate
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return objects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as! HeroCell

        let object = self.objects[indexPath.row] 
        cell.heroName!.text = object.name
        cell.heroImage.sd_setImage(with: URL(string: object.imageString!))
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastElement = objects.count - 1
        if indexPath.row == lastElement {
            MarvelHelper.sharedInstance.getCarachters(offset: indexPath.row, handler: {response in
                let json = JSON(response.result.value!)["data"]["results"]
                self.addElementsToObjects(json: json)
                
                self.tableView.reloadData()
            })
        }
    }

}

