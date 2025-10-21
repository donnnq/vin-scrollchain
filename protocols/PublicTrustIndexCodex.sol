// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicTrustIndexCodex {
    address public admin;

    struct TrustEntry {
        string institution;
        string trustMetric; // "Transparency Score", "Citizen Feedback", "Bias Audit Result"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool published;
        bool sealed;
    }

    TrustEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTrustIndex(string memory institution, string memory trustMetric, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TrustEntry(institution, trustMetric, codexClause, emotionalTag, true, false, false));
    }

    function confirmPublication(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function sealTrustEntry(uint256 index) external onlyAdmin {
        require(entries[index].published, "Must be published first");
        entries[index].sealed = true;
    }

    function getTrustEntry(uint256 index) external view returns (TrustEntry memory) {
        return entries[index];
    }
}
