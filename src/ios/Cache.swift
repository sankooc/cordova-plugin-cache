import Foundation

@objc(Cache) class Cache : CDVPlugin {
    func clear(command: CDVInvokedUrlCommand) {
        println("do clear cache")
        NSURLCache.sharedURLCache().removeAllCachedResponses()
    }
    func size(command: CDVInvokedUrlCommand){
        println("get cache size")
        var cache = NSURLCache.sharedURLCache()
        var disk = cache.currentDiskUsage;
        var memory = cache.currentMemoryUsage;
        var data = NSDictionary(dictionary:["disk":cache.currentDiskUsage,"disk_capacity":cache.diskCapacity,"memory":cache.currentMemoryUsage,"memory_capacity":cache.memoryCapacity]);
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAsDictionary:data)
        self.commandDelegate.sendPluginResult(pluginResult, callbackId:command.callbackId)
        println("cache size disk\(disk) memory \(memory)")
    }
}