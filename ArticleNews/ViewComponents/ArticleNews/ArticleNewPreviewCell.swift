//
//  ArticleNewPreviewCell.swift
//  ArticleNews
//
//  Created by Bing Bing on 2022/6/19.
//

import UIKit

class ArticleNewPreviewCell: UICollectionViewCell {
    
    static let nib = UINib(nibName: "ArticleNewPreviewCell", bundle: nil)

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var comment: UIButton!
    
    @IBOutlet weak var link: UIButton!
    
    var urlHandler: ((String) -> Void)? = nil
    var commentsHandler: ((Int) -> Void)? = nil
    
    var article: Article? {
        didSet {
            self.label.text = article?.title
            self.comment.setTitle(String(article?.descendants ?? 0) + " comments", for: .normal)
            self.link.alpha = 1
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.label.text = ""
        self.comment.setTitle("", for: .normal)
        self.link.alpha = 0
        self.link.addTarget(self, action: #selector(didLinkButtonTapped), for: .touchUpInside)
        self.comment.addTarget(self, action: #selector(didCommentsButtonTapped), for: .touchUpInside)
    }
    
    @objc private func didLinkButtonTapped() {
        guard let article = article else {
            return
        }
        
        self.urlHandler?(article.url)
    }
    
    @objc private func didCommentsButtonTapped() {
        guard let article = article else {
            return
        }
        
        self.commentsHandler?(article.id)
    }
}
