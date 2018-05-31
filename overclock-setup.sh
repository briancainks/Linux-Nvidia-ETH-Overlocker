## Tested on ubuntu OS using GeForce cards on 13 slot ASRock H110 BTC+
##
## script overclock-setup.sh
## Author Brian Cain - Donation address if you like it and it helps you 
## ETH:  0xa9d510ee22de1f45d374d0ba7771c91c72adda8a
## BTC:  135WPuskGBcaWxkzbnS1z7ud7JnStxPWoB
## ETC:  0x6014847ebe0bfb1eca6640da98461ec59e0e5e57
## 
## Bash Script to automate the overlocking of GeForce GPU's by finding the card information and settings
## overclock properties including power, memory rate and clock frequency.
## Not the cleanest script, but it works.  Will work on optomizing code at a later date
## You must have the Nvidia Cuda toolkit installed
## 1050 ~ 12.4 Mh/s  1060 ~ 23.4 Mh/s   1070 ~ 31.1 Mh/s   1080 - Don't have any, but setup for settings

## Set your OUTPUT script name here, you will call it after running overclock-setup.sh
## In this case ./overclock-cards.sh 
OVERCLOCKSCRIPT=~/overclock-cards.sh
echo "sudo nvidia-smi -pm ENABLED | sed \"s/^/  /gi\"" > $OVERCLOCKSCRIPT
## Set Overclock Variables By Card Type
## GeForce 1050 Settings
G1050PWR=75
G1050MRATE=800
G1050CLOCK=0
G1050FAN=100
## GeForce 1060 Settings
G1060PWR=100
G1060MRATE=1200
G1060CLOCK=-200
G1060FAN=60
## GeForce 1070 Settings
G1070PWR=110
G1070MRATE=1200
G1070CLOCK=-200
G1070FAN=60
## GeForce 1080 Settings
G1080PWR=110
G1080MRATE=1400
G1080CLOCK=-300
G1080FAN=60


