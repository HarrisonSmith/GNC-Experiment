clear variables; close all; clc

% IN YOUR REPORT, INCLUDE A SCREENSHOT OF THIS SECTION OF THE CODE,
% SCREENSHOT STARTS HERE...


%==========================================================================
% ENTER THE NAME OF YOUR DATA FILE HERE
%data_filename = 'data_exp3_202007100900.xls';
%==========================================================================

%{
When Phyphox exports data to Excel, it saves data from different sensors in
different sheets in the same Excel file. Open the Excel file to ensure that
the sheet numbers match the data types. E.g., in the .xls file referenced
here, sheet 1 is accelerometer, sheet 2 is Gyroscope, and sheet 3 is
magnetometer data.
%}
%==========================================================================
% Make sure sheet 1 is the accelerometer sheet in your .xls file.
% Else change the number in the next line accordingly.
data_table_acc = readtable('Accelerometer_Att_est.csv');		

% Make sure sheet 2 is the gyroscope sheet in your .xls file.
% Else change the number in the next line accordingly.
data_table_gyro = readtable('Gyroscope_Att_est.csv');

% Make sure sheet 3 is the magnetometer sheet in your .xls file.
% Else change the number in the next line accordingly.
data_table_mag = readtable('Magnetometer_Att_est.csv');
%==========================================================================


%==========================================================================
% THE BIAS AND VARIANCE VALUES BELOW ARE PLACEHOLDERS. YOU MUST ENTER THE
% CORRECT VALUES FOR THESE BIASES AND VARIANCES AS COMPUTED IN EXPERIMENT 1
bias_acc	= [0; 0; 0];	% biases in accelerometer x,y,z

% IF YOU WERE UNABLE TO CALCULATE MAGNETOMETER BIASES IN EXPERIMENT 1,
% LEAVE THEM AS ZEROS HERE
bias_mag	= [0; 0; 0];	% biases in magnetometer x,y,z

bias_gyro	= [0; 0; 0];	% biases in gyro x,y,z
var_acc		= [0.1; 0.1; 0.1];
var_gyro	= [0.1; 0.1; 0.1];
%==========================================================================

% ... SCREENSHOT ENDS HERE



%% Local gravitational acceleration
g = 9.80333; % m/s/s

%% Accelerometers
time_stamps_acc = data_table_acc{:, 1};
acc_x = data_table_acc{:, 2};
acc_y = data_table_acc{:, 3};
acc_z = data_table_acc{:, 4};

%% Rate gyros
time_stamps_gyro = data_table_gyro{:, 1};
gyro_x = data_table_gyro{:, 2};
gyro_y = data_table_gyro{:, 3};
gyro_z = data_table_gyro{:, 4};

%% Magnetometers
time_stamps_mag	 = data_table_mag{:, 1};
mag_xb = data_table_mag{:, 2};
mag_yb = data_table_mag{:, 3};
mag_zb = data_table_mag{:, 4};


%% Remove bias

acc_x_wo_bias = acc_x - bias_acc(1);
acc_y_wo_bias = acc_y - bias_acc(2);
acc_z_wo_bias = acc_z - bias_acc(3);

gyro_x_wo_bias= gyro_x - bias_gyro(1);
gyro_y_wo_bias= gyro_y - bias_gyro(2);
gyro_z_wo_bias= gyro_z - bias_gyro(3);

mag_xb_wo_bias = mag_xb - bias_mag(1);
mag_yb_wo_bias = mag_yb - bias_mag(2);
mag_zb_wo_bias = mag_zb - bias_mag(3);

%% Initial Pitch, Roll, and Yaw

initial_few_pts = 5;
roll_data	= atan( acc_y_wo_bias(1:initial_few_pts) ./ acc_z_wo_bias(1:initial_few_pts) );
pitch_data	= asin( acc_x_wo_bias(1:initial_few_pts) / g );

initial_roll	= mean( roll_data );
initial_pitch	= mean( pitch_data );

