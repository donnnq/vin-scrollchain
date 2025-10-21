// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicWhistleblowerProtocol {
    address public admin;

    struct WhistleEntry {
        string institution;
        string reportType; // "Fraud", "Conflict of Interest", "Ghost Project"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    WhistleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWhistle(string memory institution, string memory reportType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(WhistleEntry(institution, reportType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealWhistleEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getWhistleEntry(uint256 index) external view returns (WhistleEntry memory) {
        return entries[index];
    }
}
