import SwiftUI

//每一格
struct Tile: View {
    //数字
    let value: Int
    //是否加入
    let wasAdded: Bool
    //style
    private let style: TileStyle
    //标题
    private let title: String
    //字体大小
    private let size: CGFloat = 70
    
    init(_ value: Int, wasAdded: Bool = false) {
        self.wasAdded = wasAdded
        self.value = value
        style = TileStyle(value)
        title = value == 0 ? "" : value.description
    }
    
    //字体大小
    private var fontSize: CGFloat {
        switch value.digits {
        case 1, 2:
            return 30
        case 3:
            return 28
        default:
            return 22
        }
    }
    
    //阴影颜色
    private var shadowColor: Color {
        value > 100 ? .yellow : .clear
    }
    
    //阴影大小
    private var shadowColorsSize: CGFloat {
        switch value {
        case 128:
            return 1
        case 256:
            return 3
        case 512:
            return 5
        case 1024:
            return 7
        case 2048:
            return 9
        default:
            return 11
        }
    }
    
    
    //body
    var body: some View {
        Text(title)
            .font(.system(size: fontSize, weight: .black, design: .rounded))
            .foregroundColor(style.foregroundColor)
            .frame(width: size, height: size)
            .background(style.backgroundColor)
            .cornerRadius(4)
            .shadow(color: shadowColor, radius: shadowColorsSize, x: 0, y: 0)
            .animation(wasAdded ? .easeIn : .none)
    }
}

#if DEBUG
struct Tile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Tile(0)
            Tile(2)
            Tile(4)
            Tile(8)
            Tile(16)
            Tile(32)
            Tile(256)
            Tile(512)
            Tile(1024)
            Tile(2048)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
#endif
