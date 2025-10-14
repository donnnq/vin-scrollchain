// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticImmunityRegistryDAO {
    address public admin;

    struct ImmunityEntry {
        string diplomatName;
        string hostCountry;
        string immunityScope;
        string emotionalTag;
        bool registered;
    }

    ImmunityEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerImmunity(string memory _diplomatName, string memory _hostCountry, string memory _immunityScope, string memory _emotionalTag) external onlyAdmin {
        registry.push(ImmunityEntry(_diplomatName, _hostCountry, _immunityScope, _emotionalTag, false));
    }

    function confirmRegistration(uint256 index) external onlyAdmin {
        registry[index].registered = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return registry[index];
    }
}
