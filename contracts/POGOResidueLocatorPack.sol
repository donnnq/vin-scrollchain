// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract POGOResidueLocatorPack {
    address public admin;

    struct POGOEntry {
        string location;
        string suspectedOperation;
        string emotionalTag;
        bool confirmed;
    }

    POGOEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory location, string memory suspectedOperation, string memory emotionalTag) external onlyAdmin {
        entries.push(POGOEntry(location, suspectedOperation, emotionalTag, false));
    }

    function confirmEntry(uint256 index) external onlyAdmin {
        entries[index].confirmed = true;
    }

    function getEntry(uint256 index) external view returns (POGOEntry memory) {
        return entries[index];
    }
}
