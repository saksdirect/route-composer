//
// Created by Eugene Kazaev on 15/01/2018.
// Copyright (c) 2018 HBC Tech. All rights reserved.
//

import UIKit

/// Pushes a view controller in to `UINavigationController`'s child stack
public extension NavigationControllerFactory {

    /// Pushes a view controller in to `UINavigationController`'s child stack
    public struct PushToNavigation: ContainerAction {

        public typealias SupportedContainer = NavigationControllerFactory

        /// Constructor
        public init() {
        }

        public func perform(with viewController: UIViewController,
                            on existingController: UIViewController,
                            animated: Bool,
                            completion: @escaping(_: ActionResult) -> Void) {
            guard let navigationController = existingController as? UINavigationController ?? existingController.navigationController else {
                return completion(.failure("Could not find UINavigationController in \(existingController) to present view controller \(viewController)."))
            }

            navigationController.pushViewController(viewController, animated: animated)
            return completion(.continueRouting)
        }

    }

}
