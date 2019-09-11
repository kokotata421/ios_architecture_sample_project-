//
//  HomeViewAdapter.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/08/20.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//
import Foundation

protocol HomeViewInputPort {
    func fetchTopPhotos(page: Int)
    func selectPhoto(_ photo: PhotoUIEntity)
    func switchPhoto(_ photo: PhotoUIEntity)
}

extension HomeViewInputPort {
    func fetchTopPhotos(page: Int = 1) { }
}

struct HomeViewAdapter: HomeViewInputPort {
    let useCase: HomeUseCaseInputPort
    
    init(useCase: HomeUseCaseInputPort) {
        self.useCase = useCase
    }
    
    func selectPhoto(_ photo: PhotoUIEntity) {
        
    }
    
    func switchPhoto(_ photo: PhotoUIEntity) {
        
    }
    
    func fetchTopPhotos() {
        
    }
}
