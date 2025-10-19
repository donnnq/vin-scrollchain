// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SouthboundSleeperPermitProtocol {
    address public admin;

    struct PermitEntry {
        string routeName;
        string region;
        string operatorName;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    PermitEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPermit(string memory routeName, string memory region, string memory operatorName, string memory emotionalTag) external onlyAdmin {
        entries.push(PermitEntry(routeName, region, operatorName, emotionalTag, true, false, false));
    }

    function confirmApproval(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealPermitEntry(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getPermitEntry(uint256 index) external view returns (PermitEntry memory) {
        return entries[index];
    }
}
