%% PROBLEM 4

clear variables; close all; clc

data_table_mag = readtable('Magnetometer_Att_est.csv');

time_stamps_mag = data_table_mag{1:20, 1};
mag_x = data_table_mag{1:20, 2};
mag_y = data_table_mag{1:20, 3};
mag_z = data_table_mag{1:20, 4};

time_stamps = 0:0.1:60;
n_t		= numel(time_stamps);
omega_b	= zeros(3, n_t);

n_pieces =	6;
for m1 = 0:(n_pieces-1)
	omega_b(:, (m1*100 + 1):((m1+1)*100)) = kron( ...
		((-15 + 30*rand(3,1))*pi/180), ones(1, 100));
end

plot(time_stamps, omega_b*180/pi)

data_table_sheet1 = table( ...
	time_stamps', omega_b(1,: )', omega_b(2,: )', omega_b(3,: )', 'VariableNames', ...
	{'Time (s)'; 'Gyroscope x (rad/s)'; 'Gyroscope y (rad/s)'; 'Gyroscope z (rad/s)'});

data_table_sheet2 = table( ...
	time_stamps_mag, mag_x, mag_y, mag_z, 'VariableNames', ...
	{'Time (s)'; 'Magnetic field x (mu T)'; 'Magnetic field y (mu T)'; 'Magnetic field z (mu T)'});

writetable(data_table_sheet1, 'data_exp4.xls', 'Sheet', 1)
writetable(data_table_sheet2, 'data_exp4.xls', 'Sheet', 2)


