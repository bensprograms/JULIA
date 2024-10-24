using FFMPEG

# Define the input and output file paths
input_file = "/home/ben/test_signal.wav"
output_file = "/home/ben/output_audio.mp3"

# Run the conversion command using FFmpeg
FFMPEG.run(`ffmpeg -i $input_file $output_file`)
