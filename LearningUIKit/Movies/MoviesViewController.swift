//
//  ViewController.swift
//  LearningUIKit
//
//  Created by Weerawut Chaiyasomboon on 6/3/2567 BE.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.movies.onUpdate = { [weak self] movies in
            self?.tableView.reloadData()
        }
        
        viewModel.fetchData()
    }

}

extension MoviesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.value.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let movie = viewModel.movies.value[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.overviewLabel.text = movie.overview
        
        return cell
    }
    
}

extension MoviesViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies.value[indexPath.row]
        let movieDetailsViewController = MovieDetailsViewController(with: movie)
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
