// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailTHCExpansionProtocol {
    address public admin;

    struct ExpansionEntry {
        string companyName;
        string productType;
        string entryRegion;
        string emotionalTag;
        bool summoned;
        bool launched;
        bool sealed;
    }

    ExpansionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExpansion(string memory companyName, string memory productType, string memory entryRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(ExpansionEntry(companyName, productType, entryRegion, emotionalTag, true, false, false));
    }

    function confirmLaunch(uint256 index) external onlyAdmin {
        entries[index].launched = true;
    }

    function sealExpansionEntry(uint256 index) external onlyAdmin {
        require(entries[index].launched, "Must be launched first");
        entries[index].sealed = true;
    }

    function getExpansionEntry(uint256 index) external view returns (ExpansionEntry memory) {
        return entries[index];
    }
}
