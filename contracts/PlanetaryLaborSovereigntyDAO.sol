// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryLaborSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string workerName;
        string laborDomain;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory workerName, string memory laborDomain, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(workerName, laborDomain, emotionalTag, true, false));
    }

    function protectLabor(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
