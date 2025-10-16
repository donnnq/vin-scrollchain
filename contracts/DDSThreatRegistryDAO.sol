// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DDSThreatRegistryDAO {
    address public admin;

    struct ThreatEntry {
        string speakerLabel;
        string threatContent;
        string emotionalTag;
        bool verified;
        bool escalated;
    }

    ThreatEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitThreat(string memory speakerLabel, string memory threatContent, string memory emotionalTag) external onlyAdmin {
        entries.push(ThreatEntry(speakerLabel, threatContent, emotionalTag, false, false));
    }

    function verifyThreat(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function escalateThreat(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function getThreat(uint256 index) external view returns (ThreatEntry memory) {
        return entries[index];
    }
}
