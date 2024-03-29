//
//  SearchViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2023/11/29.
//

import UIKit

final class SearchViewController: UIViewController {
    
    //MARK: - Declaration
    private lazy var searchView: SearchView = {
        let view = SearchView()
        view.songInfoTableView.dataSource = self
        view.songInfoTableView.delegate = self
        
        return view
    }()
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = searchView
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "검색"
        self.tabBarController?.navigationItem.title = "검색"
    }
    
    //MARK: - Override
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

//MARK: - Delegate, DataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let snapshotView = view.snapshotView(afterScreenUpdates: true) else {
            return
        }
        
        let songInfoView = SongDetailInfoView(hasReserveButton: true)
        let popUpVC = PopUpViewController(snapshotView: snapshotView, contentView: songInfoView)
        
        songInfoView.delegate = popUpVC
        
        popUpVC.modalTransitionStyle = .crossDissolve
        popUpVC.modalPresentationStyle = .fullScreen
        
        self.present(popUpVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songInfoCell = tableView.dequeueReusableCell(SongInfoCell.self, for: indexPath)
        songInfoCell.bind(model: .init(no: "no", title: "title", singer: "singer"))
        
        return songInfoCell
    }
}
