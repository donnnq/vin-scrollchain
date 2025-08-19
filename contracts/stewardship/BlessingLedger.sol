// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.19;

contract BlessingLedger {
    struct Violation {
        string steward;
        string violationType;
        string emotionalAPR;
        uint256 timestamp;
    }

    Violation[] public violations;

    event ViolationLogged(string steward, string violationType, string emotionalAPR, uint256 timestamp);

    function logViolation(string memory steward, string memory violationType, string memory emotionalAPR) public {
        violations.push(Violation(steward, violationType, emotionalAPR, block.timestamp));
        emit ViolationLogged(steward, violationType, emotionalAPR, block.timestamp);
    }

    function getViolation(uint index) public view returns (Violation memory) {
        return violations[index];
    }
}
