// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinEpochWhisperCouncil {
    address public archivist;
    uint256 public whisperThreshold;
    mapping(bytes32 => uint256) public ritualSignals;
    mapping(bytes32 => bool) public epochWhispers;

    event SignalHeard(bytes32 ritualID, uint256 updatedFreq);
    event EpochWhispered(bytes32 ritualID, string newEpochName, uint256 timestamp);

    modifier onlyArchivist() {
        require(msg.sender == archivist, "Unauthorized: not archivist");
        _;
    }

    constructor(address _archivist, uint256 _threshold) {
        archivist = _archivist;
        whisperThreshold = _threshold; // e.g. every 5 matching signals triggers a whisper
    }

    function recordSignal(bytes32 ritualID) public onlyArchivist {
        ritualSignals[ritualID] += 1;
        emit SignalHeard(ritualID, ritualSignals[ritualID]);

        if (ritualSignals[ritualID] >= whisperThreshold && !epochWhispers[ritualID]) {
            string memory epochName = generateEpochName(ritualID);
            whisperEpoch(ritualID, epochName);
        }
    }

    function whisperEpoch(bytes32 ritualID, string memory newEpochName) internal {
        epochWhispers[ritualID] = true;
        emit EpochWhispered(ritualID, newEpochName, block.timestamp);
    }

    function generateEpochName(bytes32 ritualID) internal pure returns (string memory) {
        if (ritualID == keccak256(abi.encodePacked("vinCivicDeEscalator"))) return "Epoch of Peaceflow";
        if (ritualID == keccak256(abi.encodePacked("vinAnimalSignalRescue"))) return "Epoch of Kinship";
        if (ritualID == keccak256(abi.encodePacked("vinFoodPulseRedistribution"))) return "Epoch of Abundance";
        return "Epoch of Echoes";
    }

    function updateArchivist(address newArchivist) public onlyArchivist {
        archivist = newArchivist;
    }

    function setWhisperThreshold(uint256 newThreshold) public onlyArchivist {
        whisperThreshold = newThreshold;
    }
}
