import strutils, re

proc formatInline(text: string): string =
    var t = text

    # inline code
    t = t.replacef(re"`(.+?)`", "<code>$1</code>")

    # bold
    t = t.replacef(re"\*\*(.+?)\*\*", "<strong>$1</strong>")

    # italic
    t = t.replacef(re"\*(.+?)\*", "<em>$1</em>")

    # links
    t = t.replacef(re"\[(.+?)\]\((.+?)\)", "<a href=\"$2\">$1</a>")

    return t


proc parseMarkdown*(input: string): string =
    var html = ""
    var inList = false

    for line in input.splitLines():
        let l = line.strip()

        if l.len == 0:
            continue

        if not l.startsWith("- ") and inList:
            html &= "</ul>\n"
            inList = false

        if l.startsWith("### "):
            html &= "<h3>" & formatInline(l[4..^1]) & "</h3>\n"

        elif l.startsWith("## "):
            html &= "<h2>" & formatInline(l[3..^1]) & "</h2>\n"

        elif l.startsWith("# "):
            html &= "<h1>" & formatInline(l[2..^1]) & "</h1>\n"

        elif l.startsWith("- "):
            if not inList:
                html &= "<ul>\n"
                inList = true

            html &= "<li>" & formatInline(l[2..^1]) & "</li>\n"

        else:
            html &= "<p>" & formatInline(l) & "</p>\n"

    if inList:
        html &= "</ul>\n"

    return html