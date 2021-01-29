function bounds = GetBound(robot)

model_bounds = robot.getLimits();
bounds = struct();

model_bounds.states.x.lb(1:3) = [-10,-10,-10];
model_bounds.states.x.ub(1:3) = [10,10,10];

model_bounds.states.x.lb(4:6) = deg2rad(-5);
model_bounds.states.x.ub(4:6) = deg2rad(5);

% not pitch
model_bounds.states.x.lb(5) = -10;
model_bounds.states.x.ub(5) = 10;


%% Allleg Jump
bounds.AllLeg = model_bounds;

% roll and yaw
bounds.AllLeg.states.x.lb(4) = 0;
bounds.AllLeg.states.x.ub(4) = 0;

% not pitch
bounds.AllLeg.states.x.lb(5) = 0;
bounds.AllLeg.states.x.ub(5) = 0;

bounds.AllLeg.states.x.lb(6) = 0;
bounds.AllLeg.states.x.ub(6) = 0;
% model_bounds.states.x.lb(4:6) = deg2rad(-5);
% model_bounds.states.x.ub(4:6) = deg2rad(5);

bounds.AllLeg.init_com_z = 0.2;

bounds.AllLeg.end_com_z = 0.2;

bounds.AllLeg.momentum_z.lb = -2;
bounds.AllLeg.momentum_z.ub = 2;

bounds.AllLeg.momentum_x.lb = -20;
bounds.AllLeg.momentum_x.ub = -20;

% time is VirtualConstraint
bounds.AllLeg.time.t0.lb = 0;
bounds.AllLeg.time.t0.ub = 0;
bounds.AllLeg.time.t0.x0 = 0;

bounds.AllLeg.time.tf.lb = 0.3;
bounds.AllLeg.time.tf.ub = 0.3;
bounds.AllLeg.time.tf.x0 = 0.3;

bounds.AllLeg.time.duration.lb = 0.3;
bounds.AllLeg.time.duration.ub = 0.3;
bounds.AllLeg.time.duration.x0 = 0.3;

bounds.AllLeg.time.kp = 100;
bounds.AllLeg.time.kd = 20;

bounds.AllLeg.vel_x_arr = [0;-0.0900000000000000;-0.180000000000000;-0.270000000000000;-0.360000000000000;-0.450000000000000;-0.540000000000000;-0.630000000000000;-0.720000000000000;-0.810000000000000;-0.900000000000000;-0.990000000000000;-1.08000000000000;-1.17000000000000;-1.26000000000000;-1.35000000000000;-1.44000000000000;-1.53000000000000;-1.62000000000000;-1.71000000000000;-1.80000000000000];


% contact constraint force
bounds.AllLeg.inputs.ConstraintWrench.fFrontLeftToe.lb = -10000;
bounds.AllLeg.inputs.ConstraintWrench.fFrontLeftToe.ub = 10000;
bounds.AllLeg.inputs.ConstraintWrench.fFrontLeftToe.x0 = 10;

bounds.AllLeg.inputs.ConstraintWrench.fFrontRightToe.lb = -10000;
bounds.AllLeg.inputs.ConstraintWrench.fFrontRightToe.ub = 10000;
bounds.AllLeg.inputs.ConstraintWrench.fFrontRightToe.x0 = 10;

bounds.AllLeg.inputs.ConstraintWrench.fRearLeftToe.lb = -10000;
bounds.AllLeg.inputs.ConstraintWrench.fRearLeftToe.ub = 10000;
bounds.AllLeg.inputs.ConstraintWrench.fRearLeftToe.x0 = 10;

bounds.AllLeg.inputs.ConstraintWrench.fRearRightToe.lb = -10000;
bounds.AllLeg.inputs.ConstraintWrench.fRearRightToe.ub = 10000;
bounds.AllLeg.inputs.ConstraintWrench.fRearRightToe.x0 = 10;

% contact constraint position
bounds.AllLeg.params.pFrontLeftToe.lb = [-1;-1;0];
bounds.AllLeg.params.pFrontLeftToe.ub = [1;1;0];
bounds.AllLeg.params.pFrontLeftToe.x0 = [0;0;0];

bounds.AllLeg.params.pFrontRightToe.lb = [-1;-1;0];
bounds.AllLeg.params.pFrontRightToe.ub = [1;1;0];
bounds.AllLeg.params.pFrontRightToe.x0 = [0;0;0];

bounds.AllLeg.params.pRearLeftToe.lb = [-1;-1;0];
bounds.AllLeg.params.pRearLeftToe.ub = [1;1;0];
bounds.AllLeg.params.pRearLeftToe.x0 = [0;0;0];

