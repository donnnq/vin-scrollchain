// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToScannerEnforcementLedger {
    string public batchID = "1321.9.177";
    string public steward = "Vinvin";

    address public admin;

    struct ScannerEvent {
        string tool;       // gitleaks, trufflehog, git-secrets
        string repo;       // repository name
        string status;     // enforced, violation, clean
        uint256 timestamp;
    }

    ScannerEvent[] public scanners;

    event ScannerLogged(string tool, string repo, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logScanner(string memory tool, string memory repo, string memory status) public onlyAdmin {
        scanners.push(ScannerEvent(tool, repo, status, block.timestamp));
        emit ScannerLogged(tool, repo, status);
    }

    function getScanner(uint256 index) public view returns (string memory tool, string memory repo, string memory status, uint256 timestamp) {
        ScannerEvent memory s = scanners[index];
        return (s.tool, s.repo, s.status, s.timestamp);
    }
}
