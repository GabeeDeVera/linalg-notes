import subprocess
import os

for filename in os.listdir("./"):
  if(not filename.endswith(".typ")):
    continue

  subprocess.call(["typst", "compile", filename])