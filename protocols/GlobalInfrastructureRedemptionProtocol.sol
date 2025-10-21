// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInfrastructureRedemptionProtocol {
    address public admin;

    struct RedemptionEntry {
        string country;
        string projectType; // "Flood Control", "Roadworks", "Drainage Systems"
        string redemptionClause;
        string emotionalTag;
        bool summoned;
        bool restored;
        bool sealed;
    }

    RedemptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRedemption(string memory country, string memory projectType, string memory redemptionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RedemptionEntry(country, projectType, redemptionClause, emotionalTag, true, false, false));
    }

    function confirmRestoration(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function sealRedemptionEntry(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getRedemptionEntry(uint256 index) external view returns (RedemptionEntry memory) {
        return entries[index];
    }
}
