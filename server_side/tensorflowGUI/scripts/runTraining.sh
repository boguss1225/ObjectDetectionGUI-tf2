#! /bin/bash
# Made by Heemoon Yoon in 2019
# UNIVERSITY OF TASMANIA
# This shell script is for running tensorflow training
# This has to be run after all the training resource has been ready


# activate new env to prove that it works
export PATH="~/anaconda3/bin:$PATH"
CONDA_BASE=$(conda info --base)

source $CONDA_BASE/etc/profile.d/conda.sh
conda activate $1
conda info|egrep "conda version|active environment"

# Path Setting
#cd ~/tensorflowGUI/$1/models/research
#export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim
#export PATH=$PATH:PYTHONPATH

# Run Training
cd ~/tensorflowGUI/$1/models/research/object_detection/
export CUDA_VISIBLE_DEVICES=$3 && python model_main_tf2.py --alsologtostderr --model_dir=training/ --pipeline_config_path=training/$2.config --checkpoint_every_n=1000 --chechkpoint_dir=training/

