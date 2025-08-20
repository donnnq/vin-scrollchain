// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract KupitFirewall {
    address public budgetSteward;
    uint256 public maxAllowedDeviation = 10; // percent

    struct BudgetLog {
        uint256 proposedAmount;
        uint256 verifiedAmount;
        bool approved;
        string reason;
    }

    mapping(string => BudgetLog[]) public projectBudgets;

    event BudgetRejected(string project, uint256 proposed, uint256 verified, string reason);
    event BudgetApproved(string project, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == budgetSteward, "Only steward can verify budget");
        _;
    }

    constructor() {
        budgetSteward = msg.sender;
    }

    function verifyBudget(string memory _project, uint256 _proposed, uint256 _verified) public onlySteward {
        uint256 deviation = (_proposed > _verified) ? (_proposed - _verified) * 100 / _verified : 0;

        if (deviation > maxAllowedDeviation) {
            projectBudgets[_project].push(BudgetLog(_proposed, _verified, false, "Exceeds allowed deviation"));
            emit BudgetRejected(_project, _proposed, _verified, "Exceeds allowed deviation");
        } else {
            projectBudgets[_project].push(BudgetLog(_proposed, _verified, true, "Approved"));
            emit BudgetApproved(_project, _verified);
        }
    }

    function getBudgetLogs(string memory _project) public view returns (BudgetLog[] memory) {
        return projectBudgets[_project];
    }
}
