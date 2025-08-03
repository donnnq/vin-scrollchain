// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSignalTruthMirror {
    address public mirrorMaster;
    mapping(bytes32 => Reflection) public mediaReflections;
    string[] public archivedSignals;

    struct Reflection {
        string broadcaster;
        string signalSummary;
        string civicImpact;
        uint256 timestamp;
        bool verified;
    }

    event ReflectionArchived(bytes32 mirrorID, string broadcaster, bool verified);
    event MirrorCorrected(bytes32 mirrorID, string revisedSummary);

    modifier onlyMaster() {
        require(msg.sender == mirrorMaster, "Unauthorized mirror access.");
        _;
    }

    constructor() {
        mirrorMaster = msg.sender;
    }

    function archiveSignal(
        string calldata broadcaster,
        string calldata signalSummary,
        string calldata civicImpact,
        bool verified
    ) external onlyMaster returns (bytes32) {
        bytes32 mirrorID = keccak256(abi.encodePacked(broadcaster, signalSummary, block.timestamp));
        mediaReflections[mirrorID] = Reflection(broadcaster, signalSummary, civicImpact, block.timestamp, verified);
        archivedSignals.push(signalSummary);
        emit ReflectionArchived(mirrorID, broadcaster, verified);
        return mirrorID;
    }

    function reviseReflection(bytes32 mirrorID, string calldata newSummary) external onlyMaster {
        mediaReflections[mirrorID].signalSummary = newSummary;
        emit MirrorCorrected(mirrorID, newSummary);
    }

    function fetchReflection(bytes32 mirrorID) external view returns (Reflection memory) {
        return mediaReflections[mirrorID];
    }

    function getAllSignals() external view returns (string[] memory) {
        return archivedSignals;
    }
}
