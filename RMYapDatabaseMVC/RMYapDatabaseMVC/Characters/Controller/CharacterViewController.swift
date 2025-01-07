//
//  ViewController.swift
//  RMYapDatabaseMVC
//
//  Created by Ибрагим Габибли on 29.12.2024.
//

import UIKit
import SnapKit

final class CharacterViewController: UIViewController {
    lazy var characterView: CharacterView = {
        let view = CharacterView(frame: .zero)
        return view
    }()

    let characterTableViewDataSource = CharacterTableViewDataSource()

    override func loadView() {
        super.loadView()
        view = characterView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        getCharacters()
    }

    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        characterView.configureTableView(dataSource: characterTableViewDataSource)
    }

    private func setupNavigationBar() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .white
    }

    private func getCharacters() {
        let savedCharacters = DatabaseManager.shared.loadAllCharacters()
        if !savedCharacters.isEmpty {
            characterTableViewDataSource.characters = savedCharacters
            characterView.tableView.reloadData()
        } else {
            NetworkManager.shared.getCharacters { [weak self] result in
                switch result {
                case .success(let characters):
                    DispatchQueue.main.async {
                        self?.characterTableViewDataSource.characters = characters
                        self?.characterView.tableView.reloadData()
                        characters.forEach { character in
                            DatabaseManager.shared.saveCharacter(character, key: "\(character.id)")
                        }
                    }
                case .failure(let error):
                    print("Failed to fetch characters: \(error.localizedDescription)")
                }
            }
        }
    }
}
