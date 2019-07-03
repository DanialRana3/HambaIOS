//
//  Extensions.swift
//  xmlParser
//
//  Created by Admin on 21/06/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages
import NVActivityIndicatorView
import Accelerate



class XBViewController: UIViewController,NVActivityIndicatorViewable {}



  // MARK: - Validation Extensions
extension XBViewController {

    typealias callBack = (_ success:Bool) -> Void
    
    func isValidEmail(emailAddressString:String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
}

  // MARK: - BannerPopups Extension


extension XBViewController {
    
    func showBannerAlert_Warning(title:String,body:String) {
        
        // View setup
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
        
        
        view.configureTheme(backgroundColor:  UIColor(red: 68.0/255, green: 74.0/255, blue: 88.0/255, alpha: 1.0), foregroundColor: UIColor.white, iconImage: Icon.warningLight.image, iconText: nil)
        view.button?.setImage(Icon.errorSubtle.image, for: .normal)
        view.button?.setTitle(nil, for: .normal)
        view.button?.backgroundColor = UIColor.clear
        view.button?.tintColor = UIColor.white.withAlphaComponent(0.7)
        view.configureDropShadow()
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 5)
        // Set status bar style unless using card view (since it doesn't
        // go behind the status bar).
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    static func showBannerAlert_Warning(title:String,body:String)  {
        
        // View setup
        
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
        
        
        view.configureTheme(backgroundColor:  UIColor(red: 68.0/255, green: 74.0/255, blue: 88.0/255, alpha: 1.0), foregroundColor: UIColor.white, iconImage: Icon.warningLight.image, iconText: nil)
        view.button?.setImage(Icon.errorSubtle.image, for: .normal)
        view.button?.setTitle(nil, for: .normal)
        view.button?.backgroundColor = UIColor.clear
        view.button?.tintColor = UIColor.white.withAlphaComponent(0.7)
        view.configureDropShadow()
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 5)
        // Set status bar style unless using card view (since it doesn't
        // go behind the status bar).
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }

    static func showBannerAlert_Success(title:String,body:String)  {
        
        // View setup
        
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
        
        
        view.configureTheme(backgroundColor:  UIColor(red: 68.0/255, green: 74.0/255, blue: 88.0/255, alpha: 1.0), foregroundColor: UIColor.white, iconImage: Icon.successLight.image, iconText: nil)
        view.button?.setImage(Icon.errorSubtle.image, for: .normal)
        view.button?.setTitle(nil, for: .normal)
        view.button?.backgroundColor = UIColor.clear
        view.button?.tintColor = UIColor.white.withAlphaComponent(0.7)
        view.configureDropShadow()
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 5)
        // Set status bar style unless using card view (since it doesn't
        // go behind the status bar).
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    func showBannerAlert_Success(title:String,body:String)  {
        
        // View setup
        
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
        
        
        view.configureTheme(backgroundColor:  UIColor(red: 68.0/255, green: 74.0/255, blue: 88.0/255, alpha: 1.0), foregroundColor: UIColor.white, iconImage: Icon.successLight.image, iconText: nil)
        view.button?.setImage(Icon.errorSubtle.image, for: .normal)
        view.button?.setTitle(nil, for: .normal)
        view.button?.backgroundColor = UIColor.clear
        view.button?.tintColor = UIColor.white.withAlphaComponent(0.7)
        view.configureDropShadow()
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 5)
        // Set status bar style unless using card view (since it doesn't
        // go behind the status bar).
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    func showBannerAlert_Error(title:String,body:String)  {
        
        // View setup
        
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
        
        
        view.configureTheme(backgroundColor:  UIColor(red: 68.0/255, green: 74.0/255, blue: 88.0/255, alpha: 1.0), foregroundColor: UIColor.white, iconImage: Icon.errorLight.image, iconText: nil)
        view.button?.setImage(Icon.errorSubtle.image, for: .normal)
        view.button?.setTitle(nil, for: .normal)
        view.button?.backgroundColor = UIColor.clear
        view.button?.tintColor = UIColor.white.withAlphaComponent(0.7)
        view.configureDropShadow()
        
        // Config setup
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
        config.duration = .seconds(seconds: 5)
        // Set status bar style unless using card view (since it doesn't
        // go behind the status bar).
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    func showStatusBarMessage(msg:String, color:UIColor)  {
        let status = MessageView.viewFromNib(layout: .statusLine)
        status.backgroundView.backgroundColor = color
        status.bodyLabel?.textColor = UIColor.white
        status.configureContent(body: msg)
        var statusConfig = SwiftMessages.defaultConfig
        statusConfig.presentationStyle = SwiftMessages.PresentationStyle.top
        SwiftMessages.show(config: statusConfig, view: status)
    }
    
    static func demoCentered(title:String, Message:String ,btnTitle:String, iconStr:String,completionHandler: @escaping callBack)
    {
        let messageView: MessageView = MessageView.viewFromNib(layout: .centeredView)
        messageView.configureBackgroundView(width: 250)
        messageView.configureContent(title: title, body: Message, iconImage: nil, iconText: iconStr, buttonImage: nil, buttonTitle: btnTitle) { _ in
            SwiftMessages.hide()
            completionHandler(true)

        }
        messageView.backgroundView.backgroundColor = UIColor.init(white: 0.97, alpha: 1)
        messageView.backgroundView.layer.cornerRadius = 10
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .center
        config.duration = .forever
        config.dimMode = .blur(style: .dark, alpha: 1, interactive: true)
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: config, view: messageView)
    }
    
