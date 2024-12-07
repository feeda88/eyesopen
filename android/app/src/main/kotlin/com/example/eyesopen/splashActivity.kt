package com.example.eyesopen

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import androidx.appcompat.app.AppCompatActivity

class SplashActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Set the splash screen layout
        setContentView(R.layout.activity_splash)

        // Wait for 3 seconds and then start MainActivity
        Handler().postDelayed({
            // Navigate to MainActivity
            startActivity(Intent(this, MainActivity::class.java))
            finish()  // Close SplashActivity
        }, 3000)  // Delay for 3 seconds
    }
}
