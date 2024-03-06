//
//  MovieViewModel.swift
//  LearningUIKit
//
//  Created by Weerawut Chaiyasomboon on 6/3/2567 BE.
//

import Foundation

class MoviesViewModel {
    
    let movies = Variable<[Movie]>([])
    
    private let service = MoviesService()
    
    func fetchData() {
        service.getMovies { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies.value = response.results
            case .failure:
                break
            }
        }
    }
}
