package com.example.codigo_comum_tarefa_2

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.example.codigo_comum_tarefa_2/platform")
            .setMethodCallHandler { call, result ->
                if (call.method == "getPlatformMessage") {
                    result.success("Código ANDROID - MainActivity.kt")
                }
            }
    }
}