bounds.AllLeg.params.pRearRightToe.lb = [-1;-1;0];
bounds.AllLeg.params.pRearRightToe.ub = [1;1;0];
bounds.AllLeg.params.pRearRightToe.x0 = [0;0;0];



bounds.AllLeg.params.atime.lb = -10*ones(6*12,1);
bounds.AllLeg.params.atime.ub = 10*ones(6*12,1);
bounds.AllLeg.params.atime.x0 = zeros(6*12,1);

bounds.AllLeg.params.ptime.lb = [bounds.AllLeg.time.tf.lb, bounds.AllLeg.time.t0.lb];
bounds.AllLeg.params.ptime.ub = [bounds.AllLeg.time.tf.ub, bounds.AllLeg.time.t0.ub];
bounds.AllLeg.params.ptime.x0 = [bounds.AllLeg.time.t0.x0, bounds.AllLeg.time.tf.x0];

%% rear leg 

bounds.RearLeg = model_bounds;

% roll and yaw
bounds.RearLeg.states.x.lb(4) = 0;
bounds.RearLeg.states.x.ub(4) = 0;

bounds.RearLeg.states.x.lb(6) = 0;
bounds.RearLeg.states.x.ub(6) = 0;

% not pitch
bounds.RearLeg.states.x.lb(5) = -1.6;
bounds.RearLeg.states.x.ub(5) = 0;

bounds.RearLeg.pitch_arr = [0;-0.00393750000000000;-0.0157500000000000;-0.0354375000000000;-0.0630000000000000;-0.0984375000000000;-0.141750000000000;-0.192937500000000;-0.252000000000000;-0.318937500000000;-0.393750000000000;-0.476437500000000;-0.567000000000000;-0.665437500000000;-0.771750000000000;-0.885937500000000;-1.00800000000000;-1.13793750000000;-1.27575000000000;-1.42143750000000;-1.57500000000000];

% time is VirtualConstraint
bounds.RearLeg.time.t0.lb = 0;
bounds.RearLeg.time.t0.ub = 0;
bounds.RearLeg.time.t0.x0 = 0;

bounds.RearLeg.time.tf.lb = 0.3;
bounds.RearLeg.time.tf.ub = 0.3;
bounds.RearLeg.time.tf.x0 = 0.3;

bounds.RearLeg.time.duration.lb = 0.3;
bounds.RearLeg.time.duration.ub = 0.3;
bounds.RearLeg.time.duration.x0 = 0.3;

bounds.RearLeg.time.kp = 100;
bounds.RearLeg.time.kd = 20;

% contact constraint force
bounds.RearLeg.inputs.ConstraintWrench.fRearLeftToe.lb = -10000;
bounds.RearLeg.inputs.ConstraintWrench.fRearLeftToe.ub = 10000;
bounds.RearLeg.inputs.ConstraintWrench.fRearLeftToe.x0 = 10;

bounds.RearLeg.inputs.ConstraintWrench.fRearRightToe.lb = -10000;
bounds.RearLeg.inputs.ConstraintWrench.fRearRightToe.ub = 10000;
bounds.RearLeg.inputs.ConstraintWrench.fRearRightToe.x0 = 10;

% contact constraint position
bounds.RearLeg.params.pRearLeftToe.lb = [-1;-1;0];
bounds.RearLeg.params.pRearLeftToe.ub = [1;1;0];
bounds.RearLeg.params.pRearLeftToe.x0 = [0;0;0];

bounds.RearLeg.params.pRearRightToe.lb = [-1;-1;0];
bounds.RearLeg.params.pRearRightToe.ub = [1;1;0];
bounds.RearLeg.params.pRearRightToe.x0 = [0;0;0];


bounds.RearLeg.params.atime.lb = -10*ones(6*12,1);
bounds.RearLeg.params.atime.ub = 10*ones(6*12,1);
bounds.RearLeg.params.atime.x0 = zeros(6*12,1);

bounds.RearLeg.params.ptime.lb = [bounds.RearLeg.time.tf.lb, bounds.RearLeg.time.t0.lb];
bounds.RearLeg.params.ptime.ub = [bounds.RearLeg.time.tf.ub, bounds.RearLeg.time.t0.ub];
bounds.RearLeg.params.ptime.x0 = [bounds.RearLeg.time.t0.x0, bounds.RearLeg.time.tf.x0];

%% impact
bounds.LiftA = model_bounds;


end
