#!/bin/bash

parsecfiles=(parsec-blackscholes-large-4 parsec-bodytrack-large-4 parsec-caneal-large-4 parsec-dedup-large-4 parsec-facesim-large-4 parsec-ferret-large-4 parsec-fluidanimate-large-4 parsec-freqmine-large-4 parsec-raytrace-large-4 parsec-streamcluster-large-4 parsec-swaption-large-4 parsec-vips-large-4 parsec-x264-large-4)

specfiles=(SET1-4core-MCF-BZIP2-OMNETPP-XALANCBMK.simics SET2-4core-MILC-LESLIED3D-GEMSFDTD-LBM.simics SET3-4core-MCF-XALANCBMK-GEMSFDTD-LBM.simics SET4-4core-MCF-GEMSFDTD-POVRAY-PERLBENCH.simics SET5-4core-MCF-XALANCBMK-PERLBENCH-GCC.simics SET6-4core-GEMSFDTD-LBM-POVRAY-NAMD.simics SET7-4core-GROMACS-NAMD-DEALII-POVRAY.simics SET8-4core-PERLBENCH-GCC-DEALII-POVRAY.simics SET9-4core-NAMD-POVRAY-PERLBENCH-GCC.simics)

if [ -d "$1-reports" ]; then rm -r $1-reports; fi
if [ -d "$1-progress" ]; then rm -r $1-progress; fi
if [ -d "tor-files" ]; then rm -r tor-files; fi
if [ -d "tor-reports" ]; then rm -r tor-reports; fi

mkdir $1-reports
mkdir $1-progress
mkdir tor-files
mkdir tor-reports

parsecdir=/data/Mohammad_Arjomand/parsec
specdir=/data/Mohammad_Arjomand/SPEC

idx=0
for name in ${parsecfiles[@]}; do
	echo "#PBS -N $1-$name" > tor-files/$name.tor
	echo "#PBS -V" >> tor-files/$name.tor
	echo "#PBS -q orcaq" >> tor-files/$name.tor
	echo "#PBS -l nodes=1" >> tor-files/$name.tor
	echo "#PBS -o tor-reports/$name.tor.rep" >> tor-files/$name.tor
	echo "#PBS -j oe" >> tor-files/$name.tor
	echo "" >> tor-files/$name.tor
	echo "cd \$PBS_O_WORKDIR" >> tor-files/$name.tor
	echo "./$1 $parsecdir/$name $2 $1-reports/$name.rep $1-progress/$name.prog" >> tor-files/$name.tor
	idx=$((idx+1))
done

num=1
for name in ${specfiles[@]}; do
	echo "#PBS -N $1-$name" > tor-files/$name.tor
	echo "#PBS -V" >> tor-files/$name.tor
	echo "#PBS -q orcaq" >> tor-files/$name.tor
	echo "#PBS -l nodes=1" >> tor-files/$name.tor
	echo "#PBS -o tor-reports/$name.tor.rep" >> tor-files/$name.tor
	echo "#PBS -j oe" >> tor-files/$name.tor
	echo "" >> tor-files/$name.tor
	echo "cd \$PBS_O_WORKDIR" >> tor-files/$name.tor
	echo "./$1 $specdir/SET$num/4-core/$name $2 $1-reports/$name.rep $1-progress/$name.prog" >> tor-files/$name.tor
	idx=$((idx+1))
	num=$((num+1))
done

for name in ${parsecfiles[@]}; do
	chmod +x tor-files/$name.tor
	qsub tor-files/$name.tor
done

for name in ${specfiles[@]}; do
	chmod +x tor-files/$name.tor
	qsub tor-files/$name.tor
done



