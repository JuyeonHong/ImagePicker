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
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else{
            showToast(duration: 2, message: "Photo Library is not available")
        }
    }
    
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            showToast(duration: 2, message: "Camera is not available")
        }
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
    
    func showToast(duration: CGFloat, message: String){
        let toastLabel = UILabel()
        view.addSubview(toastLabel)
        toastLabel.frame = CGRect(x: (self.view.frame.width - 275)/2, y: (self.view.frame.height - 50)/2, width: 275, height: 50)
        
        toastLabel.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        toastLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        toastLabel.text = message
        toastLabel.textAlignment = .center
        
        toastLabel.layer.cornerRadius = 8
        toastLabel.clipsToBounds = true
        toastLabel.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        toastLabel.layer.borderWidth = 1
        
        UIView.animate(withDuration: TimeInterval(duration),
                       animations: { toastLabel.alpha = 0.0 },
                       completion: { (_) in
                        self.dismiss(animated: true, completion: nil)})
        
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    // 앨범에서 사진을 선택하고난 후의 동작 처리
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}
