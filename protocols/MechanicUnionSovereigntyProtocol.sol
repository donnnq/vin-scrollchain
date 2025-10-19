// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MechanicUnionSovereigntyProtocol {
    address public admin;

    struct UnionEntry {
        string unionName;
        string region;
        string protectionType;
        string emotionalTag;
        bool summoned;
        bool empowered;
        bool sealed;
    }

    UnionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonUnion(string memory unionName, string memory region, string memory protectionType, string memory emotionalTag) external onlyAdmin {
        entries.push(UnionEntry(unionName, region, protectionType, emotionalTag, true, false, false));
    }

    function confirmEmpowerment(uint256 index) external onlyAdmin {
        entries[index].empowered = true;
    }

    function sealUnionEntry(uint256 index) external onlyAdmin {
        require(entries[index].empowered, "Must be empowered first");
        entries[index].sealed = true;
    }

    function getUnionEntry(uint256 index) external view returns (UnionEntry memory) {
        return entries[index];
    }
}
