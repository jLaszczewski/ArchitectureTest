//
//  ViewsContainable.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//

import RxSwift

protocol ViewsContainable where Self: AnyObject {
    var views: ViewsProtocol! { get set }
    func configureViewsConstraints()
}
