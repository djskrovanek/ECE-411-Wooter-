%% Parameters for ECE 411 project
clear all
%% Machine Parameters
p    = 4;           % Number of pole pairs
Rs   = 12.4e-3;     % Stator resistance per phase           [Ohm]
Ls   = 154e-6;      % Stator self-inductance per phase, Ls  [H]
Ms   = 0.3*Ls;     % Stator mutual inductance, Ms          [H]

Vdc_max = 72;       % max dc bus voltage                    [V]
RPM_max = 4259;     % max rotor speed                       [RPM]  
I_cmd_manual_step = 133; % amplitude of manual current command [A]
Drive_Idc_limit = 200; % 133 or 200 A maximum input current [A]

%% Mechanical System parameters
r_wheel = (55e-2)/2;   % wheel radius [m]
G_ratio = 8;           % gear reduction ratio: Wooter wheel speed/BLDC shaft speed [unitless]
eff_radius = r_wheel/G_ratio;  % w [rad/s] x eff_radius [m] = vel [m/s]
Jm   = 210e-3 ;     % Rotational inertia                         [Kg*m^2]
Bm   = 42e-3;       % Rotational damping                         [N*m*s]

vel_1 = 11.11;      % S1a: rated linear speed, [m/s]
vel_2 = 13.889;     % S1b: max linear speed (coasting), [m/s]
vel_3 = 9.722;      % S2: linear speed, [m/s]
vel_0 = 0;          % inital linear speed, [m/s]

%% Control Parameters
%  Current regulator and speed (w_r) regulator gains. These should not have
%  significant impact on performance.
Kp_Idc_Regulator = 0.286;    % DC current regulator proportional gain [V/A]
Ki_Idc_Regulator = 5.723;       % DC current regulator integral gain [V/(A-s)]

Kp_vel_Regulator = 5;     % Speed (w_r) regulator proportional gain [(A-s)/(rad)]
Ki_vel_Regulator = 5;       % Speed (w_r) regulator integral gain [A/(rad)]

Ts  = 5e-6;         % Fundamental sample time            [s]
Tsc = 1e-4;         % Sample time for inner control loop [s]

tau_Te_filter = 1/(2*pi*10);  % because of the torque ripple in the BLDC 
% it's difficult to see the average torque on the scope.  This parameter 
% sets the corner frequency (10 Hz) of a low pass filter used to plot + 
% visualize the average torque.

%% Drive IGBT and Diode Parameters
% These have been reduced to "ideal" levels to minimize the impact of the
% drive on the BLDC performance.
Vf_IGBT = 0.1;
Ron_IGBT = 5e-3;
Vf_Diode = 0.1;
Ron_Diode = 5e-3;

