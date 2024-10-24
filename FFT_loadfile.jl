using WAV
using FFTW
using Plots

# Load the WAV file
signal, fs = wavread("test_signal.wav")

# Compute the FFT
n = length(signal)
fft_result = fft(signal)

# Calculate frequency axis
frequencies = (0:n-1) .* (fs / n)

# Plot the magnitude of the FFT result
plot(frequencies[1:div(n, 2)], abs.(fft_result[1:div(n, 2)]), xlabel="Frequency (Hz)", ylabel="Magnitude", title="FFT of Test Signal")

# Save the plot as a PNG image
savefig("fft_plot.png")

println("FFT plot saved as 'fft_plot.png'. You can view it using feh.")