tmp1	= [...
	cos(initial_pitch) sin(initial_pitch)*sin(initial_roll) sin(initial_pitch)*cos(initial_roll); ...
	0 cos(initial_roll) -sin(initial_roll); ...
	-sin(initial_pitch) cos(initial_pitch)*sin(initial_roll) cos(initial_pitch)*cos(initial_roll)] * ...
	[mag_xb_wo_bias(1:initial_few_pts)'; ...
	mag_yb_wo_bias(1:initial_few_pts)'; mag_zb_wo_bias(1:initial_few_pts)'];

mag_x_wo_bias	= tmp1(1,:)';
mag_y_wo_bias	= tmp1(2,:)';

magnetic_heading_data	= -atan2( mag_y_wo_bias, mag_x_wo_bias );
declination				= -14.07*pi/180;
% Declination  for Worcester, MA found using World Magnetic Model
% https://www.ngdc.noaa.gov/geomag/calculators/magcalc.shtml#declination

true_heading_data	= declination + magnetic_heading_data;
initial_yaw		= mean(true_heading_data);



%% RK4 Integration
dt	= 0.001;

t	= max([time_stamps_acc(1), time_stamps_mag(1), time_stamps_gyro(1)]);
x_t = [initial_yaw; initial_pitch; initial_roll];

tfinal = min([time_stamps_acc(end), time_stamps_mag(end), time_stamps_gyro(end)]);

n_time_pts	= round( tfinal /dt );
t_ground_truth_store = zeros(1, n_time_pts);
x_ground_truth_store = zeros(3, n_time_pts);
t_ground_truth_store(1, 1)	= t;
x_ground_truth_store(:, 1)	= x_t;

column_number	= 1;	
while (t < tfinal)
	col_gyro = find(time_stamps_gyro <= t, 1, 'last');
% 	col_acc = find(time_stamp_acc <= t, 1, 'last');
% 	col_mag = find(time_stamp_mag <= t, 1, 'last');
	
	u_t = [gyro_x_wo_bias(col_gyro); gyro_y_wo_bias(col_gyro); gyro_z_wo_bias(col_gyro)];
		
	k1		= dt*attitude_kinematics_asg3(x_t, u_t);
	k2		= dt*attitude_kinematics_asg3((x_t + 0.5*k1),	u_t);
	k3		= dt*attitude_kinematics_asg3((x_t + 0.5*k2),	u_t);
	k4		= dt*attitude_kinematics_asg3((x_t + k3),		u_t);
	x_tplusdt	= x_t + (1/6)*k1 + (1/3)*k2 + (1/3)*k3 + (1/6)*k4;

	column_number	= column_number + 1;
	t	= t + dt;		% New time
	x_t = x_tplusdt;	% x_t is the state at time t
	
	t_ground_truth_store(1, column_number)	= t;
	x_ground_truth_store(:, column_number)	= x_t;
	
end

figure;
subplot(311)
plot(t_ground_truth_store(1, :), x_ground_truth_store(1, :)*180/pi, 'LineWidth', 2);
ylabel('$\psi$ (deg)', 'Interpreter', 'latex', 'FontSize', 14)
xlabel('$t$ (s)', 'Interpreter', 'latex', 'FontSize', 14)
title('Problem 2 Ground Truth Euler Angles', 'Interpreter', 'latex', 'FontSize', 18)

subplot(312)
plot(t_ground_truth_store(1, :), x_ground_truth_store(2, :)*180/pi, 'LineWidth', 2);
ylabel('$\theta$ (deg)', 'Interpreter', 'latex', 'FontSize', 14)
xlabel('$t$ (s)', 'Interpreter', 'latex', 'FontSize', 14)

subplot(313)
plot(t_ground_truth_store(1, :), x_ground_truth_store(3, :)*180/pi, 'LineWidth', 2);
ylabel('$\phi$ (deg)', 'Interpreter', 'latex', 'FontSize', 14)
xlabel('$t$ (s)', 'Interpreter', 'latex', 'FontSize', 14)


function x_dot = attitude_kinematics_asg3(x_, u_)
	theta_	= x_(2);
	phi_	= x_(3);
	
	x_dot	= [-sin(theta_) 0 1; ...
				sin(phi_)*cos(theta_) cos(phi_) 0; ...
				cos(phi_)*cos(theta_) -sin(phi_) 0] \ u_;
end
