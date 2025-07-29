// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinPeaceSigil {
    address public scrollMaster;

    struct PeaceActivity {
        string region;
        string activityType; // e.g. "Disarmament Treaty", "Inspection Agreement", "Nuclear-Free Zone Declaration"
        string sigilHash;
        uint256 timestamp;
        address agent;
    }

    PeaceActivity[] public logbook;

    event SigilCommitted(string region, string activityType, string sigilHash, address indexed agent);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Unauthorized: Sigil channel locked");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function commitPeaceSigil(
        string memory region,
        string memory activityType,
        string memory sigilHash
    ) external onlyScrollMaster {
        PeaceActivity memory entry = PeaceActivity(
            region,
            activityType,
            sigilHash,
            block.timestamp,
            msg.sender
        );
        logbook.push(entry);
        emit SigilCommitted(region, activityType, sigilHash, msg.sender);
    }

    function getPeaceLog(uint256 index) external view returns (PeaceActivity memory) {
        require(index < logbook.length, "Index out of bounds");
        return logbook[index];
    }

    function totalEntries() external view returns (uint256) {
        return logbook.length;
    }
}
