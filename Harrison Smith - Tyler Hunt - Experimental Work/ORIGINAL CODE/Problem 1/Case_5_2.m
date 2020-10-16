clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_5_2   = readtable('Accelerometer_5_2.csv');
data_table_gyro_5_2  = readtable('Gyroscope_5_2.csv');
data_table_mag_5_2   = readtable('Magnetometer_5_2.csv');


g = 9.80328;
tru_acc_5  = [0;0;g];
tru_gyro_5 = [0;0;0];
tru_mag_5  = [0;19.729;-47.6421];
%% Accelerometers

acc_x_5_2   = data_table_acc_5_2{:,2};
acc_y_5_2   = data_table_acc_5_2{:,3}; 
acc_z_5_2   = data_table_acc_5_2{:,4};

mu_acc_x_5_2	= mean(acc_x_5_2);
sig2_acc_x_5_2	= var(acc_x_5_2);

mu_acc_y_5_2	=  mean(acc_y_5_2);
sig2_acc_y_5_2	= var(acc_y_5_2);

mu_acc_z_5_2	= mean(acc_z_5_2);
sig2_acc_z_5_2	= var(acc_z_5_2);

mu_acc_5_2      = [mu_acc_x_5_2; mu_acc_y_5_2; mu_acc_z_5_2]
bias_acc_5_2    = [mu_acc_x_5_2; mu_acc_y_5_2; mu_acc_z_5_2] - [0;0;g]		% m/s/s
var_acc_5_2		= diag([sig2_acc_x_5_2 sig2_acc_y_5_2 sig2_acc_z_5_2])

%% Gryroscopes

gyro_x_5_2 = data_table_gyro_5_2{:, 2};
gyro_y_5_2 = data_table_gyro_5_2{:, 3};
gyro_z_5_2 = data_table_gyro_5_2{:, 4};


mu_gyro_x_5_2	= mean(gyro_x_5_2);
sig2_gyro_x_5_2	= var(gyro_x_5_2);

mu_gyro_y_5_2	= mean(gyro_y_5_2);
sig2_gyro_y_5_2 = var(gyro_y_5_2);

mu_gyro_z_5_2	= mean(gyro_z_5_2);
sig2_gyro_z_5_2	= var(gyro_z_5_2);

mu_gyro_5_2     = [mu_gyro_x_5_2; mu_gyro_y_5_2; mu_gyro_z_5_2]
bias_gyro_5_2	= -[mu_gyro_x_5_2; mu_gyro_y_5_2; mu_gyro_z_5_2]				% rad/s
var_gyro_5_2	= diag([sig2_gyro_x_5_2 sig2_gyro_y_5_2 sig2_gyro_z_5_2])


%% Magnetometers

mag_x_5_2 = data_table_mag_5_2{:, 2};
mag_y_5_2 = data_table_mag_5_2{:, 3};
mag_z_5_2 = data_table_mag_5_2{:, 4};

mu_mag_x_5_2	= mean(mag_x_5_2);
sig2_mag_x_5_2	= var(mag_x_5_2);

mu_mag_y_5_2	= mean(mag_y_5_2);
sig2_mag_y_5_2	= var(mag_y_5_2);

mu_mag_z_5_2	= mean(mag_z_5_2);
sig2_mag_z_5_2	= var(mag_z_5_2);


mu_mag_5_2      = [mu_mag_x_5_2;mu_mag_y_5_2;mu_mag_z_5_2]
bias_mag_5_2	= [mu_mag_x_5_2;mu_mag_y_5_2;mu_mag_z_5_2] - [0;19.729;-47.6421]	% muT
var_mag_5_2		= diag([sig2_mag_x_5_2 sig2_mag_y_5_2 sig2_mag_z_5_2])

xlswrite('Data.xls',[mu_acc_5_2 tru_acc_5 bias_acc_5_2 var_acc_5_2],'sheet1','E67');
xlswrite('Data.xls',[mu_gyro_5_2 tru_gyro_5 bias_gyro_5_2 var_gyro_5_2],'sheet2','E67');
xlswrite('Data.xls',[mu_mag_5_2 tru_mag_5 bias_mag_5_2 var_mag_5_2],'sheet3','E67');