 static func asd(title:String,body:String)  {
        
        // View setup
        
        let view: MessageView
        view = MessageView.viewFromNib(layout: .cardView)
        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
    
    
    view.configureTheme(backgroundColor:  UIColor(red: 68.0/255, green: 74.0/255, blue: 88.0/255, alpha: 1.0), foregroundColor: UIColor.white, iconImage: Icon.errorSubtle.image, iconText: nil)
        view.button?.setImage(Icon.errorSubtle.image, for: .normal)
        view.button?.setTitle(nil, for: .normal)
        view.button?.backgroundColor = UIColor.clear
        view.button?.tintColor = UIColor.white.withAlphaComponent(0.7)
        view.configureDropShadow()
    
    // Config setup
    var config = SwiftMessages.defaultConfig
    config.presentationStyle = .top
    config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
    config.duration = .seconds(seconds: 5)
    
    // Show
        SwiftMessages.show(config: config, view: view)
    }
    
}

  // MARK: - Activity Indicator Extension

extension XBViewController{

    func startActivityIndicator(withMsg: String){
        NVActivityIndicatorView.DEFAULT_COLOR = UIColor.white
        let size = CGSize(width: 50, height: 50)
        
        startAnimating(size, message: withMsg, type: NVActivityIndicatorType.circleStrokeSpin)
  
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            self.stopAnimating()
        }
        
    }
}

  // MARK: - Date Extension

extension Date {
    var currentUTCTimeZoneDate: Date {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        
        var tmp = formatter.string(from: self)
        return formatter.date(from: tmp)!
    }
    
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    func GetString_yyyymmdd() -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
       
       return myString
    }
    func GetString_hhmmss() -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        
        return myString
    }
}

 // MARK: - Double Extension
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
 // MARK: - Image Extension
extension UIImage {
    
    
    var circle: UIImage {
        let square = size.width < size.height ? CGSize(width: size.width, height: size.width) : CGSize(width: size.height, height: size.height)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: square))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.image = self
        imageView.layer.cornerRadius = square.width/2
        imageView.layer.masksToBounds = true
        UIGraphicsBeginImageContext(imageView.bounds.size)
        imageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