GPUCOUNT=`nvidia-smi|grep GeForce|wc -l`
((GPUCOUNT0 = $GPUCOUNT - 1))
echo "Found "$GPUCOUNT" GPU's"
gpuno=0
IFS=$'\n'
for card in $(nvidia-smi --query-gpu=gpu_name --format=csv|grep -v name) 
do     
   #echo "Found "$card
   if [ $gpuno -eq 0 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU0 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"0\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:0]/GPUFanControlState=1' -a '[fan:0]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU0 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"0\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:0]/GPUFanControlState=1' -a '[fan:0]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU0 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"0\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:0]/GPUFanControlState=1' -a '[fan:0]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU0 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"0\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:0]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:0]/GPUFanControlState=1' -a '[fan:0]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
        
   fi
   
   if [ $gpuno -eq 1 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU1 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"1\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:1]/GPUFanControlState=1' -a '[fan:1]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU1 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"1\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:1]/GPUFanControlState=1' -a '[fan:1]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU1 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"1\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:1]/GPUFanControlState=1' -a '[fan1]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU1 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"1\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:1]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:1]/GPUFanControlState=1' -a '[fan1]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
   #echo "gpuno = "$gpuno
      if [ $gpuno -eq 2 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU2 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"2\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:2]/GPUFanControlState=1' -a '[fan:2]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU2 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"2\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:2]/GPUFanControlState=1' -a '[fan:2]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU2 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"2\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:2]/GPUFanControlState=1' -a '[fan2]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU2 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"2\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:2]/GPUFanControlState=1' -a '[fan2]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 3 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU3 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"3\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:2]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:2]/GPUFanControlState=1' -a '[fan2]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 3 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU3 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"3\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:3]/GPUFanControlState=1' -a '[fan:3]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU3 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"3\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:3]/GPUFanControlState=1' -a '[fan:3]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU3 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"3\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:3]/GPUFanControlState=1' -a '[fan3]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU3 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"3\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:3]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:3]/GPUFanControlState=1' -a '[fan3]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 4 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU4 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"4\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:4]/GPUFanControlState=1' -a '[fan:4]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU4 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"4\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:4]/GPUFanControlState=1' -a '[fan:4]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU4 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"4\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:4]/GPUFanControlState=1' -a '[fan4]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU4 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"4\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:4]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:4]/GPUFanControlState=1' -a '[fan4]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 5 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU5 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"5\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:5]/GPUFanControlState=1' -a '[fan:5]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU5 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"5\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:5]/GPUFanControlState=1' -a '[fan:5]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU5 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"5\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:5]/GPUFanControlState=1' -a '[fan5]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU5 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"5\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:5]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:5]/GPUFanControlState=1' -a '[fan5]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 6 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU6 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"6\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:6]/GPUFanControlState=1' -a '[fan:6]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU6 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"6\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:6]/GPUFanControlState=1' -a '[fan:6]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU6 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"6\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:6]/GPUFanControlState=1' -a '[fan6]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU6 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"6\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:6]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:6]/GPUFanControlState=1' -a '[fan6]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 7 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU7 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"7\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:7]/GPUFanControlState=1' -a '[fan:7]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU7 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"7\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:7]/GPUFanControlState=1' -a '[fan:7]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU7 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"7\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:7]/GPUFanControlState=1' -a '[fan7]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU7 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"7\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:7]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:7]/GPUFanControlState=1' -a '[fan7]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 8 ]
   then 
	   modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU8 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"8\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:8]/GPUFanControlState=1' -a '[fan:8]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU8 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"8\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:8]/GPUFanControlState=1' -a '[fan:8]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU8 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"8\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:8]/GPUFanControlState=1' -a '[fan8]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU8 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"8\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:8]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:8]/GPUFanControlState=1' -a '[fan8]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 9 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU9 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"9\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:9]/GPUFanControlState=1' -a '[fan:9]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU9 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"9\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:9]/GPUFanControlState=1' -a '[fan:9]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU9 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"9\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:9]/GPUFanControlState=1' -a '[fan9]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU9 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"9\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:9]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:9]/GPUFanControlState=1' -a '[fan9]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 10 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU10 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"10\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:10]/GPUFanControlState=1' -a '[fan:10]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU10 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"10\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:10]/GPUFanControlState=1' -a '[fan:10]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU10 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"10\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:10]/GPUFanControlState=1' -a '[fan10]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU10 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"10\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:10]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:10]/GPUFanControlState=1' -a '[fan10]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 11 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU11 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"11\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:11]/GPUFanControlState=1' -a '[fan:11]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU11 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"11\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:11]/GPUFanControlState=1' -a '[fan:11]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU11 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"11\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:11]/GPUFanControlState=1' -a '[fan11]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU11 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"11\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:11]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:11]/GPUFanControlState=1' -a '[fan11]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
      if [ $gpuno -eq 12 ]
   then 
       modno=`echo $card | grep 1050`
       if [ $modno ]
       then
           echo "##Card GPU12 is a 1050 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"12\" -pl \"$G1050PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUMemoryTransferRateOffset[3]=$G1050MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUGraphicsClockOffset[3]=$G1050CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:12]/GPUFanControlState=1' -a '[fan:12]/GPUTargetFanSpeed=$G1050FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1060`
       then
           echo "##Card GPU12 is a 1060 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"12\" -pl \"$G1060PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUMemoryTransferRateOffset[3]=$G1060MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUGraphicsClockOffset[3]=$G1060CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:12]/GPUFanControlState=1' -a '[fan:12]/GPUTargetFanSpeed=$G1060FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1070`
       then
           echo "##Card GPU12 is a 1070 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"12\" -pl \"$G1070PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUMemoryTransferRateOffset[3]=$G1070MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUGraphicsClockOffset[3]=$G1070CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:12]/GPUFanControlState=1' -a '[fan:12]/GPUTargetFanSpeed=$G1070FAN'" >> $OVERCLOCKSCRIPT
       elif [ $modno ]
       modno=`echo $card | grep 1080`
       then
           echo "##Card GPU12 is a 1080 model" >> $OVERCLOCKSCRIPT
           echo "sudo nvidia-smi -i \"12\" -pl \"$G1080PWR\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUMemoryTransferRateOffset[3]=$G1080MRATE\"" >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a \"[gpu:12]/GPUGraphicsClockOffset[3]=$G1080CLOCK\""  >> $OVERCLOCKSCRIPT
           echo "nvidia-settings -c :0 -a '[gpu:12]/GPUFanControlState=1' -a '[fan:12]/GPUTargetFanSpeed=$G1080FAN'" >> $OVERCLOCKSCRIPT
       fi
   fi
gpuno=$((gpuno + 1))
done
