// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIBorderImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string modelName;
        string originRegion;
        string containmentStrategy;
        string emotionalTag;
        bool enforced;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _modelName, string memory _originRegion, string memory _containmentStrategy, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_modelName, _originRegion, _containmentStrategy, _emotionalTag, false));
    }

    function enforceImmunity(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
