sample_base="/Users/drone_programming_audio/pumpcount/line"
sample_format=".mp3"
sample_count=4
samples = []

sample_count.times do |n|
  print sample_base + n.to_s + sample_format
  samples[n] = sample_base + n.to_s + sample_format
end


define :voice_loop do |amp_min, amp_max, offset_min, offset_max|
  loop do
    local_samples = samples.shuffle.ring
    sample_count.times do |n|
      s = local_samples[n]
      echo s, rrand(amp_min, amp_max)
      sleep 120
    end
  end
end

# main speech
in_thread do
  voice_loop 1, 1, 0, 0
end