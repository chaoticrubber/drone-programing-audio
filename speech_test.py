import pyttsx3
import os
import sys
from os import path

if __name__ == '__main__':

    if len(sys.argv) != 3:
        print("not enough args. Need a file of phrases and where to put the output")
        sys.exit(1)

    text_path = sys.argv[1]
    base_path = sys.argv[2]
    with open(text_path, 'r') as f:
        text = f.readlines()

    print(f"got {len(text)} prases to generate")
    os.makedirs(base_path, exist_ok=True)

    engine = pyttsx3.init()
    for i, t in enumerate(text):
        n = f"line{i}.mp3"
        output = path.join(base_path, n)
        engine.save_to_file(t, output, "test")
    engine.runAndWait()

    print(f"generated {len(text)} prases")
