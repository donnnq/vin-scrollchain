// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GPUSovereigntyRegistryDAO {
    address public admin;

    struct RegistryEntry {
        string manufacturer;
        string sovereigntyClause;
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

    function submitEntry(string memory _manufacturer, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        registry.push(RegistryEntry(_manufacturer, _sovereigntyClause, _emotionalTag, false));
    }

    function markVerified(uint256 index) external onlyAdmin {
        registry[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (RegistryEntry memory) {
        return registry[index];
    }
}
