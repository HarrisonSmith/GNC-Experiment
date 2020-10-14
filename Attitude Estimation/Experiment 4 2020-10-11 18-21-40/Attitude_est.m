clc; clear all; close all; 
%% Fetch Data

data_table_acc     = readtable('Accelerometer_Att_est.csv');
data_table_gyro    = readtable('Gyroscope_Att_est.csv');
data_table_mag     = readtable('Magnetometer_Att_est.csv');

%% Biases
bias_mag  = [-12.11214937;
             -19.67616054;
             22.73696197];
bias_acc  = [1.948244375;
             1.926002907;
             -3.760826138];
bias_gyro = [0.00001194560806;
             -0.00000912316961;
             -0.00000169621783];
       
g = 9.80333;
%% Read Data

acc_x    = data_table_acc{:,2};
acc_y    = data_table_acc{:,3}; 
acc_z    = data_table_acc{:,4};

gyro_x   = data_table_gyro{:,2};
gyro_y   = data_table_gyro{:,3}; 
gyro_z   = data_table_gyro{:,4};
 
mag_x    = data_table_mag{:,2};
mag_y    = data_table_mag{:,3};
mag_z    = data_table_mag{:,4};

acc_x_i  = acc_x(1:309);
acc_y_i  = acc_y(1:309);
acc_z_i  = acc_z(1:309);

gyro_x_i = gyro_x(1:309);
gyro_y_i = gyro_y(1:309);
gyro_z_i = gyro_z(1:309);

mag_x_i  = mag_x(1:309);
mag_y_i  = mag_y(1:309);
mag_z_i  = mag_z(1:309);

acc_x_f  = acc_x(907:1194);
acc_y_f  = acc_y(907:1194);
acc_z_f  = acc_z(907:1194);

gyro_x_f = gyro_x(907:1194);
gyro_y_f = gyro_y(907:1194);
gyro_z_f = gyro_z(907:1194);

mag_x_f  = mag_x(907:1194);
mag_y_f  = mag_y(907:1194);
mag_z_f  = mag_z(907:1194);

%% Remove bias

acc_x_wo_bias_i  = acc_x_i - bias_acc(1);
acc_y_wo_bias_i  = acc_y_i - bias_acc(2);
acc_z_wo_bias_i  = acc_z_i - bias_acc(3);

mag_xb_wo_bias_i = mag_x_i - bias_mag(1);
mag_yb_wo_bias_i = mag_y_i - bias_mag(2);
mag_zb_wo_bias_i = mag_z_i - bias_mag(3);

acc_x_wo_bias_f  = acc_x_f - bias_acc(1);
acc_y_wo_bias_f  = acc_y_f - bias_acc(2);
acc_z_wo_bias_f  = acc_z_f - bias_acc(3);

mag_xb_wo_bias_f = mag_x_f - bias_mag(1);
mag_yb_wo_bias_f = mag_y_f - bias_mag(2);
mag_zb_wo_bias_f = mag_z_f - bias_mag(3);

%% Yaw Pitch Heading - Initial 

roll_data_i	    = atan( acc_y_wo_bias_i ./ acc_z_wo_bias_i );
pitch_data_i	= asin( acc_x_wo_bias_i / g );

roll_mu_i		= mean( roll_data_i );
pitch_mu_i   	= mean( pitch_data_i );

roll_var_i	    = var(roll_data_i);
pitch_var_i	    = var(pitch_data_i);

tmp1_i	= [...
	cos(pitch_mu_i) sin(pitch_mu_i)*sin(roll_mu_i) sin(pitch_mu_i)*cos(roll_mu_i); ...
	0 cos(roll_mu_i) -sin(roll_mu_i); ...
	-sin(pitch_mu_i) cos(pitch_mu_i)*sin(roll_mu_i) cos(pitch_mu_i)*cos(roll_mu_i)] * ...
	[mag_xb_wo_bias_i'; mag_yb_wo_bias_i'; mag_zb_wo_bias_i'];

mag_x_wo_bias_i	= tmp1_i(1,:)';
mag_y_wo_bias_i	= tmp1_i(2,:)';

magnetic_heading_data_i	= -atan2( mag_y_wo_bias_i, mag_x_wo_bias_i );
declination				= -14.07*pi/180;

true_heading_data_i	= declination + magnetic_heading_data_i;
true_heading_mu_i		= mean(true_heading_data_i);
true_heading_var_i	= var(true_heading_data_i);


fprintf('The roll angle inital is %f deg +/- %f deg\n', ...
	roll_mu_i*180/pi, 3*sqrt(roll_var_i)*180/pi);

fprintf('The pitch angle initial is %f deg +/- %f deg\n', ...
	pitch_mu_i*180/pi, 3*sqrt(pitch_var_i)*180/pi);

fprintf('The heading inital is %f deg +/- %f deg\n', ...
	true_heading_mu_i*180/pi, 3*sqrt(true_heading_var_i)*180/pi);

%% Yaw Pitch Heading - Final

roll_data_f	    = atan( acc_y_wo_bias_f ./ acc_z_wo_bias_f );
pitch_data_f	= asin( acc_x_wo_bias_f / g );

roll_mu_f		= mean( roll_data_f );
pitch_mu_f	    = mean( pitch_data_f );

roll_var_f	    = var(roll_data_f);
pitch_var_f	    = var(pitch_data_f);

tmp1_f	= [...
	cos(pitch_mu_f) sin(pitch_mu_f)*sin(roll_mu_f) sin(pitch_mu_f)*cos(roll_mu_f); ...
	0 cos(roll_mu_f) -sin(roll_mu_f); ...
	-sin(pitch_mu_f) cos(pitch_mu_f)*sin(roll_mu_f) cos(pitch_mu_f)*cos(roll_mu_f)] * ...
	[mag_xb_wo_bias_f'; mag_yb_wo_bias_f'; mag_zb_wo_bias_f'];

mag_x_wo_bias_f	= tmp1_f(1,:)';
mag_y_wo_bias_f	= tmp1_f(2,:)';

magnetic_heading_data_f	= -atan2( mag_y_wo_bias_f, mag_x_wo_bias_f );
declination				= -14.07*pi/180;


true_heading_data_f  	= declination + magnetic_heading_data_f;
true_heading_mu_f		= mean(true_heading_data_f);
true_heading_var_f	    = var(true_heading_data_f);


fprintf('The roll angle final is %f deg +/- %f deg\n', ...
	roll_mu_f*180/pi, 3*sqrt(roll_var_f)*180/pi);

fprintf('The pitch angle final is %f deg +/- %f deg\n', ...
	pitch_mu_f*180/pi, 3*sqrt(pitch_var_f)*180/pi);

fprintf('The heading final is %f deg +/- %f deg\n', ...
	true_heading_mu_f*180/pi, 3*sqrt(true_heading_var_f)*180/pi);
%% Rate Gyro

Gyro_x = gyro_x(310:906);
Gyro_y = gyro_y(310:906);
Gyro_z = gyro_z(310:906);

tf = [1:596];


gyro_x_wo_bias = Gyro_x - bias_gyro(1);
gyro_y_wo_bias = Gyro_y - bias_gyro(2);
gyro_z_wo_bias = Gyro_z - bias_gyro(3);

Omega_x = movmean(gyro_x_wo_bias,)
Omega_y = movmean(gyro_y_wo_bias,596);
Omega_z = movmean(gyro_z_wo_bias,596);
