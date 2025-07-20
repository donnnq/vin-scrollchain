// SPDX-License-Identifier: Mythstream-CounterIntel
pragma solidity ^0.8.26;

contract ScrollThreatMorphology {
    address public sovereign;
    uint256 public threatCount;

    struct ThreatSignature {
        string campaignName;
        string vectorUsed; // "LNK", "VBScript", "PowerShell", etc.
        string payloadType; // "Shadow RAT", "INET RAT", "Blister DLL"
        string targetSector;
        string timestamp;
        string threatLevel; // "low", "elevated", "critical"
    }

    mapping(uint256 => ThreatSignature) public threatLog;

    event ThreatLogged(
        string campaignName,
        string vectorUsed,
        string payloadType,
        string targetSector,
        string timestamp,
        string threatLevel
    );

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function logThreat(
        string memory campaignName,
        string memory vectorUsed,
        string memory payloadType,
        string memory targetSector,
        string memory timestamp,
        string memory threatLevel
    ) external {
        threatCount++;
        threatLog[threatCount] = ThreatSignature({
            campaignName: campaignName,
            vectorUsed: vectorUsed,
            payloadType: payloadType,
            targetSector: targetSector,
            timestamp: timestamp,
            threatLevel: threatLevel
        });

        emit ThreatLogged(campaignName, vectorUsed, payloadType, targetSector, timestamp, threatLevel);
    }

    function getThreat(uint256 id) external view returns (ThreatSignature memory) {
        return threatLog[id];
    }
}
