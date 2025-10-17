// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryPrototypeFellowship {
    address public admin;

    struct PrototypeEntry {
        string solutionName;
        string region;
        string emotionalTag;
        bool summoned;
        bool deployed;
    }

    PrototypeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPrototype(string memory solutionName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(PrototypeEntry(solutionName, region, emotionalTag, true, false));
    }

    function deployPrototype(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function getPrototype(uint256 index) external view returns (PrototypeEntry memory) {
        return entries[index];
    }
}
