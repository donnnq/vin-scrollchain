// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToInsiderTerminationAndBlacklist {
    string public batchID = "1321.9.94";
    string public steward = "Vinvin";

    address public admin;

    struct Employee {
        bool active;
        bool blacklisted;
        string role;
    }

    mapping(address => Employee) public registry;

    event EmployeeRegistered(address indexed employee, string role);
    event EmployeeTerminated(address indexed employee, string reason);
    event EmployeeBlacklisted(address indexed employee, string reason);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function registerEmployee(address employee, string memory role) public onlyAdmin {
        registry[employee] = Employee(true, false, role);
        emit EmployeeRegistered(employee, role);
    }

    function terminateEmployee(address employee, string memory reason) public onlyAdmin {
        Employee storage e = registry[employee];
        require(e.active, "Already inactive");
        e.active = false;
        emit EmployeeTerminated(employee, reason);
    }

    function blacklistEmployee(address employee, string memory reason) public onlyAdmin {
        Employee storage e = registry[employee];
        e.blacklisted = true;
        emit EmployeeBlacklisted(employee, reason);
    }

    function isBlacklisted(address employee) public view returns (bool) {
        return registry[employee].blacklisted;
    }

    function isActive(address employee) public view returns (bool) {
        return registry[employee].active;
    }
}
