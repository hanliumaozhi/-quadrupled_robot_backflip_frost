function allleg(nlp, bounds, varargin)
    domain = nlp.Plant;
    
    %% Add Virtual Constraints
    domain.VirtualConstraints.time.imposeNLPConstraint(nlp, [bounds.time.kp, bounds.time.kd], [1,1]);
    
    %% Tau Boundary [0,1]
    addNodeConstraint(nlp, a1.constraints.tau0(nlp), ...
        [{'T'}, domain.VirtualConstraints.time.PhaseParamName], 'first', 0, 0, 'Nonlinear');
    addNodeConstraint(nlp, a1.constraints.tauF(nlp), ...
        [{'T'}, domain.VirtualConstraints.time.PhaseParamName], 'last', 0, 0, 'Nonlinear');
    
    %% other constraints
    
    % com x
    for k =1:21
       addNodeConstraint(nlp, a1.constraints.com_x(nlp), ...
           {'x'}, k, 0, 0, 'Nonlinear');
    end
    
    % com y
    for k =1:21
       addNodeConstraint(nlp, a1.constraints.com_y(nlp), ...
           {'x'}, k, 0, 0, 'Nonlinear');
    end
    
    % com z // only for first node which base_link is 0.3m
    addNodeConstraint(nlp, a1.constraints.com_z(nlp), ...
           {'x'}, 1, 0.28, 0.28, 'Nonlinear');
       
    % momentum z
    addNodeConstraint(nlp, a1.constraints.momentum_z(nlp), ...
           {'x', 'dx'}, 21, 25, 25, 'Nonlinear');
    
    %% cost
     addRunningCost(nlp, a1.costs.torque(nlp), 'u');
    
end