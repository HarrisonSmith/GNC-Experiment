clear variables; close all; clc

% IN YOUR REPORT, INCLUDE A SCREENSHOT OF THIS SECTION OF THE CODE,
% SCREENSHOT STARTS HERE...


%==========================================================================
% ENTER THE NAME OF YOUR DATA FILE HERE
data_filename = 'data_exp3_202007100900.xls';
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
data_table_acc = readtable(data_filename, 'Sheet', 1);		

% Make sure sheet 2 is the gyroscope sheet in your .xls file.
% Else change the number in the next line accordingly.
data_table_gyro = readtable(data_filename, 'Sheet', 2);

% Make sure sheet 3 is the magnetometer sheet in your .xls file.
% Else change the number in the next line accordingly.
data_table_mag = readtable(data_filename, 'Sheet', 3);
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

% THIS VALUE IS THE VARIANCE IN THE MAGNETIC HEADING CALCULATION. IT MAY BE
% FOUND BY POINTING THE DEVICE TO THE LOCAL TRUE NORTH, ESTIMATING HEADING
% AS IN EXPERIMENT 2 IN MULTIPLE TRIALS, AND THEN CALCULATING THE VARIANCE
% OF THE READING. THE EXPECTED HEADING IS ZERO WHEN POINTED TO TRUE NORTH.
var_mag_heading = (5*pi/180)^2;
% IF YOU ARE UNABLE TO COMPUTE THIS VALUE, LEAVE AS IS.
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

%% EKF
Q	= diag(var_gyro);
R	= diag([var_acc; var_mag_heading]);

dt	= 0.01;
m1	= 1;
t	= max([time_stamps_acc(1), time_stamps_mag(1), time_stamps_gyro(1)]);
tfinal		= min([time_stamps_acc(end), time_stamps_mag(end), time_stamps_gyro(end)]);
n_time_pts	= round( tfinal /dt );

V	= 0;

xhat	= [initial_yaw; initial_pitch; initial_roll];
P		= diag([var_mag_heading var_acc(1) var_acc(2)]);

time_stamps_store	= zeros(1, n_time_pts);
xhat_store			= zeros(3, n_time_pts);
P_store				= zeros(9, n_time_pts);
P_trace_store		= zeros(1, n_time_pts);

xhat_store(:, 1)	= xhat;
P_trace_store(:, 1)	= trace(P);
P_store(:, 1)		= reshape(P, 9, 1); 


