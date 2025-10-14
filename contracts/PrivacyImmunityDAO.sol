// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrivacyImmunityDAO {
    address public admin;

    struct ImmunityEntry {
        string country;
        string surveillancePolicy;
        string immunityClause;
        string emotionalTag;
        bool enforced;
    }

    ImmunityEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _country, string memory _surveillancePolicy, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(ImmunityEntry(_country, _surveillancePolicy, _immunityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        registry[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return registry[index];
    }
}
