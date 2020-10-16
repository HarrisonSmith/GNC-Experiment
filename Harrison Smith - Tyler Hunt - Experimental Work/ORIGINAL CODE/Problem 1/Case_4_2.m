clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_4_2   = readtable('Accelerometer_4_2.csv');
data_table_gyro_4_2  = readtable('Gyroscope_4_2.csv');
data_table_mag_4_2   = readtable('Magnetometer_4_2.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_2   = data_table_acc_4_2{:,2};
acc_y_4_2   = data_table_acc_4_2{:,3}; 
acc_z_4_2   = data_table_acc_4_2{:,4};

mu_acc_x_4_2	= mean(acc_x_4_2);
sig2_acc_x_4_2	= var(acc_x_4_2);

mu_acc_y_4_2	=  mean(acc_y_4_2);
sig2_acc_y_4_2	= var(acc_y_4_2);

mu_acc_z_4_2	= mean(acc_z_4_2);
sig2_acc_z_4_2	= var(acc_z_4_2);

mu_acc_4_2      = [mu_acc_x_4_2; mu_acc_y_4_2; mu_acc_z_4_2]
bias_acc_4_2    = [mu_acc_x_4_2; mu_acc_y_4_2; mu_acc_z_4_2] - [0;0;g]		% m/s/s
var_acc_4_2		= diag([sig2_acc_x_4_2 sig2_acc_y_4_2 sig2_acc_z_4_2])

%% Gryroscopes

gyro_x_4_2 = data_table_gyro_4_2{:, 2};
gyro_y_4_2 = data_table_gyro_4_2{:, 3};
gyro_z_4_2 = data_table_gyro_4_2{:, 4};


mu_gyro_x_4_2	= mean(gyro_x_4_2);
sig2_gyro_x_4_2	= var(gyro_x_4_2);

mu_gyro_y_4_2	= mean(gyro_y_4_2);
sig2_gyro_y_4_2 = var(gyro_y_4_2);

mu_gyro_z_4_2	= mean(gyro_z_4_2);
sig2_gyro_z_4_2	= var(gyro_z_4_2);

mu_gyro_4_2     = [mu_gyro_x_4_2; mu_gyro_y_4_2; mu_gyro_z_4_2]
bias_gyro_4_2	= -[mu_gyro_x_4_2; mu_gyro_y_4_2; mu_gyro_z_4_2]				% rad/s
var_gyro_4_2	= diag([sig2_gyro_x_4_2 sig2_gyro_y_4_2 sig2_gyro_z_4_2])


%% Magnetometers

mag_x_4_2 = data_table_mag_4_2{:, 2};
mag_y_4_2 = data_table_mag_4_2{:, 3};
mag_z_4_2 = data_table_mag_4_2{:, 4};

mu_mag_x_4_2	= mean(mag_x_4_2);
sig2_mag_x_4_2	= var(mag_x_4_2);

mu_mag_y_4_2	= mean(mag_y_4_2);
sig2_mag_y_4_2	= var(mag_y_4_2);

mu_mag_z_4_2	= mean(mag_z_4_2);
sig2_mag_z_4_2	= var(mag_z_4_2);


mu_mag_4_2      = [mu_mag_x_4_2;mu_mag_y_4_2;mu_mag_z_4_2]
bias_mag_4_2	= [mu_mag_x_4_2;mu_mag_y_4_2;mu_mag_z_4_2] - [0;19.729;-47.6421]	% muT
var_mag_4_2		= diag([sig2_mag_x_4_2 sig2_mag_y_4_2 sig2_mag_z_4_2])

xlswrite('Data.xls',[mu_acc_4_2 tru_acc_4 bias_acc_4_2 var_acc_4_2],'sheet1','E52');
xlswrite('Data.xls',[mu_gyro_4_2 tru_gyro_4 bias_gyro_4_2 var_gyro_4_2],'sheet2','E52');
xlswrite('Data.xls',[mu_mag_4_2 tru_mag_4 bias_mag_4_2 var_mag_4_2],'sheet3','E52');