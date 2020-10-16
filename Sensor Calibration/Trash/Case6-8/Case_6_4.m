clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_6_4   = readtable('Accelerometer_6_4.csv');
data_table_gyro_6_4  = readtable('Gyroscope_6_4.csv');
data_table_mag_6_4   = readtable('Magnetometer_6_4.csv');


g = 9.80328;
tru_acc_6  = [0;0;g];
tru_gyro_6 = [0;0;0];
tru_mag_6  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_6_4   = data_table_acc_6_4{:,2};
acc_y_6_4   = data_table_acc_6_4{:,3}; 
acc_z_6_4   = data_table_acc_6_4{:,4};

mu_acc_x_6_4	= mean(acc_x_6_4);
sig2_acc_x_6_4	= var(acc_x_6_4);

mu_acc_y_6_4	=  mean(acc_y_6_4);
sig2_acc_y_6_4	= var(acc_y_6_4);

mu_acc_z_6_4	= mean(acc_z_6_4);
sig2_acc_z_6_4	= var(acc_z_6_4);

mu_acc_6_4      = [mu_acc_x_6_4; mu_acc_y_6_4; mu_acc_z_6_4]
bias_acc_6_4    = [mu_acc_x_6_4; mu_acc_y_6_4; mu_acc_z_6_4] - [0;0;g]		% m/s/s
var_acc_6_4		= diag([sig2_acc_x_6_4 sig2_acc_y_6_4 sig2_acc_z_6_4])

%% Gryroscopes

gyro_x_6_4 = data_table_gyro_6_4{:, 2};
gyro_y_6_4 = data_table_gyro_6_4{:, 3};
gyro_z_6_4 = data_table_gyro_6_4{:, 4};


mu_gyro_x_6_4	= mean(gyro_x_6_4);
sig2_gyro_x_6_4	= var(gyro_x_6_4);

mu_gyro_y_6_4	= mean(gyro_y_6_4);
sig2_gyro_y_6_4 = var(gyro_y_6_4);

mu_gyro_z_6_4	= mean(gyro_z_6_4);
sig2_gyro_z_6_4	= var(gyro_z_6_4);

mu_gyro_6_4     = [mu_gyro_x_6_4; mu_gyro_y_6_4; mu_gyro_z_6_4]
bias_gyro_6_4	= -[mu_gyro_x_6_4; mu_gyro_y_6_4; mu_gyro_z_6_4]				% rad/s
var_gyro_6_4	= diag([sig2_gyro_x_6_4 sig2_gyro_y_6_4 sig2_gyro_z_6_4])


%% Magnetometers

mag_x_6_4 = data_table_mag_6_4{:, 2};
mag_y_6_4 = data_table_mag_6_4{:, 3};
mag_z_6_4 = data_table_mag_6_4{:, 4};

mu_mag_x_6_4	= mean(mag_x_6_4);
sig2_mag_x_6_4	= var(mag_x_6_4);

mu_mag_y_6_4	= mean(mag_y_6_4);
sig2_mag_y_6_4	= var(mag_y_6_4);

mu_mag_z_6_4	= mean(mag_z_6_4);
sig2_mag_z_6_4	= var(mag_z_6_4);


mu_mag_6_4      = [mu_mag_x_6_4;mu_mag_y_6_4;mu_mag_z_6_4]
bias_mag_6_4	= [mu_mag_x_6_4;mu_mag_y_6_4;mu_mag_z_6_4] - [0;19.729;-47.6421]	% muT
var_mag_6_4		= diag([sig2_mag_x_6_4 sig2_mag_y_6_4 sig2_mag_z_6_4])

xlswrite('Data.xls',[mu_acc_6_4 tru_acc_6 bias_acc_6_4 var_acc_6_4],'sheet1','E88');
xlswrite('Data.xls',[mu_gyro_6_4 tru_gyro_6 bias_gyro_6_4 var_gyro_6_4],'sheet2','E88');
xlswrite('Data.xls',[mu_mag_6_4 tru_mag_6 bias_mag_6_4 var_mag_6_4],'sheet3','E88');