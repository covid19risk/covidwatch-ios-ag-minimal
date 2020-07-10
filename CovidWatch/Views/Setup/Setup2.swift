//
//  Created by Zsombor Szabo on 04/05/2020.
//  
//

import SwiftUI

struct Setup2: View {

    @EnvironmentObject var userData: UserData

    var dismissesAutomatically: Bool

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    init(dismissesAutomatically: Bool = false) {
        self.dismissesAutomatically = dismissesAutomatically
    }

    var body: some View {

        ZStack(alignment: .bottom) {

            ScrollView(.vertical, showsIndicators: false) {

                VStack(spacing: 0) {

                    Spacer(minLength: .headerHeight)

                    HowItWorksTitleText(text: Text(verbatim: String.localizedStringWithFormat(NSLocalizedString("SETUP_PRE_TITLE", comment: ""), NSNumber(value: 2), NSNumber(value: 2)).uppercased()))

                    Text("ENABLE_PUSH_NOTIFICATIONS_TITLE")
                        .modifier(StandardTitleTextViewModifier())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 2 * .standardSpacing)

                    Spacer(minLength: 2 * .standardSpacing)

                    Image("Setup 2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .accessibility(label: Text("ENABLE_PUSH_NOTIFICATIONS_IMAGE_ACCESSIBILITY_LABEL"))
                        .padding(.horizontal, 2 * .standardSpacing)

                    Spacer(minLength: 2 * .standardSpacing)

                    Text("ENABLE_PUSH_NOTIFICATIONS_MESSAGE")
                        .modifier(SetupMessageTextViewModifier())
                        .padding(.horizontal, 2 * .standardSpacing)

                    Spacer(minLength: .stickyFooterHeight + .standardSpacing)

                }
            }

            VStack {

                Button(action: {

                    UNUserNotificationCenter.current().requestAuthorization(
                        options: [.alert, .sound, .badge],
                        completionHandler: { (_, error) in

                            DispatchQueue.main.async {
                                if let error = error {
                                    UIApplication.shared.topViewController?.present(error, animated: true)
                                    return
                                }

                                withAnimation {
                                    self.userData.isUserNotificationsSetup = true
                                }

                                if self.dismissesAutomatically {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                    })

                }) {

                    Text("ENABLE").modifier(SmallCallToAction())

                }
                .padding(.top, .standardSpacing)
                .padding(.horizontal, 2 * .standardSpacing)

                Button(action: {

                    withAnimation {
                        self.userData.isUserNotificationsSetup = true
                    }

                    if self.dismissesAutomatically {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {

                    Text("NOT_NOW")
                        .font(.custom("Montserrat-Medium", size: 16))
                        .frame(maxWidth: .infinity)
                        .padding()

                }
                .padding(.top, 5)
                .padding(.horizontal, 2 * .standardSpacing)
                .padding(.bottom, .standardSpacing)

            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .stickyFooterHeight, alignment: .topLeading)
            .background(BlurView(style: .systemChromeMaterial).edgesIgnoringSafeArea(.all))
        }
    }
}

struct Setup2_Previews: PreviewProvider {
    static var previews: some View {
        Setup2()
    }
}
