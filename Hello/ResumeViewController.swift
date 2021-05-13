//
//  ResumeViewController.swift
//  Hello
//
//  Created by Brian Foutty on 5/13/21.
//
import PDFKit
import UIKit

class ResumeViewController: UIViewController {
    
    let resume = Bundle.main.url(forResource: "MyResume_project_example", withExtension: "pdf")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Your name"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        let pdfView = PDFView()
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        guard let path = Bundle.main.url(forResource: "MyResume_project_example", withExtension: "pdf") else { return }
        
        if let document = PDFDocument(url: path) {
            pdfView.document = document
        }
    }
    
    @objc func shareTapped() {
        
        guard let document = resume else { return }
        let message = "Thank you for looking at my resume. It looks great. Doesn't it make you want to offer me the job?"
        
        let view = UIActivityViewController(activityItems: [document, message], applicationActivities: [])
        
        view.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(view, animated: true)
        
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

