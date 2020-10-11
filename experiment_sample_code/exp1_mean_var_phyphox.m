clear variables; close all; clc

data_table_acc = readtable('data_exp1_202007092008.xls', 'Sheet', 1);
data_table_gyro = readtable('data_exp1_202007092008.xls', 'Sheet', 2);
data_table_mag = readtable('data_exp1_202007092008.xls', 'Sheet', 3);

%% Local gravitational acceleration
g = 9.80333; % m/s/s

%% Accelerometers
acc_x = data_table_acc{:, 2};
acc_y = data_table_acc{:, 3};
acc_z = data_table_acc{:, 4};

mu_acc_x	= mean(acc_x)
sig2_acc_x	= var(acc_x)

mu_acc_y	=  mean(acc_y)
sig2_acc_y	= var(acc_y)

mu_acc_z	= mean(acc_z)
sig2_acc_z	= var(acc_z)

bias_acc	= [0; 0; g] - [mu_acc_x; mu_acc_y; mu_acc_z]		% m/s/s
var_acc		= diag([sig2_acc_x sig2_acc_y sig2_acc_z]);

%% Rate gyros
gyro_x = data_table_gyro{:, 2};
gyro_y = data_table_gyro{:, 3};
gyro_z = data_table_gyro{:, 4};


mu_gyro_x	= mean(gyro_x)
sig2_gyro_x	= var(gyro_x)

mu_gyro_y	= mean(gyro_y)
sig2_gyro_y = var(gyro_y)

mu_gyro_z	= mean(gyro_z)
sig2_gyro_z	= var(gyro_z)

bias_gyro	= -[mu_gyro_x; mu_gyro_y; mu_gyro_z]				% rad/s
var_gyro	= diag([sig2_gyro_x sig2_gyro_y sig2_gyro_z]);

%% Magnetometers
mag_x = data_table_mag{:, 2};
mag_y = data_table_mag{:, 3};
mag_z = data_table_mag{:, 4};

mu_mag_x	= mean(mag_x)
sig2_mag_x	= var(mag_x)

mu_mag_y	= mean(mag_y)
sig2_mag_y	= var(mag_y)

mu_mag_z	= mean(mag_z)
sig2_mag_z	= var(mag_z)

%-- Need to calculate magnetometer biases also
bias_mag	= [0; 0; 0];	% placeholder, muT
var_mag		= diag([sig2_mag_x sig2_mag_y sig2_mag_z]);

save sensor_calibration.mat bias_acc bias_gyro bias_mag var_acc var_gyro var_mag
