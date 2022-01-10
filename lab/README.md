---
title: "lab1_blast"
Date:
bibliography: [citations.bib]
csl: [chicago.csl]
...
# __Lab 1: Web-based and standalone BLAST__

## __How to use this material:__

First you need to have a copy of [this](https://github.com/vitorpavinato/introBlast) repository in your computer. The desirable way to do it is using Git (I am using this exercise to introduce Git to those that are not familiar with it).

In the repository page, find the green button with `<>` inside:

![image 1](images/img1.png)

A pop-up window will open. In that window, click in the button highlighted in the figure bellow:

![image 2](images/img2.png)

Find the terminal program in your OS (in Mac, you need to click on the `Launchpad`, then navigate to the `Other` folder).

Open the terminal, navigate to a folder you choose to have a copy of the repository...for example Documents/.
```dotnetcli
cd Documents/
```
Type:
```dotnetcli
git clone 
```

Paste the repository address after git clone, like this:
```dotnetcli
git clone https://github.com/vitorpavinato/introBlast.git
```

Then navigate inside the repository folder:
```dotnetcli
cd introBlast
```

The folder contains the following subfolders:
```dotnetcli
.
├── docs
│   └── Altschul_etal_1990.pdf
├── lab
│   ├── README.md
│   ├── data/
├── lecture
```
In lab you find this README.md file with all instructions we are going to follow in this class. Lecture will have the material for the class on January, 27th 2022. 

lab/data contains the files with the sequences were are going use to find similarities with sequences available in the NCBI database.

## __Installation of the standalone BLAST__ 

The next thing to do is to install a command line interface of BLAST (Blast-CLI).

__For Windows:__
A good explanation on how to download and install BLAST+ on Windows OS can be found [here](https://www.ncbi.nlm.nih.gov/books/NBK52637/).

Mac and Linux users should first check if BLAST was already installed:
```dotnetcli
which blastn
```
Run this code to check in any blast implementation (in this case _blastn_ is installed).

If you see something like this:
```dotnetcli
/usr/bin/blastn
```
OR
```dotnetcli
/usr/local/bin/blastn
```
 You can skip the next step.

__For Mac:__

First install Homebrew in your machine. Homebrew emulates the capabilities of a software package management found in Linux machines.
```dotnetcli
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
Then you install BLAST by running:
```dotnetcli
brew install blast
```
__For Linux:__
```dotnetcli
sudo apt-get install ncbi-blast+
```

### __Sequence similarity search with Web-based BLAST__

We are going to start this tutorial by using the web-based version of BLAST to find similar sequences. Similarity search is the first step on homology and functional prediction. In this tutorial we are not focus on the details behind the BLAST implementation (algorithm and theory). Instead, we are going to focus on how interpret the search output. From there, we can try to develop some intuition that will help us understand the technicalities behind the algorithm and implementation.

Some important keywords to remember:
- Query refers to the sequence your interested in to search (usually the gene or collection of genes you are working with);
- Subject refers to the database you are going to search for similarities (nr/nt, RefSeq etc);
- nr/nt refers to the not curated nucleotide collection;
- RefSeq refer to the collection of reference sequences (many flavors);
---

# __Introduction to BLAST__

For this part of the lab, we are going to follow an activity that is part of _Genome Solve_ material that can be found [here](https://qubeshub.org/publications/1085/2). This material was first developed by Anne Rosenwald, Gaurav Arora, Vinayak Mathur (Rosenwald, Arora & Mathur 2020) and later adapted (September 2021) by Sarah Prescott [here](https://qubeshub.org/publications/2754/versions/1).

Rosenwald A, Arora G, Mathur V (2020) Pre-lesson: Introduction to BLAST. 
doi:/10.25334/TY8V-G541

## __Learning Outcomes:__
When you have successfully completed this activity, you should be able to:
- Use BLAST for homology search
- Utilize the BLAST tool to find nucleotide or protein sequences similar to your query
- Interpret BLAST search results, including what makes a significant hit
- Understand how genomic sequence information can be used to find patterns and infer possible function
- Download and upload sequence data in FASTA format
- Find accession and GI numbers that reference a particular sequence


## __Background__
The purpose of this exercise is to get familiar with the Basic Local Alignment Search Tool  (BLAST).  BLAST finds regions of local similarity between sequences. The program compares a query sequence (a protein or nucleotide sequence) against a sequence database and calculates significance of matches.  BLAST divides the query sequence into shorter words and initially looks for matches of these words only. The tool gives a score based on a scoring system e.g. in blastn, it will give +1 for each match and -2 for each mismatch. 

_Task_ - Before beginning the tasks of the activity, please review several videos below to review the BLAST tool. 

Watch [this](https://youtu.be/JKD5laNtwSc) overview of BLAST video ONLY to the 6:33 mark. End before the speaker begins on the Detailed Tasks page. Answer the questions following:

- What does BLAST tell you?
- What can a Conserved Domain Search (rps-blast) tell you?

(you can watch the entire video if you want; the presenter shows several applications).


To further your understanding of BLAST returns, watch [this](https://youtu.be/dzRq-5BrGD4) short videos on E-values by NCBI and answer the questions that follow.

- How are scores and e-values related?
- Can e-values be directly compared when searching databases of different sizes? Why or why not? What about the bit scores with the same question?
- Is there a magic cutoff for poor e-values?
- How might you determine an e-value cutoff? 
- What is meant by a reported e-value of 0.0? 

## __Part A: Using BLAST to search for closely related organisms:__

This exercise demonstrates the different kinds of results you get when you search sequence databases with different algorithms using either a DNA or protein sequence from the same gene.

_Task_ - Retrieve the GenBank sequence for NM_001026785.1, as follows:

1. Go to the [NCBI](https://www.ncbi.nlm.nih.gov) web page

2. Enter the ID into the search box, and select “Nucleotide” in the pull-down menu next to the word search box on the left, and then click “Search”. On the preceding page click on the ID to get to the GenBank page.

3. Retrieve the FASTA formatted sequence for NM_001026785.1:
    - Click on the “FASTA” link on the top left of the page; 
    - Paste the sequence below in new text file;
    - Adjust the format using the following rules for FASTA formatted sequence:
 
The first line is called the “header” and always starts with “>”.
The sequence identifier must immediately follow the “>”. (No space allowed between the “>” and the identifier).
The header may include additional information after the identifier, separated from the identifier by a space. The header must all be on a single line.
The sequence starts on the second line, and can continue on additional lines
The length of the sequence on each line doesn’t matter.
Spaces and non-sequence characters are not allowed within the sequence.
FASTA formatted sequences use single line spacing.

4. Save as `celegans_sod.fasta` in the data/ folder.

A file containing this sequence can be found at `introBlast/lab/data`.

---