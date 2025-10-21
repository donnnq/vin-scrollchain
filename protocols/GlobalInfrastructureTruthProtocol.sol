// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInfrastructureTruthProtocol {
    address public admin;

    struct TruthEntry {
        string country;
        string projectName;
        string truthType; // "Verified", "Ghost", "Restored"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    TruthEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTruth(string memory country, string memory projectName, string memory truthType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TruthEntry(country, projectName, truthType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealTruthEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getTruthEntry(uint256 index) external view returns (TruthEntry memory) {
        return entries[index];
    }
}
