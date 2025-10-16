// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VerifiedHumanPresenceDAO {
    address public admin;

    struct PresenceEntry {
        string userLabel;
        string verificationMethod;
        string emotionalTag;
        bool verified;
    }

    PresenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory userLabel, string memory verificationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(PresenceEntry(userLabel, verificationMethod, emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (PresenceEntry memory) {
        return entries[index];
    }
}
