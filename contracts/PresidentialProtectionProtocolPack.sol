// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresidentialProtectionProtocolPack {
    address public admin;

    struct ProtectionEntry {
        string threatSource;
        string responseAction;
        string emotionalTag;
        bool deployed;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory threatSource, string memory responseAction, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(threatSource, responseAction, emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
