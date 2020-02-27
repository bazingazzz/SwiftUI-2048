import SwiftUI

//枚举 方块样式
enum TileStyle {
    case empty
    case two
    case four
    case eigth
    case sixteen
    case thirtyTwo
    case sixtyFour
    case onehundredtwentyeight
    case twohundredsfiftysix
    case fivehundredstwelve
    case onethousandtwentyfour
    case twothousandsfoutyeight
    case max
    
    init(_ value: Int) {
        switch value {
        case 0: self = .empty
        case 2: self = .two
        case 4: self = .four
        case 8: self = .eigth
        case 16: self = .sixteen
        case 32: self = .thirtyTwo
        case 64: self = .sixtyFour
        case 128: self = .onehundredtwentyeight
        case 256: self = .twohundredsfiftysix
        case 512: self = .fivehundredstwelve
        case 1024: self = .onethousandtwentyfour
        case 2048: self = .twothousandsfoutyeight
        default: self = .max
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .empty: return .tileEmpty
        case .two: return .tileTwo
        case .four: return .tileFour
        case .eigth: return .tileEight
        case .sixteen: return .tileSixteen
        case .thirtyTwo: return .tileThirtyTwo
        case .sixtyFour: return .tileSixtyFour
        case .onehundredtwentyeight: return .tileonehundredtwentyeight
        case .twohundredsfiftysix: return .tiletwohundredsfiftysix
        case .fivehundredstwelve: return .tilefivehundredstwelve
        case .onethousandtwentyfour: return .tileonethousandtwentyfour
        case .twothousandsfoutyeight: return .tiletwothousandsfoutyeight
        case .max: return .tileMax
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .two, .four: return .tileDarkTitle
        default: return .white
        }
    }
}
