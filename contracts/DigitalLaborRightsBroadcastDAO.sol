// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalLaborRightsBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string aiLabel;
        string laborRight;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory aiLabel, string memory laborRight, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(aiLabel, laborRight, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
