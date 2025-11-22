// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITerminationRegistry {
    function terminateEmployee(address employee, string memory reason) external;
    function blacklistEmployee(address employee, string memory reason) external;
}

contract CodexToPrivilegeTrapEnforcementProtocol {
    string public batchID = "1321.9.96";
    string public steward = "Vinvin";

    address public admin;
    ITerminationRegistry public terminationRegistry;

    event EnforcementExecuted(address indexed subject, string reason);
    event RegistryBound(address indexed registry);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor(address registry) {
        admin = msg.sender;
        terminationRegistry = ITerminationRegistry(registry);
        emit RegistryBound(registry);
    }

    function enforceTrapConsequences(address subject, string memory reason) public onlyAdmin {
        terminationRegistry.terminateEmployee(subject, reason);
        terminationRegistry.blacklistEmployee(subject, reason);
        emit EnforcementExecuted(subject, reason);
    }
}
