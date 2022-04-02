//
//  ViewController.swift
//  Photo_Gallery
//
//  Created by Ahmad Mustafa on 02/04/2022.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Proporties
    @IBOutlet weak var colllectionView: UICollectionView!
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    
    private let reuseIdentifer = "Item_Cell"
    
    private var photos: [PhotoElement] = []{
        didSet{
            DispatchQueue.main.async {
                self.colllectionView.reloadData()
            }
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        confiureUI()
        fetchPhotos()
    }

    //MARK: - Helpers
    private func confiureUI(){
        title = "Search"
        
        colllectionView.delegate = self
        colllectionView.dataSource = self
        colllectionView.register(UINib(nibName: "Item_Cell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifer)
        
        gridButton.setTitle("", for: .normal)
        listButton.setTitle("", for: .normal)
        
        gridButton.addTarget(self, action: #selector(handleGridButton), for: .touchUpInside)
        listButton.addTarget(self, action: #selector(handleListButton), for: .touchUpInside)
    }
    
    private func fetchPhotos(){
        Auth_API.fetchPhotos { photos in
            guard let photos = photos else {return}
            print("photo \(photos)")
            self.photos = photos
        }
    }
    
    @objc func handleGridButton(){
//        gridButton.selectAction = .select
//        listButton.selectAction = .nonSelect
        
        gridButton.setImage(UIImage(named: "Vector-1"), for: .normal)
        listButton.setImage(UIImage(named: "Vector"), for: .normal)
    }
    
    @objc func handleListButton(){
//        gridButton.selectAction = .nonSelect
//        listButton.selectAction = .select
//
        gridButton.setImage(UIImage(named: "Vector-3"), for: .normal)
        listButton.setImage(UIImage(named: "Vector-2"), for: .normal)
    }

}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! Item_Cell
        
        let photo = photos[indexPath.row]
        let img = photo.urls?.small ?? ""
        let name = photo.user?.name ?? ""
        let description = photo.photoDescription ?? ""
        
        cell.configureData(img: img, titleText: name, descriptionText: description)
        
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        let height = width + 150

        return CGSize(width: width, height: height)
    }
}
