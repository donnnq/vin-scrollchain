// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToAidIntegrityProtocol {
    string public batchID = "1321.9.104";
    string public steward = "Vinvin";

    address public admin;

    struct IntegrityCheck {
        bytes32 aidKey;
        string auditor;
        bool passed;
        uint256 timestamp;
    }

    mapping(bytes32 => IntegrityCheck) public integrityRegistry;

    event IntegrityVerified(bytes32 indexed aidKey, string auditor, bool passed);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function verifyAid(bytes32 aidKey, string memory auditor, bool passed) public onlyAdmin {
        integrityRegistry[aidKey] = IntegrityCheck(aidKey, auditor, passed, block.timestamp);
        emit IntegrityVerified(aidKey, auditor, passed);
    }

    function getIntegrity(bytes32 aidKey) public view returns (string memory auditor, bool passed, uint256 timestamp) {
        IntegrityCheck memory i = integrityRegistry[aidKey];
        return (i.auditor, i.passed, i.timestamp);
    }
}
