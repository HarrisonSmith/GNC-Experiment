clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_4_1   = readtable('Accelerometer_4_1.csv');
data_table_gyro_4_1  = readtable('Gyroscope_4_1.csv');
data_table_mag_4_1   = readtable('Magnetometer_4_1.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_1   = data_table_acc_4_1{:,2};
acc_y_4_1   = data_table_acc_4_1{:,3}; 
acc_z_4_1   = data_table_acc_4_1{:,4};

mu_acc_x_4_1	= mean(acc_x_4_1);
sig2_acc_x_4_1	= var(acc_x_4_1);

mu_acc_y_4_1	=  mean(acc_y_4_1);
sig2_acc_y_4_1	= var(acc_y_4_1);

mu_acc_z_4_1	= mean(acc_z_4_1);
sig2_acc_z_4_1	= var(acc_z_4_1);

mu_acc_4_1      = [mu_acc_x_4_1; mu_acc_y_4_1; mu_acc_z_4_1]
bias_acc_4_1    = [mu_acc_x_4_1; mu_acc_y_4_1; mu_acc_z_4_1] - [0;0;g]		% m/s/s
var_acc_4_1		= diag([sig2_acc_x_4_1 sig2_acc_y_4_1 sig2_acc_z_4_1])

%% Gryroscopes

gyro_x_4_1 = data_table_gyro_4_1{:, 2};
gyro_y_4_1 = data_table_gyro_4_1{:, 3};
gyro_z_4_1 = data_table_gyro_4_1{:, 4};


mu_gyro_x_4_1	= mean(gyro_x_4_1);
sig2_gyro_x_4_1	= var(gyro_x_4_1);

mu_gyro_y_4_1	= mean(gyro_y_4_1);
sig2_gyro_y_4_1 = var(gyro_y_4_1);

mu_gyro_z_4_1	= mean(gyro_z_4_1);
sig2_gyro_z_4_1	= var(gyro_z_4_1);

mu_gyro_4_1     = [mu_gyro_x_4_1; mu_gyro_y_4_1; mu_gyro_z_4_1]
bias_gyro_4_1	= -[mu_gyro_x_4_1; mu_gyro_y_4_1; mu_gyro_z_4_1]				% rad/s
var_gyro_4_1	= diag([sig2_gyro_x_4_1 sig2_gyro_y_4_1 sig2_gyro_z_4_1])


%% Magnetometers

mag_x_4_1 = data_table_mag_4_1{:, 2};
mag_y_4_1 = data_table_mag_4_1{:, 3};
mag_z_4_1 = data_table_mag_4_1{:, 4};

mu_mag_x_4_1	= mean(mag_x_4_1);
sig2_mag_x_4_1	= var(mag_x_4_1);

mu_mag_y_4_1	= mean(mag_y_4_1);
sig2_mag_y_4_1	= var(mag_y_4_1);

mu_mag_z_4_1	= mean(mag_z_4_1);
sig2_mag_z_4_1	= var(mag_z_4_1);


mu_mag_4_1      = [mu_mag_x_4_1;mu_mag_y_4_1;mu_mag_z_4_1]
bias_mag_4_1	= [mu_mag_x_4_1;mu_mag_y_4_1;mu_mag_z_4_1] - [0;19.729;-47.6421]	% muT
var_mag_4_1		= diag([sig2_mag_x_4_1 sig2_mag_y_4_1 sig2_mag_z_4_1])

xlswrite('Data.xls',[mu_acc_4_1 tru_acc_4 bias_acc_4_1 var_acc_4_1],'sheet1','E49');
xlswrite('Data.xls',[mu_gyro_4_1 tru_gyro_4 bias_gyro_4_1 var_gyro_4_1],'sheet2','E49');
xlswrite('Data.xls',[mu_mag_4_1 tru_mag_4 bias_mag_4_1 var_mag_4_1],'sheet3','E49');