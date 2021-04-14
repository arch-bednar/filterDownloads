#!/bin/bash

function checkDirectories(){

    if [ ! -d "$pth" ]; then
	mkdir $pth
    fi
    
    directories=(Programs Movies Music Documents Programming DiscImages Pictures Archieves Conf Others)
    
    for (( position=0 ; $position<${#directories[*]}; position++ )); do
	if [ ! -d "$pth/${directories[$position]}" ]; then
	    echo create ${directories[$position]}
	    mkdir "$pth/${directories[$position]}"
	fi
    done
}

function moveFiles(){
    for fun in ${directories[*]}; do
	move$fun
    done
	
}

function moveOthers(){
    #mv $dir/* $pth/$fun
    echo 
}

function moveConf(){
    kind=(.inf .conf .dll .config .key)
    for conf in ${kind[*]}; do
	echo "Moving $conf...."
	mv $dir/*"$conf" $pth/$fun
    done
}

function moveMusic(){
    kind=(.mp3 .m4a .flacc .ogg)
    for msc in ${kind[*]}; do
	echo "Moving $msc...."
	mv $dir/*"$msc" $pth/$fun
    done
}

function moveDocuments(){
    kind=(.txt .doc .docx .pdf .tex .odt)
    for doc in ${kind[*]}; do
	echo "Moving $doc...."
	mv $dir/*"$doc" $pth/$fun
    done
}

function moveProgramming(){
    kind=(.java .class .cc .c .h .cpp .py .ipynb .out .sql .sh .jar)
    for prog in ${kind[*]}; do
	echo "Moving $prog...."
	mv $dir/*"$prog" $pth/$fun
    done
}

function moveDiscImages(){
    kind=(.iso .img .bin)
    for image in ${kind[*]}; do
	echo "Moving $image...."
	mv $dir/*"$image" $pth/$fun
    done
}

function movePictures(){
    kind=(.jpg .img .png .gid .xfc .bmp .jpeg .ico .xcf)
    for pic in ${kind[*]}; do
	echo "Moving $pic...."
	mv $dir/*"$pic" $pth/$fun
    done
}

function moveArchieves(){
    kind=(.rar .zip .7z .tar .tar.xz .tar.gz)
    for arch in ${kind[*]}; do
	echo "Moving $arch...."
	mv $dir/*"$arch" $pth/$fun
    done
}

function movePrograms(){
    kind=(.deb .exe .msi .rpm)
    for prg in ${kind[*]}; do
	echo "Moving $prg...."
	mv $dir/*"$prg" $pth/$fun
    done
}

function moveMovies(){
    kind=(.avi .mp4 .mkv .amv .webm)
    for movie in ${kind[*]}; do
	echo "Moving $movie...."
	mv $dir/*"$movie" $pth/$fun
    done
}

function chooseDirectory(){
    echo -n "Podaj katalog do przefiltrowania [$HOME/Downloads]: "
    read dir
    if [ ! -d $dir ]; then
	echo "Wrong path!!"
	exit 1
    fi
    pth="$dir/filtrowane"
}

function main(){

    dir="$HOME/Downloads"
    pth="$HOME/Downloads/filtrowane"

#    chooseDirectory
    checkDirectories
    moveFiles
    echo koniec
}

main
