package com.example.flutter_method_channel;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String channel = "mohamed/gamal/calculation";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), channel).setMethodCallHandler(this::onMethodCall);
    }

    private int calculateSummation(int num1, int num2) {
        return num1 + num2;
    }

    private void onMethodCall(MethodCall call, MethodChannel.Result result) {
//        final Map<String, Object> arguments = call.arguments();
        int num1 = call.argument("num1");
        int num2 = call.argument("num2");

        if (call.method.equals("calculate")) {
            result.success(calculateSummation(num1, num2));
        }else{
            result.notImplemented();
        }
    }
}
