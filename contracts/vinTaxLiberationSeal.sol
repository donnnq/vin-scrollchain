// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinTaxLiberationSeal {
    address public sovereignDAO;
    mapping(address => bool) public isExempt;
    mapping(address => string) public exemptionReason;

    event ExemptionGranted(address indexed entity, string reason);
    event ExemptionRevoked(address indexed entity);

    constructor(address _sovereignDAO) {
        sovereignDAO = _sovereignDAO;
    }

    function grantExemption(address entity, string memory reason) external {
        require(msg.sender == sovereignDAO, "Only DAO may grant exemptions");
        isExempt[entity] = true;
        exemptionReason[entity] = reason;
        emit ExemptionGranted(entity, reason);
    }

    function revokeExemption(address entity) external {
        require(msg.sender == sovereignDAO, "Only DAO may revoke");
        isExempt[entity] = false;
        emit ExemptionRevoked(entity);
    }

    function checkExemption(address entity) external view returns (bool, string memory) {
        return (isExempt[entity], exemptionReason[entity]);
    }
}
