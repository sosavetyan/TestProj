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
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        var collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
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
