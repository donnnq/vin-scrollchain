// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureRedemptionProtocol {
    address public admin;

    struct RedemptionEntry {
        string projectName;
        string redemptionType; // "Rebuild", "Retrofit", "Public Reopening"
        string clause;
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

    function summonRedemption(string memory projectName, string memory redemptionType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(RedemptionEntry(projectName, redemptionType, clause, emotionalTag, true, false, false));
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
