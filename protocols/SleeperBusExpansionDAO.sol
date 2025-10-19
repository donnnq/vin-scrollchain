// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SleeperBusExpansionDAO {
    address public admin;

    struct ExpansionEntry {
        string routeName;
        string region;
        string busModel;
        string emotionalTag;
        bool summoned;
        bool deployed;
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

    function summonExpansion(string memory routeName, string memory region, string memory busModel, string memory emotionalTag) external onlyAdmin {
        entries.push(ExpansionEntry(routeName, region, busModel, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealExpansionEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getExpansionEntry(uint256 index) external view returns (ExpansionEntry memory) {
        return entries[index];
    }
}
