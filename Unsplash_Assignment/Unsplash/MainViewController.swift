//
//  ViewController.swift
//  Unsplash_Assignment
//
//  Created by 이은서 on 2023/09/18.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    enum Section: CaseIterable {
        case first, second, third
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
    let viewModel = ViewModel()
    var dataSource: UICollectionViewDiffableDataSource<Section, Photo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        viewModel.fetchPhoto()
        configDataSource()
        updateSnapshot()
        viewModel.firstList.bind { _ in
            self.updateSnapshot()
        }
        viewModel.secondList.bind { _ in
            self.updateSnapshot()
        }
        viewModel.thirdList.bind { _ in
            self.updateSnapshot()
        }
    }
                                          
    private static func layout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.backgroundColor = .lightGray
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func configDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, Photo>(handler: { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = "좋아요: \(itemIdentifier.likes)\n다운로드: \(itemIdentifier.downloads)"
            content.textProperties.font = .systemFont(ofSize: 13)
            
            DispatchQueue.global().async {
                guard let url = URL(string: itemIdentifier.urls.thumb) else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                
                DispatchQueue.main.async {
                    content.image = UIImage(data: data)
                    cell.contentConfiguration = content
                }
            }
            
            var background = UIBackgroundConfiguration.listPlainCell()
            background.backgroundColor = .white
            background.cornerRadius = 10
            background.strokeColor = .systemYellow
            background.strokeWidth = 1
            cell.backgroundConfiguration = background
            
        })
        
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
       
    func updateSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Photo>()
        snapshot.appendSections([.first, .second, .third])
        snapshot.appendItems([viewModel.firstList.value], toSection: .first)
        snapshot.appendItems([viewModel.secondList.value], toSection: .second)
        snapshot.appendItems([viewModel.thirdList.value], toSection: .third)
        dataSource.apply(snapshot)
    }
    
    
    
}

