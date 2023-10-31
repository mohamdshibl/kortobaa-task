import UIKit
import Flutter
import Foundation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  public class SquareCalculator {
      public static func calculateSquare(_ number: Double) -> Double {
          return number * number
      }
  }
  public class SwiftSquareCalculatorPlugin: NSObject, FlutterPlugin {
      public static func register(with registrar: FlutterPluginRegistrar) {
          let channel = FlutterMethodChannel(name: "flutter_square_calculator", binaryMessenger: registrar.messenger())
          let instance = SwiftSquareCalculatorPlugin()
          registrar.addMethodCallDelegate(instance, channel: channel)
      }

      public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
          if call.method == "calculateSquare" {
              if let arguments = call.arguments as? [String: Any],
                 let number = arguments["number"] as? Int {
                  // Calculate the square
                  let square = number * number
                  result(square)
              } else {
                  result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
              }
          } else {
              result(FlutterMethodNotImplemented)
          }
      }
  }
}


