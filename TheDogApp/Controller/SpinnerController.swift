//
//  SpinnerController.swift
//  TheDogApp
//
//  Created by Joao Barros on 11/07/22.
//

import UIKit

class SpinnerController: UIViewController {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        
        let homeController = HomeController()
        print("Entrou na SPINNERCONTROLLER")
        
        for i in 0...1000 {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (t) in
                print("Mais 1 s")
                if homeController.getName() == ["primeiraTela"] {
                    print("Ainda no timer\(i)")
                }else{
                    print("fim do timer em i= \(i)")
                    self.dismiss(animated: false)
//                    self.present(homeController, animated: false) // quebra aqui
                }
            }
           
        }
        

    }

}