//    func jpeg(_ quality: JPEGQuality) -> Data? {
//        UIImage.jpe
//        return UIImageJPEGRepresentation(self, quality.rawValue)
//    }
//
    func resizeImageWith(newSize: CGSize) -> UIImage {
        
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func resizeImageWithoutAspect(newSize: CGSize) -> UIImage {
        
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    public func applyLightEffect() -> UIImage? {
    return applyBlurWithRadius(30, tintColor: UIColor(white: 1.0, alpha: 0.3), saturationDeltaFactor: 1.8)
    }
    
    public func applyExtraLightEffect() -> UIImage? {
    return applyBlurWithRadius(20, tintColor: UIColor(white: 0.97, alpha: 0.82), saturationDeltaFactor: 1.8)
    }
    
    public func applyDarkEffect() -> UIImage? {
    return applyBlurWithRadius(20, tintColor: UIColor(white: 0.2, alpha: 0.15), saturationDeltaFactor: 1.8)
    }
    
    public func applyTintEffectWithColor(_ tintColor: UIColor) -> UIImage? {
    let effectColorAlpha: CGFloat = 0.6
    var effectColor = tintColor
    
    let componentCount = tintColor.cgColor.numberOfComponents
    
    if componentCount == 2 {
    var b: CGFloat = 0
    if tintColor.getWhite(&b, alpha: nil) {
    effectColor = UIColor(white: b, alpha: effectColorAlpha)
    }
    } else {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    if tintColor.getRed(&red, green: &green, blue: &blue, alpha: nil) {
    effectColor = UIColor(red: red, green: green, blue: blue, alpha: effectColorAlpha)
    }
    }
    
    return applyBlurWithRadius(10, tintColor: effectColor, saturationDeltaFactor: -1.0, maskImage: nil)
    }
    
    public func applyBlurWithRadius(_ blurRadius: CGFloat, tintColor: UIColor?, saturationDeltaFactor: CGFloat, maskImage: UIImage? = nil) -> UIImage? {
    // Check pre-conditions.
    if (size.width < 1 || size.height < 1) {
    print("*** error: invalid size: \(size.width) x \(size.height). Both dimensions must be >= 1: \(self)")
    return nil
    }
    guard let cgImage = self.cgImage else {
    print("*** error: image must be backed by a CGImage: \(self)")
    return nil
    }
    if maskImage != nil && maskImage!.cgImage == nil {
    print("*** error: maskImage must be backed by a CGImage: \(String(describing: maskImage))")
    return nil
    }
    
    let __FLT_EPSILON__ = CGFloat(Float.ulpOfOne)
    let screenScale = UIScreen.main.scale
    let imageRect = CGRect(origin: CGPoint.zero, size: size)
    var effectImage = self
    
    let hasBlur = blurRadius > __FLT_EPSILON__
    let hasSaturationChange = fabs(saturationDeltaFactor - 1.0) > __FLT_EPSILON__
    
    if hasBlur || hasSaturationChange {
    func createEffectBuffer(_ context: CGContext) -> vImage_Buffer {
    let data = context.data
    let width = vImagePixelCount(context.width)
    let height = vImagePixelCount(context.height)
    let rowBytes = context.bytesPerRow
    
    return vImage_Buffer(data: data, height: height, width: width, rowBytes: rowBytes)
    }
    
    UIGraphicsBeginImageContextWithOptions(size, false, screenScale)
    guard let effectInContext = UIGraphicsGetCurrentContext() else { return  nil }
    
    effectInContext.scaleBy(x: 1.0, y: -1.0)
    effectInContext.translateBy(x: 0, y: -size.height)
    effectInContext.draw(cgImage, in: imageRect)
    
    var effectInBuffer = createEffectBuffer(effectInContext)
    
    
    UIGraphicsBeginImageContextWithOptions(size, false, screenScale)
    
    guard let effectOutContext = UIGraphicsGetCurrentContext() else { return  nil }
    var effectOutBuffer = createEffectBuffer(effectOutContext)
    
    
    if hasBlur {
    // A description of how to compute the box kernel width from the Gaussian
    // radius (aka standard deviation) appears in the SVG spec:
    // http://www.w3.org/TR/SVG/filters.html#feGaussianBlurElement
    //
    // For larger values of 's' (s >= 2.0), an approximation can be used: Three
    // successive box-blurs build a piece-wise quadratic convolution kernel, which
    // approximates the Gaussian kernel to within roughly 3%.
    //
    // let d = floor(s * 3*sqrt(2*pi)/4 + 0.5)
    //
    // ... if d is odd, use three box-blurs of size 'd', centered on the output pixel.
    //
    
    let inputRadius = blurRadius * screenScale
    let d = floor(inputRadius * 3.0 * CGFloat(sqrt(2 * .pi) / 4 + 0.5))
    var radius = UInt32(d)
    if radius % 2 != 1 {
    radius += 1 // force radius to be odd so that the three box-blur methodology works.
    }
    
    let imageEdgeExtendFlags = vImage_Flags(kvImageEdgeExtend)
    
    vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
    vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
    vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, radius, radius, nil, imageEdgeExtendFlags)
    }
    
    var effectImageBuffersAreSwapped = false
    
    if hasSaturationChange {
    let s: CGFloat = saturationDeltaFactor
    let floatingPointSaturationMatrix: [CGFloat] = [
    0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
    0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
    0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
    0,                    0,                    0,  1
    ]
    
    let divisor: CGFloat = 256
    let matrixSize = floatingPointSaturationMatrix.count
    var saturationMatrix = [Int16](repeating: 0, count: matrixSize)
    
    for i: Int in 0 ..< matrixSize {
    saturationMatrix[i] = Int16(round(floatingPointSaturationMatrix[i] * divisor))
    }
    
    if hasBlur {
    vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
    effectImageBuffersAreSwapped = true
    } else {
    vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
    }
    }
    
    if !effectImageBuffersAreSwapped {
    effectImage = UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    UIGraphicsEndImageContext()
    
    if effectImageBuffersAreSwapped {
    effectImage = UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    UIGraphicsEndImageContext()
    }
    
    // Set up output context.
    UIGraphicsBeginImageContextWithOptions(size, false, screenScale)
    
    guard let outputContext = UIGraphicsGetCurrentContext() else { return nil }
    
    outputContext.scaleBy(x: 1.0, y: -1.0)
    outputContext.translateBy(x: 0, y: -size.height)
    
    // Draw base image.
    outputContext.draw(cgImage, in: imageRect)
    
    // Draw effect image.
    if hasBlur {
    outputContext.saveGState()
    if let maskCGImage = maskImage?.cgImage {
    outputContext.clip(to: imageRect, mask: maskCGImage);
    }
    outputContext.draw(effectImage.cgImage!, in: imageRect)
    outputContext.restoreGState()
    }
    
    // Add in color tint.
    if let color = tintColor {
    outputContext.saveGState()
    outputContext.setFillColor(color.cgColor)
    outputContext.fill(imageRect)
    outputContext.restoreGState()
    }
    
    // Output image is ready.
    let outputImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return outputImage
    }
    
    func saveImage(bottomImg:UIImage,topImg:UIImage)->UIImage{
      
        var originPoint = (bottomImg.size.width - topImg.size.width) / 2
        UIGraphicsBeginImageContextWithOptions(bottomImg.size, false, 0.0)
        
        bottomImg.draw(in: CGRect(origin: CGPoint.zero, size: bottomImg.size))
        topImg.draw(in: CGRect(origin: CGPoint.init(x: originPoint, y: 0), size: topImg.size))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func getImage_WithBlurBackground(image:UIImage)->UIImage{
        
        let temp_Img = self.resizeImageWithoutAspect(newSize: image.get_SQSize())
        
        let temp_bottomImg = temp_Img.applyDarkEffect()
        
     let temp_newImg = image.saveImage(bottomImg: temp_bottomImg!, topImg: image)
       return temp_newImg
    }
    
    func get_SQSize() -> CGSize {
        if self.size.width == self.size.height {
            return size
        }
        var newSize : CGSize!
        if size.width > size.height  {
            newSize = CGSize.init(width: size.width, height: size.width)
        }else{
            newSize = CGSize.init(width: size.height, height: size.height)
        }
        return newSize
    }
    
    
}

