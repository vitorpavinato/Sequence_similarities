## __Lab 1: Basic Local Alignment Search Tool (BLAST)__

How to use this material:

First you need to have a copy of this repository in your computer.
The desirable way to do it is using Git (I am using this exercise to introduce Git to those that are not familiar with it).
```dotnetcli
git clone https://github.com/vitorpavinato/Sequence_similarities.git
```

The next thing to do is to install a command line interface of BLAST (Blast-CLI).

__For Windows:__
A good explanation on how to download and install BLAST+ on Windows OS can be found [here](https://www.ncbi.nlm.nih.gov/books/NBK52637/).

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