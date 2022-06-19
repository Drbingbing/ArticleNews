//
//  NewStoriesViewController.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/19.
//

import UIKit

class NewStoriesViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    class Item: Hashable {
        let id = UUID()
        let article: Article
        init(article: Article) {
            self.article = article
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func ==(lhs: Item, rhs: Item) -> Bool {
            return lhs.id == rhs.id
        }
    }

    
    var collectionView: UICollectionView!
    
    var viewModel: NewsStoriesViewModelProtocols!
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureHeirarchy()
        self.configureDataSource()
        self.setInitialData()
        self.viewModel?.getIds { [weak self] ids in
            
            for id in ids {
                self?.viewModel.getArticle(id, completion: { result in
                    switch result {
                    case .success(let article):
                        let item = Item(article: article)
                        self?.updateData(from: item)
                    case .failure: break
                    }
                })
            }
        }
        self.navigationItem.title = self.viewModel.displayTitle
    }

    private func configureHeirarchy() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: self.createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(collectionView)
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let groupConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        return UICollectionViewCompositionalLayout.list(using: groupConfig)
    }
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<ArticleNewPreviewCell, Item>(cellNib: ArticleNewPreviewCell.nib) { (cell, indexPath, item) in
            cell.article = item.article
            cell.urlHandler = { [weak self] url in
                self?.viewModel.open(url: url)
            }
            cell.commentsHandler = { [weak self] id in
                self?.viewModel.showComments(id)
            }
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Item) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
        }
    }
    
    private func setInitialData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([], toSection: .main)
        
        self.dataSource.apply(snapshot)
    }
    
    private func updateData(from item: Item) {
        var snapshot = self.dataSource.snapshot()
        
        snapshot.appendItems([item], toSection: .main)
        
        self.dataSource.apply(snapshot)
    }
    
}
