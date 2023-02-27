//
//  SafariView.swift
//  ListJson
//
//  Created by 이종현 on 2022/11/24.
//

import SwiftUI
import SafariServices

//struct SafariView: UIViewControllerRepresentable {
//    let url: URL
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
//
//        return SFSafariViewController(url: url)
//    }
//
//    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
//        // ...
//    }
//}

struct SafariQueryView: UIViewControllerRepresentable {
    
    @Binding var prefixUrl : String
    @Binding var query : String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariQueryView>) -> SFSafariViewController {
        let url = URL(string: "\(prefixUrl)\(query)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariQueryView>) {
        // ...
    }
}

//struct SafariQueryView_Previews: PreviewProvider {
//    var quote1 : String = "BreakingBad"
//    var youtubeUrl1 : String = "https://www.youtube.com/results?search_query="
//    static var previews: some View {
//        SafariQueryView(prefixUrl: .constant(""), query: .constant(""))
//    }
//}



