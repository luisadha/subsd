#!/system/bin/mksh
# 
# subsd v0.03
# Simple program to view subfolder under /sdcard
# Created with shell (mksh) for Terminal Emulator purpose or Termux
# Copyright (C) 2024 <adharudin14@gmail.com>

#Tested on: j2lte (j2ltedd), fog(redmi10c)

BL='\e[01;90m' > /dev/null 2>&1; # Black
R='\e[01;91m' > /dev/null 2>&1; # Red
G='\e[01;92m' > /dev/null 2>&1; # Green
Y='\e[01;93m' > /dev/null 2>&1; # Yellow
B='\e[01;94m' > /dev/null 2>&1; # Blue
P='\e[01;95m' > /dev/null 2>&1; # Purple
C='\e[01;96m' > /dev/null 2>&1; # Cyan
W='\e[01;97m' > /dev/null 2>&1; # White
N='\e[0m' > /dev/null 2>&1; # Null

echo -e ${G}"======================================================"${N}
echo -e ${W}"PROGRAM UNTUK MEMERIKSA SETIAP ISI  SUBFOLDER /sdcard"${N}
echo -e ${G}"======================================================"${N}
echo
suc='[√] '
fail='[!] '
export OLDPWD='/sdcard'
function failed {
echo -e ${R}"$fail Gagal membuka direktori $i\n" ${N}
}
function succes {
echo -e ${G}"$suc Anda baru saja membuka direktori: $i" ${N}          
}
cd /sdcard || exit
count=1
for i in *; do
echo -e "$C$count.$N Buka '$i' folder?"
  ((count++))
echo -e ${B}"[PRESS ENTER TO PROCCED]"${N}
read dir
    case "$count" in
        *)
             cd "$i" 2>/dev/null
              [[ -e "$i" ]] && failed && continue || succes
          echo;
          set ./* ./[!.]* ./..?*
          if [ -n "$4" ] ||
             for e do
                 [ -L "$e" ] ||
                 [ -e "$e" ] && break
             done
          then ! echo -e "${P}"; ls -F; echo -e "${N}";
          else ls; echo; echo -e ${BL}"<info: this dir is empty>"${N}; echo;
          fi
            ;;
    esac
cd - &>/dev/null
done
echo -e ${Y}"End of program"${N}
cd "$OLDPWD" &>/dev/null
