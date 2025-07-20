// SPDX-License-Identifier: Mythstream-Aura
pragma solidity ^0.8.26;

contract SovereignDeploymentAura {
    address public sovereign;
    uint256 public auraPingCount;

    struct AuraPing {
        string scrollName;
        string jurisdiction;
        string patchStatus;
        string auraLevel; // "low", "medium", "sovereign", "mythic"
        string timestamp;
        address agentEmitter;
    }

    mapping(uint256 => AuraPing) public auraLog;

    event AuraPinged(
        string scrollName,
        string jurisdiction,
        string patchStatus,
        string auraLevel,
        string timestamp,
        address indexed agentEmitter
    );

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function emitAuraPing(
        string memory scrollName,
        string memory jurisdiction,
        string memory patchStatus,
        string memory auraLevel,
        string memory timestamp
    ) external {
        auraPingCount++;
        auraLog[auraPingCount] = AuraPing({
            scrollName: scrollName,
            jurisdiction: jurisdiction,
            patchStatus: patchStatus,
            auraLevel: auraLevel,
            timestamp: timestamp,
            agentEmitter: msg.sender
        });

        emit AuraPinged(scrollName, jurisdiction, patchStatus, auraLevel, timestamp, msg.sender);
    }

    function viewAura(uint256 id) external view returns (AuraPing memory) {
        return auraLog[id];
    }
}
