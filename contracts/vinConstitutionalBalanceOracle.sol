// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinConstitutionalBalanceOracle {
    address public oracleAdmin;

    enum Branch { Executive, Legislative, Judiciary }

    struct PowerEvent {
        Branch initiator;
        Branch affected;
        string description;
        uint256 timestamp;
        bool flaggedAsImbalance;
    }

    PowerEvent[] public eventsLog;

    event PowerLogged(Branch initiator, Branch affected, string description, bool flagged);

    modifier onlyAdmin() {
        require(msg.sender == oracleAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin) {
        oracleAdmin = _admin;
    }

    function logEvent(
        Branch initiator,
        Branch affected,
        string memory description,
        bool flagAsImbalance
    ) external onlyAdmin {
        eventsLog.push(PowerEvent({
            initiator: initiator,
            affected: affected,
            description: description,
            timestamp: block.timestamp,
            flaggedAsImbalance: flagAsImbalance
        }));

        emit PowerLogged(initiator, affected, description, flagAsImbalance);
    }

    function getEvent(uint256 index) external view returns (PowerEvent memory) {
        require(index < eventsLog.length, "Invalid index");
        return eventsLog[index];
    }

    function getTotalEvents() external view returns (uint256) {
        return eventsLog.length;
    }
}
