// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FiscalResilienceDAO {
    address public admin;

    struct ResilienceEntry {
        string strategyName;
        string reformType;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateStrategy(string memory strategyName, string memory reformType, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(strategyName, reformType, emotionalTag, true, false));
    }

    function reinforceStrategy(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getStrategy(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
