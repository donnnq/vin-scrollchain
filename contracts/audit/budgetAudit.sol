// SPDX-License-Identifier: Civic-Transparency
pragma solidity ^0.8.19;

contract BudgetAudit {
    address public steward;
    uint256 public operationalThreshold;
    mapping(string => uint256) public departmentFunds;
    mapping(string => bool) public auditFlags;

    event AuditTriggered(string department, uint256 currentFunds);
    event FundsRecalibrated(string department, uint256 newAmount);
    event EmotionalAPRLogged(uint256 trust, uint256 clarity, uint256 resonance);

    constructor(uint256 threshold) {
        steward = msg.sender;
        operationalThreshold = threshold;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized to audit");
        _;
    }

    function logFunds(string memory department, uint256 amount) public onlySteward {
        departmentFunds[department] = amount;
        if (amount < operationalThreshold) {
            auditFlags[department] = true;
            emit AuditTriggered(department, amount);
        }
    }

    function recalibrateFunds(string memory department, uint256 newAmount) public onlySteward {
        departmentFunds[department] = newAmount;
        auditFlags[department] = false;
        emit FundsRecalibrated(department, newAmount);
    }

    function logEmotionalAPR(uint256 trust, uint256 clarity, uint256 resonance) public onlySteward {
        emit EmotionalAPRLogged(trust, clarity, resonance);
    }

    function verifyAuditStatus(string memory department) public view returns (bool) {
        return auditFlags[department];
    }
}
