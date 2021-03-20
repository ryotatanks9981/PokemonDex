import UIKit

extension UIColor {
    static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> UIColor {
        .init(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    static let themeColor = UIColor.red
}

extension UIColor {
    static let fire = #colorLiteral(red: 1, green: 0.631372549, blue: 0.3215686275, alpha: 1)
    static let grass = #colorLiteral(red: 0.3607843137, green: 0.7490196078, blue: 0.4039215686, alpha: 1)
    static let poison = #colorLiteral(red: 0.7254901961, green: 0.3843137255, blue: 0.8117647059, alpha: 1)
    static let flying = #colorLiteral(red: 0.6078431373, green: 0.7019607843, blue: 0.8823529412, alpha: 1)
    static let water = #colorLiteral(red: 0.5803921569, green: 0.768627451, blue: 0.9058823529, alpha: 1)
    static let bug = #colorLiteral(red: 0.6078431373, green: 0.8078431373, blue: 0.1921568627, alpha: 1)
    static let normal = #colorLiteral(red: 0.568627451, green: 0.6039215686, blue: 0.6274509804, alpha: 1)
    static let electric = #colorLiteral(red: 0.968627451, green: 0.8549019608, blue: 0.3568627451, alpha: 1)
    static let ground = #colorLiteral(red: 0.8431372549, green: 0.5529411765, blue: 0.368627451, alpha: 1)
    static let fairy = #colorLiteral(red: 1, green: 0.6823529412, blue: 0.9411764706, alpha: 1)
    static let ice = #colorLiteral(red: 0.4901960784, green: 0.8235294118, blue: 0.7803921569, alpha: 1)
    static let dark = #colorLiteral(red: 0.4, green: 0.4078431373, blue: 0.4705882353, alpha: 1)
    static let ghost = #colorLiteral(red: 0.3843137255, green: 0.4274509804, blue: 0.7450980392, alpha: 1)
    static let psychic = #colorLiteral(red: 0.9882352941, green: 0.5607843137, blue: 0.5490196078, alpha: 1)
    static let rock = #colorLiteral(red: 0.8156862745, green: 0.7647058824, blue: 0.5921568627, alpha: 1)
    static let steel = #colorLiteral(red: 0.3294117647, green: 0.5921568627, blue: 0.6392156863, alpha: 1)
    static let dragon = #colorLiteral(red: 0.07058823529, green: 0.4039215686, blue: 0.737254902, alpha: 1)
    static let fighting = #colorLiteral(red: 0.8470588235, green: 0.2980392157, blue: 0.4078431373, alpha: 1)
    
    static func setTypeColor(typeCase: TypeCase) -> UIColor {
        switch typeCase {
        case .grass:
            return .grass
        case .poison:
            return .poison
        case .fire:
            return .fire
        case .flying:
            return .flying
        case .water:
            return .water
        case .bug:
            return .bug
        case .normal:
            return .normal
        case .electric:
            return .electric
        case .ground:
            return .ground
        case .fairy:
            return .fairy
        case .ice:
            return .ice
        case .dark:
            return .dark
        case .ghost:
            return .ghost
        case .psychic:
            return .psychic
        case .rock:
            return .rock
        case .steel:
            return .steel
        case .dragon:
            return .dragon
        case .fighting:
            return .fighting
        }
    }
}
