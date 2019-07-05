package com.example.hello_rust

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log

class MainActivity : AppCompatActivity() {

    external fun hello(to: String): String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        Log.d("from-rust", "Loading rust lib...")
        System.loadLibrary("hello_rust")

        // one can view these logs with "$adb shell logcat"
        Log.d("from-rust", hello("from Kotlin"))
    }
}
