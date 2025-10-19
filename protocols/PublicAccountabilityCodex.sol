// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAccountabilityCodex {
    address public admin;

    struct AccountabilityEntry {
        string institutionName;
        string grievanceType;
        string resolutionPath;
        string emotionalTag;
        bool summoned;
        bool resolved;
        bool sealed;
    }

    AccountabilityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAccountability(string memory institutionName, string memory grievanceType, string memory resolutionPath, string memory emotionalTag) external onlyAdmin {
        entries.push(AccountabilityEntry(institutionName, grievanceType, resolutionPath, emotionalTag, true, false, false));
    }

    function confirmResolution(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function sealAccountabilityEntry(uint256 index) external onlyAdmin {
        require(entries[index].resolved, "Must be resolved first");
        entries[index].sealed = true;
    }

    function getAccountabilityEntry(uint256 index) external view returns (AccountabilityEntry memory) {
        return entries[index];
    }
}
