//
//  ReleaseViewController.swift
//  NANO
//
//  Created by DwaeWoo on 2024/01/17.
//

import UIKit
import SnapKit

final class ReleaseViewController: UIViewController {
    
    //MARK: - Declaration
    private lazy var songListView: SongListView = {
        let view = SongListView()
        view.songInfoTableView.dataSource = self
        view.songInfoTableView.delegate = self
        
        return view
    }()
    
    //MARK: - Initialize
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Cycle
    override func loadView() {
        self.view = songListView
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControll()
//        setUpViews()
    }
    
    //MARK: - Navigation
    private func navigationControll() {
        navigationController?.navigationBar.topItem?.title = "신곡"
    }
}

extension ReleaseViewController {
    
    //MARK: - Function
    private func setUpViews() {
        
        self.view.addSubview(songListView)
        songListView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - Delegate, DataSource
extension ReleaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let songInfoCell = tableView.dequeueReusableCell(SongInfoCell.self, for: indexPath)
        songInfoCell.bind(model: .init(no: "no", title: "title", singer: "singer"))
        
        return songInfoCell
    }
}