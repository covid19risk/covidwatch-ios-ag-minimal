//
//  Created by Zsombor Szabo on 03/05/2020.
//  
//

import SwiftUI

struct SubCallToAction: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat-Regular", size: 14))
            .foregroundColor(Color("Title Text Color"))
            .multilineTextAlignment(.center)
    }
}
