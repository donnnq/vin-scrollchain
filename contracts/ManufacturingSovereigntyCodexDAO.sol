// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManufacturingSovereigntyCodexDAO {
    address public admin;

    struct SovereigntyEntry {
        string productType;
        string localCapacityGoal;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _productType, string memory _localCapacityGoal, string memory _emotionalTag) external onlyAdmin {
        codex.push(SovereigntyEntry(_productType, _localCapacityGoal, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return codex[index];
    }
}
