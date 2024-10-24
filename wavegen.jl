using WAV
using DSP

# Parameters for the sine wave
frequency = 256          # Frequency in Hz
duration = 2.0           # Duration in seconds
sampling_rate = 44100    # Sampling rate (standard for audio)
amplitude = 0.5          # Amplitude of the sine wave

# Generate the time vector
t = range(0, stop=duration, step=1/sampling_rate)

# Generate the 256 Hz sine wave
sine_wave = amplitude * sin.(2 * π * frequency * t)

# Convert the waveform to Int16 format for saving as WAV
waveform = round.(Int16, sine_wave .* Int16(2^15 - 1))

# Save the waveform to a .wav file
wavwrite(waveform, sampling_rate, "sine_wave_256hz.wav")

println("256 Hz sine wave saved as sine_wave_256hz.wav")
