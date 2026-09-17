//
//  ListViewController.swift
//  view.Controller.practis#24
//
//  Created by Виктор on 17.09.2026.
//

import UIKit
import SnapKit

struct Film {
    let name: String
    let year: Int
    let rating: Double
    let posterName: String
}
    class ListPopularFolmViewController: UIViewController {
        
        let films: [Film] = [
            Film(name: "Interstellar", year: 2014, rating: 8.7, posterName: "interstellar"),
            Film(name: "Gladiator", year: 2000, rating: 8.5, posterName: "gladiator"),
            Film(name: "Pulp Fiction", year: 1994, rating: 8.9, posterName: "pulpFiction"),
            Film(name: "Fight Club", year: 1999, rating: 8.8, posterName: "fightClub"),
            Film(name: "The Dark Knight", year: 2008, rating: 9.0, posterName: "darkKnight"),
            Film(name: "Inception", year: 2010, rating: 8.8, posterName: "inception"),
            Film(name: "The Matrix", year: 1999, rating: 8.7, posterName: "matrix"),
            Film(name: "The Green Mile", year: 1999, rating: 8.6, posterName: "greenMile"),
            Film(name: "Django Unchained", year: 2012, rating: 8.5, posterName: "django"),
            Film(name: "The Wolf of Wall Street", year: 2013, rating: 8.2, posterName: "wolfOfWallStreet")
        ]
        
        private let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            
            layout.itemSize = CGSize(width: 160, height: 240)
            layout.minimumInteritemSpacing = 12
            layout.minimumLineSpacing = 12
            layout.scrollDirection = .horizontal
            
            let collectionView = UICollectionView(
                frame: .zero,
                collectionViewLayout: layout)
            
            
            return collectionView
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationItem.title = "Список Фильмов"
            setupUI()
            setupConstraints()
        }
        
        func setupUI() {
            view.backgroundColor = .white
            collectionView.dataSource = self
            collectionView.register(FilmCell.self, forCellWithReuseIdentifier: "FilmCell")
            collectionView.delegate = self
            
            view.addSubview(collectionView)
        }
        
        func setupConstraints() {
            collectionView.snp.makeConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
                $0.leading.trailing.equalToSuperview().inset(20)
                $0.height.equalTo(280)
            }
        }
        
        
    }


extension ListPopularFolmViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        films.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = films[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "FilmCell",
            for: indexPath
        ) as? FilmCell else {
            return UICollectionViewCell()
        }
        
        
        cell.configure(with: film)
        return cell
    }
}

extension ListPopularFolmViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let film = films[indexPath.item]
       
        let filmDetailsViewController = FilmDetailsViewController(film: film)
        
        
        navigationController?.pushViewController(filmDetailsViewController, animated: true)
        
        
    }
}
