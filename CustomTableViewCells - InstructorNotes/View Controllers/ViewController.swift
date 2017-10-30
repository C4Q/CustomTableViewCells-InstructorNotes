//
//  ViewController.swift
//  CustomTableViewCells - InstructorNotes
//
//  Created by C4Q  on 10/30/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200.0
        tableView.delegate = self
        tableView.dataSource = self
        self.movies = MovieData.movies.sorted(by: {$0.genre < $1.genre})
    }

    //Data source methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath)
        let movie = movies[indexPath.row]
        if let movieCell = cell as? MovieTableViewCell {
            movieCell.movieTitleLabel.text = movie.name
            movieCell.movieSummaryLabel.text = movie.description
            movieCell.imageView?.image = UIImage(named: movie.posterImageName)
        }
        return cell
    }
    
    //Delegate methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 196
    }
}

