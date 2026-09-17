//
//  FilmCell.swift
//  view.Controller.practis#24
//
//  Created by Виктор on 17.09.2026.
//

import UIKit
import SnapKit

class FilmCell: UICollectionViewCell {

    let posterImageView = UIImageView()
    let nameLabel = UILabel()
    let yearLabel = UILabel()
    let ratingLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(ratingLabel)

        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true

        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        yearLabel.font = .systemFont(ofSize: 14)
        yearLabel.textColor = .secondaryLabel

        ratingLabel.font = .systemFont(ofSize: 14)

        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.backgroundColor = .secondarySystemBackground
    }

    func setupConstraints() {
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(160)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
        yearLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(yearLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(20)
        }
    }

    func configure(with film: Film) {
        posterImageView.image = UIImage(named: film.posterName)
        nameLabel.text = film.name
        ratingLabel.text = "\(film.rating)"
        yearLabel.text = "\(film.year)"
    }
}
