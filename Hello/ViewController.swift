//
//  ViewController.swift
//  Hello
//
//  Created by Brian Foutty on 5/8/21.
//
import SafariServices
import UIKit

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    let phoneNumber = "3308470503"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callBrian(_ sender: Any) {
        // this enables a physical device to call our phone number
        if let url = NSURL(string: "tel://\(phoneNumber)") {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            
            // since the Simulator cannot make phone call. This line will print a string to the console to confirm the code executed.
            print("The phone is calling my number. Voicemail would be triggered automatically if this were a physical device.")
        }
    }
    
    @IBAction func skillsButtonTapped(_ sender: Any) {
        showWebPage()
    }
    
    
    
    func showWebPage() {
        let urlString = "https://www.swiftteacher.org"
        
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let view = SFSafariViewController(url: url, configuration: config)
            view.delegate = self
            present(view, animated: true)
        }
    }
    
    /*
    @IBAction func unwindToHome(unwindSegue: UIStoryboardSegue) {
        
    }*/

}

