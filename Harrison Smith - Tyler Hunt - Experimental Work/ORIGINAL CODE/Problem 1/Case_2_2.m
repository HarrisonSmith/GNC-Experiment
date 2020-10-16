clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_2_2   = readtable('Accelerometer_2_2.csv');
data_table_gyro_2_2  = readtable('Gyroscope_2_2.csv');
data_table_mag_2_2   = readtable('Magnetometer_2_2.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_2   = data_table_acc_2_2{:,2};
acc_y_2_2   = data_table_acc_2_2{:,3}; 
acc_z_2_2   = data_table_acc_2_2{:,4};

mu_acc_x_2_2	= mean(acc_x_2_2);
sig2_acc_x_2_2	= var(acc_x_2_2);

mu_acc_y_2_2	=  mean(acc_y_2_2);
sig2_acc_y_2_2	= var(acc_y_2_2);

mu_acc_z_2_2	= mean(acc_z_2_2);
sig2_acc_z_2_2	= var(acc_z_2_2);

mu_acc_2_2      = [mu_acc_x_2_2; mu_acc_y_2_2; mu_acc_z_2_2]
bias_acc_2_2    = [mu_acc_x_2_2; mu_acc_y_2_2; mu_acc_z_2_2] - [0;0;g]		% m/s/s
var_acc_2_2		= diag([sig2_acc_x_2_2 sig2_acc_y_2_2 sig2_acc_z_2_2])

%% Gryroscopes

gyro_x_2_2 = data_table_gyro_2_2{:, 2};
gyro_y_2_2 = data_table_gyro_2_2{:, 3};
gyro_z_2_2 = data_table_gyro_2_2{:, 4};


mu_gyro_x_2_2	= mean(gyro_x_2_2);
sig2_gyro_x_2_2	= var(gyro_x_2_2);

mu_gyro_y_2_2	= mean(gyro_y_2_2);
sig2_gyro_y_2_2 = var(gyro_y_2_2);

mu_gyro_z_2_2	= mean(gyro_z_2_2);
sig2_gyro_z_2_2	= var(gyro_z_2_2);

mu_gyro_2_2     = [mu_gyro_x_2_2; mu_gyro_y_2_2; mu_gyro_z_2_2]
bias_gyro_2_2	= -[mu_gyro_x_2_2; mu_gyro_y_2_2; mu_gyro_z_2_2]				% rad/s
var_gyro_2_2	= diag([sig2_gyro_x_2_2 sig2_gyro_y_2_2 sig2_gyro_z_2_2])


%% Magnetometers

mag_x_2_2 = data_table_mag_2_2{:, 2};
mag_y_2_2 = data_table_mag_2_2{:, 3};
mag_z_2_2 = data_table_mag_2_2{:, 4};

mu_mag_x_2_2	= mean(mag_x_2_2);
sig2_mag_x_2_2	= var(mag_x_2_2);

mu_mag_y_2_2	= mean(mag_y_2_2);
sig2_mag_y_2_2	= var(mag_y_2_2);

mu_mag_z_2_2	= mean(mag_z_2_2);
sig2_mag_z_2_2	= var(mag_z_2_2);


mu_mag_2_2      = [mu_mag_x_2_2;mu_mag_y_2_2;mu_mag_z_2_2]
bias_mag_2_2	= [mu_mag_x_2_2;mu_mag_y_2_2;mu_mag_z_2_2] - [0;19.729;-47.6421]	% muT
var_mag_2_2		= diag([sig2_mag_x_2_2 sig2_mag_y_2_2 sig2_mag_z_2_2])

xlswrite('Data.xls',[mu_acc_2_2 tru_acc_2 bias_acc_2_2 var_acc_2_2],'sheet1','E22');
xlswrite('Data.xls',[mu_gyro_2_2 tru_gyro_2 bias_gyro_2_2 var_gyro_2_2],'sheet2','E22');
xlswrite('Data.xls',[mu_mag_2_2 tru_mag_2 bias_mag_2_2 var_mag_2_2],'sheet3','E22');