#!/bin/bash
#killall Xcode
#rm -rf ./Pods
#rm Podfile.lock
xcrun -k
xcodebuild -alltargets clean
echo "removing $(getconf DARWIN_USER_CACHE_DIR)org.llvm.clang/ModuleCache"
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)org.llvm.clang/ModuleCache"
echo "removing $(getconf DARWIN_USER_CACHE_DIR)org.llvm.clang.$(whoami)/ModuleCache"
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)org.llvm.clang.$(whoami)/ModuleCache"
echo "removing ~/Library/Developer/Xcode/DerivedData/*"
rm -rf ~/Library/Developer/Xcode/DerivedData/*
echo "removing ~/Library/Caches/com.apple.dt.Xcode/*"
rm -rf ~/Library/Caches/com.apple.dt.Xcode/*
#pod repo update
#pod install
#open /Applications/Xcode.app
