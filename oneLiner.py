# i have lua file i need combine all line in one and if next line has "--" skip and each line end with ";"

# read file
fileName = "Timber2.lua"

with open(fileName, "r") as f:
    lines = f.readlines()
newLines = [line.strip() for line in lines if not line.startswith("--")]
newLines = ";".join(newLines)
newLines = newLines.replace(";;", ";")
with open(f"one_{fileName}", "w") as f:
    f.write(newLines)
