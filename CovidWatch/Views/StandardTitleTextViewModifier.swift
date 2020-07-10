//
//  Created by Zsombor Szabo on 03/05/2020.
//  
//

import SwiftUI

struct StandardTitleTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-SemiBold", size: 31))
            .foregroundColor(Color("Title Text Color"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
