//
//  ViewController.swift
//  Filterer
//
//  Created by Gurnoor Singh Khurana on 26/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var filters = Filters()
    var myRGBA:RGBAImage?
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var chooseImageButton: UIButton!
    @IBOutlet weak var filtersButton: UIButton!
    @IBOutlet weak var compareButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    
    @IBOutlet weak var imageState: UILabel!
    
    var imagePicker = UIImagePickerController()
    var originalImage:UIImage?
    var filteredImage:UIImage?
    
    func applyFilterToImage(name:String){
        filters.applyFilter(name: name, myRGBA: &myRGBA)
        filteredImage = myRGBA!.toUIImage()
        mainImage.image = filteredImage
        imageState.text=""
        compareButton.isEnabled = true
    }
    
    func chooseImageFromCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func chooseImagefromGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        filtersButton.isEnabled = false
        compareButton.isEnabled = false
        shareButton.isEnabled = false
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        mainImage.isUserInteractionEnabled = true
        mainImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        let choosefromGallery = UIAlertAction(title: "Choose From Gallery", style: .default, handler: {
            (UIAlertAction) in self.chooseImagefromGallery()
        })
        
        let useCamera = UIAlertAction(title: "Open Camera", style: .default, handler:{
            (UIAlertAction) in self.chooseImageFromCamera()
        })
        
        optionMenu.addAction(choosefromGallery)
        optionMenu.addAction(useCamera)
        optionMenu.addAction(UIAlertAction(title:"Cancel",style:.cancel))
        self.present(optionMenu,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            mainImage.contentMode = .scaleAspectFit
            mainImage.image = pickedImage
            originalImage = pickedImage
            filtersButton.isEnabled = true
            shareButton.isEnabled = true
            myRGBA = RGBAImage(image: mainImage.image!)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func filtersActionSheet(_ sender: UIButton) {
        let actionSheet = UIAlertController(title:nil, message:"Choose Filter",preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title:"Warm", style: .default, handler:{
            _ in self.applyFilterToImage(name: "warm")
        }))
        actionSheet.addAction(UIAlertAction(title:"Brighten", style: .default, handler:{
            _ in self.applyFilterToImage(name: "brightness")
        }))
        actionSheet.addAction(UIAlertAction(title:"Contrast", style: .default, handler:{
            _ in self.applyFilterToImage(name: "contrast")
        }))
        actionSheet.addAction(UIAlertAction(title:"Cold", style: .default, handler:{
            _ in self.applyFilterToImage(name: "cold")
        }))
        actionSheet.addAction(UIAlertAction(title:"Vignette", style: .default, handler:{
            _ in self.applyFilterToImage(name: "vignette")
        }))
        actionSheet.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler:{
            _ in
        }))
        self.present(actionSheet,animated: true,completion: nil)
    }
    
    
    @IBAction func compareImage(_ sender: UIButton) {
        if(mainImage.image==filteredImage){
            UIView.transition(with: mainImage, duration: 0.33, options: .transitionCrossDissolve, animations: {
                self.mainImage.image = self.originalImage
                self.imageState.text="Original"
            }, completion: nil)
        }
        else{
            UIView.transition(with: self.mainImage, duration: 0.33, options: .transitionCrossDissolve, animations: {
                self.mainImage.image = self.filteredImage
                self.imageState.text="Edited"
            }, completion: nil)
            
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if(compareButton.isEnabled && mainImage.image==filteredImage){
            let tappedImage = tapGestureRecognizer.view as! UIImageView
            UIView.transition(with: self.mainImage, duration: 0.33, options: .transitionCrossDissolve, animations: {
                    tappedImage.image = self.originalImage
                    self.imageState.text="Original"
                }, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                UIView.transition(with: self.mainImage, duration: 0.33, options: .transitionCrossDissolve, animations: {
                       tappedImage.image = self.filteredImage
                       self.imageState.text="Edited"
                    }, completion: nil)
            }
        }
    }
    
    
    @IBAction func shareImage(_ sender: UIButton) {
        let imageShare = [ mainImage.image ]
        let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

