// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VSCodeExtensionRegistryDAO {
    address public admin;

    struct ExtensionEntry {
        string extensionLabel;
        string registryClause;
        string emotionalTag;
        bool verified;
    }

    ExtensionEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _extensionLabel, string memory _registryClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(ExtensionEntry(_extensionLabel, _registryClause, _emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        registry[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (ExtensionEntry memory) {
        return registry[index];
    }
}
