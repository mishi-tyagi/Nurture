Nurture 🌿 | Swift Student Challenge 2026

Nurture is a SwiftUI-based application built to protect indoor greenery through real-time environmental monitoring. By bridging the gap between botanical science and live data, the app replaces gardening guesswork with data-driven survival alerts.

🚀 The Vision

Many plant owners struggle with "invisible" environmental threats. Nurture acts as a biological translator—using live micro-climate data to tell you exactly when your plants are in danger before it's too late.

✨ Key Features

Real-Time Micro-Climate Tracking: Integrates CoreLocation to pinpoint the user's exact environmental context.

Live Weather Integration: Implements URLSession for asynchronous data retrieval from global meteorological services.

Survival Logic Engine: A custom-built algorithm that cross-references live temperature against species-specific biological limits.

Reactive UI: A "Glassmorphism" interface that shifts from a calm Thrive state to an urgent Danger alert based on real-time conditions.

🛠️ Tech Stack

Language: Swift 5.10+

Framework: SwiftUI

Asynchronous Networking: URLSession

Location Services: CoreLocation

Data Handling: Foundation

🧬 How It Works

Authorization: The app requests location access to determine the user's specific climate.

The Fetch: Using coordinates, URLSession retrieves current meteorological data.

The Comparison: The WeatherManager processes the temperature and evaluates it against the minTemp property of the plant model (currentTemp < minTemp).

The State Change: If a threat is detected, the UI instantly updates to provide the user with immediate care instructions.

♿ Accessibility & Design

Nurture was built with inclusive design principles:

SF Symbols: Used for redundant visual signaling (combining icon + color).

Dynamic Type: Support for all text size settings to ensure legibility.

High Contrast: Clear color differentiation (Green vs. Orange) for critical status updates.
