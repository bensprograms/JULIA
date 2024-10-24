using WAV
using DSP

# Parameters
fs = 44100  # Sampling rate
duration = 5.0  # Duration of the signal in seconds
t = 0:1/fs:duration-1/fs  # Time vector

# Generate pure tones
tone1 = sin.(2 * π * 200 * t)  # 200 Hz
tone2 = sin.(2 * π * 440 * t)  # 440 Hz
tone3 = sin.(2 * π * 880 * t)  # 880 Hz

# Generate harmonics (2nd and 3rd harmonics of 440 Hz)
harmonic1 = sin.(2 * π * 880 * t)  # 2nd harmonic
harmonic2 = sin.(2 * π * 1320 * t)  # 3rd harmonic

# Add some white noise
noise = 0.1 * randn(length(t))

# Apply amplitude modulation to 200 Hz tone
mod_freq = 2  # Modulation frequency of 2 Hz
modulated_tone = (1 .+ 0.5 .* sin.(2 * π * mod_freq * t)) .* tone1

# Combine all signals (use broadcasting for element-wise addition)
signal = tone1 .+ tone2 .+ tone3 .+ harmonic1 .+ harmonic2 .+ modulated_tone .+ noise

# Normalize the signal (apply abs element-wise)
signal = signal / maximum(abs.(signal))

# Write the signal to a WAV file
wavwrite(signal, fs, "test_signal.wav")

println("WAV file 'test_signal.wav' created successfully.")
