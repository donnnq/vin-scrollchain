// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanLedDiscoveryRegistryDAO {
    address public admin;

    struct RegistryEntry {
        string userLabel;
        string verifiedContribution;
        string emotionalTag;
        bool registered;
    }

    RegistryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory userLabel, string memory verifiedContribution, string memory emotionalTag) external onlyAdmin {
        entries.push(RegistryEntry(userLabel, verifiedContribution, emotionalTag, false));
    }

    function registerEntry(uint256 index) external onlyAdmin {
        entries[index].registered = true;
    }

    function getEntry(uint256 index) external view returns (RegistryEntry memory) {
        return entries[index];
    }
}
