//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MovieListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fontSize = CGFloat(20) {
        didSet {
            tableView.reloadData()
        }
    }
    
    var movie = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movie = Movie.allMovies
        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let keepInfoSegue = segue.destination as? SettingsViewController else {
            fatalError("Unable to properly segue")
        }
        keepInfoSegue.currentFloat = fontSize

    }
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let backwardsInfo = segue.source as? SettingsViewController,
        let newFontSize = backwardsInfo.currentFloat else {
            fatalError("Unable to retrieve font size")
        }
        fontSize = newFontSize
    }
    
    
}

extension MovieListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
           
        let thisMovie = movie[indexPath.row]
        
        
        cell.textLabel?.font = UIFont(name: "Helvetica", size: fontSize)
        cell.textLabel?.text = thisMovie.name
        cell.detailTextLabel?.text = "\(thisMovie.year)"
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: fontSize)
        cell.imageView?.image = UIImage(named: thisMovie.posterImageName)
        
        return cell
    }
    
}
