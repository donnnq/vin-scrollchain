// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScamDomainScannerProtocolDAO {
    address public admin;

    struct DomainEntry {
        string domainName;
        string scanResult;
        string threatLevel;
        string emotionalTag;
        bool flagged;
    }

    DomainEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitDomain(string memory _domainName, string memory _scanResult, string memory _threatLevel, string memory _emotionalTag) external onlyAdmin {
        registry.push(DomainEntry(_domainName, _scanResult, _threatLevel, _emotionalTag, false));
    }

    function flagDomain(uint256 index) external onlyAdmin {
        registry[index].flagged = true;
    }

    function getDomain(uint256 index) external view returns (DomainEntry memory) {
        return registry[index];
    }
}
