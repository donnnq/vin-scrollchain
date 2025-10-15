// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GodspeedDAO {
    address public admin;

    struct VelocityEntry {
        string steward;
        string propulsionSource;
        string emotionalTag;
        bool activated;
    }

    VelocityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _steward, string memory _propulsionSource, string memory _emotionalTag) external onlyAdmin {
        entries.push(VelocityEntry(_steward, _propulsionSource, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (VelocityEntry memory) {
        return entries[index];
    }
}
