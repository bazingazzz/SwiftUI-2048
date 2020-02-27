import SwiftUI

struct SmallActionButton: View {
    let title: String
    let action: () -> ()
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .black, design: .rounded))
                .padding(.horizontal, 20)
                .padding(.vertical, 11)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

struct SmallActionButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallActionButton(title: "MENU") { }
    }
}
