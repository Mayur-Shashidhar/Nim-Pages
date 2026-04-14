# Nim Pages — Markdown Static Site Generator in Nim

A lightweight **Markdown → HTML static site generator** written entirely in **Nim**.
NimBite converts `.md` files into fully styled multi-page static websites with navigation, layout, and CLI support.

This project demonstrates:

* Systems programming with Nim
* CLI tool development
* Markdown parsing
* Static site generation
* Multi-page website generation
* HTML templating

---

# ✨ Features

* Convert Markdown → HTML
* Multi-page static website generator
* CLI tool (`nim_markdown docs`)
* Automatic navbar (Home / About)
* Styled HTML layout
* Directory-based site building
* Lightweight and fast
* No dependencies

---

# 📁 Project Structure

```
mdtohtml/
│
├── docs/               # Website content (Markdown)
│   ├── index.md
│   └── about.md
│
├── dist/               # Generated static site (auto created)
│   ├── index.html
│   └── about.html
│
├── parser.nim          # Markdown parser
├── main.nim            # Static site generator + CLI
├── nim_markdown        # Compiled CLI binary (ignored in git)
└── README.md
```

---

## 🧰 Tech Stack

* **Language:** Nim
* **Modules:** `os`, `strutils`, `re`
* **Type:** CLI Static Site Generator
* **Parser:** Custom Markdown → HTML parser
* **Output:** Static HTML + CSS
* **Preview:** Python `http.server`
* **Version Control:** Git & GitHub

---

# ⚙️ How It Works

### Step 1 — Write Markdown

Create pages inside `docs/`

Example:

`docs/index.md`

```
# BurgerHub

Welcome to **BurgerHub**

## Menu

- Classic Burger
- Cheese Burger
- Double Smash
```

---

### Step 2 — Run Generator

```
./nim_markdown docs
```

---

### Step 3 — HTML Generated

```
dist/
 ├── index.html
 └── about.html
```

---

### Step 4 — Run Website

```
cd dist
python3 -m http.server 8000
```

Open:

```
http://localhost:8000
```

---

# 🧠 Architecture

```
Markdown (.md)
      ↓
parser.nim
      ↓
HTML body
      ↓
main.nim layout wrapper
      ↓
dist/*.html
      ↓
Browser
```

---

# 🧩 parser.nim

Responsible for **Markdown parsing**

Supported Markdown:

### Headers

```
# H1
## H2
### H3
```

### Bold

```
**bold**
```

### Italic

```
*italic*
```

### Lists

```
- item 1
- item 2
```

### Inline Code

```
`code`
```

### Links

```
[Home](index.html)
```

Converted to:

```
<h1>
<strong>
<em>
<ul>
<code>
<a href="">
```

---

# 🧠 main.nim

Responsible for:

### 1. CLI handling

```
nim_markdown docs
nim_markdown file.md
```

### 2. Markdown conversion

Calls:

```
parseMarkdown()
```

### 3. HTML layout wrapping

Adds:

* navbar
* CSS
* structure

### 4. Static site generation

Converts:

```
docs/*.md → dist/*.html
```

---

# 🚀 Usage

## Compile

```
nim c -d:release -o:nim_markdown main.nim
```

---

## Generate Site

```
./nim_markdown docs
```

---

## Convert Single File

```
./nim_markdown sample.md
```

---

## Run Website

```
cd dist
python3 -m http.server 8000
```

---

# 🎨 Generated Layout

Each page includes:

* Navigation bar
* Responsive layout
* Styled lists
* Code highlighting
* Clean typography

Navbar:

```
Home | About
```

---

# 🧪 Example Markdown

```
# BurgerHub

Welcome to **BurgerHub**

## Menu

- Classic Burger
- Cheese Burger
- Double Smash

### Special

`Double Smash Burger`
```

---

# 📦 Output HTML

```
<h1>BurgerHub</h1>
<p>Welcome to <strong>BurgerHub</strong></p>

<ul>
<li>Classic Burger</li>
<li>Cheese Burger</li>
<li>Double Smash</li>
</ul>
```

---

# 🛠️ Supported Commands

Generate full site

```
./nim_markdown docs
```

Convert single file

```
./nim_markdown file.md
```

---

# 📌 Why Nim?

This project showcases Nim's:

* C-like performance
* Python-like syntax
* Native compilation
* Zero dependencies
* Great CLI support

---

# 🔥 What This Project Demonstrates

* Compiler-based language usage
* CLI tool development
* Static site generator architecture
* Markdown parsing
* File system traversal
* HTML templating
* Multi-page website generation

---

# 🧹 .gitignore

```
nim_markdown
main
dist/
*.html
```

---

# 📈 Future Improvements

* Blog post support
* Markdown images
* Code block support
* Themes
* Live reload server
* Sitemap generation
* Sidebar navigation
* Frontmatter support

---

# 🧑‍💻 Author

Built as a **systems + tooling project** in Nim to demonstrate:

* CLI development
* Static site generation
* Markdown parsing

---

# 🪪 License

MIT License
