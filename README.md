# Useful Bashrc alias and functions

## Getting started
* #### To open .bashrc file
   ```javascript
    gedit ~/.bashrc
    ```
* #### To reload .bashrc file after editing
   ```javascript
    source ~/.bashrc
    ```
## A few explanations

* #### Example:
   ```javascript
    findseq scaffold1$ file1.fa
    ```
* #### Executed command:
   ```javascript
    awk 'BEGIN{RS=">";FS="\n"}{if ($1~/scaffold1$/) print ">"$0}' file1.fa > temp.fa
    ```
  * ##### Note: Specifying "scaffolds1$" will print the sequence with the name "scaffold1" (but not "scaffold100") to a new file called "temp.fa"


* #### Example:
   ```javascript
    scp1 file1 reads
    ```
* #### Executed command:
   ```javascript
   scp file1 username@prd.vital-it.ch:/scratch/cluster/monthly/username/reads
    ```
    * ##### Note: Please edit the IP address of the remote machine and full path of the directory on .bashrc 

* #### Example:
   ```javascript
    addmodule ncbi-blast
    ```
* #### Output:
   ```javascript
    module add Blast/ncbi-blast/2.2.28+
    module add Blast/ncbi-blast/2.2.29+
    module add Blast/ncbi-blast/2.2.31+
    module add Blast/ncbi-blast/2.3.0+
    module add Blast/ncbi-blast/latest
    ```
* #### Executed command:
   ```javascript
    module avail 2>&1 | awk '{if ($0~/ncbi-blast/) print "module add "$0}'
    ```
