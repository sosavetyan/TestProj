//
//  ListScreenViewController.swift
//  AholdDelhaizeTestProject
//

import UIKit

protocol ListScreenDisplayLogic: AnyObject {
    func displayItems(viewMode: ListScreen.UseCase.ViewModel)
    func displayError(viewMode: ListScreen.UseCase.ViewModel)
}

class ListScreenViewController: UIViewController, ListScreenDisplayLogic {
    var interactor: ListScreenBusinessLogic?
    var router: (NSObjectProtocol & ListScreenRoutingLogic & ListScreenDataPassing)?
    private var items = [CollectionUI]()
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    lazy var collectionView: UICollectionView = {
        let reuseId = String(describing: ItemCollectionViewCell.self)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 60, height: 60)
        var collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
                                              
                                            
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ListScreenInteractor()
        let presenter = ListScreenPresenter()
        let router = ListScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionsView()
        interactor?.getItems()
        
    }
    
    private func setupCollectionsView() {
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ItemCollectionViewCell.self))
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func displayItems(viewMode: ListScreen.UseCase.ViewModel) {
        self.items = viewMode.items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func displayError(viewMode: ListScreen.UseCase.ViewModel) {
        
    }
    
}

extension ListScreenViewController: UICollectionViewDelegate {
    
}

extension ListScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == (items.count - 1) {
            interactor?.getItems()
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ItemCollectionViewCell.self), for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.displayItem(item: items[indexPath.row])
        return cell
    }
}
