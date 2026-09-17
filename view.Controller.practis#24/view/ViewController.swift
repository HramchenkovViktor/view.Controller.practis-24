//
//  ViewController.swift
//  view.Controller.practis#24
//
//  Created by Виктор on 17.09.2026.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    private let titleLabel = UILabel()
    private let selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Популярные фильмы"
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(selectedButton)
        
        titleLabel.text = "Популярный фильмы! 🎥"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = .systemBlue
        titleLabel.textAlignment = .center
        titleLabel.layer.cornerRadius = 15
        titleLabel.clipsToBounds = true
        
        selectedButton.setTitle("Выбрать фильм", for: .normal)
        selectedButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        selectedButton.tintColor = .white
        selectedButton.backgroundColor = .systemBlue
        selectedButton.layer.cornerRadius = 15
        selectedButton.clipsToBounds = true
        selectedButton.addTarget(self, action: #selector(selectedButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(100)
            $0.height.equalTo(50)
        }
        selectedButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(100)
            $0.height.equalTo(50)
        }
    }
    @objc private func selectedButtonTapped() {
        let listPopularViewController = ListPopularFolmViewController()
        
        navigationController?.pushViewController(listPopularViewController, animated: true)
    }

}

