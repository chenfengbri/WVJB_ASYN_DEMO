
// To check if a library is compiled with CocoaPods you
// can use the `COCOAPODS` macro definition which is
// defined in the xcconfigs so it is available in
// headers also when they are imported in the client
// project.


// AFNetworking
#define COCOAPODS_POD_AVAILABLE_AFNetworking
#define COCOAPODS_VERSION_MAJOR_AFNetworking 1
#define COCOAPODS_VERSION_MINOR_AFNetworking 3
#define COCOAPODS_VERSION_PATCH_AFNetworking 0

// JSONKit
#define COCOAPODS_POD_AVAILABLE_JSONKit
// This library does not follow semantic-versioning,
// so we were not able to define version macros.
// Please contact the author.
// Version: 1.5pre.

// WebViewJavascriptBridge
#define COCOAPODS_POD_AVAILABLE_WebViewJavascriptBridge
#define COCOAPODS_VERSION_MAJOR_WebViewJavascriptBridge 3
#define COCOAPODS_VERSION_MINOR_WebViewJavascriptBridge 0
#define COCOAPODS_VERSION_PATCH_WebViewJavascriptBridge 0

