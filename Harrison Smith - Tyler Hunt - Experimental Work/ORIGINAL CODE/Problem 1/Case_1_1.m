clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_1_1   = readtable('Accelerometer_1_1.csv');
data_table_gyro_1_1  = readtable('Gyroscope_1_1.csv');
data_table_mag_1_1   = readtable('Magnetometer_1_1.csv');


g = 9.80328;
tru_acc_1  = [0;0;g];
tru_gyro_1 = [0;0;0];
tru_mag_1  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_1_1   = data_table_acc_1_1{:,2};
acc_y_1_1   = data_table_acc_1_1{:,3}; 
acc_z_1_1   = data_table_acc_1_1{:,4};

mu_acc_x_1_1	= mean(acc_x_1_1);
sig2_acc_x_1_1	= var(acc_x_1_1);

mu_acc_y_1_1	=  mean(acc_y_1_1);
sig2_acc_y_1_1	= var(acc_y_1_1);

mu_acc_z_1_1	= mean(acc_z_1_1);
sig2_acc_z_1_1	= var(acc_z_1_1);

mu_acc_1_1      = [mu_acc_x_1_1; mu_acc_y_1_1; mu_acc_z_1_1]
bias_acc_1_1    = [mu_acc_x_1_1; mu_acc_y_1_1; mu_acc_z_1_1] - [0;0;g]		% m/s/s
var_acc_1_1		= diag([sig2_acc_x_1_1 sig2_acc_y_1_1 sig2_acc_z_1_1])

%% Gryroscopes

gyro_x_1_1 = data_table_gyro_1_1{:, 2};
gyro_y_1_1 = data_table_gyro_1_1{:, 3};
gyro_z_1_1 = data_table_gyro_1_1{:, 4};


mu_gyro_x_1_1	= mean(gyro_x_1_1);
sig2_gyro_x_1_1	= var(gyro_x_1_1);

mu_gyro_y_1_1	= mean(gyro_y_1_1);
sig2_gyro_y_1_1 = var(gyro_y_1_1);

mu_gyro_z_1_1	= mean(gyro_z_1_1);
sig2_gyro_z_1_1	= var(gyro_z_1_1);

mu_gyro_1_1     = [mu_gyro_x_1_1; mu_gyro_y_1_1; mu_gyro_z_1_1]
bias_gyro_1_1	= -[mu_gyro_x_1_1; mu_gyro_y_1_1; mu_gyro_z_1_1]				% rad/s
var_gyro_1_1	= diag([sig2_gyro_x_1_1 sig2_gyro_y_1_1 sig2_gyro_z_1_1])


%% Magnetometers

mag_x_1_1 = data_table_mag_1_1{:, 2};
mag_y_1_1 = data_table_mag_1_1{:, 3};
mag_z_1_1 = data_table_mag_1_1{:, 4};

mu_mag_x_1_1	= mean(mag_x_1_1);
sig2_mag_x_1_1	= var(mag_x_1_1);

mu_mag_y_1_1	= mean(mag_y_1_1);
sig2_mag_y_1_1	= var(mag_y_1_1);

mu_mag_z_1_1	= mean(mag_z_1_1);
sig2_mag_z_1_1	= var(mag_z_1_1);


mu_mag_1_1      = [mu_mag_x_1_1;mu_mag_y_1_1;mu_mag_z_1_1]
bias_mag_1_1	= [mu_mag_x_1_1;mu_mag_y_1_1;mu_mag_z_1_1] - [0;19.729;-47.6421]	% muT
var_mag_1_1		= diag([sig2_mag_x_1_1 sig2_mag_y_1_1 sig2_mag_z_1_1])

xlswrite('Data.xls',[mu_acc_1_1 tru_acc_1 bias_acc_1_1 var_acc_1_1],'sheet1','E4');
xlswrite('Data.xls',[mu_gyro_1_1 tru_gyro_1 bias_gyro_1_1 var_gyro_1_1],'sheet2','E4');
xlswrite('Data.xls',[mu_mag_1_1 tru_mag_1 bias_mag_1_1 var_mag_1_1],'sheet3','E4');