//
//  ViewController.swift
//  ImagePicker
//
//  Created by hongjuyeon_dev on 16/09/2019.
//  Copyright © 2019 hongjuyeon_dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       imagePicker.delegate = self
    }
    
    func openAlbum(){
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func openCamera(){
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addImage(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "", message: "사진 설정", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "앨범에서 사진 선택", style: .default, handler: { (_) in
            print("앨범 열기")
            self.openAlbum()
        }))
        alert.addAction(UIAlertAction(title: "카메라로 사진 촬영", style: .default, handler: { (_) in
            print("카메라로 사진 촬영")
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
}
