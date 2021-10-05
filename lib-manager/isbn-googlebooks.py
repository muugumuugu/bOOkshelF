import urllib.request
import urllib.parse
import json
import textwrap


base_api_link = "https://www.googleapis.com/books/v1/volumes?q="
user_input = urllib.parse.quote(input("Enter title: ").strip())

with urllib.request.urlopen(base_api_link + user_input) as f:
	text = f.read()
decoded_text = text.decode("utf-8")
obj = json.loads(decoded_text)["items"] # deserializes decoded_text to a Python object
volume_info = obj[0]
authors = obj[0]["volumeInfo"]["authors"]

# displays title, summary, author, domain, page count and language
print("\nTitle:", volume_info["volumeInfo"]["title"])
print("\nISBN:", volume_info["volumeInfo"]["industryIdentifiers"][1]["identifier"])
print("\nSummary:\n")
print(textwrap.fill(volume_info["searchInfo"]["textSnippet"], width=65))
print("\nAuthor(s):", ",".join(authors))
print("\nLanguage:", volume_info["volumeInfo"]["language"])
print("\n***")
