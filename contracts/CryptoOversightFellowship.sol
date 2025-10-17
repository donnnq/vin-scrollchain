// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoOversightFellowship {
    address public admin;

    struct OversightEntry {
        string agencyName;
        string cryptoDomain;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateOversight(string memory agencyName, string memory cryptoDomain, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(agencyName, cryptoDomain, emotionalTag, true, false));
    }

    function reinforceOversight(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getOversight(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
