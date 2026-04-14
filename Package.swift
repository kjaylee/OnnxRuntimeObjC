// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "OnnxRuntimeObjC",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "OnnxRuntimeObjC",
            targets: ["onnxruntime_objc"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kjaylee/OnnxRuntimeC.git", from: "1.20.2"),
    ],
    targets: [
        .target(
            name: "onnxruntime_objc",
            dependencies: [
                .product(name: "OnnxRuntimeC", package: "OnnxRuntimeC"),
            ],
            path: "Sources/onnxruntime_objc",
            publicHeadersPath: "include",
            cxxSettings: [
                .define("SPM_BUILD"),
                .headerSearchPath("."),
            ]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
