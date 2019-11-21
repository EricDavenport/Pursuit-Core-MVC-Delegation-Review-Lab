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
    
    
}

extension MovieListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell: MovieViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
           
        let thisMovie = movie[indexPath.row]
        
        cell.textLabel?.text = thisMovie.name
        cell.detailTextLabel?.text = "\(thisMovie.year)"
        cell.imageView?.image = UIImage(named: thisMovie.posterImageName)
        
        return cell
    }
    
}
