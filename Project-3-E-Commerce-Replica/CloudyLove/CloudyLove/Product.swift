//  Product.swift
//  CloudyLove
//
//  Created by Theron Jones on 4/10/17.
//  Copyright © 2017 Theron Jones. All rights reserved.
//

import UIKit
import Firebase

// TJ: 4-10-17 Restructed previously written data to be generalized for any product item
class Product: NSObject, NSCoding {

    var name: String
    var productDescription: String
    var size: String
    var cost: Double
    var imageURL: String
    var productID: String
    private var image: UIImage?
    var category: String

    init (name: String, description: String, size: String, cost: Double, imageURL: String, productID: String, category: String) {
        self.name = name
        self.productDescription = description
        self.size = size
        self.cost = cost
        self.imageURL = imageURL
        self.productID = productID
        self.category = category
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(productDescription, forKey: "description")
        aCoder.encode(size, forKey: "size")
        aCoder.encode("\(cost)", forKey: "cost")
        //print(imageURL.absoluteString)
        aCoder.encode(imageURL, forKey: "imageURL")
        aCoder.encode(productID, forKey: "productID")
        aCoder.encode(category, forKey: "category")
    }

    convenience required init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: "name") as? String else {
            return nil
        }
        guard let description = aDecoder.decodeObject(forKey: "description") as? String else {
            return nil
        }
        guard let size = aDecoder.decodeObject(forKey: "size") as? String else {
            return nil
        }

        guard let costString = aDecoder.decodeObject(forKey: "cost") as? String else {
            return nil
        }
        guard let cost = Double(costString) else {
            return nil
        }

        guard let imageURL = aDecoder.decodeObject(forKey: "imageURL") as? String else {
            return nil
        }

//        guard let url = URL(string: imageURL) else { return nil }

        guard let productID = aDecoder.decodeObject(forKey: "productID") as? String else {
            return nil
        }
        guard let category = aDecoder.decodeObject(forKey: "category") as? String else {
            return nil
        }
        
        self.init(name: name, description: description, size: size, cost: cost, imageURL: imageURL, productID: productID, category: category)
    }


    // TJ: 4-10-17 Going to pull an image
    func showImage(completion: @escaping (UIImage) -> Void) {
        if let image = image { completion(image); return }
        FirebaseManager.shared.storageRef.storage.reference(forURL:
            //"gs://cloudylove-d2961.appspot.com/" +
            imageURL).data(withMaxSize: INT64_MAX) { (imageData, error)
                in
                guard error == nil else {
                    print ("error downloading: \(error!)")
                    return
                }
                guard let imageData = imageData else { return }
                // TJ: if everything is good then I'll get here and grab an image, next lets drop it into Favorites
                if let image = UIImage(data: imageData) {
                    self.image = image
                    completion(image)
                }
        }
    }


    static func create (fromJSON json: [AnyHashable : Any]) -> Product? {
        guard let category = json["category"] as? String else {
            return nil
        }
        guard let cost = json["cost"] as? Double else {
            return nil
        }
        guard let description = json["description"] as? String else {
            return nil
        }
        guard let imageURL = json["imageURL"] as? String else {
            return nil
        }
//        guard let imageURL = URL(string: url) else {
//            print(url)
//            return nil
//        }
        guard let name = json["name"] as? String else {
            return nil
        }
        guard let productID = json["productID"] as? String else {
            return nil
        }
        guard let size = json["size"] as? String else {
            return nil
        }


        return Product(name: name, description: description, size: size, cost: cost, imageURL: imageURL, productID: productID, category: category)
    }

    // TJ: 4/12/17 - NSCoding Persistence: Setup Directory for Local Persistence
    private static let DocumentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let FavoriteArchiveURL = DocumentDirectory.appendingPathComponent("favorite")
    private static let CartArchiveURL = DocumentDirectory.appendingPathComponent("cart")

    // TJ: 4/12/17 - NSCoding Persistence: Functions for local saving
    @discardableResult static func saveFavorites(_ products: [Product]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(products, toFile: Product.FavoriteArchiveURL.path)
    }
    @discardableResult static func saveCart(_ products: [Product]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(products, toFile: Product.CartArchiveURL.path)
    }

    // TJ: 4/12/17 - NSCoding Persistence: Functions for local reading
    static func readFavorites() -> [Product] {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Product.FavoriteArchiveURL.path) as? [Product] ?? []
    }
    static func readCart() -> [Product] {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Product.CartArchiveURL.path) as? [Product] ?? []
    }
    
}

