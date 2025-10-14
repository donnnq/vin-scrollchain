// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhilippineFarmImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string region;
        string livestockType;
        string immunityClause;
        string emotionalTag;
        bool deployed;
    }

    ImmunityEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _region, string memory _livestockType, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(ImmunityEntry(_region, _livestockType, _immunityClause, _emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        registry[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return registry[index];
    }
}
