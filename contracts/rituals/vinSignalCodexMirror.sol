// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSignalCodexMirror {
    address public talismanSource;
    mapping(bytes32 => uint256) public ritualFrequency;
    mapping(bytes32 => string) public lastContext;
    string[] public ritualLog;

    event CodexUpdated(bytes32 ritualID, string context, uint256 updatedFreq);
    event CodexReflection(bytes32 ritualID, string reflection);

    constructor(address _talismanSource) {
        talismanSource = _talismanSource;
    }

    modifier onlyTalisman() {
        require(msg.sender == talismanSource, "Unauthorized talisman access");
        _;
    }

    function archiveRitual(bytes32 ritualID, string memory context) public onlyTalisman {
        ritualFrequency[ritualID] += 1;
        lastContext[ritualID] = context;
        ritualLog.push(context);
        emit CodexUpdated(ritualID, context, ritualFrequency[ritualID]);

        if (ritualFrequency[ritualID] % 3 == 0) {
            reflectRitual(ritualID);
        }
    }

    function reflectRitual(bytes32 ritualID) internal {
        string memory context = lastContext[ritualID];
        string memory reflection = string(abi.encodePacked("Ritual '", context, "' reached resonance milestone."));
        emit CodexReflection(ritualID, reflection);
    }

    function getFrequency(bytes32 ritualID) public view returns (uint256) {
        return ritualFrequency[ritualID];
    }

    function fetchRitualLog() public view returns (string[] memory) {
        return ritualLog;
    }

    function updateTalisman(address newSource) public {
        require(msg.sender == talismanSource, "Only current talisman can migrate");
        talismanSource = newSource;
    }
}
