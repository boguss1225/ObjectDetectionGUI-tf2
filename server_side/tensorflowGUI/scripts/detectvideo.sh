#! /bin/bash
# Made by Heemoon Yoon in 2019
# Heemoon.yoon@utas.edu.au
# UNIVERSITY OF TASMANIA
# This shell script is for detecting object in image files
# This script is part of TF-GUI project

# Store parameter in array *first parameter is always envName!
PARAMETERS=("$@")

if [[ ${#PARAMETERS[@]} -lt 5 ]]; then
        echo "not enough PARAMETERS: $PARAMETERS"
        exit
fi

# activate tensorflow env
export PATH="~/anaconda3/bin:$PATH"
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate $1
conda info|egrep "conda version|active environment"

# Path Setting
#cd ~/tensorflowGUI/$1/models/research
#export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
#export PATH=$PATH:PYTHONPATH

#hidden function (GPU enable)
default_gpu=-1
thickness=$3 
if [[ $3 == *"@"* ]]; then
        default_gpu=`echo $3 | cut -d'@' -f 2`
        thickness=`echo $3 | cut -d'@' -f 1`
fi

# repeat as many as num of files
for i in "${PARAMETERS[@]:4}"; do

#Edit python code file
while read line
do
        # edit image name
        if [[ $line == "# Path to video" ]]; then
                read line
		temp="$i"
                `sed -i "/$line/cPATH_TO_IMAGE = os.path.join(CWD_PATH,'test_videos','$temp') ###" ~/tensorflowGUI/$1/models/research/object_detection/Object_detection_video_tf2.py`
        fi

	# edit num of classes
	if [[ $line == "# Number of classes the object detector can identify" ]]; then
                read line
                `sed -i "/$line/cNUM_CLASSES = $2 ##" ~/tensorflowGUI/$1/models/research/object_detection/Object_detection_video_tf2.py`
        fi

	# edit util setting
        if [[ $line == *use_normalized_coordinates=True, ]]; then
		read line
                `sed -i "/$line/c\            line_thickness=$thickness, ##" ~/tensorflowGUI/$1/models/research/object_detection/Object_detection_video_tf2.py`
		read line
		`sed -i "/$line/c\            min_score_thresh=$4, ##" ~/tensorflowGUI/$1/models/research/object_detection/Object_detection_video_tf2.py`
		break
        fi

done < ~/tensorflowGUI/$1/models/research/object_detection/Object_detection_video_tf2.py

# Run Training
cd ~/tensorflowGUI/$1/models/research/object_detection/
export CUDA_VISIBLE_DEVICES=$default_gpu && python Object_detection_video_tf2.py

done



