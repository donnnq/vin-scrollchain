// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToAuthenticityCheckProtocol {
    string public batchID = "1321.9.110";
    string public steward = "Vinvin";

    address public admin;

    struct Check {
        bytes32 signalKey;
        string method; // e.g., triangulation, spectral analysis
        bool passed;
        uint256 timestamp;
    }

    mapping(bytes32 => Check) public checkRegistry;

    event CheckPerformed(bytes32 indexed signalKey, string method, bool passed);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function performCheck(bytes32 signalKey, string memory method, bool passed) public onlyAdmin {
        checkRegistry[signalKey] = Check(signalKey, method, passed, block.timestamp);
        emit CheckPerformed(signalKey, method, passed);
    }

    function getCheck(bytes32 signalKey) public view returns (string memory method, bool passed, uint256 timestamp) {
        Check memory c = checkRegistry[signalKey];
        return (c.method, c.passed, c.timestamp);
    }
}
