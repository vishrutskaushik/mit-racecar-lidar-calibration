# Velodyne Lidar Calibration and Transform

1) Clone the repository
```
git clone git@github.com:vishrutskaushik/velodyne-lidar-calibration-and-transform.git
```

2) Set the IP address of the Velodyne VLP-16 LiDAR in src/velodyne_pointcloud/launch/VLP16_points.launch on Line 8
```
<arg name="device_ip" default="your_lidar_ip_address" />
```

3) Set your receiver IP address in Velodyne Config
Refer: https://velodynelidar.com/wp-content/uploads/2019/12/63-9243-Rev-E-VLP-16-User-Manual.pdf
Page 23, Section 4.2.1

4) Change target frame of the Velodyne VLP-16 LiDAR in src/velodyne_pointcloud/launch/VLP16_points.launch on Line 51
```
<arg name="frame_id" default="your_lidar_frame_id" />
eg. <arg name="frame_id" default="velodyne" />
```

5) Change target frame of the Velodyne VLP-16 LiDAR in src/velodyne_pointcloud/launch/VLP16_points.launch on Line 51
```
<arg name="target_frame" value="your_target_frame" />
eg. <arg name="target_frame" value="base_link" />
```

6) Set the x, y, z, roll ,pitch, yaw, child_frame_id, frame_id in src/velodyne_pointcloud/params/vlp16_extrinsic.yaml
  - Your child_frame_id should be same as frame_id in step 4.
  - Your frame_id should be same as target_frame in step 5.

7) Running the program
  Terminal 1:
  ```
  cd velodyne-lidar-calibration-and-transform
  catkin_make
  source devel/setup.bash
  roslaunch velodyne_pointcloud VLP16_points.launch
  ```
  Terminal 2:
  ```
  cd velodyne-lidar-calibration-and-transform
  source devel/setup.bash
  roslaunch lidar_transform vlp16_lidar_transform.launch
  ```
  
8) Rviz
  - Set the the fixed frame in global options to your target_frame in step 5.
  - Click on Add. Select PointCloud2 in By topic -> velodyne_points/PointCloud2


Credits:
- Velodyne Github: https://github.com/ros-drivers/velodyne
  
