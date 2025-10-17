// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CelebrityConsentDAO {
    address public admin;

    struct ConsentEntry {
        string celebrityName;
        string usageContext;
        string emotionalTag;
        bool authorized;
        bool revoked;
    }

    ConsentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function authorizeUsage(string memory celebrityName, string memory usageContext, string memory emotionalTag) external onlyAdmin {
        entries.push(ConsentEntry(celebrityName, usageContext, emotionalTag, true, false));
    }

    function revokeUsage(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getConsentEntry(uint256 index) external view returns (ConsentEntry memory) {
        return entries[index];
    }
}
