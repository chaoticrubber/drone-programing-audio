# Chant generator

## To setup

(you should only need to do this once)

* Install python 3.7+ https://www.python.org/downloads/
* Install Sonic Pi https://sonic-pi.net/

* Open power shell. Right click on the start button and select Windows Powershell
* run the following:

```powershell
cd <directory where you unzipped this>
python -m venv venv
./venv/Scripts/activate.bat
pip install -r requirements.txt
```

## To create the voice clips

You only need to do this if you change the lines of speech

* Edit your lines file using your favorite text editor. An example is included as `test1.txt`
* Go back to powershell (you only need to run the first two lines if you have closed the window since you did the setup)

```powershell
cd <directory where you unzipped this>
./venv/Scripts/activate.bat

python -m speech_test test1.txt output/
```

Change the test1.txt in the last command to point to the lines file you edited. A folder will be created called output with a sample of each line.

## to play

* Open Sonic Pi (Some times this takes a while)
* Open `milking.rb` in sonic pi
* At the top of the file change the line with `sample_base` to point to your output folder created above. Make sure it's appended with `/line`
* Change the `sample_count` value to match the number of lines created (it will have been output by the script)
* Press play in the top left of the sonic pi window
* Sit back and enjoy
