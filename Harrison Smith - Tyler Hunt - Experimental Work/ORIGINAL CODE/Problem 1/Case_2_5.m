clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_2_5   = readtable('Accelerometer_2_5.csv');
data_table_gyro_2_5  = readtable('Gyroscope_2_5.csv');
data_table_mag_2_5   = readtable('Magnetometer_2_5.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_5   = data_table_acc_2_5{:,2};
acc_y_2_5   = data_table_acc_2_5{:,3}; 
acc_z_2_5   = data_table_acc_2_5{:,4};

mu_acc_x_2_5	= mean(acc_x_2_5);
sig2_acc_x_2_5	= var(acc_x_2_5);

mu_acc_y_2_5	=  mean(acc_y_2_5);
sig2_acc_y_2_5	= var(acc_y_2_5);

mu_acc_z_2_5	= mean(acc_z_2_5);
sig2_acc_z_2_5	= var(acc_z_2_5);

mu_acc_2_5      = [mu_acc_x_2_5; mu_acc_y_2_5; mu_acc_z_2_5]
bias_acc_2_5    = [mu_acc_x_2_5; mu_acc_y_2_5; mu_acc_z_2_5] - [0;0;g]		% m/s/s
var_acc_2_5		= diag([sig2_acc_x_2_5 sig2_acc_y_2_5 sig2_acc_z_2_5])

%% Gryroscopes

gyro_x_2_5 = data_table_gyro_2_5{:, 2};
gyro_y_2_5 = data_table_gyro_2_5{:, 3};
gyro_z_2_5 = data_table_gyro_2_5{:, 4};


mu_gyro_x_2_5	= mean(gyro_x_2_5);
sig2_gyro_x_2_5	= var(gyro_x_2_5);

mu_gyro_y_2_5	= mean(gyro_y_2_5);
sig2_gyro_y_2_5 = var(gyro_y_2_5);

mu_gyro_z_2_5	= mean(gyro_z_2_5);
sig2_gyro_z_2_5	= var(gyro_z_2_5);

mu_gyro_2_5     = [mu_gyro_x_2_5; mu_gyro_y_2_5; mu_gyro_z_2_5]
bias_gyro_2_5	= -[mu_gyro_x_2_5; mu_gyro_y_2_5; mu_gyro_z_2_5]				% rad/s
var_gyro_2_5	= diag([sig2_gyro_x_2_5 sig2_gyro_y_2_5 sig2_gyro_z_2_5])


%% Magnetometers

mag_x_2_5 = data_table_mag_2_5{:, 2};
mag_y_2_5 = data_table_mag_2_5{:, 3};
mag_z_2_5 = data_table_mag_2_5{:, 4};

mu_mag_x_2_5	= mean(mag_x_2_5);
sig2_mag_x_2_5	= var(mag_x_2_5);

mu_mag_y_2_5	= mean(mag_y_2_5);
sig2_mag_y_2_5	= var(mag_y_2_5);

mu_mag_z_2_5	= mean(mag_z_2_5);
sig2_mag_z_2_5	= var(mag_z_2_5);


mu_mag_2_5      = [mu_mag_x_2_5;mu_mag_y_2_5;mu_mag_z_2_5]
bias_mag_2_5	= [mu_mag_x_2_5;mu_mag_y_2_5;mu_mag_z_2_5] - [0;19.729;-47.6421]	% muT
var_mag_2_5		= diag([sig2_mag_x_2_5 sig2_mag_y_2_5 sig2_mag_z_2_5])

xlswrite('Data.xls',[mu_acc_2_5 tru_acc_2 bias_acc_2_5 var_acc_2_5],'sheet1','E31');
xlswrite('Data.xls',[mu_gyro_2_5 tru_gyro_2 bias_gyro_2_5 var_gyro_2_5],'sheet2','E31');
xlswrite('Data.xls',[mu_mag_2_5 tru_mag_2 bias_mag_2_5 var_mag_2_5],'sheet3','E31');