// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollDivergence {
    enum DivergenceType { Concord, Soul, Scroll }

    struct Divergence {
        DivergenceType divergenceType;
        address subject;
        string reason;
        string transformation;
        bool completed;
        uint256 timestamp;
    }

    Divergence[] public divergences;
    address public immutable divergenceKeeper;

    event DivergenceInitiated(uint256 indexed id, DivergenceType divergenceType, address subject, string reason, string transformation, uint256 timestamp);
    event DivergenceCompleted(uint256 indexed id, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == divergenceKeeper, "Not the divergence keeper");
        _;
    }

    constructor() {
        divergenceKeeper = msg.sender;
    }

    function initiateDivergence(
        DivergenceType divergenceType,
        address subject,
        string calldata reason,
        string calldata transformation
    ) external onlyKeeper {
        divergences.push(Divergence({
            divergenceType: divergenceType,
            subject: subject,
            reason: reason,
            transformation: transformation,
            completed: false,
            timestamp: block.timestamp
        }));

        emit DivergenceInitiated(divergences.length - 1, divergenceType, subject, reason, transformation, block.timestamp);
    }

    function completeDivergence(uint256 id) external onlyKeeper {
        require(id < divergences.length, "Invalid divergence ID");
        require(!divergences[id].completed, "Already completed");

        divergences[id].completed = true;
        emit DivergenceCompleted(id, block.timestamp);
    }

    function getDivergence(uint256 id) external view returns (Divergence memory) {
        require(id < divergences.length, "Invalid divergence ID");
        return divergences[id];
    }

    function totalDivergences() external view returns (uint256) {
        return divergences.length;
    }
}
