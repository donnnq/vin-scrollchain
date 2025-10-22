// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MaliciousServerDetectionProtocol {
    address public admin;

    struct DetectionEntry {
        string serverType; // "SMB honeypot", "Fake file share", "Privilege escalation trap"
        string detectionSignal; // "Unusual traffic", "Unauthorized handshake", "Exploit signature"
        string emotionalTag;
        bool detected;
        bool sealed;
    }

    DetectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function detectServer(string memory serverType, string memory detectionSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(DetectionEntry(serverType, detectionSignal, emotionalTag, true, false));
    }

    function sealDetectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].detected, "Must be detected first");
        entries[index].sealed = true;
    }

    function getDetectionEntry(uint256 index) external view returns (DetectionEntry memory) {
        return entries[index];
    }
}
