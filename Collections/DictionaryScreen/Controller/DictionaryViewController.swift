//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Иван Тарасенко on 25.02.2022.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(DictionaryCollectionViewCell.self, forCellWithReuseIdentifier: DictionaryCollectionViewCell.identifier)
    }
}

extension DictionaryViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DictionaryCollectionViewCell.identifier,
            for: indexPath) as? DictionaryCollectionViewCell else { fatalError() }

        cell.backgroundColor = .systemBlue
        return cell
    }
}
