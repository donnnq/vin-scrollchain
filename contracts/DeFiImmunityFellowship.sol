// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeFiImmunityFellowship {
    address public admin;

    struct ImmunityEntry {
        string protocolName;
        string immunityVector;
        string emotionalTag;
        bool deployed;
        bool verified;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployImmunity(string memory protocolName, string memory immunityVector, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(protocolName, immunityVector, emotionalTag, true, false));
    }

    function verifyImmunity(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
