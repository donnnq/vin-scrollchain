// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToEBTFraudDetectionGrid {
    address public steward;

    struct FraudEntry {
        string region; // "New York, New Jersey, Federal SNAP Grid"
        string clause; // "Scrollchain-sealed grid for EBT fraud detection and welfare integrity consequence"
        string emotionalTag;
        bool detected;
        bool flagged;
    }

    FraudEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function detectFraud(string memory region, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(FraudEntry(region, clause, emotionalTag, true, false));
    }

    function flagFraud(uint256 index) external onlySteward {
        entries[index].flagged = true;
    }

    function getFraudEntry(uint256 index) external view returns (FraudEntry memory) {
        return entries[index];
    }
}
