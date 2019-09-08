//
//  Builder.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/08/19.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation
import UIKit

final class Builder {
    static func buildAppCoordinator(window: UIWindow) -> AppCoordinator {
        let webAPIClient: UnsplashAPIProvider = .shared
        let repository: FetchPhotoGateWay = .init(client: webAPIClient)
        let viewModel: SplashViewModel = .init()
        let useCase: AppPrepareUseCase = .init(repository: repository,
                                                 output: presenter)
        let controller: SplashControllerProtocol = .init(useCase: useCase,
                                                         viewModel: viewModel)
        let vc: SplashViewController = .init(controller: controller)
        
        let coordinator: AppCoordinator = .init(window: window,
                                                rootVC: vc)
        vc.inject(transitioner: coordinator)
        
        return  coordinator
    }
    
    static func buildMainTabCoordinator() -> MainTabCoordinator {
        return MainTabCoordinator()
    }
    
    static func buildHomeVCCoordinator() -> HomeVCCoordinator {
        return HomeVCCoordinator()
    }
    
}
