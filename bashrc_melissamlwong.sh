########## This .bashrc alias and script is written by Melissa M.L. Wong (Melissa.Wong@unil.ch) on 3rd June 2016. ##########

########## common unix alias ##########

alias 'll=ls -l'
alias 'p=ps aux |grep '
alias 'dfh=df -h'
alias 'dfh=df -h'
alias 'top10=du -a * | sort -n -r | head -n 10' #check top 10 largest folder in current directory
# cd aliases
alias '..=cd ..'
alias '...=cd ../..'
alias '....=cd ../../..'
#autoremove and clean
alias 'clean=sudo apt-get autoremove && sudo apt-get clean'
#remove linux-image; it will print remove command for a list of linux image available. just choose the old images and paste on the terminal to run the command
alias 'remove=dpkg --get-selections | grep linux-image-[0-9] | awk '\''{print "sudo apt-get remove --purge " $1}'\'''

########## Alias/script for using the cluster ##########

#To login into server
alias prd='ssh username@prd.vital-it.ch'
#Changed last modified time of all files to current time #To prevent files from being deleted in server
alias 'touchall = find . -exec touch {} \;'
#cd to directory
alias 'temp = cd /scratch/cluster/monthly/username'
#find module using regex pattern and echo module add command
function addmodule {
    first="module avail 2>&1 | awk '{if ($0~/"
    last="/) print \"module add \"$0}'"
    cmd="${first}${1}${last}"
    (echo $cmd) || echo -e "\n   To find modules and echo add module command \n   Usage: addmodule [insert regex_pattern]\n"
}
#scp files from local machine to remote server
alias 'vital=echo scp username@prd.vital-it.ch:/scratch/cluster/monthly/username'
function scp1 {
    first="scp "
    last="username@prd.vital-it.ch:/scratch/cluster/monthly/username"
    cmd="${first}${1}${last}${2}"
    (eval $cmd) || echo -e "\n   To copy file from local machine to remote server\n   Usage: scp1 filename [insert path after /scratch/cluster/monthly/username/]\n"
}

########## Alias/script for bioinformatics ##########

#grep sequence... include middle and end code <space> filename. usage: findseq scaffold repeat.fa
function findseq {
    first="awk 'BEGIN{RS=\">\";FS=\"\n\"}{if (\$1~/"
    last="/) print \">\"\$0}'"
    cmd="${first}${1}${last} ${2} > temp.fa"
    (eval $cmd) || echo -e "\n   To extract a sequence from fasta file based on a regex pattern\n   Usage: findseq [insert regex pattern] repeat.fa > temp.fa\n"
}
#echo blast command
alias 'runblastn=echo "makeblastdb -in ref.fa -dbtype nucl -out ref && blastn -task blastn -db ref -query temp.fa -out results.txt -evalue 1E-10 -outfmt 6 -num_threads 2"'
alias 'runblastp=echo "makeblastdb -in ref.fa -dbtype prot -out ref && blastp -db ref -query temp.fa -out results.txt -evalue 1E-10 -outfmt 6 -num_threads 2"'
#echo install perl module command
alias 'cpan=echo perl -MCPAN -e \"install HTML::Template\"'


