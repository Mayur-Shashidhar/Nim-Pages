import os, strutils
import parser

proc wrapHtml(body: string, title: string): string =
    return """
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>""" & title & """</title>
<style>
body {
    font-family: Arial;
    max-width: 900px;
    margin: 40px auto;
    line-height: 1.6;
    background: #f5f5f5;
}

nav {
    margin-bottom: 30px;
    padding: 15px;
    background: white;
    border-radius: 8px;
}

nav a {
    margin-right: 20px;
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

nav a:hover {
    color: #ff6b00;
}

h1, h2, h3 {
    color: #111;
}

ul {
    background: white;
    padding: 15px 30px;
    border-radius: 8px;
}

p {
    background: white;
    padding: 12px;
    border-radius: 6px;
}

code {
    background: #eee;
    padding: 3px 6px;
    border-radius: 4px;
}
</style>
</head>
<body>

<nav>
<a href="index.html">Home</a>
<a href="about.html">About</a>
</nav>

""" & body & """

</body>
</html>
"""


proc convertFile(inputFile: string, outputFile: string) =
    let markdown = readFile(inputFile)
    let html = parseMarkdown(markdown)
    let wrapped = wrapHtml(html, inputFile)

    writeFile(outputFile, wrapped)
    echo "Converted -> ", outputFile


proc buildDirectory(dirPath: string) =
    createDir("dist")

    for kind, path in walkDir(dirPath):
        if kind == pcFile and path.endsWith(".md"):
            let name = splitFile(path).name
            let outputFile = "dist/" & name & ".html"
            convertFile(path, outputFile)


# CLI
if paramCount() == 0:
    echo "Usage:"
    echo "  nim_markdown file.md"
    echo "  nim_markdown folder/"
    quit()

let input = paramStr(1)

if dirExists(input):
    echo "Building static site..."
    buildDirectory(input)

elif fileExists(input):
    let outputFile = changeFileExt(input, ".html")
    convertFile(input, outputFile)

else:
    echo "Error: path not found -> ", input