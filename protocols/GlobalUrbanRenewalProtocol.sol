// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalUrbanRenewalProtocol {
    address public admin;

    struct RenewalEntry {
        string city;
        string renewalType; // "Esplanade Upgrade", "Riverfront Beautification", "Bridge Restoration"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    RenewalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRenewal(string memory city, string memory renewalType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RenewalEntry(city, renewalType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealRenewalEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getRenewalEntry(uint256 index) external view returns (RenewalEntry memory) {
        return entries[index];
    }
}
