
#! /bin/bash
# Made by Heemoon Yoon in 2019
# Heemoon.yoon@utas.edu.au
# UNIVERSITY OF TASMANIA
# This shell script is for converting tensorflow training ckpt file
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

# Run Training
cd ~/tensorflowGUI/$1/models/research/object_detection/
python exporter_main_v2.py --input_type image_tensor --pipeline_config_path training/$3.config --trained_checkpoint_dir training/ --output_directory inference_graph
