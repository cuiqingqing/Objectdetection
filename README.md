# Objectdetection


1.      Excute ‘build.sh’ in the archive file to compile the code.

2.      Download the video file into network/ir_fp32 or ir_fp16 folders.

        cd network/ir_fp32 # or ir_fp16

        wget https://raw.githubusercontent.com/nealvis/media/master/traffic_vid/bus_station_6094_960x540.mp4

3.      Download the weights file and convert the bin files.

        cd network

        a.      download  the SSD_GoogleNetV2 archive file from https://software.intel.com/file/609199/download =>SSD_GoogleNetV2_caffe.tgz

        b.     Uncompress the  archive files and rename SSD_GoogleNetV2.prototext from SSD_GoogleNetV2_Deploy.prototxt

        c.      Convert the caffemodel as OpenVINO format.

        /opt//intel/computer_vision_sdk_2018.1.249/deployment_tools/model_optimizer/mo.py --input_model SSD_GoogleNetV2.caffemodel --output_dir ir_fp16 --data_type FP16

       /opt//intel/computer_vision_sdk_2018.1.249/deployment_tools/model_optimizer/mo.py --input_model SSD_GoogleNetV2.caffemodel --output_dir ir_fp32 --data_type FP32

4.      Link the library file into ir_fp32 and ir_fp16 folders and the binary file in build folder.

        cd network/ir_fp32

        ln –s /opt/intel/computer_vision_sdk/deployment_tools/inference_engine/lib/ubuntu_16.04/ lib

        ln –s ../../build/intel64/Release/object_detection_demo_ssd_async   object_detection_demo_ssd_async

5.      Execute the demo

a.      CPU mode

        cd network/ir_fp32

        ./object_detection_demo_ssd_async -i bus_station_6094_960x540.mp4 -m SSD_GoogleNetV2.xml 

b.     MYRIAD mode 

        cd network/ir_fp16

        sudo ./object_detection_demo_ssd_async -i bus_station_6094_960x540.mp4 -m SSD_GoogleNetV2.xml -d MYRIAD

 

