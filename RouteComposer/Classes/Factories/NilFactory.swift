//
//  NilFactory.swift
//  RouteComposer
//
//  Created by Eugene Kazaev on 08/02/2018.
//

import Foundation
import UIKit

/// Dummy struct to be provided to an assembly to show that this step should not have any factories
/// The only purpose it exists is to provide type safety checks for `StepAssembly`.
///
/// NB: Must be chained with a `NilAction`!
///
/// For example, `UIViewController` of this step was already loaded and integrated into a stack by a
/// storyboard.
public struct NilFactory<VC: UIViewController, C>: Factory, NilEntity {

    public typealias ViewController = VC

    public typealias Context = C

    /// Constructor
    public init() {
    }

    public func build(with context: Context) throws -> ViewController {
        throw RoutingError.message("This factory should never reach router.")
    }

}
