//
//  DetailScreenViewController.swift
//  AholdDelhaizeTestProject
//

import UIKit

protocol DetailScreenDisplayLogic: AnyObject {

}

class DetailScreenViewController: UIViewController, DetailScreenDisplayLogic {
    var interactor: DetailScreenBusinessLogic?
    var router: (NSObjectProtocol & DetailScreenRoutingLogic & DetailScreenDataPassing)?
    var titleText = ""
    var descriptionText = ""
    private var pageTitleLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
        
    private func setup() {
        let viewController = self
        let interactor = DetailScreenInteractor()
        let presenter = DetailScreenPresenter()
        let router = DetailScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUIItems()
    }
    
    private func makeUIItems() {
        view.addSubview(pageTitleLabel)
        view.addSubview(descriptionLabel)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40.0),
            pageTitleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10.0),
            pageTitleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10.0),
            pageTitleLabel.heightAnchor.constraint(equalToConstant: 20.0),
            descriptionLabel.topAnchor.constraint(equalTo: self.pageTitleLabel.bottomAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.pageTitleLabel.trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.pageTitleLabel.leadingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        pageTitleLabel.text = titleText
        descriptionLabel.text = descriptionText

    }
    
    
    
}
