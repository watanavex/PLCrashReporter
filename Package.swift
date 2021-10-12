// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PLCrashReporter",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .tvOS(.v9)
    ],
    products: [
        .library(name: "PLCrashReporter", targets: ["PLCrashReporter"])
    ],
    targets: [
        .target(
            name: "CrashReporter",
            path: "",
            exclude: [
                "Source/dwarf_opstream.hpp",
                "Source/dwarf_stack.hpp",
                "Source/PLCrashAsyncDwarfCFAState.hpp",
                "Source/PLCrashAsyncDwarfCIE.hpp",
                "Source/PLCrashAsyncDwarfEncoding.hpp",
                "Source/PLCrashAsyncDwarfExpression.hpp",
                "Source/PLCrashAsyncDwarfFDE.hpp",
                "Source/PLCrashAsyncDwarfPrimitives.hpp",
                "Source/PLCrashAsyncLinkedList.hpp",
                "Source/PLCrashReport.proto"
            ],
            sources: [
                "Source",
                "Dependencies/protobuf-c"
            ],
            cSettings: [
                .define("PLCR_PRIVATE"),
                .define("PLCF_RELEASE_BUILD"),
                .define("PLCRASHREPORTER_PREFIX", to: ""),
                .define("SWIFT_PACKAGE"), // Should be defined by default, Xcode 11.1 workaround.
                .headerSearchPath("Dependencies/protobuf-c")
            ],
            linkerSettings: [
                .linkedFramework("Foundation")
            ]
        ),
        .binaryTarget(
            name: "PLCrashReporter", 
            url: "https://github.com/watanavex/PLCrashReporter/releases/download/1.9.0/PLCrashReporter.xcframework.zip", 
            checksum: "cb35d80ed2178e3d3ea33c6531f0ade3ae2919464355f80f3d5c9ff52190f69c"
        ),
    ]
)
