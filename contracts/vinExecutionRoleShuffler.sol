// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinExecutionRoleShuffler {
    struct ExecutionData {
        address executor;
        uint256 successRate;
        uint256 grade;
        uint256 efficiency;
        string role;
    }

    ExecutionData[] public executions;
    mapping(string => address) public roleToExecutor;

    event ExecutionAdded(address indexed executor, uint256 successRate, uint256 grade, uint256 efficiency, string role);
    event TopExecutorSelected(address indexed executor, string role, uint256 index);
    event RolesReshuffled(uint256 timestamp);

    function addExecution(
        address _executor,
        uint256 _successRate,
        uint256 _grade,
        uint256 _efficiency,
        string memory _role
    ) public {
        executions.push(ExecutionData(_executor, _successRate, _grade, _efficiency, _role));
        emit ExecutionAdded(_executor, _successRate, _grade, _efficiency, _role);
    }

    function pickTopExecutor() public returns (address bestExecutor, string memory selectedRole, uint256 index) {
        require(executions.length > 0, "No executions available");

        uint256 highestScore = 0;

        for (uint256 i = 0; i < executions.length; i++) {
            uint256 score = executions[i].successRate + executions[i].grade + executions[i].efficiency;
            if (score > highestScore) {
                highestScore = score;
                bestExecutor = executions[i].executor;
                selectedRole = executions[i].role;
                index = i;
            }
        }

        roleToExecutor[selectedRole] = bestExecutor;
        emit TopExecutorSelected(bestExecutor, selectedRole, index);
    }

    function reshuffleRoles() public {
        require(executions.length > 0, "No executions available");

        for (uint256 i = 0; i < executions.length; i++) {
            uint256 reshuffleIndex = (uint256(keccak256(abi.encodePacked(block.timestamp, i))) % executions.length);
            string memory tempRole = executions[i].role;
            executions[i].role = executions[reshuffleIndex].role;
            executions[reshuffleIndex].role = tempRole;
        }

        emit RolesReshuffled(block.timestamp);
    }
}
