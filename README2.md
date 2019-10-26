>This README2 describes a work under active development. Visit this page regularly for more updates.

<br>


<br>

## Running Analysis within Docker Container (Default)

[README](https://github.com/tmbuza/iMAP/blob/master/README2.md) (iMAP-master)

* Requires Docker Images.
* Runs both Windows and Linux applications.
* Uses less resources but memory-intensive computing may sometimes fail.
* All analyses are run interactively on container’s Command-line.
* The output is stored on your computer in the current working directory (iMAP is default folder).

> Important: Graphical applications don't work well. Some R-packages do not install well when creating docker images.

```{}
git clone https://github.com/tmbuza/iMAP.git

# OR

curl -LOk https://github.com/tmbuza/iMAP/archive/master.zip
unzip master.zip
mv iMAP-master iMAP
rm -rf master.zip

# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/archive/master.zip 
unzip master.zip
mv iMAP-master iMAP
rm -rf master.zip

```
<br>
<br>

## Running Analysis Outside of a Docker Container

[README](https://github.com/tmbuza/iMAP/blob/master/README2.md) for all platforms (this document).

* Best option for integrating most applications and packages.
* No DOCKER Images are required.
* Involves two separate workflows:
  * **Preprocessing and Bioinformatics Analysis**: It involves running Bash-scripts interactively (or in batch mode) from the Command-line or remotely on HPC computing nodes.
  * **OTU Analysis, Visualization and Reporting**:  It involves installing R-packages and running R-scripts interactively within the RStudio IDE.

<hr>
<br>
<br>


# PREPROCESSING & BIOINFORMATICS

<br>

### Step 1: Dowload a Package suitable for your platform

<br>
<br>

#### MAC OS X (in progress)
```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Mac-OSX.v1.0.zip
unzip iMAP-Mac-OSX.v1.0.zip
mv iMAP-Mac-OSX.v1.0 iMAP
rm -f iMAP-Mac-OSX.v1.0.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Mac-OSX.v1.0.zip
unzip iMAP-Mac-OSX.v1.0.zip
mv iMAP-Mac-OSX.v1.0 iMAP
rm -f iMAP-Mac-OSX.v1.0.zip
cd iMAP
```

<br>
<br>

#### Unix-Linux environments (in progress)
```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip
mv iMAP-UnixLinux.v1.0 iMAP
rm -f iMAP-UnixLinux.v1.0.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-UnixLinux.v1.0.zip
unzip iMAP-UnixLinux.v1.0.zip
mv iMAP-UnixLinux.v1.0 iMAP
rm -f iMAP-UnixLinux.v1.0.zip
cd iMAP
```


<br>
<br>

#### Windows 10 with WSL (in progress)

```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-WSL.v1.0.zip
unzip Windows10-WSL.v1.0.zip
mv iMAP-Windows10-WSL.v1.0 iMAP
rm -f Windows10-WSL.v1.0.zip
cd iMAP


# OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-WSL.v1.0.zip
unzip iMAP-Windows10-WSL.v1.0.zip
mv iMAP-Windows10.v1.0 iMAP
rm -f Windows10-WSL.v1.0.zip
cd iMAP
```
<br>
<br>

#### Windows 10 with GIT bash (in progress)

```{}

curl -LOk https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-GIT.v1.0.zip
unzip iMAP-Windows10-GIT.v1.0.zip
mv iMAP-Windows10-GIT.v1.0 iMAP
rm -f iMAP-Windows10-GIT.v1.0.zip
cd iMAP


OR

wget --no-check-certificate https://github.com/tmbuza/iMAP/releases/download/v1.0/iMAP-Windows10-WSL.v1.0.zip
unzip iMAP-Windows10-GIT.v1.0.zip
mv iMAP-Windows10-GIT.v1.0 iMAP
rm -f iMAP-Windows10-GIT.v1.0.zip
cd iMAP
```

<br>
<br>

### Step2: Install required software
The following script installs the executable tools integrated in the pipeline, including, [seqkit](https://github.com/shenwei356/seqkit/releases/tag/v0.11.0), [fastqc](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/), [bbmap](https://sourceforge.net/projects/bbmap/), [multiqc](https://multiqc.info/docs/#manual-installation), and [mothur](https://github.com/mothur/mothur/releases/tag/v.1.43.0). If the installation fails, please try to install it manually. Each tool name is hyperlinked to lead you to its site.  

```{}
bash ./code/00_1_InstallSoftwareDriver.bash
```

<br>
<br>

### Step 3: Add data and reference databases
* Place the rawdata, metadata, mapping files, reference alignments, and classifiers in the designated folders.
* Highly recommended testing your system with the demo data loaded into the designated folders using the following command:
```{}
bash ./code/00_2_GetDemoDataDriver.bash
```

<br>
<br>

### Step 4: Check folders and files to be certain
> Repeat this step as necessary.

```{}
bash ./code/00_3_CheckFilesDriver.bash
```

<br>
<br>
<hr>

## Microbiome Data Analysis 
We have bundled workflow-specific scripts into a driver script to make the analysis easily implemented sequentially.

<br>

### Mode 1: Running analysis interactively on CLI
* Users sequentially run individual or bundled scripts on CLI (Command-Line-Interface). 
* Interactive mode allows investigators to review the results progressively and make well-informed decisions.

### Mode 2: Running analysis Remotely on HPC (Not tested)
* Requires a job scheduling script to submit to the HPC queue, to allocate the available computing resources, and to request additional resources. 

<hr>
<br>


### 1.0: Preprocessing
The preprocessing step includes: 

  - Metadata profiling
  - Computing simple statistics of the raw reads 
  - Inspecting base quality scores of original reads (qc0)
  - Filtering and trimming poor reads. Phred Score = 25 or more (qctrim25: default)
  - Removing phiX contamination (qced)
  - Summarizing Base Call Phred scores graphically
  
```{}
bash ./code/01_1_ReadPreprocessDriver.bash
```

<br>

### 2.0 Sequence Processing and Classification
The step uses mothur functions to perform the following: 

* Assembling of the forward and reverse reads, screen by length and create representative sequences.
* Aligning the representative sequences with reference alignments. Default SILVA seed.
* Denoising to remove poor alignments.
* Removing Chimeric sequences.
* Classifying the sequences and performing post-classification QC.
* Clustering the OTUs (97% identity) using Phylotype (default), cluster-based or Phylogeny method.
* Assigning taxonomy names to observed OTUs.
```{}
bash ./code/01_2_SeqProcessingDriver.bash
bash ./code/01_3_ClassifySeqDriver.bash
```

<br>

### 3.0  OTU Preliminary Analysis
Useful link: [Mothur MiSeq SOP: Preparing for analysis](https://www.mothur.org/wiki/MiSeq_SOP#Preparing_for_analysis).

<br>

**Phylotype method** (Default) 

```{}
bash ./code/01_4_PhylotypeBasedTaxaDriver.bash
```

<br>

**Cluster-based method** (Memory-intensive)

```{}
bash ./code/01_5_ClusterBasedTaxaDriver.bash
```

<br>

**Phylogeny method** (Memory-intensive)

```{}
bash ./code/01_6_PhylogenyBasedTaxaDriver.bash
```

<br>

## Remotely on HPC Using PBS (Portable Batch System) Script
* The Portable Batch System or PBS in short is the most used workload management solution for HPC systems and Linux clusters. 
* The **qsub** command scans the lines of the PBS script file for directives.
* Below is a sample PBS script. Replace the parameters in the script to match your systems.

```{}
#!/bin/bash -f
#PBS -N iMAPtutorial
#PBS -A vxk1_a_g_sc_default
#PBS -l nodes=1:ppn=10
#PBS -l walltime=3:00:00
#PBS -l pmem=10gb
#PBS -j oe
#PBS -o [Output file]
#PBS -M [Email address]
#PBS -m bea

cd $PBS_O_WORKDIR

bash ./code/01_1_ReadPreprocessDriver.bash
bash ./code/01_2_SeqProcessingDriver.bash
bash ./code/01_3_ClassifySeqDriver.bash
bash ./code/01_4_PhylotypeBasedTaxaDriver.bash
bash ./code/01_5_ClusterBasedTaxaDriver.bash
bash ./code/01_6_PhylogenyBasedTaxaDriver.bash

```

**Description of the PBS code**

The above PBS submit script specifies:  

* The environment to use (#!/bin/bash -f)
* The name of the job (#PBS -N iMAPtutorial)
* The group allocation name (#PBS -A vxk1_a_g_sc_default)
* Ten processors to run on a single node (#PBS -l nodes=1:ppn=10)
* Three walltime hours (#PBS -l walltime=3:00:00)
* Ten gigabytes of memory (#PBS -l pmem=10gb)
* Joins the error and output in a single file (#PBS -j oe)
* Writes the output in a text file named iMAPtutorial.txt (#PBS -o iMAPtutorial.txt)
* Instructs the PBS manager to send message to a specified email address when the job (b)egins, (e)xits or (a)borts (bea) (#PBS -m bea). 
* Instructs the PBS manager to send the notification emails to the specified email.
* The working directory (cd $PBS_O_WORKDIR)
* The code or individual scripts to be executed
* Finally, the PBS manager will instruct the system to exit once the execution is done (exit 0).


<br>
<br>
<hr>

# OTU ANALYSIS, VISUALIZATION & REPORTING (In progress)
The output is analyzed and visualized via the RStudio IDE (Integrated Development Environment). The entire analysis is summarized in a single HTML report or in a pre-specified format using Rmarkdown.

<hr>
<br>
<br>
D