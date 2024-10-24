#Julia Waveform Plot

using Plots

# Parameters for sine wave
fs = 1000       # Sample rate (Hz)
duration = 1    # Duration (seconds)
f = 5           # Frequency of sine wave (Hz)

# Generate time vector and sine wave
t = 0:1/fs:duration  # Time vector
y = sin.(2 * pi * f * t)  # Sine wave signal

# Plot the waveform
plot(t, y, xlabel="Time (s)", ylabel="Amplitude", title="Sine Wave", legend=false)

# Save the plot as a .png file
savefig("sine_wave.png")