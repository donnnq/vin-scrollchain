// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperImpactIndex {
    address public scrollkeeper;

    struct ImpactEvent {
        string initiative;
        uint256 score; // 1-100 scale based on emotional uplift
        uint256 timestamp;
    }

    ImpactEvent[] public events;

    event ImpactLogged(string initiative, uint256 score);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logImpact(string memory initiative, uint256 score) external onlyScrollkeeper {
        require(score <= 100, "Score out of range");
        events.push(ImpactEvent(initiative, score, block.timestamp));
        emit ImpactLogged(initiative, score);
    }

    function getImpact(uint256 index) external view returns (string memory, uint256, uint256) {
        ImpactEvent memory e = events[index];
        return (e.initiative, e.score, e.timestamp);
    }

    function totalImpactLogs() external view returns (uint256) {
        return events.length;
    }
}
