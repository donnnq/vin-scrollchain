// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ProcessorLock - Ritual contract to freeze or lock processor usage based on civic or geopolitical triggers
/// @author Vinvin

contract ProcessorLock {
    address public scrollsmith;

    struct Processor {
        string model;
        string origin;
        bool isFrozen;
        bool isPermanentlyLocked;
        uint256 freezeTimestamp;
    }

    mapping(string => Processor) public processors;
    string[] public lockedModels;

    event ProcessorFrozen(string model, string origin);
    event ProcessorUnlocked(string model);
    event ProcessorPermanentlyLocked(string model);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a processor for potential lockdown
    function registerProcessor(string calldata model, string calldata origin) external onlyScrollsmith {
        processors[model] = Processor(model, origin, false, false, 0);
    }

    /// @notice Freeze processor temporarily
    function freezeProcessor(string calldata model) external onlyScrollsmith {
        Processor storage p = processors[model];
        require(!p.isPermanentlyLocked, "Already permanently locked");

        p.isFrozen = true;
        p.freezeTimestamp = block.timestamp;
        emit ProcessorFrozen(model, p.origin);
    }

    /// @notice Unlock processor
    function unlockProcessor(string calldata model) external onlyScrollsmith {
        Processor storage p = processors[model];
        require(p.isFrozen, "Processor not frozen");

        p.isFrozen = false;
        p.freezeTimestamp = 0;
        emit ProcessorUnlocked(model);
    }

    /// @notice Permanently lock processor
    function permanentlyLock(string calldata model) external onlyScrollsmith {
        Processor storage p = processors[model];
        p.isFrozen = true;
        p.isPermanentlyLocked = true;
        p.freezeTimestamp = block.timestamp;
        lockedModels.push(model);
        emit ProcessorPermanentlyLocked(model);
    }

    /// @notice View locked processor models
    function getLockedModels() external view returns (string[] memory) {
        return lockedModels;
    }

    /// @notice View processor details
    function getProcessor(string calldata model) external view returns (Processor memory) {
        return processors[model];
    }
}
