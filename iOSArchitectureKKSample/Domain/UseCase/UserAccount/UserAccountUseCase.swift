//
//  UserAccountUseCase.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/08/19.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation
import RxSwift

protocol UserAccountUseCaseInputPort: PhotoSelectable, CollectionSelectable {
    func getAccount() -> Single<UnsplashAccountTarget.Response>
    func selectPhotos()
    func selectCollections()
    func selectLikes()
    func createCollection()
}

protocol UserAccountUseCaseOutputPort: CollectionTransitionable {
    func selectPhotos()
    func selectCollections()
    func selectLikes()
    func createCollection()
}

final class AccountUseCase: UserAccountUseCaseInputPort {
    let repository: AccountRepository
    let disposeBag: DisposeBag = .init()
    
    init(repository: AccountRepository) {
        self.repository = repository
    }
    
    func getAccount() -> Single<UnsplashAccountTarget.Response> {
        return repository.fetchAccount()
    }
    
    func selectPhotos() {
        
    }
    
    func selectCollections() {
        
    }
    
    func selectLikes() {
        
    }
    
    func createCollection() {
        
    }
    
    func selectImage(id: String) {
        
    }
    
    func selectCollection(id: String) {
    }
}
