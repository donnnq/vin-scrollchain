// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ComputeAccessRegistryDAO {
    address public admin;

    struct AccessEntry {
        string entityName;
        string computeTier;
        string accessLevel;
        string emotionalTag;
        bool granted;
    }

    AccessEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerAccess(string memory _entityName, string memory _computeTier, string memory _accessLevel, string memory _emotionalTag) external onlyAdmin {
        registry.push(AccessEntry(_entityName, _computeTier, _accessLevel, _emotionalTag, false));
    }

    function grantAccess(uint256 index) external onlyAdmin {
        registry[index].granted = true;
    }

    function getAccess(uint256 index) external view returns (AccessEntry memory) {
        return registry[index];
    }
}
