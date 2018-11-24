#!/bin/bash

DIRWORK="/home/ninjadev/estudos_python/"
LOCK=".git/index.lock" 
DATA=$(date +%d/%m/%Y-%H:%M:%S)
echo $DATA
#CCOR='\033[1;90m'
CCOR='\033[0;32m'
NCOR='\033[0m'
OK="[*]"


func_gitcreaterepo()
{ 
	cd $DIRWORK/ && git remote remove origin 
	[ -f $DIRWORK/$1/$LOCK && rm -f $DIRWORK/$1/$LOCK ]
	echo "#$1 - Commit $DATA" >> $DIRWORK/$1/README.md
	echo -e "${CCOR}$OK${NCOR} Diretorio $(pwd)" 
	echo "Acessa diretorio $DIRWORK/$1/"
	cd $DIRWORK/$1 && git init 
	#git init $DIRWORK/$1 
	cd $DIRWORK/$1 && git add .
	cd $DIRWORK/$1 && git commit -m "$DATA - First Commit"
	cd $DIRWORK/$1 && git remote add origin https://github.com/sandromelobrazil/$1.git 
	cd $DIRWORK/$1 && git remote -v
	cd $DIRWORK/$1 && git config --global credential.helper store
	cd $DIRWORK/$1 && git config credential.helper cache 600000	
	cd $DIRWORK/$1 && git push -u origin master -f
	echo -e "${CCOR}$OK${NCOR} Finalizado o processo de inicializacao do repositorio " 
	echo -e "${CCOR}$OK${NCOR} Repositorio -> $1 " 

}

func_gitupdate()
{
	cd $DIRWORK/ && git remote remove origin 
	[ -f $DIRWORK/$1/$LOCK && rm -f $DIRWORK/$1/$LOCK ]
	echo "#$1 - New commit $DATA" >> $DIRWORK/$1/README.md
	cd $DIRWORK/$1 && git commit -am " - The last Commit was $DATA - "
	cd $DIRWORK/$1 && git remote add origin https://github.com/sandromelobrazil/$1.git 
	cd $DIRWORK/$1 && git remote -v
	cd $DIRWORK/$1 && git config --global credential.helper store
	cd $DIRWORK/$1 && git config credential.helper cache 600000	
	cd $DIRWORK/$1 && git push -u origin master -f
	echo -e "${CCOR}$OK${NCOR} Finalizado o processo de atualizacao do repositorio " 
	echo -e "${CCOR}$OK${NCOR} Repositorio -> $1 " 
}


func_gitsimpleupdate()
{
	echo "#$1 - New commit $DATA" >> $DIRWORK/$1/README.md
	[ -f $DIRWORK/$1/$LOCK && rm -f $DIRWORK/$1/$LOCK ]
	cd $DIRWORK/$2 && git remote remove origin 
	cd $DIRWORK/$1 && git remote add origin https://github.com/sandromelobrazil/$1.git 
	cd $DIRWORK/$1 && git commit -am " - The new commit was done -> $DATA - "
	cd $DIRWORK/$1 && git config --global credential.helper store
	cd $DIRWORK/$1 && git config credential.helper cache 600000	
	cd $DIRWORK/$1 && git push -f
	echo -e "${CCOR}$OK${NCOR} Finalizado o processo de atualizacao do repositorio " 
	echo -e "${CCOR}$OK${NCOR} Repositorio -> $1 " 
}


func_initrepo_main()
{
	#func_gitcreaterepo Python_Para_Pentes1
	func_gitcreaterepo PENTEST_GREEN_BELT
	func_gitcreaterepo SHELLSCRIPTS
	func_gitcreaterepo BOOKS_RESOURCES
	func_gitcreaterepo HONEYPOT_UNIRON
	func_gitcreaterepo MALIBU
	func_gitcreaterepo PEDEMOLEQUE
	func_gitcreaterepo REAL_FORENSICS
	func_gitcreaterepo TAMBAQUI_CORP
	echo .
}

func_fullupdate_main()
{
	### only update
	#func_gitupdate PENTEST_GREEN_BELT
	#func_gitupdate BOOKS_RESOURCES
	echo ..
}

func_simpleupdate_main()
{
	### Simple update
	#func_gitsimpleupdate PENTEST_GREEN_BELT
	#func_gitsimpleupdate BOOKS_RESOURCES
	echo ...
}


func_initrepo_main
func_fullupdate_main
func_simpleupdate_main


