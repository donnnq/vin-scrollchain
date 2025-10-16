// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAccountabilityBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string subject;
        string civicSignal;
        string emotionalTag;
        bool aired;
        bool ritualized;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory subject, string memory civicSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(subject, civicSignal, emotionalTag, false, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function ritualizeBroadcast(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
