//
//  SplashPresenter.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/08/18.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol SplashControllerProtocol: class {
    func fetchPopularPhotos(page: Int)
    func loadCategoryPhotos()
    func fetchAccount()
}

extension SplashControllerProtocol {
    func fetchPopularPhotos(page: Int = 1) {
        
    }
}

protocol SplashPresenterProtocol: class {
}

final class SplashViewAdapter: SplashControllerProtocol, SplashPresenterProtocol {
    private let useCase: PrepareAppUseCaseInputPort
    private let disposeBag: DisposeBag
    
    lazy private(set) var popularPhotosObservable: Observable<UnsplashPhotosTarget.Response> = {
        return self.popularPhotosSubject.asObservable()
    }()
    private let popularPhotosSubject: PublishRelay<UnsplashPhotosTarget.Response> = .init()
    
    lazy private(set) var topPhotosObservable: Observable<UnsplashPhotosTarget.Response> = {
        return self.topPhotosSubject.asObservable()
    }()
    private let topPhotosSubject: PublishRelay<UnsplashPhotosTarget.Response> = .init()

    
    lazy private(set) var categoryPhotosObservable: Observable<(Category, UnsplashPhotoEntity)> = {
        return self.categoryPhotosSubject.asObservable()
    }()
    private let categoryPhotosSubject: PublishRelay<(Category, UnsplashPhotoEntity)> = .init()

    
    init (useCase: PrepareAppUseCaseInputPort,
          disposeBag: DisposeBag = DisposeBag()) {
        self.useCase = useCase
        self.disposeBag = disposeBag
    }
    
    func fetchPopularPhotos(page: Int = 1) {
        var popularPhotos: UnsplashPhotosTarget.Response = .init()
        var topPhotos: UnsplashPhotosTarget.Response = .init()
        useCase.fetchPopularPhotos(page: 1)
            .subscribe(onSuccess: { [weak self] photos in
                guard let self = self else { return }
                popularPhotos.append(contentsOf: photos)
                let appendedTopPhotos: UnsplashPhotosTarget.Response = photos.filter { $0.heightRatioToWidth <= 1.5
                    && $0.heightRatioToWidth >= 1.4 }
                topPhotos.append(contentsOf: appendedTopPhotos)
                if topPhotos.count >= 20 {
                    self.topPhotosSubject.accept(topPhotos)
                    self.popularPhotosSubject.accept(popularPhotos)
                } else {
                    self.fetchPopularPhotos(page: page + 1)
                }
            },
                       onError: { error in
                        #if DEBUG
                        log.debug(error)
                        #endif
            })
            .disposed(by: disposeBag)
    }
    
    func loadCategoryPhotos() {
        Observable.merge(<#T##sources: [Observable<_>]##[Observable<_>]#>)
        let categoryPhotos: (Category, UnsplashPhotoEntity?) = Category.allCases.map {
            self.useCase.loadCategoryPhoto(key: $0.cacheKey)
                .subscribe(onSuccess: { [weak self] photoEntity in
                    guard let self = self else {
                        return
                    }
                    if let photo = photoEntity {
                        return ($0,)
                    } else {
                        
                    }
                    
                    },
                           onError: )
        }
    }
    
    func fetchAccount() {
        
    }
}
