// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerLandLossRegistryDAO {
    address public admin;

    struct RegistryEntry {
        string region;
        string lossCause;
        string emotionalTag;
        bool verified;
    }

    RegistryEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _region, string memory _lossCause, string memory _emotionalTag) external onlyAdmin {
        registry.push(RegistryEntry(_region, _lossCause, _emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        registry[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (RegistryEntry memory) {
        return registry[index];
    }
}
