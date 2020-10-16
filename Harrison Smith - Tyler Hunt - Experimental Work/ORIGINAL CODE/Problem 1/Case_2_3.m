clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_2_3   = readtable('Accelerometer_2_3.csv');
data_table_gyro_2_3  = readtable('Gyroscope_2_3.csv');
data_table_mag_2_3   = readtable('Magnetometer_2_3.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_3   = data_table_acc_2_3{:,2};
acc_y_2_3   = data_table_acc_2_3{:,3}; 
acc_z_2_3   = data_table_acc_2_3{:,4};

mu_acc_x_2_3	= mean(acc_x_2_3);
sig2_acc_x_2_3	= var(acc_x_2_3);

mu_acc_y_2_3	=  mean(acc_y_2_3);
sig2_acc_y_2_3	= var(acc_y_2_3);

mu_acc_z_2_3	= mean(acc_z_2_3);
sig2_acc_z_2_3	= var(acc_z_2_3);

mu_acc_2_3      = [mu_acc_x_2_3; mu_acc_y_2_3; mu_acc_z_2_3]
bias_acc_2_3    = [mu_acc_x_2_3; mu_acc_y_2_3; mu_acc_z_2_3] - [0;0;g]		% m/s/s
var_acc_2_3		= diag([sig2_acc_x_2_3 sig2_acc_y_2_3 sig2_acc_z_2_3])

%% Gryroscopes

gyro_x_2_3 = data_table_gyro_2_3{:, 2};
gyro_y_2_3 = data_table_gyro_2_3{:, 3};
gyro_z_2_3 = data_table_gyro_2_3{:, 4};


mu_gyro_x_2_3	= mean(gyro_x_2_3);
sig2_gyro_x_2_3	= var(gyro_x_2_3);

mu_gyro_y_2_3	= mean(gyro_y_2_3);
sig2_gyro_y_2_3 = var(gyro_y_2_3);

mu_gyro_z_2_3	= mean(gyro_z_2_3);
sig2_gyro_z_2_3	= var(gyro_z_2_3);

mu_gyro_2_3     = [mu_gyro_x_2_3; mu_gyro_y_2_3; mu_gyro_z_2_3]
bias_gyro_2_3	= -[mu_gyro_x_2_3; mu_gyro_y_2_3; mu_gyro_z_2_3]				% rad/s
var_gyro_2_3	= diag([sig2_gyro_x_2_3 sig2_gyro_y_2_3 sig2_gyro_z_2_3])


%% Magnetometers

mag_x_2_3 = data_table_mag_2_3{:, 2};
mag_y_2_3 = data_table_mag_2_3{:, 3};
mag_z_2_3 = data_table_mag_2_3{:, 4};

mu_mag_x_2_3	= mean(mag_x_2_3);
sig2_mag_x_2_3	= var(mag_x_2_3);

mu_mag_y_2_3	= mean(mag_y_2_3);
sig2_mag_y_2_3	= var(mag_y_2_3);

mu_mag_z_2_3	= mean(mag_z_2_3);
sig2_mag_z_2_3	= var(mag_z_2_3);


mu_mag_2_3      = [mu_mag_x_2_3;mu_mag_y_2_3;mu_mag_z_2_3]
bias_mag_2_3	= [mu_mag_x_2_3;mu_mag_y_2_3;mu_mag_z_2_3] - [0;19.729;-47.6421]	% muT
var_mag_2_3		= diag([sig2_mag_x_2_3 sig2_mag_y_2_3 sig2_mag_z_2_3])

xlswrite('Data.xls',[mu_acc_2_3 tru_acc_2 bias_acc_2_3 var_acc_2_3],'sheet1','E25');
xlswrite('Data.xls',[mu_gyro_2_3 tru_gyro_2 bias_gyro_2_3 var_gyro_2_3],'sheet2','E25');
xlswrite('Data.xls',[mu_mag_2_3 tru_mag_2 bias_mag_2_3 var_mag_2_3],'sheet3','E25');