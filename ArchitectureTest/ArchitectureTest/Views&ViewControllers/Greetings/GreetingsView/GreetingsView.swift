//
//  AuthorizationView.swift
//  ArchitectureTest
//
//  Created by Jakub Łaszczewski on 07/04/2019.
//  Copyright © 2019 letUs. All rights reserved.
//
import RxSwift

final class AuthorizationView: BaseView<GreetingsViewModel> {
    
    var authorizationViews: Views? {
        return views as? Views
    }
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        views = Views(containerView: self)
    }
}

// MARK: - Views
extension AuthorizationView {
    struct Views: ViewsProtocol {
        
        let containerView: UIView
        
        let greetingsLabel = Label(text: L10n.greetingsTitle, textAlignment: .center, numberOfLines: 0, fontSize: Constants.Layout.defaultFontSize, fontWeight: .book)
        
        func add() {
            containerView.add(subviews: greetingsLabel)
        }
        
        func configureConstraints() {
            containerView.addConstraints([
                greetingsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                greetingsLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)])
        }
    }
}
