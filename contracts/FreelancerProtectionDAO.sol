// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title FreelancerProtectionDAO
 * @dev Emotionally tagged smart contract to log contract fairness,
 * payment rituals, and client accountability — scrollchain-sealed dignity.
 */

contract FreelancerProtectionDAO {
    address public steward;

    struct ContractEvent {
        address initiator;
        string projectName;
        uint256 agreedPayment;
        bool paid;
        string emotionalTag;
        uint256 timestamp;
    }

    ContractEvent[] public contracts;

    event ContractLogged(address indexed initiator, string projectName, uint256 agreedPayment, bool paid, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log freelancer protection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logContract(address initiator, string memory projectName, uint256 agreedPayment, bool paid, string memory emotionalTag) external onlySteward {
        contracts.push(ContractEvent({
            initiator: initiator,
            projectName: projectName,
            agreedPayment: agreedPayment,
            paid: paid,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ContractLogged(initiator, projectName, agreedPayment, paid, emotionalTag, block.timestamp);
    }

    function getContractByIndex(uint256 index) external view returns (address initiator, string memory projectName, uint256 agreedPayment, bool paid, string memory emotionalTag, uint256 timestamp) {
        require(index < contracts.length, "Scrollstorm index out of bounds");
        ContractEvent memory c = contracts[index];
        return (c.initiator, c.projectName, c.agreedPayment, c.paid, c.emotionalTag, c.timestamp);
    }
}
