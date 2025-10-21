// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TentSovereigntyProtocol {
    address public admin;

    struct TentEntry {
        string zone;
        string originStatus; // "Relocated", "Transient", "Provincial"
        string sovereigntyClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    TentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTent(string memory zone, string memory originStatus, string memory sovereigntyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TentEntry(zone, originStatus, sovereigntyClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealTentEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getTentEntry(uint256 index) external view returns (TentEntry memory) {
        return entries[index];
    }
}
