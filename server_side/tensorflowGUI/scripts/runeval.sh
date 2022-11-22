#! /bin/bash
# Made by Heemoon Yoon in 2019
# Heemoon.yoon@utas.edu.au
# UNIVERSITY OF TASMANIA
# This shell script is for evaluate tensorflow model
# This script is part of TF-GUI project


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

#Set configfile
#cd ~/tensorflowGUI/$1/models/research/object_detection/images/test
#cnt=`ls -1|wc -l`
#(( cnt=cnt/2 ))
#while read line
#do
        # last line of class setting
#        if [[ $line == "eval_config: {" ]]; then
#		read line
#		read line
#               `sed -i "/$line/c\  num_examples : $cnt" ~/tensorflowGUI/$1/models/research/object_detection/training/$2.config`
#		break
#        fi
#done < ~/tensorflowGUI/$1/models/research/object_detection/training/$2.config


# Run Training
cd ~/tensorflowGUI/$1/models/research/object_detection/
#python model_main_tf2.py --model_dir=training/efficientdet_d0_coco17_tpu-32 --pipeline_config_path=training/efficientdet_d0_coco17_tpu-32.config --checkpoint_dir=training
export CUDA_VISIBLE_DEVICES=-1&&python model_main_tf2.py --logtostderr --pipeline_config_path=training/$2.config --checkpoint_dir=training/ --model_dir=training/

