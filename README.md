# Easy Tensorflow Object Detection API GUI for anyone
Easy to use, Good looking, Highly utilized, and Light Tensorflow Tool.\
TF-GRAF(TensorFlow with user friendly GRAphical Framework for object detection API) allows anyone, even without any previous knowledge of deep learning frameworks, to design, train and deploy machine intelligence models without coding.\
No need to Code! NO need type Command line!\
All you need to do is download exe file and go!\
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/Detect_faster_rccn_inception.png)

# Requirement for user
* Windows 10
* JRE 1.8.0
* User needs to prepare set of images and annotation data.

# General Features
* Convert annotated dataset to tf-record files 
* Hyperparameter setting of configuration files
* Training various models
* Real time observation of training processing
* Object detection in test images using trained models
* evaluating model with various metrics

# Usage
## Download exe file and run in windows
currently exclusively available to internal group of association.
If you need to setup exe, please contact me.

## Set classes
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/step1setclasses.PNG)

## Generate TF-record files
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/step2-GenerateTFrecord.PNG)

## Set configurations
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/configuration.PNG)

## Training
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/Train-finished.PNG)

## Generate Pb file (frozen inference graph.pb)
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/convertCKPT-result2.PNG)

## Object Detection
* faster_rcnn_inception\
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/Detect_faster_rccn_inception.png)
* rfcn_resnet101\
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/Detect_rfcn_resnet101.png)
* ssd_mobilenet_v2\
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/Detect_ssd_mobilenet_v2.png)
* mask_rcnn_resnet101\
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/Detect_mask_rccn_resnet101.png)

## Evaluate trained model
![picture](https://github.com/boguss1225/ObjectDetectionGUI/blob/master/screenshot/eval_model-finished.PNG)

# Manual
step by step manual is available here\
https://drive.google.com/file/d/1mZkj5jhdDJcANsP8xcHKdmlPNxeHcmXM/view?usp=sharing

# Requirements and specification for developer
* Tensorflow environment installed in Ubuntu 20.04.5 LTS
* Anaconda environment version 22.9.0 installed to establish Tensorflow virtual environment
* CUDA version: 11.4
* Tensorflow version: 2.10.0
* Python version: 3.8.13
* Pre-trained models: COCO dataset
* opencv-python==4.6.0.66
* opencv-python-headless==4.6.0.66
* PygIDE tested within Windows 10 and jre 1.8.0


# Setup server-side
~~~
mkdir env_name
~~~
~~~
conda create -n env_name python==3.8
~~~
~~~
conda activate env_name
~~~
~~~
pip install tensorflow==2.* cython
~~~
~~~
cd ~/tensorflowGUI/env_name/models/research/cocoapi/PythonAPI
~~~
~~~
make
~~~
~~~
cp -r pycocotools ../../
~~~
~~~
cd models/research/
~~~
~~~
python -m pip install .
~~~
~~~
cp builder.py /home/tfgraf/anaconda3/envs/{env_name}/lib/python3.8/site-packages/google/protobuf/internal/
~~~
~~~
python object_detection/builders/model_builder_tf2_test.py
~~~

# News
- PygIDE 1.0 was initially released on Github in 24th of Apr 2020.
- PygIDE is renamed as TFGraF
- Hidden Function added : Entering '-1' on gpu selection in 'start training' dialog will make the training run on CPU
- Hidden Function added 2 : Entering '50071' in thickness text field when you inference image will make the training run on GPU #1 and 5 thickness. Otherwise, run on CPU

# Request
Please email us if you need more information or free account\
heemoon.yoon@utas.edu.au

# Paper
~~~
https://arxiv.org/abs/2006.06385
~~~

# if you want to cite this
~~~
Yoon, H., Lee, S. H., & Park, M. (2020). TensorFlow with user friendly Graphical Framework for object detection API. arXiv, arXiv-2006.
~~~
~~~
@misc{yoon2020tensorflow,
    title={TensorFlow with user friendly Graphical Framework for object detection API},
    author={Heemoon Yoon and Sang-Hee Lee and Mira Park},
    year={2020},
    eprint={2006.06385},
    archivePrefix={arXiv},
    primaryClass={eess.IV}
}
~~~
