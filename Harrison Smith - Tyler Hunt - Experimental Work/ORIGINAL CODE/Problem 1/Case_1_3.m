clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_1_3   = readtable('Accelerometer_1_3.csv');
data_table_gyro_1_3  = readtable('Gyroscope_1_3.csv');
data_table_mag_1_3   = readtable('Magnetometer_1_3.csv');


g = 9.80328;
tru_acc_1  = [0;0;g];
tru_gyro_1 = [0;0;0];
tru_mag_1  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_1_3   = data_table_acc_1_3{:,2};
acc_y_1_3   = data_table_acc_1_3{:,3}; 
acc_z_1_3   = data_table_acc_1_3{:,4};

mu_acc_x_1_3	= mean(acc_x_1_3);
sig2_acc_x_1_3	= var(acc_x_1_3);

mu_acc_y_1_3	=  mean(acc_y_1_3);
sig2_acc_y_1_3	= var(acc_y_1_3);

mu_acc_z_1_3	= mean(acc_z_1_3);
sig2_acc_z_1_3	= var(acc_z_1_3);

mu_acc_1_3      = [mu_acc_x_1_3; mu_acc_y_1_3; mu_acc_z_1_3]
bias_acc_1_3    = [mu_acc_x_1_3; mu_acc_y_1_3; mu_acc_z_1_3] - [0;0;g]		% m/s/s
var_acc_1_3		= diag([sig2_acc_x_1_3 sig2_acc_y_1_3 sig2_acc_z_1_3])

%% Gryroscopes

gyro_x_1_3 = data_table_gyro_1_3{:, 2};
gyro_y_1_3 = data_table_gyro_1_3{:, 3};
gyro_z_1_3 = data_table_gyro_1_3{:, 4};


mu_gyro_x_1_3	= mean(gyro_x_1_3);
sig2_gyro_x_1_3	= var(gyro_x_1_3);

mu_gyro_y_1_3	= mean(gyro_y_1_3);
sig2_gyro_y_1_3 = var(gyro_y_1_3);

mu_gyro_z_1_3	= mean(gyro_z_1_3);
sig2_gyro_z_1_3	= var(gyro_z_1_3);

mu_gyro_1_3     = [mu_gyro_x_1_3; mu_gyro_y_1_3; mu_gyro_z_1_3]
bias_gyro_1_3	= -[mu_gyro_x_1_3; mu_gyro_y_1_3; mu_gyro_z_1_3]				% rad/s
var_gyro_1_3	= diag([sig2_gyro_x_1_3 sig2_gyro_y_1_3 sig2_gyro_z_1_3])


%% Magnetometers

mag_x_1_3 = data_table_mag_1_3{:, 2};
mag_y_1_3 = data_table_mag_1_3{:, 3};
mag_z_1_3 = data_table_mag_1_3{:, 4};

mu_mag_x_1_3	= mean(mag_x_1_3);
sig2_mag_x_1_3	= var(mag_x_1_3);

mu_mag_y_1_3	= mean(mag_y_1_3);
sig2_mag_y_1_3	= var(mag_y_1_3);

mu_mag_z_1_3	= mean(mag_z_1_3);
sig2_mag_z_1_3	= var(mag_z_1_3);


mu_mag_1_3      = [mu_mag_x_1_3;mu_mag_y_1_3;mu_mag_z_1_3]
bias_mag_1_3	= [mu_mag_x_1_3;mu_mag_y_1_3;mu_mag_z_1_3] - [0;19.729;-47.6421]	% muT
var_mag_1_3		= diag([sig2_mag_x_1_3 sig2_mag_y_1_3 sig2_mag_z_1_3])

xlswrite('Data.xls',[mu_acc_1_3 tru_acc_1 bias_acc_1_3 var_acc_1_3],'sheet1','E10');
xlswrite('Data.xls',[mu_gyro_1_3 tru_gyro_1 bias_gyro_1_3 var_gyro_1_3],'sheet2','E10');
xlswrite('Data.xls',[mu_mag_1_3 tru_mag_1 bias_mag_1_3 var_mag_1_3],'sheet3','E10');