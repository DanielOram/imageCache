//
//  ViewController.swift
//  imageCache
//
//  Created by Daniel Oram on 27/10/16.
//  Copyright © 2016 Daniel Oram. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //Image array to purge
    var cupcakeArray = [CupCake]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //load up some cupcakes
        cookCupcakes(3000)
    }
    
    //populate cupcakeArray
    func cookCupcakes(_ numberOfCupcakes: Int) {
        
        for _ in 0..<numberOfCupcakes {
            
            cupcakeArray.append(CupCake())  //should store referene to CupCake objects or Cupcake's Image?
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("DESTROYING CUPCAKES")
    }
    
    //delegate functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cupcakeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CupCakeCollectionViewCell
        
        cell.imageOfCell.image = cupcakeArray[indexPath.row].image
        
        return cell
    }


}

class CupCake {
    
    var image: UIImage!
    
    init(){
        image = #imageLiteral(resourceName: "cupcake")
    }
    
    deinit {
        print("cupcake was deallocated!")
    }
}
