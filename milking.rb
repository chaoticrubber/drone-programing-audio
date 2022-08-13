sample_base="C:/git/speech_test/output/line"
sample_format=".mp3"
sample_count=48
samples = []

sample_count.times do |n|
  print sample_base + n.to_s + sample_format
  samples[n] = sample_base + n.to_s + sample_format
end


define :echo do |s, a|
  if one_in(2) then
    sample s, pan: -1, amp: a
    sleep rrand(0.00001,0.1)
    sample s, pan: 1, amp: a
  else
    sample s, pan: 1, amp: a
    sleep rrand(0.00001,0.1)
    sample s, pan: -1, amp: a
  end
end


define :voice_loop do |amp_min, amp_max, offset_min, offset_max|
  loop do
    local_samples = samples.shuffle.ring
    sample_count.times do |n|
      s = local_samples[n]
      echo s, rrand(amp_min, amp_max)
      sleep sample_duration(s)
      sleep rrand(offset_min, offset_max)
    end
  end
end

# simple background noises
in_thread do
  loop do
    play rrand(40, 50), amp: 0.4
    sleep 0.5
  end
end

in_thread do
  loop do
    play rrand(50, 60), amp: 0.2
    sleep 0.25
  end
end

# a binaural beat
in_thread do
  loop do
    play 30, amp: 0.6, pan: -1, attack:0, release:0, decay:0, sustain:10
    play 35, amp: 0.6, pan: 1, attack:0, release:0, decay:0, sustain:10
    
    play 40, amp: 0.6, pan: -1, attack:0, release:0, decay:0, sustain:10
    play 45, amp: 0.6, pan: 1, attack:0, release:0, decay:0, sustain:10
    
    sleep 10
  end
end

# background speech
4.times do
  in_thread do
    voice_loop 0.2, rrand(0.25,0.3), 0.1, rrand(0.15,0.6)
  end
end

# main speech
in_thread do
  voice_loop 0.5, 0.5, 0, 0
end