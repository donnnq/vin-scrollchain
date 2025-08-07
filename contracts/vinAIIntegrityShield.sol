// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinAIIntegrityShield - Guardian of Ethical AI Deployments
/// @author Vinvin
/// @notice Tracks, verifies, and flags AI usage across civic, media, and private domains

contract vinAIIntegrityShield {
    address public scrollMaster;
    uint256 public flaggedCount;

    enum AIUseType { Civic, Media, Commercial, Unknown }
    enum IntegrityStatus { Verified, Flagged, Pending }

    struct AIInstance {
        string name;
        AIUseType useType;
        IntegrityStatus status;
        string metadata;
        uint256 timestamp;
    }

    mapping(bytes32 => AIInstance) public registry;

    event AIRegistered(bytes32 indexed signalHash, string name, AIUseType useType);
    event AIFlagged(bytes32 indexed signalHash, string reason);
    event IntegrityVerified(bytes32 indexed signalHash);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Not authorized");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function registerAI(
        string memory name,
        AIUseType useType,
        string memory metadata
    ) public onlyScrollMaster returns (bytes32) {
        bytes32 signalHash = keccak256(abi.encodePacked(name, block.timestamp));
        registry[signalHash] = AIInstance(name, useType, IntegrityStatus.Pending, metadata, block.timestamp);
        emit AIRegistered(signalHash, name, useType);
        return signalHash;
    }

    function verifyIntegrity(bytes32 signalHash) public onlyScrollMaster {
        require(registry[signalHash].timestamp != 0, "AI not found");
        registry[signalHash].status = IntegrityStatus.Verified;
        emit IntegrityVerified(signalHash);
    }

    function flagAI(bytes32 signalHash, string memory reason) public onlyScrollMaster {
        require(registry[signalHash].timestamp != 0, "AI not found");
        registry[signalHash].status = IntegrityStatus.Flagged;
        flaggedCount++;
        emit AIFlagged(signalHash, reason);
    }

    function getAIStatus(bytes32 signalHash) public view returns (IntegrityStatus) {
        return registry[signalHash].status;
    }
}
