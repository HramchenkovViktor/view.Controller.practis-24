//
//  FilmDetailsViewController.swift
//  view.Controller.practis#24
//
//  Created by Виктор on 17.09.2026.
//

import UIKit
import SnapKit

class FilmDetailsViewController: UIViewController {

    let film: Film
    
    let posterName = UIImageView()
    let nameLabel = UILabel()
    let yearLabel = UILabel()
    let ratingLabel = UILabel()
    

    init(film: Film) {
        self.film = film
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupConstraints()
        configure()
    }
    func configure() {
        posterName.image = UIImage(named: film.posterName)
        nameLabel.text = film.name
        yearLabel.text = "\(film.year)"
        ratingLabel.text = "\(film.rating)"
    }
    func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(posterName)
        view.addSubview(nameLabel)
        view.addSubview(yearLabel)
        view.addSubview(ratingLabel)
        
    }
    func setupConstraints() {
        posterName.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(posterName.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        yearLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(yearLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
    }
 }
