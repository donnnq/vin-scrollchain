// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinGlobalPulseHub {
    address public pulseEnvoy;
    uint256 public creationBlock;

    struct GeoPulse {
        string nation;
        string status;
        string signalQuote;
        uint256 timestamp;
    }

    GeoPulse[] public pulseLog;

    event GlobalPulseTagged(string nation, string status, string signalQuote);

    modifier onlyEnvoy() {
        require(msg.sender == pulseEnvoy, "Only the pulse envoy can update the ritual map.");
        _;
    }

    constructor() {
        pulseEnvoy = msg.sender;
        creationBlock = block.number;
    }

    function tagNationPulse(
        string memory nation,
        string memory status,
        string memory signalQuote
    ) external onlyEnvoy {
        pulseLog.push(GeoPulse(nation, status, signalQuote, block.timestamp));
        emit GlobalPulseTagged(nation, status, signalQuote);
    }

    function fetchLastPulse() external view returns (GeoPulse memory) {
        require(pulseLog.length > 0, "No pulses recorded yet.");
        return pulseLog[pulseLog.length - 1];
    }

    function viewPulseByNation(string memory nation) external view returns (string memory status, string memory signalQuote) {
        for (uint256 i = pulseLog.length; i > 0; i--) {
            if (keccak256(bytes(pulseLog[i - 1].nation)) == keccak256(bytes(nation))) {
                return (pulseLog[i - 1].status, pulseLog[i - 1].signalQuote);
            }
        }
        return ("Unknown", "No pulse found for that nation.");
    }
}