while (t < tfinal)
	
	col_gyro = find(time_stamps_gyro <= t, 1, 'last');
	col_acc = find(time_stamps_acc <= t, 1, 'last');
	col_mag = find(time_stamps_mag <= t, 1, 'last');
	t	= t + dt;
	 
	u	= [gyro_x_wo_bias(col_gyro); gyro_y_wo_bias(col_gyro); gyro_z_wo_bias(col_gyro)];
	
	psi_hat		= xhat(1);
	theta_hat	= xhat(2);
	phi_hat		= xhat(3);
	A	= [[0;0;0] ...
		[	0		sin(phi_hat)*tan(theta_hat)*sec(theta_hat)		sin(phi_hat)*tan(theta_hat)*sec(theta_hat); ...
			0		0												0;...
			0		sin(phi_hat)*sec(theta_hat)^2					cos(phi_hat)*sec(theta_hat)^2 ]*u ...
		[	0	cos(phi_hat)*sec(theta_hat)		-sin(phi_hat)*sec(theta_hat); ...
			0	-sin(phi_hat)					-cos(phi_hat); ...
			0	cos(phi_hat)*tan(theta_hat)		sin(phi_hat)*tan(theta_hat)]*u];
	B2	= [...
		0	sin(phi_hat)*sec(theta_hat)		cos(phi_hat)*sec(theta_hat); ...
		0	cos(phi_hat)					-sin(phi_hat); ...
		1	sin(phi_hat)*tan(theta_hat)		cos(phi_hat)*tan(theta_hat);];
	C	= [[0;0;0;1] ...
		[V*[0 cos(theta_hat) 0; -cos(theta_hat) 0 -sin(theta_hat); 0 sin(theta_hat) 0]*u + ...
		g*[cos(theta_hat); sin(theta_hat)*sin(phi_hat); sin(theta_hat)*cos(phi_hat)]; 0] ...
		g*[0; -cos(theta_hat)*cos(phi_hat); cos(theta_hat)*sin(phi_hat); 0]];
	
	F	= eye(3) + A*dt;
	G2	= B2*dt;

	tmp1	= [...
		cos(theta_hat) sin(theta_hat)*sin(phi_hat) sin(theta_hat)*cos(phi_hat); ...
		0 cos(phi_hat) -sin(phi_hat); ...
		-sin(theta_hat) cos(theta_hat)*sin(phi_hat) cos(theta_hat)*cos(phi_hat)] * ...
		[mag_xb_wo_bias(col_mag); mag_yb_wo_bias(col_mag); mag_zb_wo_bias(col_mag)];

	mag_x_wo_bias	= tmp1(1);
	mag_y_wo_bias	= tmp1(2);

	magnetic_heading_data	= -atan2( mag_y_wo_bias, mag_x_wo_bias );
	magnetometer_yaw	= declination + magnetic_heading_data;

	x_minus	= xhat + attitude_kinematics_asg3(xhat, u)*dt;
	P_minus	= F*P*F' + G2*Q*G2';	

	L		= (P_minus * C') / (C * P_minus * C' + R );
	z		= [acc_x_wo_bias(col_acc); ...
		acc_y_wo_bias(col_acc); acc_z_wo_bias(col_acc); ...
		magnetometer_yaw];
	xhat	= x_minus + L*(z - attitude_measurement_asg3(xhat, u, V));
	P		= (eye(3) - L*C)*P_minus;
	
	time_stamps_store(m1 + 1) = t;
	xhat_store(:, m1+1)	= xhat;
	P_store(:, m1+1)	= reshape(P, 9, 1);
	P_trace_store(:, m1+1)	= trace(P);
	
	m1	= m1 + 1;
end



figure;
subplot(311)
plot(time_stamps_store(1:m1), xhat_store(1, 1:m1)*180/pi, 'LineWidth', 2);
ylabel('$\psi$ (deg)', 'Interpreter', 'latex', 'FontSize', 14)
xlabel('$t$ (s)', 'Interpreter', 'latex', 'FontSize', 14)
title('Problem 2 Ground Truth Euler Angles', 'Interpreter', 'latex', 'FontSize', 18)

subplot(312)
plot(time_stamps_store(1:m1), xhat_store(2, 1:m1)*180/pi, 'LineWidth', 2);
ylabel('$\theta$ (deg)', 'Interpreter', 'latex', 'FontSize', 14)
xlabel('$t$ (s)', 'Interpreter', 'latex', 'FontSize', 14)

subplot(313)
plot(time_stamps_store(1:m1), xhat_store(3, 1:m1)*180/pi, 'LineWidth', 2);
ylabel('$\phi$ (deg)', 'Interpreter', 'latex', 'FontSize', 14)
xlabel('$t$ (s)', 'Interpreter', 'latex', 'FontSize', 14)

figure;
plot(time_stamps_store(1:m1), P_trace_store(1:m1), 'LineWidth', 2);
title('Problem 4 $\mathrm{tr}(P)$', 'Interpreter', 'latex', 'FontSize', 18)


%% Function definitions
function x_dot = attitude_kinematics_asg3(x_, u_)
	theta_	= x_(2);
	phi_	= x_(3);
	
	x_dot	= [-sin(theta_) 0 1; ...
				sin(phi_)*cos(theta_) cos(phi_) 0; ...
				cos(phi_)*cos(theta_) -sin(phi_) 0] \ u_;
end

function z_ = attitude_measurement_asg3(x_, u_, V)
	psi_	= x_(1);
	theta_	= x_(2);
	phi_	= x_(3);
	z_		= [ V*[...
		0 sin(theta_) 0; -sin(theta_) 0 cos(theta_); 0 -cos(theta_) 0]*u_ + ...
		9.81*[sin(theta_); -cos(theta_)*sin(phi_); -cos(theta_)*cos(phi_)]; psi_];
end
