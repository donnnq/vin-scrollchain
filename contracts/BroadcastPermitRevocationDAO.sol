// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastPermitRevocationDAO {
    address public admin;

    struct RevocationEntry {
        string networkName;
        string violationType;
        string emotionalTag;
        bool summoned;
        bool revoked;
    }

    RevocationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRevocation(string memory networkName, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(RevocationEntry(networkName, violationType, emotionalTag, true, false));
    }

    function revokePermit(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getRevocationEntry(uint256 index) external view returns (RevocationEntry memory) {
        return entries[index];
    }
}
