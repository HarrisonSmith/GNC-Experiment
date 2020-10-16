clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_4_3   = readtable('Accelerometer_4_3.csv');
data_table_gyro_4_3  = readtable('Gyroscope_4_3.csv');
data_table_mag_4_3   = readtable('Magnetometer_4_3.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_3   = data_table_acc_4_3{:,2};
acc_y_4_3   = data_table_acc_4_3{:,3}; 
acc_z_4_3   = data_table_acc_4_3{:,4};

mu_acc_x_4_3	= mean(acc_x_4_3);
sig2_acc_x_4_3	= var(acc_x_4_3);

mu_acc_y_4_3	=  mean(acc_y_4_3);
sig2_acc_y_4_3	= var(acc_y_4_3);

mu_acc_z_4_3	= mean(acc_z_4_3);
sig2_acc_z_4_3	= var(acc_z_4_3);

mu_acc_4_3      = [mu_acc_x_4_3; mu_acc_y_4_3; mu_acc_z_4_3]
bias_acc_4_3    = [mu_acc_x_4_3; mu_acc_y_4_3; mu_acc_z_4_3] - [0;0;g]		% m/s/s
var_acc_4_3		= diag([sig2_acc_x_4_3 sig2_acc_y_4_3 sig2_acc_z_4_3])

%% Gryroscopes

gyro_x_4_3 = data_table_gyro_4_3{:, 2};
gyro_y_4_3 = data_table_gyro_4_3{:, 3};
gyro_z_4_3 = data_table_gyro_4_3{:, 4};


mu_gyro_x_4_3	= mean(gyro_x_4_3);
sig2_gyro_x_4_3	= var(gyro_x_4_3);

mu_gyro_y_4_3	= mean(gyro_y_4_3);
sig2_gyro_y_4_3 = var(gyro_y_4_3);

mu_gyro_z_4_3	= mean(gyro_z_4_3);
sig2_gyro_z_4_3	= var(gyro_z_4_3);

mu_gyro_4_3     = [mu_gyro_x_4_3; mu_gyro_y_4_3; mu_gyro_z_4_3]
bias_gyro_4_3	= -[mu_gyro_x_4_3; mu_gyro_y_4_3; mu_gyro_z_4_3]				% rad/s
var_gyro_4_3	= diag([sig2_gyro_x_4_3 sig2_gyro_y_4_3 sig2_gyro_z_4_3])


%% Magnetometers

mag_x_4_3 = data_table_mag_4_3{:, 2};
mag_y_4_3 = data_table_mag_4_3{:, 3};
mag_z_4_3 = data_table_mag_4_3{:, 4};

mu_mag_x_4_3	= mean(mag_x_4_3);
sig2_mag_x_4_3	= var(mag_x_4_3);

mu_mag_y_4_3	= mean(mag_y_4_3);
sig2_mag_y_4_3	= var(mag_y_4_3);

mu_mag_z_4_3	= mean(mag_z_4_3);
sig2_mag_z_4_3	= var(mag_z_4_3);


mu_mag_4_3      = [mu_mag_x_4_3;mu_mag_y_4_3;mu_mag_z_4_3]
bias_mag_4_3	= [mu_mag_x_4_3;mu_mag_y_4_3;mu_mag_z_4_3] - [0;19.729;-47.6421]	% muT
var_mag_4_3		= diag([sig2_mag_x_4_3 sig2_mag_y_4_3 sig2_mag_z_4_3])

xlswrite('Data.xls',[mu_acc_4_3 tru_acc_4 bias_acc_4_3 var_acc_4_3],'sheet1','E55');
xlswrite('Data.xls',[mu_gyro_4_3 tru_gyro_4 bias_gyro_4_3 var_gyro_4_3],'sheet2','E55');
xlswrite('Data.xls',[mu_mag_4_3 tru_mag_4 bias_mag_4_3 var_mag_4_3],'sheet3','E55');