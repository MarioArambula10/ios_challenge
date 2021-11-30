//
//  CarListTableViewCell.swift
//  IOSChallenge
//
//  Created by Mario Arambula on 21.11.2021.
//

import UIKit

class CarListTableViewCell: GenericTableViewCell<CarListViewModel> {
    
    let carImageView = UIImageView()
    let favoriteIconButton = UIButton(type: .system)
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    let yearLabel = UILabel()
    let milageLabel = UILabel()
    let vinLabel = UILabel()
    private let viewModel = ViewModel()
    
    let systemConfig = UIImage.SymbolConfiguration.init(pointSize: 18, weight: .bold)
    
    override var item: CarListViewModel? {
        didSet {
            if item != oldValue {
                nameLabel.text = item?.carName
                carImageView.image = item?.carImage
                priceLabel.text = item?.carPrice
                milageLabel.text = item?.carMilage
                yearLabel.text = item?.carMakeYear
                vinLabel.text = item?.carVINNumber
                favoriteIconButton.isSelected = item?.carIsFavorite ?? false
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func favoriteButtonWasPressed(sender: UIButton) {
        guard let item = item else { return }
        viewModel.favoriteButtonWasPressed(item: item) { errorString in
            if let errorString = errorString {
                //show error
            } else {
                sender.isSelected.toggle()
            }
        }
    }
    
    func configure() {
        
        selectionStyle = .none
        
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .left
        nameLabel.lineBreakMode = .byTruncatingTail
        
        priceLabel.textColor = .systemGreen
        priceLabel.font = .systemFont(ofSize: 18, weight: .bold)
        priceLabel.numberOfLines = 1
        priceLabel.textAlignment = .left
        priceLabel.lineBreakMode = .byTruncatingTail
        
        milageLabel.textColor = .darkGray
        milageLabel.font = .systemFont(ofSize: 16)
        milageLabel.numberOfLines = 1
        milageLabel.textAlignment = .left
        milageLabel.lineBreakMode = .byTruncatingTail
        
        yearLabel.textColor = .darkGray
        yearLabel.font = .systemFont(ofSize: 16)
        yearLabel.numberOfLines = 1
        yearLabel.textAlignment = .left
        yearLabel.lineBreakMode = .byTruncatingTail
        
        vinLabel.textColor = .darkGray
        vinLabel.font = .systemFont(ofSize: 16)
        vinLabel.numberOfLines = 1
        vinLabel.textAlignment = .left
        vinLabel.lineBreakMode = .byTruncatingTail
        
        carImageView.contentMode = .scaleAspectFill
        carImageView.layer.cornerRadius = 8
        carImageView.clipsToBounds = true
        
        favoriteIconButton.addTarget(self, action: #selector(favoriteButtonWasPressed(sender:)), for: .touchUpInside)
        favoriteIconButton.setImage(systemConfig.image(named: "star"), for: .normal)
        favoriteIconButton.setImage(systemConfig.image(named: "star.fill"), for: .selected)
        favoriteIconButton.tintColor = .systemYellow
    }
    
    func setupViews() {
//        contentView.addSubview(carImageView)
//        contentView.addSubview(favoriteIconButton)
//        contentView.addSubview(nameLabel)
//        contentView.addSubview(priceLabel)
//        contentView.addSubview(yearLabel)
//        contentView.addSubview(milageLabel)
//        contentView.addSubview(vinLabel)
        
        let textLabels = UIStackView(arrangedSubviews: [nameLabel, priceLabel, yearLabel, milageLabel, vinLabel])
        textLabels.axis = .vertical
        let contentHorizontal = UIStackView(arrangedSubviews: [textLabels])
        
        
        contentView.addSubview(contentHorizontal)
        
        contentHorizontal.axis = .horizontal
        contentHorizontal.distribution = .fill
        contentHorizontal.translatesAutoresizingMaskIntoConstraints = false
        contentHorizontal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        contentHorizontal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        contentHorizontal.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        contentHorizontal.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
//        carImageView.translatesAutoresizingMaskIntoConstraints = false
//        favoriteIconButton.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
//        yearLabel.translatesAutoresizingMaskIntoConstraints = false
//        milageLabel.translatesAutoresizingMaskIntoConstraints = false
//        vinLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//        nameLabel.trailingAnchor.constraint(equalTo: favoriteIconButton.leadingAnchor, constant: -10).isActive = true
//        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
//
//        favoriteIconButton.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
//        favoriteIconButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
//        favoriteIconButton.heightAnchor.constraint(equalTo: nameLabel.heightAnchor).isActive = true
//        favoriteIconButton.widthAnchor.constraint(equalTo: favoriteIconButton.heightAnchor).isActive = true
//
//        carImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
//        carImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
//        carImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
//        carImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
//
//        priceLabel.topAnchor.constraint(equalTo: carImageView.topAnchor).isActive = true
//        priceLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10).isActive = true
//        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
//
//        milageLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5).isActive = true
//        milageLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor).isActive = true
//        milageLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor).isActive = true
//
//        yearLabel.topAnchor.constraint(equalTo: milageLabel.bottomAnchor, constant: 5).isActive = true
//        yearLabel.leadingAnchor.constraint(equalTo: milageLabel.leadingAnchor).isActive = true
//        yearLabel.trailingAnchor.constraint(equalTo: milageLabel.trailingAnchor).isActive = true
//
//        vinLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5).isActive = true
//        vinLabel.leadingAnchor.constraint(equalTo: yearLabel.leadingAnchor).isActive = true
//        vinLabel.trailingAnchor.constraint(equalTo: yearLabel.trailingAnchor).isActive = true
//        vinLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
}
