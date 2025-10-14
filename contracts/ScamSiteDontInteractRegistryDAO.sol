// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScamSiteDontInteractRegistryDAO {
    address public admin;

    struct ScamEntry {
        string domainName;
        string scamType;
        string warningTag;
        string emotionalTag;
        bool tagged;
    }

    ScamEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitScam(string memory _domainName, string memory _scamType, string memory _warningTag, string memory _emotionalTag) external onlyAdmin {
        registry.push(ScamEntry(_domainName, _scamType, _warningTag, _emotionalTag, false));
    }

    function tagScam(uint256 index) external onlyAdmin {
        registry[index].tagged = true;
    }

    function getScam(uint256 index) external view returns (ScamEntry memory) {
        return registry[index];
    }
}
