# **The ABC of SCO Unix**

# Preface

Some years ago I read a quote by [Abraham Lincoln](https://en.wikipedia.org/wiki/Abraham_Lincoln) about How a government must be.
He said

> Government of the people, by the people, for the people, shall not perish from the Earth.

Actually I first read it years ago in University when Studing about Unix in a book.
But unfortunaltly I can't remember book name.

## Resarch

But fortunate enouth which someone in some article about in Persian here.

[gnu planet](https://planet.sito.ir/%DA%86%DB%8C%D8%B2%D9%87%D8%A7%DB%8C%DB%8C-%DA%A9%D9%87-%D8%A8%D8%A7%DB%8C%D8%AF-%D8%A8%D8%AF%D8%A7%D9%86%DB%8C%D8%AF/)

So in there express source of quote is Book ABC of SCO Unix.

[Text in Persian](persian_source.md)

After I find book name, the next step is to get book.

# Find Book

So how to find ebook version.

General search engine like duckduckgo not provide result.
Consulting ```libgen.is``` without success.

Next try is [Intenet archive project](https://archive.org/)

OK, find it in internet archive. But in there we can only review and borrow.

## How to Download 

By Installing firefox extention `Internet Archive Downloader`
we can grab pdf file.

```
$ ls -ltrh
-rw-r--r-- 1 esmaeel esmaeel 175M Feb 28 01:05  abc.pdf
```

## Search for quote in book

To doing search we need convert each book page to plain text

### First of all convert image to plain text

In Debian we have `tesseract` program for this task.

Install tesseract

```
$ sudo apt install tesseract
```

Convert picture to text

```
tesseract eng.png out.txt
```

# One script to do all of these steps

It is simple, just run it with bash

```
bash run.sh
```

After works finished we have a good book for reading.

## Search in book 

Search for word in all files with grep

I want to search for "lincoln" word in all of book.

```
grep -ri "lincoln" out/text -A20 -B 20 -h > ~/lincoln.txt
```

Explaination

grep for `lincoln` word in all files inside the `out/text` directory. doing search in case intensive form `i` and recursivly `r`.

Show only 20 lines before and after `-A20 -B20`

And remove file name from output `-h`

[find_speech_in_book](lincoln.txt)


> Lincoln said government should be “of the people, by the peo-
> ple, for the people.” Thompson and Ritchie designed UNIX to be “of
> the files, by the files, for the files.”

### How to find only filename?
use `grep -l`

```
$ grep -ri "lincoln" . -l
./087.txt
```

This quote appeard in this file `087.txt`

---

After all 
Initial question is answered well.

And I want to share it with my friends but pdf file is very huge.

```
$ ls -ltrh
-rw-r--r-- 1 esmaeel esmaeel 175M Feb 28 01:05  abc.pdf
```

## How to reduce scanned pdf files size?

Extract all images from pdf

```
mkdir images
pdfimages -all abc.pdf images/
```

### How to reduce each image size

By reducing each part of pdf, total size will reduce.

Using `convert` command and set recution factore to 40%

Some try of fail I find ***30%*** factor is good enough for this ebook

### Combine images to create new book

Append images, create new pdf book.

### Create new book 

```
convert out/*.jpg abc_of_unix.pdf
```

## Download Get book

[The_ABC's_of_Sco_Unix](https://github.com/esmaeelE/books/blob/main/unix/The_ABC's_of_Sco_Unix.pdf)

